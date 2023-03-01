# (C) 2001-2018 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#!/usr/bin/env bash

# RUN_SCRIPT_PARAMETERS
QUARTUS_INSTALL_DIR="$QUARTUS_ROOTDIR"
SETUP_SCRIPTS="../setup_scripts/xcelium/xcelium_setup.sh"
dut_wave_do="xcelium_wave.tcl"

cp ../setup_scripts/xcelium/cds.lib .
cp -rf ../setup_scripts/xcelium/cds_libs .
cp ../setup_scripts/xcelium/hdl.var .

# This execution line only create the compilation libraries directory. The libraries need to be created before compile Avalon IP. Furthermore Avalon IP compilation
# is needed before testbench models compilation.
. $SETUP_SCRIPTS TOP_LEVEL_NAME="tb_top" SKIP_DEV_COM=1 SKIP_COM=1 SKIP_ELAB=1 SKIP_SIM=1 QSYS_SIMDIR="./../setup_scripts"

# Compile Avalon VIP
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/lib/verbosity_pkg.sv"                                                                                                                                                                                                                                                                                                         
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/lib/avalon_mm_pkg.sv"
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/lib/avalon_utilities_pkg.sv"
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/altera_avalon_mm_master_bfm/altera_avalon_mm_master_bfm.sv"
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/altera_avalon_st_sink_bfm/altera_avalon_st_sink_bfm.sv"
xmvlog -sv "$QUARTUS_INSTALL_DIR/../ip/altera/sopc_builder_ip/verification/altera_avalon_st_source_bfm/altera_avalon_st_source_bfm.sv"

# This execution line include compilation.
. $SETUP_SCRIPTS TOP_LEVEL_NAME="tb_top" SKIP_ELAB=1 SKIP_SIM=1 QSYS_SIMDIR="./../setup_scripts"

# run the elaboration
xmelab -timescale 1ps/1ps -access +w+r+c +DISABLEGENCHK -namemap_mixgen -relax $TOP_LEVEL_NAME

# run the simulation
xmsim -licqueue -tcl -input $dut_wave_do $TOP_LEVEL_NAME

