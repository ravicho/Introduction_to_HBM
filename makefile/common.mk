
./$(BUILDDIR)/vadd_$(TARGET).xo: $(HOST_SRC_FPGA)
	@echo "Running target to generate xo file"
	v++ -c -g -t $(TARGET) -R 1 -k vadd \
		--platform $(PLATFORM) \
                --profile.data all:all:all \
                --profile.stall all:all:all \
		-DDATA_ELEMENTS=$(DWORDS) \
		--save-temps \
		--temp_dir ./$(BUILDDIR)/temp_dir \
		--report_dir ./$(BUILDDIR)/report_dir \
		--log_dir ./$(BUILDDIR)/log_dir \
		-I$(SRCDIR) \
		-DNDDR_BANKS=$(BANKS) \
		$(HOST_SRC_FPGA) \
		-o ./$(BUILDDIR)/vadd_$(TARGET).xo

#./$(BUILDDIR)/vadd_$(TARGET).xclbin:
./$(BUILDDIR)/vadd_$(TARGET).xclbin: ./$(BUILDDIR)/vadd_$(TARGET).xo
	@echo "Running target to generate xclbin file"
	v++ -l -g -t $(TARGET) -R 1 \
		--platform $(PLATFORM) \
                --profile.data all:all:all \
                --profile.stall all:all:all \
		--temp_dir ./$(BUILDDIR)/temp_dir \
		--report_dir ./$(BUILDDIR)/report_dir \
		--log_dir ./$(BUILDDIR)/log_dir \
		--config $(CURRENT_DIR)/$(MEMTYPE)_banks$(BANKS)$(OVERLAP).cfg \
		-I$(SRCDIR) \
		-DNDDR_BANKS=$(BANKS) \
		./$(BUILDDIR)/vadd_$(TARGET).xo \
		-o ./$(BUILDDIR)/vadd_$(TARGET).xclbin

host: $(SRCDIR)/*.cpp 
	@echo "Running target to generate host.exe file"
	mkdir -p $(BUILDDIR)
	g++ -D__USE_XOPEN2K8 -D__USE_XOPEN2K8 \
		-I$(XILINX_XRT)/include/ \
		-I$(SRCDIR) \
		-O3 -Wall -fmessage-length=0 -std=c++11\
		$(HOST_SRC_CPP) \
		-L$(XILINX_XRT)/lib/ \
		-lxilinxopencl -lpthread -lrt \
		-o $(BUILDDIR)/host

emconfig.json:
	cp $(SRCDIR)/emconfig.json .

xclbin: ./$(BUILDDIR)/vadd_$(TARGET).xclbin

xo: ./$(BUILDDIR)/vadd_$(TARGET).xo

clean:
	rm -rf temp_dir log_dir ../build report_dir *log host vadd* *.csv *summary .run .Xil vitis* *jou xilinx*
