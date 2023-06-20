LL10G_Cyclone10GX_1

Test of 10 Gb ethernet output from Cyclone 10 GX dev kit

All switches up (OFF, 1) except S3_2 (and S2_1)
For FMC JTAG not in use, set S5_1 to 0

Quartus Pro 18.1

Program with .sof (via .cdf to open programmer)<br>
Runs for unlimited time, but can't program permanently<br>
See heartbeat LED<br>
Reset Arduino with soft_i2c_cyclone10gx to program SFP outputs (level shifted to 1.8 V)<br>
See red, then green, SFP LEDs<br>
Open system console<br>

 cd hwtesting\\system_console
 
 source main.tcl
 
 SEND 0 10G 80
 
 SENDAGAIN

Set reset pulse duration with (ex: 8) :
 PULSES_pos1dur <duration>

Set write pulse duration with (ex: 7) :
 PULSES_pos2dur <duration>

Set read pulse duration with (ex: 30) :
 PULSES_pos3dur <duration>

https://en.wikipedia.org/wiki/Ethernet_frame <br>
https://en.wikipedia.org/wiki/Internet_Protocol_version_4 <br>
https://en.wikipedia.org/wiki/User_Datagram_Protocol <br>

mac64b_clk; // 156.25 MHz via pll<br>
6.4ns per tick<br>

C10GX kit download: https://www.dropbox.com/s/qehok7muoahcpib/cyclone-10-gx-kit-collateral.zip?dl=0 <br>
  Board test system: https://www.dropbox.com/sh/13s1js1465clt0y/AADcKpqSJ-fH7NIdkqhGLnxYa?dl=0 <br>
  Factory recovery: https://www.dropbox.com/sh/fvxx9ef50a99x4v/AAATVMVC8e21aiI6xPSL01WCa?dl=0 <br>

Simulation of amps: 
https://tinyurl.com/297t5xo8

Simulation of pulse generators:
https://tinyurl.com/27l9ev2u



