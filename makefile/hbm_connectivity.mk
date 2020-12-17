ifeq ($(BANKS), 2)
IN1 = 0:1
IN2 = 2:3
OUT = 4:5
endif
ifeq ($(BANKS), 3)
IN1 = 0:2
IN2 = 3:5
OUT = 6:8
endif
ifeq ($(BANKS), overlap)
IN1 = 0:1
IN2 = 1:2
OUT = 3:4
endif
ifeq ($(BANKS), all)
IN1 = 0:31
IN2 = 0:31
OUT = 0:31
endif
ifeq ($(BANKS), custom)
IN1 = <user input>
IN2 = 0<user input>
OUT = 0<user input>
endif


hbm_config:
	echo  "Creating HBM configuration";
	./create_hbm_config.sh $(IN1) $(IN2) $(OUT) $(BUILDDIR)
	mv HBM_tmp.cfg $(BUILDDIR)/HBM_connectivity.cfg
