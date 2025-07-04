 module i2c_generator (
    input wire clk_in,         // Input clock (fast clock)
    input wire reset_in,       // Reset signal
    input wire button_in,      // Button input
    input wire button_ether_in,      // Button input
    output wire slow_clk_out,  // Slowed down clock output
	 output wire slow_clk_stgr_out,
	 output wire slow_clk_ether_out,  // Slowed down clock output for ether-on
	 output wire slow_clk_ether_stgr_out,
    output wire pulse_out,     // Pulse sequence output
    output wire pulse_ether_out,     // Pulse sequence output for ethernet-on
	 output wire reset_led,
	 input wire sequence_switch,
	 
	 input chip_id,
	 input [3:0] dac_id,
	 input [11:0] vol, 
	 input [11:0] new_vol,
	 input wire dac_adjustment,
	 input feedback,
	 output wire led_check_dac_adj
);

    // Parameters
    parameter SLOW_DIV = 25;  // Clock division factor for slow clock (adjust as needed)
	 parameter SLOW_STR_DIV = 50;  // Clock division factor for slow clock (adjust as needed)
    parameter SEQ_LEN = 81;    // Length of the pulse sequence
    
    // Pulse sequence (example: 01110101110101)
    reg [SEQ_LEN-1:0] pulse_sequence = 81'b0_110000111100000000_11_000011110000000000_11_111111111100000000_00_000000000000000000_01;
	 reg [SEQ_LEN-1:0] other_sequence = 81'b0_110000111100000000_11_000011110000000000_11_000000000000000000_11_000000000000000000_01;
	 
	 wire [8:0] start;
	 wire [1:0] chip;
	 wire [17:0] chip_to_channel;
	 wire [7:0] channel;
	 wire [3:0] channel_to_voltage;
	 wire [27:0] voltage;
	 wire [11:0] stop;
	 
	 
	 assign start = 9'b0_11000011;
	 assign chip = {~chip_id, ~chip_id}; 
	 assign chip_to_channel = 18'b00000000_11_00001111;
	 assign channel = {dac_id[3], dac_id[3], dac_id[2], dac_id[2], dac_id[1], dac_id[1], dac_id[0], dac_id[0]};
	 assign channel_to_voltage = 4'b00_11;
	 assign voltage = {vol[11], vol[11], vol[10], vol[10], vol[9], vol[9], vol[8], vol[8], vol[7], vol[7], vol[6], vol[6], vol[5], vol[5], vol[4], vol[4], 4'b00_11, vol[3], vol[3], vol[2], vol[2], vol[1], vol[1], vol[0], vol[0]};
	 assign stop = 12'b0000000000_01;
	 
	 wire [SEQ_LEN-1:0] composite_sequence;
	 assign composite_sequence = {start, chip, chip_to_channel, channel, channel_to_voltage, voltage, stop};
	 //reg [SEQ_LEN-1:0] send_out_command = 27'b01000000_0_00000011_0_00000000_0;
	 //reg [SEQ_LEN-1:0] command_on = 27'b01000000_0_00000001_0_11111001_0;
	 //reg [SEQ_LEN-1:0] command_off = 27'b01000000_0_00000001_0_11111110_0;
	
	
	 wire [8:0] adj_start;
	 wire [1:0] adj_chip;
	 wire [17:0] adj_chip_to_channel;
	 wire [7:0] adj_channel;
	 wire [3:0] adj_channel_to_voltage;
	 wire [27:0] adj_voltage;
	 wire [11:0] adj_stop;
	 
	 
	 //assign adj_start = 9'b0_11000011;
	 assign adj_chip = 2'b11; 
	 //assign adj_chip_to_channel = 18'b00000000_11_00001111;
	 assign adj_channel = 8'b00000000;
	 //assign adj_channel_to_voltage = 4'b00_11;
	 assign adj_voltage = {new_vol[11], new_vol[11], new_vol[10], new_vol[10], new_vol[9], new_vol[9], new_vol[8], new_vol[8], new_vol[7], new_vol[7], new_vol[6], new_vol[6], new_vol[5], new_vol[5], new_vol[4], new_vol[4], 4'b00_11, new_vol[3], new_vol[3], new_vol[2], new_vol[2], new_vol[1], new_vol[1], new_vol[0], new_vol[0]};
	 //assign adj_stop = 12'b0000000000_01;
	 wire [SEQ_LEN-1:0] adj_sequence;
	 assign adj_sequence = {start, adj_chip, chip_to_channel, adj_channel, channel_to_voltage, adj_voltage, stop};
	
	
	
	
    // Registers and wires
    reg [8:0] clk_div_counter = 0;
	 reg [8:0] clk_div_stgr_counter = 25;
    reg slow_clk = 0;
	 reg slow_clk_stgr = 0;
    reg [7:0] pulse_index = 0;
	 reg [7:0] pulse_index_f = 0;
    reg pulse_gen = 1;
	 reg reset_btn;
	 reg button_state = 1'b0;
	 reg button_state_f = 1'b0;
	 reg button_d;
	 reg button_d_f;
	 wire button_chg;
	 wire button_chg_f;
	 wire feedback_button;
	 assign feedback_button = (~dac_adjustment) && (~feedback);
	 wire led_check_dac_adj;
	 assign led_check_dac_adj = dac_adjustment;
	 //wire gen_button;
	 //assign gen_button = (~feedback_button) || (~button_in);
	 reg [9:0] clk_div_pulses = 0;
	 
	 
	 always @(posedge clk_in) begin
	     reset_btn = ~reset_in;
    end
	 
    // Clock Divider
    always @(posedge clk_in or negedge reset_in) begin
        if (~reset_in) begin
            clk_div_counter <= 0;
            slow_clk <= 0;
        end else if (feedback) begin
		      if (~button_state || pulse_index == 0) begin
				   slow_clk_stgr <= 0;
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
				end else if(~button_state || pulse_index == SEQ_LEN-1 || pulse_index == SEQ_LEN || pulse_index % 20 == 0 || pulse_index % 20 == 1) begin
			      if(pulse_index == SEQ_LEN-1 || pulse_index == SEQ_LEN) begin
						slow_clk_stgr <= 0;
					end else begin
						slow_clk_stgr <= 1;
					end
					
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
			   end else begin
					if (clk_div_stgr_counter >= (SLOW_STR_DIV - 1)) begin
						 clk_div_stgr_counter <= 0;
						 slow_clk_stgr = ~slow_clk_stgr;
					end else begin
						 clk_div_stgr_counter <= clk_div_stgr_counter + 1;
					end
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
				end
        end else if (~feedback) begin
			  if (~button_state_f || pulse_index == 0) begin
						slow_clk_stgr <= 0;
						if (clk_div_counter >= (SLOW_DIV - 1)) begin
							 clk_div_counter <= 0;
							 slow_clk = ~slow_clk;
						end else begin
							 clk_div_counter <= clk_div_counter + 1;
						end
				end else if(~button_state_f || pulse_index == SEQ_LEN-1 || pulse_index == SEQ_LEN || pulse_index % 20 == 0 || pulse_index % 20 == 1) begin
					if(pulse_index == SEQ_LEN-1 || pulse_index == SEQ_LEN) begin
						slow_clk_stgr <= 0;
					end else begin
						slow_clk_stgr <= 1;
					end
					
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
				end else begin
					if (clk_div_stgr_counter >= (SLOW_STR_DIV - 1)) begin
						 clk_div_stgr_counter <= 0;
						 slow_clk_stgr = ~slow_clk_stgr;
					end else begin
						 clk_div_stgr_counter <= clk_div_stgr_counter + 1;
					end
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
				end
		  end
    end

    // Pulse Sequence Generation State Machine
    always @(posedge slow_clk or negedge reset_in) begin
        if (~reset_in) begin
            pulse_index <= 0;
            pulse_gen <= 1;
				button_d <= 0;
        end else if (feedback) begin
		      button_d <= button_in;
		      if (~button_in && ~button_state && button_chg) begin
				    button_state <= 1'b1;
		      end else if(button_state) begin
					if (pulse_index < SEQ_LEN) begin
						  pulse_gen <= composite_sequence[SEQ_LEN - pulse_index - 1];
						  pulse_index <= pulse_index + 1'd1;
					 end else begin
						  pulse_index <= 0;
						  pulse_gen <= 1;
						  button_state <= 1'b0;
					 end 
				end
			end else if (~feedback) begin
				 button_d_f <= dac_adjustment;
				 if (~dac_adjustment && ~button_state_f && button_chg_f) begin
					button_state_f <= 1'b1;
				 end else if (button_state_f) begin
						if (pulse_index < SEQ_LEN) begin
							pulse_gen <= adj_sequence[SEQ_LEN - pulse_index -1];
							pulse_index <= pulse_index + 1;
						end else begin
							pulse_index <= 0;
							pulse_gen <= 1;
							button_state_f <= 1'b0;
						end
				 end
         end
	 end

    // Assign outputs
    assign slow_clk_out = ~slow_clk;
	 assign slow_clk_stgr_out = ~slow_clk_stgr;
    assign pulse_out = pulse_gen;
	 assign reset_led = reset_btn;
	 assign button_chg = (button_in != button_d);
	 assign button_chg_f = (dac_adjustment != button_d_f);
	 
	 
	 ether_on ether_on_inst(
		.clk_in     (clk_in),
		.reset_in   (reset_in),
		.ether_button_in (button_ether_in),
		.slow_clk_out  (slow_clk_ether_out),
		.slow_clk_stgr_out (slow_clk_ether_stgr_out),
		.ether_pulse_out (pulse_ether_out)
	);


endmodule
