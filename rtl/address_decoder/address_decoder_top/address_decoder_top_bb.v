module address_decoder_top (
		input  wire        csr_clk_clk,                             //                     csr_clk.clk
		input  wire        csr_clk_reset_reset_n,                   //               csr_clk_reset.reset_n
		input  wire        mac_clk_clk,                             //                     mac_clk.clk
		input  wire        mac_clk_reset_reset_n,                   //               mac_clk_reset.reset_n
		input  wire [25:0] slave_address,                           //                       slave.address
		output wire        slave_waitrequest,                       //                            .waitrequest
		input  wire        slave_read,                              //                            .read
		output wire [31:0] slave_readdata,                          //                            .readdata
		output wire        slave_readdatavalid,                     //                            .readdatavalid
		input  wire        slave_write,                             //                            .write
		input  wire [31:0] slave_writedata,                         //                            .writedata
		output wire [19:0] multi_channel_address,                   //               multi_channel.address
		output wire        multi_channel_write,                     //                            .write
		output wire        multi_channel_read,                      //                            .read
		input  wire [31:0] multi_channel_readdata,                  //                            .readdata
		output wire [31:0] multi_channel_writedata,                 //                            .writedata
		input  wire        multi_channel_waitrequest,               //                            .waitrequest
		output wire [13:0] traffic_controller_ch_0_1_address,       //   traffic_controller_ch_0_1.address
		output wire        traffic_controller_ch_0_1_write,         //                            .write
		output wire        traffic_controller_ch_0_1_read,          //                            .read
		input  wire [31:0] traffic_controller_ch_0_1_readdata,      //                            .readdata
		output wire [31:0] traffic_controller_ch_0_1_writedata,     //                            .writedata
		input  wire        traffic_controller_ch_0_1_waitrequest,   //                            .waitrequest
		output wire [13:0] traffic_controller_ch_10_11_address,     // traffic_controller_ch_10_11.address
		output wire        traffic_controller_ch_10_11_write,       //                            .write
		output wire        traffic_controller_ch_10_11_read,        //                            .read
		input  wire [31:0] traffic_controller_ch_10_11_readdata,    //                            .readdata
		output wire [31:0] traffic_controller_ch_10_11_writedata,   //                            .writedata
		input  wire        traffic_controller_ch_10_11_waitrequest, //                            .waitrequest
		output wire [13:0] traffic_controller_ch_2_3_address,       //   traffic_controller_ch_2_3.address
		output wire        traffic_controller_ch_2_3_write,         //                            .write
		output wire        traffic_controller_ch_2_3_read,          //                            .read
		input  wire [31:0] traffic_controller_ch_2_3_readdata,      //                            .readdata
		output wire [31:0] traffic_controller_ch_2_3_writedata,     //                            .writedata
		input  wire        traffic_controller_ch_2_3_waitrequest,   //                            .waitrequest
		output wire [13:0] traffic_controller_ch_4_5_address,       //   traffic_controller_ch_4_5.address
		output wire        traffic_controller_ch_4_5_write,         //                            .write
		output wire        traffic_controller_ch_4_5_read,          //                            .read
		input  wire [31:0] traffic_controller_ch_4_5_readdata,      //                            .readdata
		output wire [31:0] traffic_controller_ch_4_5_writedata,     //                            .writedata
		input  wire        traffic_controller_ch_4_5_waitrequest,   //                            .waitrequest
		output wire [13:0] traffic_controller_ch_6_7_address,       //   traffic_controller_ch_6_7.address
		output wire        traffic_controller_ch_6_7_write,         //                            .write
		output wire        traffic_controller_ch_6_7_read,          //                            .read
		input  wire [31:0] traffic_controller_ch_6_7_readdata,      //                            .readdata
		output wire [31:0] traffic_controller_ch_6_7_writedata,     //                            .writedata
		input  wire        traffic_controller_ch_6_7_waitrequest,   //                            .waitrequest
		output wire [13:0] traffic_controller_ch_8_9_address,       //   traffic_controller_ch_8_9.address
		output wire        traffic_controller_ch_8_9_write,         //                            .write
		output wire        traffic_controller_ch_8_9_read,          //                            .read
		input  wire [31:0] traffic_controller_ch_8_9_readdata,      //                            .readdata
		output wire [31:0] traffic_controller_ch_8_9_writedata,     //                            .writedata
		input  wire        traffic_controller_ch_8_9_waitrequest    //                            .waitrequest
	);
endmodule

