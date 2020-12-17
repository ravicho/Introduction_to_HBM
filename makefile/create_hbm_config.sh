#!/bin/bash

#Define the string value
src1=$1;
src2=$2;
des=$3;

echo "[connectivity]" > HBM_tmp.cfg
echo "sp=vadd_1.in1:HBM[$1]" >> HBM_tmp.cfg
echo "sp=vadd_1.in2:HBM[$2]" >> HBM_tmp.cfg
echo "sp=vadd_1.out:HBM[$3]" >> HBM_tmp.cfg
