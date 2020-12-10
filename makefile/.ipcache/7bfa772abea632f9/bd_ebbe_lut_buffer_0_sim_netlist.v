// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Dec  8 13:39:02 2020
// Host        : xsjrdevl110 running 64-bit CentOS Linux release 7.4.1708 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_ebbe_lut_buffer_0_sim_netlist.v
// Design      : bd_ebbe_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_ebbe_lut_buffer_0,lut_buffer_v2_0_0_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_0_lut_buffer,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_0_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
geSCzw9gYjFCv0Dn0YxOXxhH+GZFMePCQPK3AjT+zbjt1urPphGbRmSIP212qcXhU3u6qBayOOuP
zGTUOznyYQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
OnCSRn8bnLy+eSxgkIEXKk5zY3JDppSX+6N3lQVX9PeSypgnQ/2z4GTpmoL+rdMoco6U9R4G1u4m
E0xhKuM4ba9nEk7cLfAxOQqKqsWQrZaIEmzIr1ET+cp4jOMvYA/MsN4jh93kbuKcSDuJ8zN13DFX
RemIkmekhFjPkyUS5qM=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MSBAO7tnsBVh2XpVImbQvPkv1Ik+6Bw1D0e9n6H/Bw1mXnRXzm0RzPaEYAIFuluPbWglTrw4pQSr
JI/DSdCg6087Xmb+Q5zKawFvuZahx4HgmrKxTL15lZwamiIpmu3LGyxaEH/VbYGM9Ky0jp5PyDKU
Jeskyx64XVUPlRklhMjIKCtYITsgROzqjs+d1jIc494zqnDADEz0msJP38WdzHgwLDQ0NamfpodX
BUqMR71hgPx1Rvdt7HagUbkfyaG3/12LxFvpAblT7W0W6RKBFEFgFrxWRFaDw+jzj4jgl9g+sjY0
cveJYAA4UpZJwPSDIWehjmS+mOinzlnl8UP7jw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UtIiSU3lZ1iUKAuaJuT083jLC5QokBuxbJC/zVsWXf8ozOCIDAvtpSufF02lDCCaNNheB40dXQFS
I8VBcTtdWzNr2vj/HmW17e10D6T6mqn/8t0HnWx9c3modRuXup0Too1mNTU5gTH+v3utogTO5ztm
HbJZ/+5ov0tPkaeJufJl5L/RZAfLmRnRYybtx5bbc7XiGyWaVk6KunsaWtX5zJtVnMeUOkg0N8oL
RBeyFp3tFqTN7ecNUp7zom6BjZ3fR6euRy36u1XviJsqBjcxzASI1k+bn2lDs3oEdXuMHoRvcuWL
mmMddzjwWr43L7YoB/WBz/Tw7t6iYI5B6imPUA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
AMZ17uwJyVzW4KyzjD/YjCrX2GlLIDwW9HSuEat97pn8ZQ7QpDPhFLNx09klp1fHQ8yb1KlxCqpm
IjAljp4A5oQHWcBw/s+Xhtpin6GMDGjsmd5KmAD2J5DQmzqPazc0M8vNO+pGpCJogvWarX5XrP6U
56l9vH5mfyPmbT/09Kw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oAGTk8IFmmwAT5eT+h5xMK7MsqYCJnsMll3rq17njNu6wbVX2TAoOlVC5DzNg9T5ce7gVnuLuFG/
FgNSnTJx8TlbP73KxlDubmAVofR56G/yHzaJfJ0fwNhrfXm5AFgmFaKFPTKNkrG/qjdNuwUeA8p4
iHoj1zvPx50myVHXSpHLQ8n92DLWgMUX/57aPLbMHmYu/gsD0kHOuQ8Fr2Mi2DxufAvq1gzT0kc+
lxSntoseL+X1HLSvmKpEkR/sjaz6P9omIzqKlmOhvLeTZVEZcUtukVN1HTrlol+4/pTFDztcz0tZ
XqYZKVNB/igvn1iP/Fej8fpkaeJOrk1YgJZ6xw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HM0OWTHTT9qkiqicwldwQlaXCXhAavOkOLtzdsXybVEqcdGTuInS8Xvu2i7fjfGdnZjc+o4ZayFd
adCXUGMQZ+7u79Rm71DMtV7WL4PMhXZmItLJgXQmNzajU211AuWse/CyD7Am9ZDJuQcIK0fcqZQI
XVJU6sMESVWiSWdCuqkcQLSuSoBY7TVLmCDoTF9n7MlYfcxCkkK6d+2Xs/gjaWO59GZ3TbWhAQLc
9hHL9YUJUTzZ8yPC8tX+DLS/YrniD3lBpquxXGcl1FxHKFTSpMG/6pTH+7Y5u1s29iqS/KYCCOfR
Pqg3ikxxR4ywBL+umX+Ijv+Hqgol6tBnCkWh/g==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DQuK/YuairmUNmnTZFN/Tbbjjk202ciTMNZWiES7z/c8BYrmlnBses/x7XzAVxFxOTns+S6gcbxv
lho3MoYQI3b1wxR93ymMpbFY2AAKqfTaYrt9nuBi+J66NUkNb4mO5Ysrmk/FyxUuVMw2JeKhCxVf
1Lkw2weXEA2RSHrWxd8764IFSbBqKoKUTMuqLxHovRaQHDy/mOdyefGG7/6ywGbKjVTlE8lXVH8E
8QodSYZ7p8uod81sVFzJL26a9Tqu+u2tOgD/WqMuxrio7zRkYYC5P+/FtxLC4GaIZ6LivaJuTLOF
bkAMneaa5dlfamLnRyzDXUCJu/DFpJtH5s1eLQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DL1JbuaDxIhP8ir0jAdx6nea42/rMQ2VXG8PZEGqMkgF/yLmK8+UcPNvmkEnUbVxq6WNxCUUYBOO
eroUXvKd3hB7aza+lE1PkczDRQpe4dZWQ8yHCUSbqj/KnUKU7sMHOSk5MiYcbBazdC+B/zdSxJsr
sUmnOLgp/SqygmZW7/oDYMIYyOExEOrIPD4CH/xXZGlvuNs4OjdmaSus7kQp/iaUxQz03NGaMv3/
EuIfORb3j+mQPwXwEBQhecy81p8ky3bmOS0LK+CPuz0LF3VVvrDnnXUSBCWa2WW6t7burmoHvgPV
oB2jrvwkS6dNjRJ7CoyGvV0N6d60kiD0LjZg6Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
`pragma protect data_block
//SrRHjB6PI2U7BlibrxEiyVcsbXpJfAz5qRjQ14PTjYAk2gNOyT7vumIbFemhvCmpSmpwH3fOrX
hFaDX75BCZfRHZh5TvxTPjS7wHjjiUkyxlGfmQmvg5Mo+QNMjq4LWRcczHUapmJOwn0uy0NXJzxT
ZTG7eg2+/LMDoYpDUldaefOBR2Cuwrt1ndBjoPNDGwNnZIHfbsuI10IXsALaHYeEmyoKcH9c2MJP
LOHh/xXSLc+PrN6Mgkg8wDBpyhdF6cgYkluUDeLYNE3nJvpMCVdioplvyvyIv5NZnaZ6sqyfgAE3
9t5gwdT3DOfjaalBsl66M/q/QhZUQ1V+Z8SBIlcw5wAHL3JHI54Uw2gcf030WNhNn55GKGgigFXX
9Wy5iYpWhnPD0iBFuVYRwt1Yc9MZ/2NJIwCoSd8eZXLrT4V/AaPdgbP4jF+ZiQbeTBK3mqDWOVeN
ca9jM0un2Toq2vID96rMzqqGiN53LvwrwfzX61CUy+DFJ2L1LsvIwW5+qv3PdHwcnlizLefxbKVm
aP1SaRuZvUWbtF2khViM0WNFMJ8EW48jX5MbH8Ipmeb3VxUhSmD/TR+DQ2btcfRh2DR6vQ7SGrwk
JpeB8jCmOSUvwqfvOIEwfAMdMfxGNcrVI4cR1ivE+iaaTTo6QKVFiUjqjgnh1tiZXehS6qfG4MO2
dnt6rt6axLlNfWh+FTId2mSc3eWafq+byestWONAXWQJILMTwiR45gb5OoPjJfwNmV+X7M76jQws
j0elr0DcRk2m5Wh/fGGmGGdxWHGVPdCry8fgaGNzySHrv5ZaiBjJ0QeyEMas49JYNKLHWhRVPkJe
BYZlAZSqfBBs+RCtHhWPCAOqmeBZqTfsZmDaiEoOdetI/c3qhxI1dn1S5shsE+Ojkj7FDPBZBlwU
pWh8lri5cS3/ORDRQ+8cc+AsE+dQKtB8LoRtF5SBqiI8eyETl2aUWZNKRB842DSl8wcjpRmvpi/v
3qXvo/cTvy+OyhWmHAOXfjlAoe2StglGSz1f/p0BbZ7BiWgLYBbI4yjOYQh9G+adbzQzTqY0apXO
fyjgU/3KPaNEPfLCEaonP4/K2TBRp0c5ifk9vUXA2Yk1NeVIXiybXbFok6kAdEMQ4MZgBJ302jyJ
V7PkCkXvfvdzK+XNYwNUUFbH+fS1acn96LeMUkcoX1siqu2FeESypX075gjWEgeQpfb44wBGGRmu
6d3mbcQ5Yn3KLXNTuUydGSTaqtiCmMSrY0gx+E2RYBbTFe56Uw7/ag7w0VvLVfMzyHAm470Yg6Ic
HruWthP/Q2e1ZKYC/swoqc2l51z0vH/GFtnCISuT/9HMkIvbwbAAr8kS6v8nXIP58SSdf1OMXScO
8k/X+/n/RQpdSfd7OqTixuMhzzEuLxmnes1pgU99E/x8Mg+IFkxJVOk7k+bln3eCfPSGz6uyYDQB
UMHviVxiu11vOqNHNc4gn0NhYYmKfKjeyhxLEaMBYAEdd8EZ0d3s41l4VqSjazfLRf3fwXSUodp1
2tshAmqqLndb7vcfyCMUdhWfJRxfdKi3NZWy1gaqxHPjy/KDk1wGU6HkPlERxslMfmmQtR62zuLA
GpnqC+6ut2E4Htov/wy8yHH3M848Yzvy+9ekEMmeuXurH1ZNvyPH3duXHYjFNhbmmVT5T/K2+/+M
hxR5fXb2+56fw9yYa48gy/GDEoT1v0KwGa9ZqpOfmvhFxHmzs5adxFkaSjN4qRYpYLL56OfoNYZU
Zn5XO+BZNmDEX41USyoLoo7x3bms0ecNUQp6jCEtUNx6aVOJS3Uf1Np0cIHaRNzc/Z4b0rDu6NXB
wX22kGbvm4/N0W6dcWN6MIBqGAFdWmHGvqNs/mbOwv39u6JcTnkwkzt6QsQT0JBH0cInQ3NFLvkV
nTfEVZfM42f3KAzoYsykgKN5HiLwPq2M4uy+jKbRWhvv1ydGTCWTS0WY8F9pmwX0BJOV9PvQy1OU
khxfEvZg4FaxZA0LE0XQeM3MmYq05uIgUtZe42LDth8k0fO/fM+7a8cEI2jbUzKMDgmTFmi1aWrs
3xDMg7/3EZwh+4rk3fZMCJXq79LPogEnSPd9mbGVhM3aDV0KIcSm4WGFuHAZoDQGu3FttkD00Iwl
opDo3qbH3GaELHGMG9cZIKxxY73T3gatyycvxBPsKX1lom6r645XRQ13DvhDQDqGS24mrwStxVQk
Iw3npVCinyoENj1SJK8Xhtw6kcijCMk3sn6AgrjMkCM/Cn+sF+FupOC+mKKqjp18BJl0AHGnTW1P
aTr8MZe5OgAwoYZswgums46a2Xe0YQ5lLMTzvZ9cVjwTL+pJ4SWFCBqxNvocUzk3Ft1jwDU1rNF2
H11yLbefcXrd4VOSvjEui+0EYTJqmqjpHt+iDg25R66+N1lILB3u34/YV6/GDVQsCf6KV1a9zsAI
7qNmhJLM7uJDM/h+n1K+WeR13kRLWsasXI1m0wkcTDx2xsRxQ7bwqEPml2wiNe1TY00OcpWGVHXO
lhgEltXSF+3wEUJyHoVa1sn2/sg0vgmkB6JmTVf75PgPCnhW/YrxLhvyVtRNrV4EiuYZ2+M6qRaA
wJwOBVnQJhQ3axIeYxMqjV4kLwHKJ2L3qAbmOq8ZSBLyA930FrH/zYCJHwQ10qkMyY4ViXx96Gwh
9C4K/xr6sJQHmncq12xqT/sZw7oVzabCCIPh1dz8/iS4VJQpRoyLTSjLn89dq56FATsEH2MyQY3F
YBCgeCVxqKyi1myBEw4DNFPuuWaNJXFjFO0JB5zQh2xdrLhK0mkHspOC7ZT4jNb7ZBj9EVrp4O1d
F3gHA47rI+rFz10fgodXKOi7cKsDcQN7nGJDGL6X3xMhvZmStf/jiePBPLaYN1mhiOiFMPd/AEQE
Ztc7v61a9s4mBz/qyJ53U+6GjmAPNM1O46EXWmp4XjQCHW/RveTQZFuNagdZT6X/nB5sR49Y6MnT
2Uvlu5chKPU2gArz2U6SNTrQxdlmqginXQK0wX8K6+9Ip0dtuuRbQ+ID7Px4JVw/j3061Fskq8Fz
l5hn3yoZTh8ZdFjt5n76l+TsjKRGMGulRDVumbjOQkq27caFUYpUgV7pK7ocmamfFWtCVnzRqARA
Tb5y0CIBJGx5tVJhnJe1ufrwRnWWMzB6tocEYHUxs//dAMnNiKlePkB1VpF6nfoRtGN/qqXme9Ay
YkEP7kwIvEzq+LRZyvonP92JLp3ZXjU4OLyFQ1XrYWLbU4Fwbp829uDesgz+HBmOZmL8ODbcmapH
b6wGFuMnFDHk6JLk/L9UoAjfywt0cHI8uqX63k9CuT0igEA5swymyGvfJqWYFmDOiW+it4QlrzKJ
O3GO3f5wYruNhSkSRgIpq7BEVODgocPbs/x9wz3VlUc/uyS9LJhBczpaaRDGXJzWOxVhn9XSXaVs
G9Bc+BZLw9pWIvlPA+pVhFimRS3cohraV92Vzj/pEH9n4DVpS6Vh/Z4MycNYEj7i7LAS3ogung3H
dxrpS0O5DEK7i8K5PnzpF2YdB7MNX9O2aNi4j0fFrmLKEizlHrz9y/38Qq+SO4GJ8Azt/4I73mmI
37XlrxxV2rWVghOtbWS6GcSvL38Z2qz3hOd3VkGN9iCFWz6BkH1QZHRLJTYjHijYLZeKwV3uJnd8
xJNx3cNtc+eojlS7sz+Jl5l+EX+whmk+46XzZbz6bazFT6rfyNhDkfGxqBpPnOdSNvymj7nGQNa8
eCy92jrwjitZZL8mzSNH82AqpJia95sGYKNd3gShdFrnwVZoTrMXOCm4MVZjuXVH9bOwhSPCFQRf
uKIeFFoq3H8hAjFJQCXvV1i1B+ZRioG75L60VOJCcg2tBuXDjIKQYsUZU3Uxo5TwK2Oqw1FC1F16
Hkj9gwfgTt5pOUK2hyWh80LG/y6uBYZ4DiIM43BQUeJ4veyl5PMqjDxN5oW1VfTfvYaMbvU=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
