source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_csr_clk/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_11/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_10/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_9/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_master/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_5/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_6/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_7/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_3/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_8/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_4/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_2/sim/common/modelsim_files.tcl]

namespace eval address_decoder_multi_channel {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_0::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_csr_clk::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_11::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_10::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_9::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_master::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_5::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_6::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_7::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_3::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_8::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_4::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_1::get_design_libraries]]
    set libraries [dict merge $libraries [address_decoder_multi_channel_channel_2::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_181 1
    dict set libraries altera_merlin_slave_translator_181  1
    dict set libraries altera_merlin_master_agent_181      1
    dict set libraries altera_merlin_slave_agent_181       1
    dict set libraries altera_avalon_sc_fifo_181           1
    dict set libraries altera_merlin_router_181            1
    dict set libraries altera_merlin_traffic_limiter_181   1
    dict set libraries alt_hiconnect_sc_fifo_181           1
    dict set libraries altera_merlin_demultiplexer_181     1
    dict set libraries altera_merlin_multiplexer_181       1
    dict set libraries altera_mm_interconnect_181          1
    dict set libraries altera_reset_controller_181         1
    dict set libraries address_decoder_multi_channel       1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_0::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_0/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_csr_clk::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_csr_clk/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_11::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_11/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_10::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_10/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_9::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_9/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_master::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_master/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_5::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_5/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_6::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_6/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_7::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_7/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_3::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_3/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_8::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_8/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_4::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_4/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_1::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_1/sim/"]]
    set memory_files [concat $memory_files [address_decoder_multi_channel_channel_2::get_memory_files "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_2/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_0/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_csr_clk::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_csr_clk/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_11::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_11/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_10::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_10/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_9::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_9/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_master::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_master/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_5::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_5/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_6::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_6/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_7::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_7/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_3::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_3/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_8::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_8/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_4::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_4/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_1/sim/"]]
    set design_files [dict merge $design_files [address_decoder_multi_channel_channel_2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_2/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_0/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_csr_clk::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_csr_clk/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_11::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_11/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_10::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_10/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_9::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_9/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_master::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_master/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_5::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_5/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_6::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_6/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_7::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_7/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_3::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_3/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_8::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_8/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_4::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_4/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_1/sim/"]]
    set design_files [concat $design_files [address_decoder_multi_channel_channel_2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/address_decoder_multi_channel/address_decoder_multi_channel_channel_2/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_181/sim/address_decoder_multi_channel_altera_merlin_master_translator_181_mhudjri.sv"]\"  -work altera_merlin_master_translator_181"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_181/sim/address_decoder_multi_channel_altera_merlin_slave_translator_181_5aswt6a.sv"]\"  -work altera_merlin_slave_translator_181"   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_181/sim/address_decoder_multi_channel_altera_merlin_master_agent_181_t5eyqrq.sv"]\"  -work altera_merlin_master_agent_181"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/address_decoder_multi_channel_altera_merlin_slave_agent_181_a7g37xa.sv"]\"  -work altera_merlin_slave_agent_181"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_181"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_181/sim/address_decoder_multi_channel_altera_avalon_sc_fifo_181_hseo73i.v"]\"  -work altera_avalon_sc_fifo_181"                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/address_decoder_multi_channel_altera_merlin_router_181_2r62dfa.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/address_decoder_multi_channel_altera_merlin_router_181_ssua6gq.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_181/sim/address_decoder_multi_channel_altera_merlin_traffic_limiter_181_3qlefua.v"]\"  -work altera_merlin_traffic_limiter_181"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/address_decoder_multi_channel_alt_hiconnect_sc_fifo_181_cjmuh4a.sv"]\"  -work alt_hiconnect_sc_fifo_181"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_infer_scfifo.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_mlab_scfifo.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_fifo_empty.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_mlab_scfifo_a6.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_mlab_scfifo_a7.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_hiconnect_sc_fifo_181/sim/alt_st_reg_scfifo.sv"]\"  -work alt_hiconnect_sc_fifo_181"                                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_181/sim/address_decoder_multi_channel_altera_merlin_traffic_limiter_181_cjprurq.v"]\"  -work altera_merlin_traffic_limiter_181"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_181/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_181"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_181/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_181"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_181/sim/address_decoder_multi_channel_altera_merlin_traffic_limiter_181_reppfiq.sv"]\"  -work altera_merlin_traffic_limiter_181"      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/address_decoder_multi_channel_altera_merlin_demultiplexer_181_5j5bexa.sv"]\"  -work altera_merlin_demultiplexer_181"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/address_decoder_multi_channel_altera_merlin_multiplexer_181_grdugky.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/address_decoder_multi_channel_altera_merlin_demultiplexer_181_otwqgqi.sv"]\"  -work altera_merlin_demultiplexer_181"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/address_decoder_multi_channel_altera_merlin_multiplexer_181_txx6epa.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_181/sim/address_decoder_multi_channel_altera_mm_interconnect_181_2yhwuoa.v"]\"  -work altera_mm_interconnect_181"                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_181"                                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_181"                                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/address_decoder_multi_channel.v"]\"  -work address_decoder_multi_channel"                                                                                                  
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_csr_clk::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_11::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_10::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_9::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_master::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_5::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_6::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_7::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_3::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_8::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_4::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_1::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [address_decoder_multi_channel_channel_2::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [address_decoder_multi_channel_channel_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_csr_clk::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_11::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_10::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_9::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_master::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_5::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_6::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_7::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_3::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_8::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_4::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [address_decoder_multi_channel_channel_2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_csr_clk::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_11::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_10::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_9::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_master::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_5::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_6::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_7::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_3::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_8::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_4::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [address_decoder_multi_channel_channel_2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
