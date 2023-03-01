	component address_decoder_top is
		port (
			csr_clk_clk                             : in  std_logic                     := 'X';             -- clk
			csr_clk_reset_reset_n                   : in  std_logic                     := 'X';             -- reset_n
			mac_clk_clk                             : in  std_logic                     := 'X';             -- clk
			mac_clk_reset_reset_n                   : in  std_logic                     := 'X';             -- reset_n
			slave_address                           : in  std_logic_vector(25 downto 0) := (others => 'X'); -- address
			slave_waitrequest                       : out std_logic;                                        -- waitrequest
			slave_read                              : in  std_logic                     := 'X';             -- read
			slave_readdata                          : out std_logic_vector(31 downto 0);                    -- readdata
			slave_readdatavalid                     : out std_logic;                                        -- readdatavalid
			slave_write                             : in  std_logic                     := 'X';             -- write
			slave_writedata                         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			multi_channel_address                   : out std_logic_vector(19 downto 0);                    -- address
			multi_channel_write                     : out std_logic;                                        -- write
			multi_channel_read                      : out std_logic;                                        -- read
			multi_channel_readdata                  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			multi_channel_writedata                 : out std_logic_vector(31 downto 0);                    -- writedata
			multi_channel_waitrequest               : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_0_1_address       : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_0_1_write         : out std_logic;                                        -- write
			traffic_controller_ch_0_1_read          : out std_logic;                                        -- read
			traffic_controller_ch_0_1_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_0_1_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_0_1_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_10_11_address     : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_10_11_write       : out std_logic;                                        -- write
			traffic_controller_ch_10_11_read        : out std_logic;                                        -- read
			traffic_controller_ch_10_11_readdata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_10_11_writedata   : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_10_11_waitrequest : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_2_3_address       : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_2_3_write         : out std_logic;                                        -- write
			traffic_controller_ch_2_3_read          : out std_logic;                                        -- read
			traffic_controller_ch_2_3_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_2_3_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_2_3_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_4_5_address       : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_4_5_write         : out std_logic;                                        -- write
			traffic_controller_ch_4_5_read          : out std_logic;                                        -- read
			traffic_controller_ch_4_5_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_4_5_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_4_5_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_6_7_address       : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_6_7_write         : out std_logic;                                        -- write
			traffic_controller_ch_6_7_read          : out std_logic;                                        -- read
			traffic_controller_ch_6_7_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_6_7_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_6_7_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			traffic_controller_ch_8_9_address       : out std_logic_vector(13 downto 0);                    -- address
			traffic_controller_ch_8_9_write         : out std_logic;                                        -- write
			traffic_controller_ch_8_9_read          : out std_logic;                                        -- read
			traffic_controller_ch_8_9_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			traffic_controller_ch_8_9_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			traffic_controller_ch_8_9_waitrequest   : in  std_logic                     := 'X'              -- waitrequest
		);
	end component address_decoder_top;

	u0 : component address_decoder_top
		port map (
			csr_clk_clk                             => CONNECTED_TO_csr_clk_clk,                             --                     csr_clk.clk
			csr_clk_reset_reset_n                   => CONNECTED_TO_csr_clk_reset_reset_n,                   --               csr_clk_reset.reset_n
			mac_clk_clk                             => CONNECTED_TO_mac_clk_clk,                             --                     mac_clk.clk
			mac_clk_reset_reset_n                   => CONNECTED_TO_mac_clk_reset_reset_n,                   --               mac_clk_reset.reset_n
			slave_address                           => CONNECTED_TO_slave_address,                           --                       slave.address
			slave_waitrequest                       => CONNECTED_TO_slave_waitrequest,                       --                            .waitrequest
			slave_read                              => CONNECTED_TO_slave_read,                              --                            .read
			slave_readdata                          => CONNECTED_TO_slave_readdata,                          --                            .readdata
			slave_readdatavalid                     => CONNECTED_TO_slave_readdatavalid,                     --                            .readdatavalid
			slave_write                             => CONNECTED_TO_slave_write,                             --                            .write
			slave_writedata                         => CONNECTED_TO_slave_writedata,                         --                            .writedata
			multi_channel_address                   => CONNECTED_TO_multi_channel_address,                   --               multi_channel.address
			multi_channel_write                     => CONNECTED_TO_multi_channel_write,                     --                            .write
			multi_channel_read                      => CONNECTED_TO_multi_channel_read,                      --                            .read
			multi_channel_readdata                  => CONNECTED_TO_multi_channel_readdata,                  --                            .readdata
			multi_channel_writedata                 => CONNECTED_TO_multi_channel_writedata,                 --                            .writedata
			multi_channel_waitrequest               => CONNECTED_TO_multi_channel_waitrequest,               --                            .waitrequest
			traffic_controller_ch_0_1_address       => CONNECTED_TO_traffic_controller_ch_0_1_address,       --   traffic_controller_ch_0_1.address
			traffic_controller_ch_0_1_write         => CONNECTED_TO_traffic_controller_ch_0_1_write,         --                            .write
			traffic_controller_ch_0_1_read          => CONNECTED_TO_traffic_controller_ch_0_1_read,          --                            .read
			traffic_controller_ch_0_1_readdata      => CONNECTED_TO_traffic_controller_ch_0_1_readdata,      --                            .readdata
			traffic_controller_ch_0_1_writedata     => CONNECTED_TO_traffic_controller_ch_0_1_writedata,     --                            .writedata
			traffic_controller_ch_0_1_waitrequest   => CONNECTED_TO_traffic_controller_ch_0_1_waitrequest,   --                            .waitrequest
			traffic_controller_ch_10_11_address     => CONNECTED_TO_traffic_controller_ch_10_11_address,     -- traffic_controller_ch_10_11.address
			traffic_controller_ch_10_11_write       => CONNECTED_TO_traffic_controller_ch_10_11_write,       --                            .write
			traffic_controller_ch_10_11_read        => CONNECTED_TO_traffic_controller_ch_10_11_read,        --                            .read
			traffic_controller_ch_10_11_readdata    => CONNECTED_TO_traffic_controller_ch_10_11_readdata,    --                            .readdata
			traffic_controller_ch_10_11_writedata   => CONNECTED_TO_traffic_controller_ch_10_11_writedata,   --                            .writedata
			traffic_controller_ch_10_11_waitrequest => CONNECTED_TO_traffic_controller_ch_10_11_waitrequest, --                            .waitrequest
			traffic_controller_ch_2_3_address       => CONNECTED_TO_traffic_controller_ch_2_3_address,       --   traffic_controller_ch_2_3.address
			traffic_controller_ch_2_3_write         => CONNECTED_TO_traffic_controller_ch_2_3_write,         --                            .write
			traffic_controller_ch_2_3_read          => CONNECTED_TO_traffic_controller_ch_2_3_read,          --                            .read
			traffic_controller_ch_2_3_readdata      => CONNECTED_TO_traffic_controller_ch_2_3_readdata,      --                            .readdata
			traffic_controller_ch_2_3_writedata     => CONNECTED_TO_traffic_controller_ch_2_3_writedata,     --                            .writedata
			traffic_controller_ch_2_3_waitrequest   => CONNECTED_TO_traffic_controller_ch_2_3_waitrequest,   --                            .waitrequest
			traffic_controller_ch_4_5_address       => CONNECTED_TO_traffic_controller_ch_4_5_address,       --   traffic_controller_ch_4_5.address
			traffic_controller_ch_4_5_write         => CONNECTED_TO_traffic_controller_ch_4_5_write,         --                            .write
			traffic_controller_ch_4_5_read          => CONNECTED_TO_traffic_controller_ch_4_5_read,          --                            .read
			traffic_controller_ch_4_5_readdata      => CONNECTED_TO_traffic_controller_ch_4_5_readdata,      --                            .readdata
			traffic_controller_ch_4_5_writedata     => CONNECTED_TO_traffic_controller_ch_4_5_writedata,     --                            .writedata
			traffic_controller_ch_4_5_waitrequest   => CONNECTED_TO_traffic_controller_ch_4_5_waitrequest,   --                            .waitrequest
			traffic_controller_ch_6_7_address       => CONNECTED_TO_traffic_controller_ch_6_7_address,       --   traffic_controller_ch_6_7.address
			traffic_controller_ch_6_7_write         => CONNECTED_TO_traffic_controller_ch_6_7_write,         --                            .write
			traffic_controller_ch_6_7_read          => CONNECTED_TO_traffic_controller_ch_6_7_read,          --                            .read
			traffic_controller_ch_6_7_readdata      => CONNECTED_TO_traffic_controller_ch_6_7_readdata,      --                            .readdata
			traffic_controller_ch_6_7_writedata     => CONNECTED_TO_traffic_controller_ch_6_7_writedata,     --                            .writedata
			traffic_controller_ch_6_7_waitrequest   => CONNECTED_TO_traffic_controller_ch_6_7_waitrequest,   --                            .waitrequest
			traffic_controller_ch_8_9_address       => CONNECTED_TO_traffic_controller_ch_8_9_address,       --   traffic_controller_ch_8_9.address
			traffic_controller_ch_8_9_write         => CONNECTED_TO_traffic_controller_ch_8_9_write,         --                            .write
			traffic_controller_ch_8_9_read          => CONNECTED_TO_traffic_controller_ch_8_9_read,          --                            .read
			traffic_controller_ch_8_9_readdata      => CONNECTED_TO_traffic_controller_ch_8_9_readdata,      --                            .readdata
			traffic_controller_ch_8_9_writedata     => CONNECTED_TO_traffic_controller_ch_8_9_writedata,     --                            .writedata
			traffic_controller_ch_8_9_waitrequest   => CONNECTED_TO_traffic_controller_ch_8_9_waitrequest    --                            .waitrequest
		);

