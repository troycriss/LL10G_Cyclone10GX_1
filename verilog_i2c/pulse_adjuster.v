module pulse_adjuster (
    input wire clk_in,         // Input clock (fast clock)
    input wire reset_in,
    input wire [15:0] new_zeros_num,
	 input feedback,
    output wire dac_adjustment,
    output wire [11:0] new_vol
);

    reg [31:0] counter = 0;
    reg [31:0] over_p_counter = 0;
    reg [15:0] old_num_zeros = 0;
    parameter SAMPLE_SIZE = 100;
    parameter BIT_LENGTH = 2**16;
    parameter [11:0] starting_vol = 750;
    reg [11:0] output_vol = starting_vol;
	 //wire [11:0] new_vol;
    assign new_vol = output_vol[11:0];
    reg new_dac_adjust = 1'b1;
    assign dac_adjustment = new_dac_adjust;
	 wire feedback_button;
	 assign feedback_button = feedback;


    always @(posedge clk_in or negedge reset_in) begin
        if (~reset_in) begin
            output_vol <= starting_vol;
            counter <= 0;
            new_dac_adjust <= 0;
            over_p_counter <= 0;
            old_num_zeros <= 0;
        end else begin
            if ((new_zeros_num != old_num_zeros) && (~feedback_button)) begin
                old_num_zeros <= new_zeros_num;
                if (counter == 50) begin
                    new_dac_adjust <= 1'b1;
                end
                if (counter < SAMPLE_SIZE) begin
                    counter <= counter + 1;
                    if (new_zeros_num < BIT_LENGTH/2) begin
                        over_p_counter <= over_p_counter + 1;
                    end
                end else begin
                    counter <= 0;
                    if (over_p_counter > (SAMPLE_SIZE + SAMPLE_SIZE/100)) begin
                        output_vol <= output_vol - 10;
                        new_dac_adjust <= 1'b0;
                    end else if (over_p_counter < (SAMPLE_SIZE - SAMPLE_SIZE/100)) begin
                        output_vol <= output_vol + 10;
                        new_dac_adjust <= 1'b0;
                    end else begin
                        new_dac_adjust <= 1'b1;
                    end 
                    over_p_counter <= 0;
                end
            end
        end
    end
endmodule


	