module pulse_adjuster (
    input wire clk_in,         // Input clock (fast clock)
    input wire reset_in,
    input wire [15:0] new_zeros_num,
	 output wire dac_adjustment,
	 output wire [11:0] new_vol,
	 input feedback,
	 output wire new_zero_led_check,
	 input wire new_zeros
	 //output wire led_checker
);

    reg [31:0] counter = 0;
	 reg [31:0] counter_2 = 0;
	 reg [31:0] sample_counter = 0;
	 reg [40:0] total_zeros = 0;
    reg [31:0] over_p_counter = 0;
    reg [15:0] old_num_zeros = 0;
    parameter SAMPLE_SIZE = 8_000;
    parameter BIT_LENGTH = 2**16;
	 parameter DELAY_TIME = 1000;
	 parameter FEEDBACK_INTERVAL = 10_000;
    parameter [11:0] starting_vol = 700;
    reg [11:0] output_vol = starting_vol;
	 //wire [11:0] new_vol;
    assign new_vol[11:0] = output_vol[11:0];
    reg new_dac_adjustment = 1'b1;
    assign dac_adjustment = new_dac_adjustment;
	 wire feedback_button;
	 assign feedback_button = feedback;
	 //wire [15:0] zeros;
	 //assign zeros = new_zeros_num;
	 reg led_check = 1'b1;
	 //wire led_checker;
	 //assign led_checker = led_check;
	 reg [31:0] change_counter = 0;
	 reg new_z_check;
	 //reg feedback_on = 1'b1;
	 reg led_check_2 = 1'b1;
	 assign new_zero_led_check = led_check_2;	
	 wire is_new_zeros;
	 assign is_new_zeros = (new_zeros != new_z_check);

    always @(posedge clk_in) begin// or negedge reset_in) begin
			  if ((~feedback) && (new_dac_adjustment) && (new_zeros_num != old_num_zeros)) begin
				  led_check_2 <= 1'b1;
				  led_check <= 1'b1;
				  if (counter_2 < (FEEDBACK_INTERVAL - 1)) begin
				      counter_2 <= counter_2 + 1;
						total_zeros <= total_zeros + new_zeros_num;
						sample_counter <= sample_counter + 1;
				  end else if (counter_2 >= (FEEDBACK_INTERVAL - 1)) begin
					  if (total_zeros > (((BIT_LENGTH*sample_counter) >> 1) + 5000)) begin
							new_dac_adjustment <= 1'b0;
							output_vol <= output_vol + 1;
					  end else if (new_zeros_num < (((BIT_LENGTH*sample_counter) >> 1) - 5000)) begin
							new_dac_adjustment <= 1'b0;
							output_vol <= output_vol - 1;
					  end else begin
							new_dac_adjustment <= 1'b1;
							led_check <= 1'b1;
							led_check_2 <= 1'b1;
					  end
					  counter_2 <= 0;
					  sample_counter <= 0;
					  total_zeros <= 0;
				  end
			  end else if (~new_dac_adjustment) begin
				  if (counter >= (DELAY_TIME - 1)) begin
						counter <= 0;
						new_dac_adjustment <= 1'b1;
				  end else begin
					 counter <= counter + 1;
					 led_check <= 1'b0;
					 led_check_2 <= 1'b0;
				  end
			  end else begin
				  output_vol <= starting_vol;
				  counter <= 0;
				  sample_counter <= 0;
			  end
		end
endmodule

	