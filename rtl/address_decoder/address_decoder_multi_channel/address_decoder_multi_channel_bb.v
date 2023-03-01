module address_decoder_multi_channel (
		output wire [15:0] channel_0_address,      //     channel_0.address
		output wire        channel_0_write,        //              .write
		output wire        channel_0_read,         //              .read
		input  wire [31:0] channel_0_readdata,     //              .readdata
		output wire [31:0] channel_0_writedata,    //              .writedata
		input  wire        channel_0_waitrequest,  //              .waitrequest
		output wire [15:0] channel_1_address,      //     channel_1.address
		output wire        channel_1_write,        //              .write
		output wire        channel_1_read,         //              .read
		input  wire [31:0] channel_1_readdata,     //              .readdata
		output wire [31:0] channel_1_writedata,    //              .writedata
		input  wire        channel_1_waitrequest,  //              .waitrequest
		output wire [15:0] channel_10_address,     //    channel_10.address
		output wire        channel_10_write,       //              .write
		output wire        channel_10_read,        //              .read
		input  wire [31:0] channel_10_readdata,    //              .readdata
		output wire [31:0] channel_10_writedata,   //              .writedata
		input  wire        channel_10_waitrequest, //              .waitrequest
		output wire [15:0] channel_11_address,     //    channel_11.address
		output wire        channel_11_write,       //              .write
		output wire        channel_11_read,        //              .read
		input  wire [31:0] channel_11_readdata,    //              .readdata
		output wire [31:0] channel_11_writedata,   //              .writedata
		input  wire        channel_11_waitrequest, //              .waitrequest
		output wire [15:0] channel_2_address,      //     channel_2.address
		output wire        channel_2_write,        //              .write
		output wire        channel_2_read,         //              .read
		input  wire [31:0] channel_2_readdata,     //              .readdata
		output wire [31:0] channel_2_writedata,    //              .writedata
		input  wire        channel_2_waitrequest,  //              .waitrequest
		output wire [15:0] channel_3_address,      //     channel_3.address
		output wire        channel_3_write,        //              .write
		output wire        channel_3_read,         //              .read
		input  wire [31:0] channel_3_readdata,     //              .readdata
		output wire [31:0] channel_3_writedata,    //              .writedata
		input  wire        channel_3_waitrequest,  //              .waitrequest
		output wire [15:0] channel_4_address,      //     channel_4.address
		output wire        channel_4_write,        //              .write
		output wire        channel_4_read,         //              .read
		input  wire [31:0] channel_4_readdata,     //              .readdata
		output wire [31:0] channel_4_writedata,    //              .writedata
		input  wire        channel_4_waitrequest,  //              .waitrequest
		output wire [15:0] channel_5_address,      //     channel_5.address
		output wire        channel_5_write,        //              .write
		output wire        channel_5_read,         //              .read
		input  wire [31:0] channel_5_readdata,     //              .readdata
		output wire [31:0] channel_5_writedata,    //              .writedata
		input  wire        channel_5_waitrequest,  //              .waitrequest
		output wire [15:0] channel_6_address,      //     channel_6.address
		output wire        channel_6_write,        //              .write
		output wire        channel_6_read,         //              .read
		input  wire [31:0] channel_6_readdata,     //              .readdata
		output wire [31:0] channel_6_writedata,    //              .writedata
		input  wire        channel_6_waitrequest,  //              .waitrequest
		output wire [15:0] channel_7_address,      //     channel_7.address
		output wire        channel_7_write,        //              .write
		output wire        channel_7_read,         //              .read
		input  wire [31:0] channel_7_readdata,     //              .readdata
		output wire [31:0] channel_7_writedata,    //              .writedata
		input  wire        channel_7_waitrequest,  //              .waitrequest
		output wire [15:0] channel_8_address,      //     channel_8.address
		output wire        channel_8_write,        //              .write
		output wire        channel_8_read,         //              .read
		input  wire [31:0] channel_8_readdata,     //              .readdata
		output wire [31:0] channel_8_writedata,    //              .writedata
		input  wire        channel_8_waitrequest,  //              .waitrequest
		output wire [15:0] channel_9_address,      //     channel_9.address
		output wire        channel_9_write,        //              .write
		output wire        channel_9_read,         //              .read
		input  wire [31:0] channel_9_readdata,     //              .readdata
		output wire [31:0] channel_9_writedata,    //              .writedata
		input  wire        channel_9_waitrequest,  //              .waitrequest
		input  wire        csr_clk_clk,            //       csr_clk.clk
		input  wire        csr_clk_reset_reset_n,  // csr_clk_reset.reset_n
		input  wire [19:0] slave_address,          //         slave.address
		output wire        slave_waitrequest,      //              .waitrequest
		input  wire        slave_read,             //              .read
		output wire [31:0] slave_readdata,         //              .readdata
		input  wire        slave_write,            //              .write
		input  wire [31:0] slave_writedata         //              .writedata
	);
endmodule

