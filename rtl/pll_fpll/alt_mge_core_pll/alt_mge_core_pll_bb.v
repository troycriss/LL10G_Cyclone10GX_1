module alt_mge_core_pll (
		input  wire  pll_refclk0,   //   pll_refclk0.clk
		input  wire  pll_powerdown, // pll_powerdown.pll_powerdown
		output wire  pll_locked,    //    pll_locked.pll_locked
		output wire  outclk0,       //       outclk0.clk
		output wire  outclk1,       //       outclk1.clk
		output wire  pll_cal_busy   //  pll_cal_busy.pll_cal_busy
	);
endmodule

