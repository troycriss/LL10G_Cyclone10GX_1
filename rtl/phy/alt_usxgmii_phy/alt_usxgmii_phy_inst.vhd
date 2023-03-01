	component alt_usxgmii_phy is
		port (
			csr_clk              : in  std_logic                     := 'X';             -- clk
			xgmii_rx_coreclkin   : in  std_logic                     := 'X';             -- clk
			xgmii_tx_coreclkin   : in  std_logic                     := 'X';             -- clk
			reset                : in  std_logic                     := 'X';             -- reset
			rx_digitalreset      : in  std_logic                     := 'X';             -- rx_digitalreset
			tx_digitalreset      : in  std_logic                     := 'X';             -- tx_digitalreset
			csr_readdata         : out std_logic_vector(31 downto 0);                    -- readdata
			csr_writedata        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			csr_address          : in  std_logic_vector(10 downto 0) := (others => 'X'); -- address
			csr_waitrequest      : out std_logic;                                        -- waitrequest
			csr_read             : in  std_logic                     := 'X';             -- read
			csr_write            : in  std_logic                     := 'X';             -- write
			xgmii_tx_valid       : in  std_logic                     := 'X';             -- export
			xgmii_tx_control     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			xgmii_tx_data        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			xgmii_rx_valid       : out std_logic;                                        -- export
			xgmii_rx_control     : out std_logic_vector(3 downto 0);                     -- export
			xgmii_rx_data        : out std_logic_vector(31 downto 0);                    -- export
			led_an               : out std_logic;                                        -- export
			rx_block_lock        : out std_logic;                                        -- rx_enh_blk_lock
			operating_speed      : out std_logic_vector(2 downto 0);                     -- export
			tx_serial_clk        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk_1      : in  std_logic                     := 'X';             -- clk
			rx_pma_clkout        : out std_logic;                                        -- clk
			tx_analogreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			rx_analogreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			tx_cal_busy          : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy          : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_data       : out std_logic_vector(0 downto 0);                     -- tx_serial_data
			rx_serial_data       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_is_lockedtodata   : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			reconfig_clk         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			reconfig_reset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- reset
			reconfig_write       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- write
			reconfig_read        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- read
			reconfig_address     : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			reconfig_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			reconfig_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			reconfig_waitrequest : out std_logic_vector(0 downto 0)                      -- waitrequest
		);
	end component alt_usxgmii_phy;

	u0 : component alt_usxgmii_phy
		port map (
			csr_clk              => CONNECTED_TO_csr_clk,              --            csr_clk.clk
			xgmii_rx_coreclkin   => CONNECTED_TO_xgmii_rx_coreclkin,   -- xgmii_rx_coreclkin.clk
			xgmii_tx_coreclkin   => CONNECTED_TO_xgmii_tx_coreclkin,   -- xgmii_tx_coreclkin.clk
			reset                => CONNECTED_TO_reset,                --              reset.reset
			rx_digitalreset      => CONNECTED_TO_rx_digitalreset,      --    rx_digitalreset.rx_digitalreset
			tx_digitalreset      => CONNECTED_TO_tx_digitalreset,      --    tx_digitalreset.tx_digitalreset
			csr_readdata         => CONNECTED_TO_csr_readdata,         --      avalon_mm_csr.readdata
			csr_writedata        => CONNECTED_TO_csr_writedata,        --                   .writedata
			csr_address          => CONNECTED_TO_csr_address,          --                   .address
			csr_waitrequest      => CONNECTED_TO_csr_waitrequest,      --                   .waitrequest
			csr_read             => CONNECTED_TO_csr_read,             --                   .read
			csr_write            => CONNECTED_TO_csr_write,            --                   .write
			xgmii_tx_valid       => CONNECTED_TO_xgmii_tx_valid,       --     xgmii_tx_valid.export
			xgmii_tx_control     => CONNECTED_TO_xgmii_tx_control,     --   xgmii_tx_control.export
			xgmii_tx_data        => CONNECTED_TO_xgmii_tx_data,        --      xgmii_tx_data.export
			xgmii_rx_valid       => CONNECTED_TO_xgmii_rx_valid,       --     xgmii_rx_valid.export
			xgmii_rx_control     => CONNECTED_TO_xgmii_rx_control,     --   xgmii_rx_control.export
			xgmii_rx_data        => CONNECTED_TO_xgmii_rx_data,        --      xgmii_rx_data.export
			led_an               => CONNECTED_TO_led_an,               --             led_an.export
			rx_block_lock        => CONNECTED_TO_rx_block_lock,        --      rx_block_lock.rx_enh_blk_lock
			operating_speed      => CONNECTED_TO_operating_speed,      --    operating_speed.export
			tx_serial_clk        => CONNECTED_TO_tx_serial_clk,        --      tx_serial_clk.clk
			rx_cdr_refclk_1      => CONNECTED_TO_rx_cdr_refclk_1,      --    rx_cdr_refclk_1.clk
			rx_pma_clkout        => CONNECTED_TO_rx_pma_clkout,        --      rx_pma_clkout.clk
			tx_analogreset       => CONNECTED_TO_tx_analogreset,       --     tx_analogreset.tx_analogreset
			rx_analogreset       => CONNECTED_TO_rx_analogreset,       --     rx_analogreset.rx_analogreset
			tx_cal_busy          => CONNECTED_TO_tx_cal_busy,          --        tx_cal_busy.tx_cal_busy
			rx_cal_busy          => CONNECTED_TO_rx_cal_busy,          --        rx_cal_busy.rx_cal_busy
			tx_serial_data       => CONNECTED_TO_tx_serial_data,       --     tx_serial_data.tx_serial_data
			rx_serial_data       => CONNECTED_TO_rx_serial_data,       --     rx_serial_data.rx_serial_data
			rx_is_lockedtodata   => CONNECTED_TO_rx_is_lockedtodata,   -- rx_is_lockedtodata.rx_is_lockedtodata
			reconfig_clk         => CONNECTED_TO_reconfig_clk,         --       reconfig_clk.clk
			reconfig_reset       => CONNECTED_TO_reconfig_reset,       --     reconfig_reset.reset
			reconfig_write       => CONNECTED_TO_reconfig_write,       --      reconfig_avmm.write
			reconfig_read        => CONNECTED_TO_reconfig_read,        --                   .read
			reconfig_address     => CONNECTED_TO_reconfig_address,     --                   .address
			reconfig_writedata   => CONNECTED_TO_reconfig_writedata,   --                   .writedata
			reconfig_readdata    => CONNECTED_TO_reconfig_readdata,    --                   .readdata
			reconfig_waitrequest => CONNECTED_TO_reconfig_waitrequest  --                   .waitrequest
		);

