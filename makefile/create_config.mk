hbm_config:
	echo  "Creating HBM configuration";
	./create_config.sh $(IN1) $(IN2) $(OUT) 
	mv HBM_tmp.cfg $(BUILDDIR)
