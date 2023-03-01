	address_decoder_channel u0 (
		.csr_clk_clk           (_connected_to_csr_clk_clk_),           //   input,   width = 1,       csr_clk.clk
		.csr_clk_reset_reset_n (_connected_to_csr_clk_reset_reset_n_), //   input,   width = 1, csr_clk_reset.reset_n
		.mac_address           (_connected_to_mac_address_),           //  output,  width = 10,           mac.address
		.mac_write             (_connected_to_mac_write_),             //  output,   width = 1,              .write
		.mac_read              (_connected_to_mac_read_),              //  output,   width = 1,              .read
		.mac_readdata          (_connected_to_mac_readdata_),          //   input,  width = 32,              .readdata
		.mac_writedata         (_connected_to_mac_writedata_),         //  output,  width = 32,              .writedata
		.mac_waitrequest       (_connected_to_mac_waitrequest_),       //   input,   width = 1,              .waitrequest
		.slave_address         (_connected_to_slave_address_),         //   input,  width = 16,         slave.address
		.slave_waitrequest     (_connected_to_slave_waitrequest_),     //  output,   width = 1,              .waitrequest
		.slave_read            (_connected_to_slave_read_),            //   input,   width = 1,              .read
		.slave_readdata        (_connected_to_slave_readdata_),        //  output,  width = 32,              .readdata
		.slave_write           (_connected_to_slave_write_),           //   input,   width = 1,              .write
		.slave_writedata       (_connected_to_slave_writedata_),       //   input,  width = 32,              .writedata
		.phy_address           (_connected_to_phy_address_),           //  output,  width = 11,           phy.address
		.phy_write             (_connected_to_phy_write_),             //  output,   width = 1,              .write
		.phy_read              (_connected_to_phy_read_),              //  output,   width = 1,              .read
		.phy_readdata          (_connected_to_phy_readdata_),          //   input,  width = 32,              .readdata
		.phy_writedata         (_connected_to_phy_writedata_),         //  output,  width = 32,              .writedata
		.phy_waitrequest       (_connected_to_phy_waitrequest_),       //   input,   width = 1,              .waitrequest
		.xcvr_rcfg_address     (_connected_to_xcvr_rcfg_address_),     //  output,  width = 10,     xcvr_rcfg.address
		.xcvr_rcfg_write       (_connected_to_xcvr_rcfg_write_),       //  output,   width = 1,              .write
		.xcvr_rcfg_read        (_connected_to_xcvr_rcfg_read_),        //  output,   width = 1,              .read
		.xcvr_rcfg_readdata    (_connected_to_xcvr_rcfg_readdata_),    //   input,  width = 32,              .readdata
		.xcvr_rcfg_writedata   (_connected_to_xcvr_rcfg_writedata_),   //  output,  width = 32,              .writedata
		.xcvr_rcfg_waitrequest (_connected_to_xcvr_rcfg_waitrequest_)  //   input,   width = 1,              .waitrequest
	);

