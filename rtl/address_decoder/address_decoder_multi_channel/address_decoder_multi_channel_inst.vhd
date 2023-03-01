	component address_decoder_multi_channel is
		port (
			channel_0_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_0_write        : out std_logic;                                        -- write
			channel_0_read         : out std_logic;                                        -- read
			channel_0_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_0_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_0_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_1_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_1_write        : out std_logic;                                        -- write
			channel_1_read         : out std_logic;                                        -- read
			channel_1_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_1_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_1_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_10_address     : out std_logic_vector(15 downto 0);                    -- address
			channel_10_write       : out std_logic;                                        -- write
			channel_10_read        : out std_logic;                                        -- read
			channel_10_readdata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_10_writedata   : out std_logic_vector(31 downto 0);                    -- writedata
			channel_10_waitrequest : in  std_logic                     := 'X';             -- waitrequest
			channel_11_address     : out std_logic_vector(15 downto 0);                    -- address
			channel_11_write       : out std_logic;                                        -- write
			channel_11_read        : out std_logic;                                        -- read
			channel_11_readdata    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_11_writedata   : out std_logic_vector(31 downto 0);                    -- writedata
			channel_11_waitrequest : in  std_logic                     := 'X';             -- waitrequest
			channel_2_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_2_write        : out std_logic;                                        -- write
			channel_2_read         : out std_logic;                                        -- read
			channel_2_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_2_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_2_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_3_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_3_write        : out std_logic;                                        -- write
			channel_3_read         : out std_logic;                                        -- read
			channel_3_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_3_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_3_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_4_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_4_write        : out std_logic;                                        -- write
			channel_4_read         : out std_logic;                                        -- read
			channel_4_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_4_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_4_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_5_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_5_write        : out std_logic;                                        -- write
			channel_5_read         : out std_logic;                                        -- read
			channel_5_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_5_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_5_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_6_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_6_write        : out std_logic;                                        -- write
			channel_6_read         : out std_logic;                                        -- read
			channel_6_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_6_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_6_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_7_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_7_write        : out std_logic;                                        -- write
			channel_7_read         : out std_logic;                                        -- read
			channel_7_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_7_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_7_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_8_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_8_write        : out std_logic;                                        -- write
			channel_8_read         : out std_logic;                                        -- read
			channel_8_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_8_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_8_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			channel_9_address      : out std_logic_vector(15 downto 0);                    -- address
			channel_9_write        : out std_logic;                                        -- write
			channel_9_read         : out std_logic;                                        -- read
			channel_9_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			channel_9_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			channel_9_waitrequest  : in  std_logic                     := 'X';             -- waitrequest
			csr_clk_clk            : in  std_logic                     := 'X';             -- clk
			csr_clk_reset_reset_n  : in  std_logic                     := 'X';             -- reset_n
			slave_address          : in  std_logic_vector(19 downto 0) := (others => 'X'); -- address
			slave_waitrequest      : out std_logic;                                        -- waitrequest
			slave_read             : in  std_logic                     := 'X';             -- read
			slave_readdata         : out std_logic_vector(31 downto 0);                    -- readdata
			slave_write            : in  std_logic                     := 'X';             -- write
			slave_writedata        : in  std_logic_vector(31 downto 0) := (others => 'X')  -- writedata
		);
	end component address_decoder_multi_channel;

	u0 : component address_decoder_multi_channel
		port map (
			channel_0_address      => CONNECTED_TO_channel_0_address,      --     channel_0.address
			channel_0_write        => CONNECTED_TO_channel_0_write,        --              .write
			channel_0_read         => CONNECTED_TO_channel_0_read,         --              .read
			channel_0_readdata     => CONNECTED_TO_channel_0_readdata,     --              .readdata
			channel_0_writedata    => CONNECTED_TO_channel_0_writedata,    --              .writedata
			channel_0_waitrequest  => CONNECTED_TO_channel_0_waitrequest,  --              .waitrequest
			channel_1_address      => CONNECTED_TO_channel_1_address,      --     channel_1.address
			channel_1_write        => CONNECTED_TO_channel_1_write,        --              .write
			channel_1_read         => CONNECTED_TO_channel_1_read,         --              .read
			channel_1_readdata     => CONNECTED_TO_channel_1_readdata,     --              .readdata
			channel_1_writedata    => CONNECTED_TO_channel_1_writedata,    --              .writedata
			channel_1_waitrequest  => CONNECTED_TO_channel_1_waitrequest,  --              .waitrequest
			channel_10_address     => CONNECTED_TO_channel_10_address,     --    channel_10.address
			channel_10_write       => CONNECTED_TO_channel_10_write,       --              .write
			channel_10_read        => CONNECTED_TO_channel_10_read,        --              .read
			channel_10_readdata    => CONNECTED_TO_channel_10_readdata,    --              .readdata
			channel_10_writedata   => CONNECTED_TO_channel_10_writedata,   --              .writedata
			channel_10_waitrequest => CONNECTED_TO_channel_10_waitrequest, --              .waitrequest
			channel_11_address     => CONNECTED_TO_channel_11_address,     --    channel_11.address
			channel_11_write       => CONNECTED_TO_channel_11_write,       --              .write
			channel_11_read        => CONNECTED_TO_channel_11_read,        --              .read
			channel_11_readdata    => CONNECTED_TO_channel_11_readdata,    --              .readdata
			channel_11_writedata   => CONNECTED_TO_channel_11_writedata,   --              .writedata
			channel_11_waitrequest => CONNECTED_TO_channel_11_waitrequest, --              .waitrequest
			channel_2_address      => CONNECTED_TO_channel_2_address,      --     channel_2.address
			channel_2_write        => CONNECTED_TO_channel_2_write,        --              .write
			channel_2_read         => CONNECTED_TO_channel_2_read,         --              .read
			channel_2_readdata     => CONNECTED_TO_channel_2_readdata,     --              .readdata
			channel_2_writedata    => CONNECTED_TO_channel_2_writedata,    --              .writedata
			channel_2_waitrequest  => CONNECTED_TO_channel_2_waitrequest,  --              .waitrequest
			channel_3_address      => CONNECTED_TO_channel_3_address,      --     channel_3.address
			channel_3_write        => CONNECTED_TO_channel_3_write,        --              .write
			channel_3_read         => CONNECTED_TO_channel_3_read,         --              .read
			channel_3_readdata     => CONNECTED_TO_channel_3_readdata,     --              .readdata
			channel_3_writedata    => CONNECTED_TO_channel_3_writedata,    --              .writedata
			channel_3_waitrequest  => CONNECTED_TO_channel_3_waitrequest,  --              .waitrequest
			channel_4_address      => CONNECTED_TO_channel_4_address,      --     channel_4.address
			channel_4_write        => CONNECTED_TO_channel_4_write,        --              .write
			channel_4_read         => CONNECTED_TO_channel_4_read,         --              .read
			channel_4_readdata     => CONNECTED_TO_channel_4_readdata,     --              .readdata
			channel_4_writedata    => CONNECTED_TO_channel_4_writedata,    --              .writedata
			channel_4_waitrequest  => CONNECTED_TO_channel_4_waitrequest,  --              .waitrequest
			channel_5_address      => CONNECTED_TO_channel_5_address,      --     channel_5.address
			channel_5_write        => CONNECTED_TO_channel_5_write,        --              .write
			channel_5_read         => CONNECTED_TO_channel_5_read,         --              .read
			channel_5_readdata     => CONNECTED_TO_channel_5_readdata,     --              .readdata
			channel_5_writedata    => CONNECTED_TO_channel_5_writedata,    --              .writedata
			channel_5_waitrequest  => CONNECTED_TO_channel_5_waitrequest,  --              .waitrequest
			channel_6_address      => CONNECTED_TO_channel_6_address,      --     channel_6.address
			channel_6_write        => CONNECTED_TO_channel_6_write,        --              .write
			channel_6_read         => CONNECTED_TO_channel_6_read,         --              .read
			channel_6_readdata     => CONNECTED_TO_channel_6_readdata,     --              .readdata
			channel_6_writedata    => CONNECTED_TO_channel_6_writedata,    --              .writedata
			channel_6_waitrequest  => CONNECTED_TO_channel_6_waitrequest,  --              .waitrequest
			channel_7_address      => CONNECTED_TO_channel_7_address,      --     channel_7.address
			channel_7_write        => CONNECTED_TO_channel_7_write,        --              .write
			channel_7_read         => CONNECTED_TO_channel_7_read,         --              .read
			channel_7_readdata     => CONNECTED_TO_channel_7_readdata,     --              .readdata
			channel_7_writedata    => CONNECTED_TO_channel_7_writedata,    --              .writedata
			channel_7_waitrequest  => CONNECTED_TO_channel_7_waitrequest,  --              .waitrequest
			channel_8_address      => CONNECTED_TO_channel_8_address,      --     channel_8.address
			channel_8_write        => CONNECTED_TO_channel_8_write,        --              .write
			channel_8_read         => CONNECTED_TO_channel_8_read,         --              .read
			channel_8_readdata     => CONNECTED_TO_channel_8_readdata,     --              .readdata
			channel_8_writedata    => CONNECTED_TO_channel_8_writedata,    --              .writedata
			channel_8_waitrequest  => CONNECTED_TO_channel_8_waitrequest,  --              .waitrequest
			channel_9_address      => CONNECTED_TO_channel_9_address,      --     channel_9.address
			channel_9_write        => CONNECTED_TO_channel_9_write,        --              .write
			channel_9_read         => CONNECTED_TO_channel_9_read,         --              .read
			channel_9_readdata     => CONNECTED_TO_channel_9_readdata,     --              .readdata
			channel_9_writedata    => CONNECTED_TO_channel_9_writedata,    --              .writedata
			channel_9_waitrequest  => CONNECTED_TO_channel_9_waitrequest,  --              .waitrequest
			csr_clk_clk            => CONNECTED_TO_csr_clk_clk,            --       csr_clk.clk
			csr_clk_reset_reset_n  => CONNECTED_TO_csr_clk_reset_reset_n,  -- csr_clk_reset.reset_n
			slave_address          => CONNECTED_TO_slave_address,          --         slave.address
			slave_waitrequest      => CONNECTED_TO_slave_waitrequest,      --              .waitrequest
			slave_read             => CONNECTED_TO_slave_read,             --              .read
			slave_readdata         => CONNECTED_TO_slave_readdata,         --              .readdata
			slave_write            => CONNECTED_TO_slave_write,            --              .write
			slave_writedata        => CONNECTED_TO_slave_writedata         --              .writedata
		);

