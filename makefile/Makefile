CURRENT_DIR = $(PWD)
TARGET := hw
MEMTYPE := DDR
BANKS :=

SRCDIR := ./../reference_files

ifeq ($(MEMTYPE), DDR)
PLATFORM :=xilinx_u200_xdma_201830_2
else
PLATFORM :=xilinx_u50_gen3x16_xdma_201920_3
endif

_OVERLAP :=
ifeq ($(OVERLAP_BANKS),1)
_OVERLAP = _overlap
endif

DWORDS     := 16
_DWORDS    := _d512
ifeq ($(DWIDTH), 256)
DWORDS   = 8
_DWORDS   = _d256
endif
ifeq ($(DWIDTH), 128)
DWORDS   = 4
_DWORDS   = _d128
endif
ifeq ($(DWIDTH), 64)
DWORDS   = 2
_DWORDS   = _d64
endif

ifeq (${RAMA},yes)
	_RAMA := _RAMA
	CONFIG_RAMA_FILE=cfg-rama.ini
	RAMAFLAGS := --config $(CONFIG_RAMA_FILE)
makeramacfg:
	$(shell echo > $(CONFIG_RAMA_FILE))
	$(shell echo [advanced] >> $(CONFIG_RAMA_FILE))
	$(shell echo param=compiler.userPostSysLinkTcl=$(shell readlink -f rama_post_sys_link.tcl) >> $(CONFIG_RAMA_FILE))
	@echo "$@ generated $(CONFIG_RAMA_FILE)"
else
makeramacfg:
endif


# Default Settings here ..
HOST_SRC_CPP := $(SRCDIR)/host.cpp
BUILDDIR := ./../build/$(MEMTYPE)_banks$(BANKS)$(_OVERLAP)$(_DWORDS)$(_RAMA)


# Common Source Code for FPGA and Host
FPGA_SRC_CPP := $(SRCDIR)/kernel.cpp
HOST_SRC_CPP += $(SRCDIR)/xcl2.cpp

# SoC variables
RUN_APP_SCRIPT = run_app.sh
PACKAGE_OUT = package.$(TARGET)

LAUNCH_EMULATOR = $(PACKAGE_OUT)/launch_$(TARGET).sh
RESULT_STRING = TEST PASSED

VPP := v++
SDCARD := sd_card

include common.mk
include hbm_connectivity.mk

#####################################################################################################
### Build the host executable. This step is always executed
#####################################################################################################
compile_host:  host
	@echo $(FPGA_SRC_CPP) is being used as source for Generating Kernel; \
	mkdir -p $(BUILDDIR)

build: display_time makeramacfg compile_host hbm_config xo xclbin $(BUILDDIR)/$(EMCONFIG_FILE)

display_time:
	@echo "# make command started $(shell date) #"

#####################################################################################################
ifneq ($(TARGET), hw)
PREFIX_COMMAND=XCL_EMULATION_MODE=$(TARGET)
endif

ifeq ($(BUILDXCLBIN), 0)
run:  host 
else
run:   build host
endif
	cp xrt.ini $(BUILDDIR)
	@echo "*** Running $(TARGET) mode ***  Use Command Line to run application!"
	cd $(BUILDDIR) && $(PREFIX_COMMAND) ./host vadd_$(TARGET).xclbin $(DSIZE) $(ADDRNDM) $(KRNL_LOOP);

ddr_addSeq:
	make run TARGET=hw MEMTYPE=DDR DSIZE=600 ADDRNDM=0 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=ddr_addSeq
ddr_addRandom:
	make run TARGET=hw MEMTYPE=DDR DSIZE=256 ADDRNDM=1 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=ddr_addRandom
hbm_addSeq_2Banks:
	make run TARGET=hw MEMTYPE=HBM BANKS=2 DSIZE=600 ADDRNDM=0 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=hbm_addSeq_2Banks
hbm_addSeq_3Banks:
	make run TARGET=hw MEMTYPE=HBM BANKS=3 DSIZE=600 ADDRNDM=0 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=hbm_addSeq_3Banks
hbm_addSeq_2Banks_overlap:
	make run TARGET=hw MEMTYPE=HBM BANKS=2 DSIZE=600 ADDRNDM=0 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 OVERLAP_BANKS=1 BUILDDIR=hbm_addSeq_2Banks_overlap
hbm_addRandom:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=1 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=hbm_addRandom

hbm_addSeq_allBanks_d512:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addSeq_allBanks_d512
hbm_addSeq_allBanks_d256:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=256 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addSeq_allBanks_d256
hbm_addSeq_allBanks_d128:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=128 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addSeq_allBanks_d128
hbm_addSeq_allBanks_d64:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=64 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addSeq_allBanks_d64

hbm_addRnd_allBanks_d512:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=512 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addRnd_allBanks_d512
hbm_addRnd_allBanks_d256:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=256 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addRnd_allBanks_d256
hbm_addRnd_allBanks_d128:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=128 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addRnd_allBanks_d128
hbm_addRnd_allBanks_d64:
	make run TARGET=hw MEMTYPE=HBM BANKS=all DSIZE=600 ADDRNDM=0 DWIDTH=64 KRNL_LOOP=1 BUILDXCLBIN=1 BUILDDIR=../build/hbm_addRnd_allBanks_d64


help:
	@echo  " "
	@echo  " "
	@echo  " Makefile Usage:"
	@echo  " "
	@echo  "   Use the following command to Target application for sending DSize(kb) from Host to Device"
	@echo  "   ADDRNDM determines address to be random(1) or sequential(0) for Kernel accessing MEMTYPE" 
	@echo  "   KRNL_LOOP can be set to any num for repeating kernel execution # of times"
	@echo  "   For HBM runs, BANKS=2 can be added for using only 2PC for inputs/outputs"
	@echo  "   Add BUILDXCLBIN=1 for using existing hw xclbins "
	@echo  " "
	@echo  "   make <build/run>    TARGET=<sw_emu/hw_emu/hw> MEMTYPE=<DDR/HBM> DSIZE=<From Host in MB> ADDRNDM=<0/1> KRNL_LOOP=<#>"
	@echo  " "
	@echo  "   make run TARGET=hw MEMTYPE=HBM BANKS=2 DSIZE=256 ADDRNDM=1 KRNL_LOOP=1"
	@echo  " "
	@echo  "   Also provided some helper targets for running hw runs as shown below"
	@echo  " "
	@echo  "   > For using DDR with Sequential Address Access -- make ddr_addSeq "
	@echo  "   > For using DDR with Random     Address Access -- make ddr_addRandom"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_2Banks         	- This should error out as only 2 Banks used and data xfer is > 512M"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_3Banks         	- This should PASS as kernel is not constraint to just 2 Banks"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_2Banks_overlap 	- This enables configuration with overlapping Banks"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d512  	- This enables configuration with all Banks using datawidth=512"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d256  	- This enables configuration with all Banks using datawidth=256"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d128  	- This enables configuration with all Banks using datawidth=128"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d64  	- This enables configuration with all Banks using datawidth=64"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d512  	- This enables configuration with all Banks using datawidth=512"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d256  	- This enables configuration with all Banks using datawidth=256"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d128  	- This enables configuration with all Banks using datawidth=128"
	@echo  "   > For using HBM with Sequential Address Access -- make hbm_addSeq_allBanks_d64  	- This enables configuration with all Banks using datawidth=64"

