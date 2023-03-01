module address_decoder_channel (
		input  wire        csr_clk_clk,           //       csr_clk.clk
		input  wire        csr_clk_reset_reset_n, // csr_clk_reset.reset_n
		output wire [9:0]  mac_address,           //           mac.address
		output wire        mac_write,             //              .write
		output wire        mac_read,              //              .read
		input  wire [31:0] mac_readdata,          //              .readdata
		output wire [31:0] mac_writedata,         //              .writedata
		input  wire        mac_waitrequest,       //              .waitrequest
		input  wire [15:0] slave_address,         //         slave.address
		output wire        slave_waitrequest,     //              .waitrequest
		input  wire        slave_read,            //              .read
		output wire [31:0] slave_readdata,        //              .readdata
		input  wire        slave_write,           //              .write
		input  wire [31:0] slave_writedata,       //              .writedata
		output wire [10:0] phy_address,           //           phy.address
		output wire        phy_write,             //              .write
		output wire        phy_read,              //              .read
		input  wire [31:0] phy_readdata,          //              .readdata
		output wire [31:0] phy_writedata,         //              .writedata
		input  wire        phy_waitrequest,       //              .waitrequest
		output wire [9:0]  xcvr_rcfg_address,     //     xcvr_rcfg.address
		output wire        xcvr_rcfg_write,       //              .write
		output wire        xcvr_rcfg_read,        //              .read
		input  wire [31:0] xcvr_rcfg_readdata,    //              .readdata
		output wire [31:0] xcvr_rcfg_writedata,   //              .writedata
		input  wire        xcvr_rcfg_waitrequest  //              .waitrequest
	);
endmodule

