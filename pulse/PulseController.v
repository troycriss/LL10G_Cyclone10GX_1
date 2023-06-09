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
input clk_in,

input [31:0] pos1dur,
input [31:0] pos1pausedur,
input [31:0] pos2dur,
input [31:0] pos2pausedur,
input [31:0] pos3dur,
input [31:0] pos3pausedur,
input [31:0] pos4dur,
input [31:0] pos4pausedur,

input [31:0] neg1dur,
input [31:0] neg1pausedur,
input [31:0] neg2dur,
input [31:0] neg2pausedur,
input [31:0] neg3dur,
input [31:0] neg3pausedur,
input [31:0] neg4dur,
input [31:0] neg4pausedur,

output reg [7:0] signal_out
);

parameter maxl = 16-1;

reg [3:0] pulse_index = 4'd0;

reg [maxl:0] pulse_durations [11:0];

reg [maxl:0] timer = 16'd0;

reg [maxl:0] currentpuldur = 16'd1;

always@(posedge clk_in)

//(R)eset then (W)rite then (M)easure, then do it again with reversed polarity for R and W
//M pulse is always positive
begin
	pulse_durations[11] <= pos1dur; 			//R+
	pulse_durations[0] <= pos1pausedur;		//pause
	pulse_durations[1] <= pos2dur; 			//W-
	pulse_durations[2] <= pos2pausedur;		//pause
	pulse_durations[3] <= pos3dur; 			//M
	pulse_durations[4] <= pos3pausedur;		//pause
	
	pulse_durations[5] <= neg1dur; 			//R-
	pulse_durations[6] <= neg1pausedur;		//pause
	pulse_durations[7] <= neg2dur; 			//W+
	pulse_durations[8] <= neg2pausedur;		//pause
	pulse_durations[9] <= neg3dur; 	   	//M
	pulse_durations[10] <= neg3pausedur;	//pause
end

always@(posedge clk_in)
	begin
			
		case (pulse_index)
		
			4'd0: begin
				signal_out<=8'b1000_1000;	//R+
			end
			4'd1: begin
				signal_out<=8'b1000_0000;
			end
			
			4'd2: begin
				signal_out<=8'b1001_0000;	//W-
			end
			4'd3: begin
				signal_out<=8'b1000_0000;
			end
			
			4'd4: begin
				signal_out<=8'b1000_0100;	//M
			end
			4'd5: begin
				signal_out<=8'b1000_0000;
			end
			
			//now the same pulses but with R and W upside down
			
			4'd6: begin
				signal_out<=8'b1010_0000;	//R-
			end
			4'd7: begin
				signal_out<=8'b1000_0000;
			end
			
			4'd8: begin
				signal_out<=8'b1000_0010;	//W+
			end
			4'd9: begin
				signal_out<=8'b1000_0000;
			end
			
			4'd10: begin
				signal_out<=8'b1000_0100;	//M
			end
			4'd11: begin
				signal_out<=8'b1000_0000;
			end
			
			default: signal_out<=8'b1000_0000;
		endcase
		
		if(timer == currentpuldur) begin
			currentpuldur<=pulse_durations[pulse_index];
			if(pulse_index == 11) pulse_index <= 0;
			else pulse_index <= pulse_index + 1;
			timer <= 0;			
		end
		else timer <= timer + 1;

	end

endmodule