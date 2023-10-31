/*
Serial UART control of DAC7578
For Uno: A4 (SDA), A5 (SCL)

Board: Arduino Nano
Processor: ATmega168
*/

#include <Wire.h>
byte CA = 0x30;
unsigned createMask(unsigned a, unsigned b){
   unsigned r = 0;
   for (unsigned i=a; i<=b; i++) r |= 1 << i;
   return r;
}

//chip=0 is for pulses (DAC 00 =P1, 01=P2, 02=P3, 03=P4, 04=N1, 05=N2, 06=N3, 07=N4)
//chip=1 is for offsets and unused extras (DAC 08 =input offset, 09=pulse offset -, 10=pulse offset +, 
//                                             11=dacextra3, 12=dacextra4, 13=none, 14=none, 15=none)
//DAC is which of the 8 DACs on the chip to alter
//value is 0 -- 4095 (12 bit) where 0 is 0V and 4095 is the input voltage (1.8V), and linear in between, e.g. 2048 = 1.8V/2
void writeDAC(uint16_t value, uint8_t DAC, uint8_t chip){
  uint16_t MSDB2, LSDB2;  
  unsigned r = createMask(0, 3);
  LSDB2 = value & r;
  LSDB2 = LSDB2 << 4;  
  unsigned x = createMask(3, 11);
  MSDB2 = value & x;
  MSDB2 = MSDB2 >> 4;
  // B1001100 0x4C floating , B1001010 0x4A vcc, B1001000 0x48 gnd
  if (chip==0) Wire.beginTransmission(0x4C);
  if (chip==1) Wire.beginTransmission(0x48);
  Wire.write(CA + DAC);    //CA byte
  Wire.write(MSDB2);  //MSDB
  Wire.write(LSDB2);  //LSDB
  Wire.endTransmission();
}

void setup() {
  Wire.begin();
  pinMode(LED_BUILTIN, OUTPUT);  
  Serial.begin(9600);
  Serial.println("Arduino Connected");

  writeDAC(4095/2, 0, 0);//1p, chip 0 (pulses)
  writeDAC(1000, 1, 0);//chip 0 (pulses)
  writeDAC(1000, 2, 0);//chip 0 (pulses)
  writeDAC(1000, 3, 0);//chip 0 (pulses)
  
  writeDAC(4095/2, 4, 0);// 1n chip 0 (pulses)
  writeDAC(1000, 5, 0);//chip 0 (pulses)
  writeDAC(1000, 6, 0);//chip 0 (pulses)
  writeDAC(1000, 7, 0);//chip 0 (pulses)
}

String input;
void loop() {
    //USAGE: write "dacwrite <channel> <relative voltage>" in serial monitor and press "send" button
    //channel must be a two digit integer and relative voltage is a four digit integer from 0 to 4095
    //channel 0-7 are for dac chip 1channel 8-15 are for dac chip 1
    if(Serial.available()){
        input = Serial.readStringUntil('\n');
        int dac_channel = 0;
        int dac_voltage = 0; 
        Serial.println("Read: " + input);
        Serial.println(input.substring(0, 8));
        if(input.substring(0, 8) == "dacwrite") {
          Serial.println("dacwrite command received");
          dac_channel = input.substring(9,11).toInt();
          dac_voltage = input.substring(12,16).toInt();
          Serial.println("About to set DAC channel:");
          Serial.println(dac_channel);
          Serial.println("to voltage:");
          Serial.println(dac_voltage);
          int dac_channel_new = dac_channel;
          int dac_chip = 0;
          if(dac_channel_new > 7) {
            dac_channel_new -= 8;
            dac_chip = 1;
          }
          writeDAC(dac_voltage, dac_channel_new, dac_chip);
        }
    }
}
