	component alt_mge_xcvr_reset_ctrl_txpll is
		port (
			clock         : in  std_logic                    := 'X'; -- clk
			reset         : in  std_logic                    := 'X'; -- reset
			pll_powerdown : out std_logic_vector(0 downto 0)         -- pll_powerdown
		);
	end component alt_mge_xcvr_reset_ctrl_txpll;

	u0 : component alt_mge_xcvr_reset_ctrl_txpll
		port map (
			clock         => CONNECTED_TO_clock,         --         clock.clk
			reset         => CONNECTED_TO_reset,         --         reset.reset
			pll_powerdown => CONNECTED_TO_pll_powerdown  -- pll_powerdown.pll_powerdown
		);

