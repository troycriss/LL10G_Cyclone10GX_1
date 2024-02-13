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


#**************************************************************
# Create input reference Clocks
#**************************************************************

create_clock -period "125 MHz" -name {clk_125} [get_ports clk_125]
create_clock -period "644.53125 MHz" -name {refclk_10g} [get_ports refclk_10g]

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

#**************************************************************
# Set False Path for alt_mge_reset_synchronizer
#**************************************************************
set reset_sync_aclr_counter 0
set reset_sync_clrn_counter 0
set reset_sync_aclr_collection [get_pins -compatibility_mode -nocase -nowarn *alt_mge_reset_synchronizer:*|alt_mge_reset_synchronizer_int_chain*|aclr]
set reset_sync_clrn_collection [get_pins -compatibility_mode -nocase -nowarn *alt_mge_reset_synchronizer:*|alt_mge_reset_synchronizer_int_chain*|clrn]

set_false_path -to *dcfifo:dcfifo_component|dcfifo_*:auto_generated|dffpipe_*:wraclr|dffe*a[0]
set_false_path -to *dcfifo:dcfifo_component|dcfifo_*:auto_generated|dffpipe_*:rdaclr|dffe*a[0]

set_false_path -from *eth_std_traffic_controller*|GEN|pos*dur*
set_false_path -from *eth_std_traffic_controller*|GEN|neg*dur*

set_false_path -from *eth_std_traffic_controller*|GEN|do_test_counter_data*
set_false_path -from *eth_std_traffic_controller*|GEN|trigger_offset*

set_false_path -from [get_clocks DUT|core_pll|xcvr_fpll_a10_0|outclk0] -to [get_clocks DUT|core_pll|xcvr_fpll_a10_0|outclk3]


foreach_in_collection reset_sync_aclr_pin $reset_sync_aclr_collection {
    set reset_sync_aclr_counter [expr $reset_sync_aclr_counter + 1]
}

foreach_in_collection reset_sync_clrn_pin $reset_sync_clrn_collection {
    set reset_sync_clrn_counter [expr $reset_sync_clrn_counter + 1]
}

if {$reset_sync_aclr_counter > 0} {
    set_false_path -to [get_pins -compatibility_mode -nocase *alt_mge_reset_synchronizer:*|alt_mge_reset_synchronizer_int_chain*|aclr]
}

if {$reset_sync_clrn_counter > 0} {
    set_false_path -to [get_pins -compatibility_mode -nocase *alt_mge_reset_synchronizer:*|alt_mge_reset_synchronizer_int_chain*|clrn]
}
# add constraint for JTAG
create_clock -name altera_reserved_tck [get_ports {altera_reserved_tck}] -period 16MHz  
if { [string equal quartus_fit \$::TimeQuestInfo(nameofexecutable)] } { set_max_delay -to [get_ports { altera_reserved_tdo } ] 0 }
set_clock_groups -asynchronous -group {altera_reserved_tck}
