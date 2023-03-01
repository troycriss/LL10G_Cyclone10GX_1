
namespace eval alt_usxgmii_phy {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_common_sv_packages  1
    dict set libraries alt_mge_phy_pcs_181        1
    dict set libraries alt_mge_phy_xcvr_term_181  1
    dict set libraries altera_xcvr_native_a10_181 1
    dict set libraries alt_mge_phy_181            1
    dict set libraries alt_usxgmii_phy            1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "altera_common_sv_packages::altera_xcvr_native_a10_functions_h" "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/altera_xcvr_native_a10_functions_h.sv"]\"  -work altera_common_sv_packages"
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_async_fifo_fpga.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_bitsync.v"]\"  -work alt_mge_phy_pcs_181"                                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_mbow_clock_crosser.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_pcs.v"]\"  -work alt_mge_phy_pcs_181"                                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_pcs_csr_top.v"]\"  -work alt_mge_phy_pcs_181"                                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_pcs_rst_sync.v"]\"  -work alt_mge_phy_pcs_181"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_pipeline_base.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_std_synchronizer_bundle.v"]\"  -work alt_mge_phy_pcs_181"                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_an_top.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_creg_map.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_creg_top.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_incr_cnt.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_pcs.v"]\"  -work alt_mge_phy_pcs_181"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_rx_64_to_32_wadpt.v"]\"  -work alt_mge_phy_pcs_181"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_rx_data_derep.v"]\"  -work alt_mge_phy_pcs_181"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_rx_rm_fifo.v"]\"  -work alt_mge_phy_pcs_181"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_rx_rm_fifo_top.v"]\"  -work alt_mge_phy_pcs_181"                                                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_rx_top.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_tx_32_to_64_wadpt.v"]\"  -work alt_mge_phy_pcs_181"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_tx_clockcomp_fifo.v"]\"  -work alt_mge_phy_pcs_181"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_tx_data_mux.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_tx_data_rep.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_tx_top.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxg32_umii_fault.v"]\"  -work alt_mge_phy_pcs_181"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_1588_latency.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_1588_ppm_counter.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_clockcomp.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_pcs.v"]\"  -work alt_mge_phy_pcs_181"                                                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_rx_fifo.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_xgmii_soft_fifo.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_1588_ppm_counter.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_a_fifo_24.v"]\"  -work alt_mge_phy_pcs_181"                                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_carrier_sense.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_clock_crosser.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_colision_detect.v"]\"  -work alt_mge_phy_pcs_181"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_control.v"]\"  -work alt_mge_phy_pcs_181"                                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_gray_cnt.v"]\"  -work alt_mge_phy_pcs_181"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_gxb_aligned_rxsync.v"]\"  -work alt_mge_phy_pcs_181"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_host_control.v"]\"  -work alt_mge_phy_pcs_181"                                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_mdio_reg.v"]\"  -work alt_mge_phy_pcs_181"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_mii_rx_if_pcs.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_mii_tx_if_pcs.v"]\"  -work alt_mge_phy_pcs_181"                                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_ph_calculator.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_pma_gige.v"]\"  -work alt_mge_phy_pcs_181"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_pma.v"]\"  -work alt_mge_phy_pcs_181"                                                                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_reset_synchronizer.v"]\"  -work alt_mge_phy_pcs_181"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_rx_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_rx_encapsulation_strx_gx.v"]\"  -work alt_mge_phy_pcs_181"                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_rx_fifo_rd.v"]\"  -work alt_mge_phy_pcs_181"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_sdpm_altsyncram.v"]\"  -work alt_mge_phy_pcs_181"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_sgmii_clk_enable.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_std_synchronizer.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_1000_base_x_strx_gx.v"]\"  -work alt_mge_phy_pcs_181"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_autoneg.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_pcs_strx_gx.v"]\"  -work alt_mge_phy_pcs_181"                                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_rx_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_sgmii_strx_gx.v"]\"  -work alt_mge_phy_pcs_181"                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_top_tx_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_tx_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_tx_encapsulation.v"]\"  -work alt_mge_phy_pcs_181"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_xcvr_resync.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_xcvr_latency_pulse_measurement.v"]\"  -work alt_mge_phy_pcs_181"                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/latency_pulse_measurement.v"]\"  -work alt_mge_phy_pcs_181"                                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_sgmii_8_to_16_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge16_pcs_sgmii_16_to_8_converter.v"]\"  -work alt_mge_phy_pcs_181"                                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/mentor/alt_mge_phy_usxgmii_1588_latency.sv"]\" -L altera_common_sv_packages -work alt_mge_phy_pcs_181"                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_pcs_181/sim/altera_std_synchronizer_nocut.v"]\"  -work alt_mge_phy_pcs_181"                                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_xcvr_term_181/sim/mentor/alt_mge_phy_gf_clock_mux.v"]\"  -work alt_mge_phy_xcvr_term_181"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_xcvr_term_181/sim/mentor/alt_mge16_phy_xcvr_term.v"]\"  -work alt_mge_phy_xcvr_term_181"                                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_arbiter.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/alt_xcvr_arbiter.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/twentynm_pcs.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/twentynm_pma.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/twentynm_xcvr_native.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/twentynm_pcs.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/twentynm_pma.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/mentor/twentynm_xcvr_native.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/a10_avmm_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_pipe_retry.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_avmm_csr.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_prbs_accum.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_odi_accel.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_rcfg_arb.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/altera_xcvr_native_pcie_dfe_params_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/pcie_mgmt_commands_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/pcie_mgmt_functions_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/pcie_mgmt_program.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/pcie_mgmt_cpu.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/pcie_mgmt_master.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/altera_xcvr_native_pcie_dfe_ip.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/reconfig/alt_mge_phy_reconfig_parameters_CFG0.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_usxgmii_phy_altera_xcvr_native_a10_181_abaevuq.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_181/sim/alt_xcvr_native_rcfg_opt_logic_abaevuq.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_181"            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../alt_mge_phy_181/sim/alt_usxgmii_phy_alt_mge_phy_181_ofhxqti.v"]\"  -work alt_mge_phy_181"                                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/alt_usxgmii_phy.v"]\"  -work alt_usxgmii_phy"                                                                                                                 
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
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
