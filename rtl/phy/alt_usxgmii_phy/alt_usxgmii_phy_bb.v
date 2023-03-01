module alt_usxgmii_phy (
		input  wire        csr_clk,              //            csr_clk.clk
		input  wire        xgmii_rx_coreclkin,   // xgmii_rx_coreclkin.clk
		input  wire        xgmii_tx_coreclkin,   // xgmii_tx_coreclkin.clk
		input  wire        reset,                //              reset.reset
		input  wire        rx_digitalreset,      //    rx_digitalreset.rx_digitalreset
		input  wire        tx_digitalreset,      //    tx_digitalreset.tx_digitalreset
		output wire [31:0] csr_readdata,         //      avalon_mm_csr.readdata
		input  wire [31:0] csr_writedata,        //                   .writedata
		input  wire [10:0] csr_address,          //                   .address
		output wire        csr_waitrequest,      //                   .waitrequest
		input  wire        csr_read,             //                   .read
		input  wire        csr_write,            //                   .write
		input  wire        xgmii_tx_valid,       //     xgmii_tx_valid.export
		input  wire [3:0]  xgmii_tx_control,     //   xgmii_tx_control.export
		input  wire [31:0] xgmii_tx_data,        //      xgmii_tx_data.export
		output wire        xgmii_rx_valid,       //     xgmii_rx_valid.export
		output wire [3:0]  xgmii_rx_control,     //   xgmii_rx_control.export
		output wire [31:0] xgmii_rx_data,        //      xgmii_rx_data.export
		output wire        led_an,               //             led_an.export
		output wire        rx_block_lock,        //      rx_block_lock.rx_enh_blk_lock
		output wire [2:0]  operating_speed,      //    operating_speed.export
		input  wire [0:0]  tx_serial_clk,        //      tx_serial_clk.clk
		input  wire        rx_cdr_refclk_1,      //    rx_cdr_refclk_1.clk
		output wire        rx_pma_clkout,        //      rx_pma_clkout.clk
		input  wire [0:0]  tx_analogreset,       //     tx_analogreset.tx_analogreset
		input  wire [0:0]  rx_analogreset,       //     rx_analogreset.rx_analogreset
		output wire [0:0]  tx_cal_busy,          //        tx_cal_busy.tx_cal_busy
		output wire [0:0]  rx_cal_busy,          //        rx_cal_busy.rx_cal_busy
		output wire [0:0]  tx_serial_data,       //     tx_serial_data.tx_serial_data
		input  wire [0:0]  rx_serial_data,       //     rx_serial_data.rx_serial_data
		output wire [0:0]  rx_is_lockedtodata,   // rx_is_lockedtodata.rx_is_lockedtodata
		input  wire [0:0]  reconfig_clk,         //       reconfig_clk.clk
		input  wire [0:0]  reconfig_reset,       //     reconfig_reset.reset
		input  wire [0:0]  reconfig_write,       //      reconfig_avmm.write
		input  wire [0:0]  reconfig_read,        //                   .read
		input  wire [9:0]  reconfig_address,     //                   .address
		input  wire [31:0] reconfig_writedata,   //                   .writedata
		output wire [31:0] reconfig_readdata,    //                   .readdata
		output wire [0:0]  reconfig_waitrequest  //                   .waitrequest
	);
endmodule

