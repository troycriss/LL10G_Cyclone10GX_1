/*
Test of DAC7578
For Uno: A4 (SDA), A5 (SCL)
*/

#include <Wire.h>
byte CA = 0x30;

unsigned createMask(unsigned a, unsigned b)
{
   unsigned r = 0;
   for (unsigned i=a; i<=b; i++) r |= 1 << i;
   return r;
}

void writeDAC(uint16_t value, uint8_t DAC){
  uint16_t MSDB2, LSDB2;
  
  unsigned r = createMask(0, 3);
  LSDB2 = value & r;
  LSDB2 = LSDB2 << 4;
  
  unsigned x = createMask(3, 11);
  MSDB2 = value & x;
  MSDB2 = MSDB2 >> 4;
  
  Wire.begin();
  // B1001100 0x4C floating 
  // B1001010 0x4A vcc
  // B1001000 0x48 gnd
  Wire.beginTransmission(0x4C); 
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

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
  delay(100);                      // wait for a second
  digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
  delay(100);                      // wait for a second

  writeDAC(4096/2, 0); // 1.8V/2 = 0.9V?
  /*
  for(int i=0; i<=4095; i++){
    writeDAC(i, 0);
    delay(5);
    //writeDAC(i, 1);
    //delay(5);
    //Serial.println(analogRead(A0));
  }
  */
}
