/* Quartus Prime Version 18.1.0 Build 222 09/21/2018 SJ Pro Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(10M08SA) MfrSpec(OpMask(0) SEC_Device(CFI_2GB) Child_OpMask(1 0));
	P ActionCode(Cfg)
		Device PartName(10CX220YF780) Path("C:/git/LL10G/") File("altera_eth_top_time_limited.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
