// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: signal_out
// 
// Author: Andre Dubovskiy
// 
// Description: pulse state machine
// 

module PulseController
(
input clk_in,  //clk_in

input [31:0] pos1dur,
input [31:0] pos1pausedur,
input [31:0] pos2dur,
input [31:0] pos3dur,
input [31:0] pos4dur,
//input rst_n_in,  //rst_n_in, active low
output reg [7:0] signal_out  //signal_out output
);

//ADD MORE

reg [1:0] pulse_index = 1'd0;

reg [31:0] pulse_durations [1:0];

reg [31:0] timer = 32'd0; 

always@(posedge clk_in)
begin
	pulse_durations[0] <= pos1dur; //32'd40; 		// write pulse
	pulse_durations[1] <= pos1pausedur; //32'd20; // pause
end

always@(posedge clk_in)
	begin
		//if(!rst_n_in) begin 
		//	signal_out<=8'b1111_1111;
		//	pulse_index = 3'd0;
		//	timer = 16'd0;
			
		case (pulse_index)
		
			//reset and pause
			3'd0: begin
				signal_out<=8'b1000_1000;
			end
			3'd1: begin
				signal_out<=8'b1000_0000;
			end
			
			default: signal_out<=8'b0000_0000;
		endcase
		
		
		
		if(timer >= pulse_durations[pulse_index]) begin
			
			
			if(pulse_index == 1) pulse_index <= 0;
			else pulse_index <= pulse_index + 1;
			
			timer <= 0;			
		end
		else timer <= timer + 1;
	end

endmodule