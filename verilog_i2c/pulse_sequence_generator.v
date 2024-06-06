module pulse_sequence_generator (
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
	 input wire sequence_switch
);

    // Parameters
    parameter SLOW_DIV = 60;  // Clock division factor for slow clock (adjust as needed)
    parameter SEQ_LEN = 40;    // Length of the pulse sequence
    
    // Pulse sequence (example: 01110101110101)
    reg [SEQ_LEN-1:0] pulse_sequence = 40'b0_10011000_0_10011000_0_01111110_0_01001000_0_010;
	 reg [SEQ_LEN-1:0] other_sequence = 40'b0_10011000_0_10011000_0_00000000_0_01001000_0_010;

	 //reg [SEQ_LEN-1:0] send_out_command = 27'b01000000_0_00000011_0_00000000_0;
	 //reg [SEQ_LEN-1:0] command_on = 27'b01000000_0_00000001_0_11111001_0;
	 //reg [SEQ_LEN-1:0] command_off = 27'b01000000_0_00000001_0_11111110_0;
	
	 //reg [SEQ_LEN-1:0] pulse_sequence = 16'b1001000
    // Registers and wires
    reg [8:0] clk_div_counter = 0;
	 reg [8:0] clk_div_stgr_counter = 0;
    reg slow_clk = 0;
	 reg slow_clk_stgr = 0;
    reg [5:0] pulse_index = 0;
    reg pulse_gen = 1;
	 reg reset_btn;
	 reg button_state = 1'b0;
	 reg button_d;
	 wire button_chg;
	 reg [8:0] clk_div_pulses = 0;
	 
	 
	 always @(posedge clk_in) begin
	     reset_btn = ~reset_in;
    end
	 
    // Clock Divider
    always @(posedge clk_in or negedge reset_in) begin
        if (~reset_in) begin
            clk_div_counter <= 0;
            slow_clk <= 0;
        end else begin
		      if (~button_state || pulse_index == 0) begin
				   slow_clk_stgr <= 0;
					
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
				end else if(~button_state || pulse_index == 1 || pulse_index == 11 || pulse_index == 21 || pulse_index == 31 || pulse_index == 41) begin
			      slow_clk_stgr <= 1'b1;
					
					if (clk_div_counter >= (SLOW_DIV - 1)) begin
						 clk_div_counter <= 0;
						 slow_clk = ~slow_clk;
					end else begin
						 clk_div_counter <= clk_div_counter + 1;
					end
			   end else begin
					if (clk_div_stgr_counter >= (SLOW_DIV - 1)) begin
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
        end else begin
		      button_d <= button_in;
		      if (~button_in && ~button_state && button_chg) begin
				    button_state <= 1'b1;
		      end else if(button_state)begin
					 if (sequence_switch)begin
						 if (pulse_index < SEQ_LEN) begin
							  pulse_gen <= pulse_sequence[SEQ_LEN - pulse_index - 1];  // Corrected indexing
							  pulse_index <= pulse_index + 1;
						 end else begin
							  pulse_index <= 0;
							  pulse_gen <= 1;
							  button_state <= 1'b0;
						 end
					 end else begin
						if (pulse_index < SEQ_LEN) begin
							  pulse_gen <= other_sequence[SEQ_LEN - pulse_index - 1];  // Corrected indexing
							  pulse_index <= pulse_index + 1;
						 end else begin
							  pulse_index <= 0;
							  pulse_gen <= 1;
							  button_state <= 1'b0;
						 end
					 end
            end else begin
                pulse_index <= 0;
                pulse_gen <= 1;
				
            end
        end
	 end

    // Assign outputs
    assign slow_clk_out = ~slow_clk;
	 assign slow_clk_stgr_out = ~slow_clk_stgr;
    assign pulse_out = pulse_gen;
	 assign reset_led = reset_btn;
	 assign button_chg = (button_in != button_d);
	 
	 
	 ether_on ether_on_inst(
		.clk_in     (clk_in),
		.reset_in   (reset_in),
		.ether_button_in (button_ether_in),
		.slow_clk_out  (slow_clk_ether_out),
		.slow_clk_stgr_out (slow_clk_ether_stgr_out),
		.ether_pulse_out (pulse_ether_out),
	);


endmodule



