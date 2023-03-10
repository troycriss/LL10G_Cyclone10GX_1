LL10G_Cyclone10GX_1

Test of 10 Gb ethernet output from Cyclone 10 GX dev kit

All switches up (OFF, 1) except S3_2 (and S2_1)

Quartus Pro 18.1

Program with .sof (via .cdf to open programmer)
Runs for unlimited time, but can't program permanently
See heartbeat LED
Reset Arduino with soft_i2c_cyclone10gx to program SFP outputs (level shifted to 1.8 V)
See red, then green, SFP LEDs
Open system console
cd hwtesting\\system_console
TEST_EXT_LB 0 10G 800000
With loopback optical see 9.84 Gbps

https://en.wikipedia.org/wiki/Ethernet_frame
https://en.wikipedia.org/wiki/Internet_Protocol_version_4
https://en.wikipedia.org/wiki/User_Datagram_Protocol

mac64b_clk; // 156.25 MHz via pll
6.4ns per tick

