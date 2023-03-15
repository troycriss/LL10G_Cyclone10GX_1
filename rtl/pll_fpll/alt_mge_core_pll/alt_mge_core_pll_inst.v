	alt_mge_core_pll u0 (
		.pll_refclk0   (_connected_to_pll_refclk0_),   //   input,  width = 1,   pll_refclk0.clk
		.pll_powerdown (_connected_to_pll_powerdown_), //   input,  width = 1, pll_powerdown.pll_powerdown
		.pll_locked    (_connected_to_pll_locked_),    //  output,  width = 1,    pll_locked.pll_locked
		.outclk0       (_connected_to_outclk0_),       //  output,  width = 1,       outclk0.clk
		.outclk1       (_connected_to_outclk1_),       //  output,  width = 1,       outclk1.clk
		.outclk2       (_connected_to_outclk2_),       //  output,  width = 1,       outclk2.clk
		.outclk3       (_connected_to_outclk3_),       //  output,  width = 1,       outclk3.clk
		.pll_cal_busy  (_connected_to_pll_cal_busy_)   //  output,  width = 1,  pll_cal_busy.pll_cal_busy
	);

