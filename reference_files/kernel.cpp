/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

/*******************************************************************************
Description:
    HLS pragmas can be used to optimize the design : improve throughput, reduce latency and
    device resource utilization of the resulting RTL code
    This is vector addition example to demonstrate how HLS optimizations are used in kernel.
*******************************************************************************/


//#define BUFFER_SIZE 1024
//#define VDATA_SIZE 16
//typedef struct v_datatype { unsigned int data[VDATA_SIZE]; } v_dt;

#include "kernel.h"
#include <ap_int.h>

// TRIPCOUNT identifier
const unsigned int c_total = 1024/VDATA_SIZE;


// 32 bits LFSR with taps at 32,22,2,1, as per table 3 of XAPP 052
// https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
unsigned int next_lfsr32(ap_uint<32> lfsr_in) {

  bool b_32 = lfsr_in.get_bit(32 - 32);
  bool b_22 = lfsr_in.get_bit(32 - 22);
  bool b_2 = lfsr_in.get_bit(32 - 2);
  bool b_1 = lfsr_in.get_bit(32 - 1);
  bool new_bit = b_32 ^ b_22 ^ b_2 ^ b_1;
  ap_uint<32> lfsr_out = lfsr_in >> 1;
  lfsr_out.set_bit(31, new_bit);

  return lfsr_out.to_uint();
}


/*
 * generates a "all 1's" mask that is strictly smaller than the input value,
 * e.g. :
 * gen_mask(126) -> 63
 * gen_mask(127) -> 63
 * gen_mask(128) -> 127
 * gen_mask(129) -> 127
 *
 * we will use this mask to clear the higher bits of the PRNG so that what
 * is left if of the same magnitude of the size, but smaller
*/
unsigned int gen_mask(unsigned int x) {
    unsigned int mask=0xffffffff;
gmask:
    do {
        #pragma HLS LOOP_TRIPCOUNT min = 1 max = 32
        mask=mask>>1;
    } while(mask>=x);
    return mask;
}


/*
    Vector Addition Kernel Implementation
    Arguments:
        in1   (input)     --> Input Vector1
        in2   (input)     --> Input Vector2
        out   (output)    --> Output Vector
        size  (input)     --> Size of Vector in Integer
*/
extern "C"
void vadd(
        const v_dt *in1,               // Read-Only Vector 1
        const v_dt *in2,               // Read-Only Vector 2
        v_dt *out,                     // Output Result for ADD
        const unsigned int size,       // Size in integer
        const unsigned int num_times,  // Running the same kernel operations num_times
        bool addRandom                 // Address Pattern is random
        ) {
#pragma HLS INTERFACE m_axi port = in1 offset = slave bundle = gmem0 latency = 300 num_read_outstanding = 128 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port = in2 offset = slave bundle = gmem1 latency = 300 num_read_outstanding = 128 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port = out offset = slave bundle = gmem2 latency = 50  num_write_outstanding= 128 num_read_outstanding= 1

#pragma HLS INTERFACE s_axilite bundle = control port = in1
#pragma HLS INTERFACE s_axilite bundle = control port = in2
#pragma HLS INTERFACE s_axilite bundle = control port = out

#pragma HLS INTERFACE s_axilite bundle = control port = size
#pragma HLS INTERFACE s_axilite bundle = control port = num_times
#pragma HLS INTERFACE s_axilite bundle = control port = addRandom
#pragma HLS INTERFACE s_axilite bundle = control port = return

    unsigned int in_index=0;
    // size is a multiple of 16, even 1024, VDATA_SIZE is power of 2
    unsigned int vSize = size / VDATA_SIZE;

    unsigned int mask = gen_mask(vSize);

    // we separate the code between random access and sequential access
    // because the compile is able to infer burst in the sequential case
    // but if we merge the 2 codes, the burst is not inferred 
    if(addRandom==false) {
        // sequential access
    seqvops1:
        for (unsigned int count = 0; count < num_times; count++) {
            // Running same kernel operation num_times to keep the kernel busy for HBM
            // bandwidth testing
            #pragma HLS LOOP_TRIPCOUNT min = c_total max = c_total
            //Per iteration of this loop perform vSize vector addition
    seqvops2:
            for (unsigned int i = 0; i < vSize; i++) {
                #pragma HLS LOOP_TRIPCOUNT min = VDATA_SIZE max = VDATA_SIZE
                in_index = i;

                v_dt tmpIn1 = in1[in_index];
                v_dt tmpIn2 = in2[in_index];
                v_dt tmpOutAdd;

    seqvops3: // will be unrolled because parent loop is pipelined
                for (int k = 0; k < VDATA_SIZE; k++) {
                    tmpOutAdd.data[k] = tmpIn1.data[k] + tmpIn2.data[k];
                }

                out[in_index] = tmpOutAdd;
            }
        }
    } else {
        // random access
        unsigned int randvalue=0x12345678; // initialize to non-zero value!
    randvops1:
        for (unsigned int count = 0; count < num_times; count++) {
            #pragma HLS LOOP_TRIPCOUNT min = c_total max = c_total
            //Per iteration of this loop perform vSize vector addition
    randvops2:
            for (unsigned int i = 0; i < vSize; i++) {
                #pragma HLS LOOP_TRIPCOUNT min = VDATA_SIZE max = VDATA_SIZE
                randvalue = next_lfsr32(randvalue); // 32 bits
                // mask is less than vSize by construct, 
                // so randvalueclipped will be less than vSize too
                unsigned int randvalueclipped = randvalue & mask;
                unsigned int candidate = in_index + randvalueclipped; // less than 2x vSize
                // need to make sure it is strictly less than vSize
                // note: don't need a true modulo operator because of the above masking and derived constraints
                unsigned int in_index_random = candidate < vSize ? candidate : candidate-vSize;

                in_index = in_index_random;

                v_dt tmpIn1 = in1[in_index];
                v_dt tmpIn2 = in2[in_index];
                v_dt tmpOutAdd;

    randvops3: // will be unrolled because parent loop is pipelined
                for (int k = 0; k < VDATA_SIZE; k++) {
                    tmpOutAdd.data[k] = tmpIn1.data[k] + tmpIn2.data[k];
                }

                out[in_index] = tmpOutAdd;
            }
        }

    }
}

