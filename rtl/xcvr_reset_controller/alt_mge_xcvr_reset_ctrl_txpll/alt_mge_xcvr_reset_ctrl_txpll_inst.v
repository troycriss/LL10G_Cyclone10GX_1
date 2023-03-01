	alt_mge_xcvr_reset_ctrl_txpll u0 (
		.clock         (_connected_to_clock_),         //   input,  width = 1,         clock.clk
		.reset         (_connected_to_reset_),         //   input,  width = 1,         reset.reset
		.pll_powerdown (_connected_to_pll_powerdown_)  //  output,  width = 1, pll_powerdown.pll_powerdown
	);

