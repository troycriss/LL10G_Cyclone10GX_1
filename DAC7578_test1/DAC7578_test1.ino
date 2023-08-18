/*
Test of DAC7578
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

//chip=0 is for pulses (chan 0 =P1, 1=P2, 2=P3, 3=P4, 4=N1, 5=N2, 6=N3, 7=N4)
//chip=1 is for offsets and unused extras (chan 0 =offset1, 1=offset2, 2=extra3, 3=4, 4=5, 5=6, 6=7, 7=8)
void writeDAC(uint16_t value, uint8_t DAC, uint8_t chip){
  uint16_t MSDB2, LSDB2;
  
  unsigned r = createMask(0, 3);
  LSDB2 = value & r;
  LSDB2 = LSDB2 << 4;
  
  unsigned x = createMask(3, 11);
  MSDB2 = value & x;
  MSDB2 = MSDB2 >> 4;
  
  Wire.begin();
  // B1001100 0x4C floating , B1001010 0x4A vcc, B1001000 0x48 gnd
  if (chip==0) Wire.beginTransmission(0x4C);
  if (chip==1) Wire.beginTransmission(0x48);
  Wire.write(CA + DAC);    //CA byte
  Wire.write(MSDB2);  //MSDB
  Wire.write(LSDB2);  //LSDB
  Wire.endTransmission();
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);  
  Serial.begin(9600);
  delay(100);
  Serial.println("Arduino Connected");
}

void blink(){
  digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
  delay(10);                      // wait
  digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
}

void loop() {  
  for(int value=0; value<=4095; value++){
    for (int chan=0; chan<8; chan++) writeDAC(value, chan, 0);//chip 0 (pulses)
    for (int chan=0; chan<8; chan++) writeDAC(value, chan, 1);//chip 1 (offsets and extra channels)
    blink();
  }  
}
