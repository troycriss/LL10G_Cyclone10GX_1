	component address_decoder_channel is
		port (
			csr_clk_clk           : in  std_logic                     := 'X';             -- clk
			csr_clk_reset_reset_n : in  std_logic                     := 'X';             -- reset_n
			mac_address           : out std_logic_vector(9 downto 0);                     -- address
			mac_write             : out std_logic;                                        -- write
			mac_read              : out std_logic;                                        -- read
			mac_readdata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mac_writedata         : out std_logic_vector(31 downto 0);                    -- writedata
			mac_waitrequest       : in  std_logic                     := 'X';             -- waitrequest
			slave_address         : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			slave_waitrequest     : out std_logic;                                        -- waitrequest
			slave_read            : in  std_logic                     := 'X';             -- read
			slave_readdata        : out std_logic_vector(31 downto 0);                    -- readdata
			slave_write           : in  std_logic                     := 'X';             -- write
			slave_writedata       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			phy_address           : out std_logic_vector(10 downto 0);                    -- address
			phy_write             : out std_logic;                                        -- write
			phy_read              : out std_logic;                                        -- read
			phy_readdata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			phy_writedata         : out std_logic_vector(31 downto 0);                    -- writedata
			phy_waitrequest       : in  std_logic                     := 'X';             -- waitrequest
			xcvr_rcfg_address     : out std_logic_vector(9 downto 0);                     -- address
			xcvr_rcfg_write       : out std_logic;                                        -- write
			xcvr_rcfg_read        : out std_logic;                                        -- read
			xcvr_rcfg_readdata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			xcvr_rcfg_writedata   : out std_logic_vector(31 downto 0);                    -- writedata
			xcvr_rcfg_waitrequest : in  std_logic                     := 'X'              -- waitrequest
		);
	end component address_decoder_channel;

	u0 : component address_decoder_channel
		port map (
			csr_clk_clk           => CONNECTED_TO_csr_clk_clk,           --       csr_clk.clk
			csr_clk_reset_reset_n => CONNECTED_TO_csr_clk_reset_reset_n, -- csr_clk_reset.reset_n
			mac_address           => CONNECTED_TO_mac_address,           --           mac.address
			mac_write             => CONNECTED_TO_mac_write,             --              .write
			mac_read              => CONNECTED_TO_mac_read,              --              .read
			mac_readdata          => CONNECTED_TO_mac_readdata,          --              .readdata
			mac_writedata         => CONNECTED_TO_mac_writedata,         --              .writedata
			mac_waitrequest       => CONNECTED_TO_mac_waitrequest,       --              .waitrequest
			slave_address         => CONNECTED_TO_slave_address,         --         slave.address
			slave_waitrequest     => CONNECTED_TO_slave_waitrequest,     --              .waitrequest
			slave_read            => CONNECTED_TO_slave_read,            --              .read
			slave_readdata        => CONNECTED_TO_slave_readdata,        --              .readdata
			slave_write           => CONNECTED_TO_slave_write,           --              .write
			slave_writedata       => CONNECTED_TO_slave_writedata,       --              .writedata
			phy_address           => CONNECTED_TO_phy_address,           --           phy.address
			phy_write             => CONNECTED_TO_phy_write,             --              .write
			phy_read              => CONNECTED_TO_phy_read,              --              .read
			phy_readdata          => CONNECTED_TO_phy_readdata,          --              .readdata
			phy_writedata         => CONNECTED_TO_phy_writedata,         --              .writedata
			phy_waitrequest       => CONNECTED_TO_phy_waitrequest,       --              .waitrequest
			xcvr_rcfg_address     => CONNECTED_TO_xcvr_rcfg_address,     --     xcvr_rcfg.address
			xcvr_rcfg_write       => CONNECTED_TO_xcvr_rcfg_write,       --              .write
			xcvr_rcfg_read        => CONNECTED_TO_xcvr_rcfg_read,        --              .read
			xcvr_rcfg_readdata    => CONNECTED_TO_xcvr_rcfg_readdata,    --              .readdata
			xcvr_rcfg_writedata   => CONNECTED_TO_xcvr_rcfg_writedata,   --              .writedata
			xcvr_rcfg_waitrequest => CONNECTED_TO_xcvr_rcfg_waitrequest  --              .waitrequest
		);

