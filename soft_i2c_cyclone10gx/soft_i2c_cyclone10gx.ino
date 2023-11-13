
/*
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

//chip=0 is for pulses (DAC 0 =P1, 1=P2, 2=P3, 3=P4, 4=N1, 5=N2, 6=N3, 7=N4)
//chip=1 is for offsets and unused extras (DAC 0 =offset1, 1=offset2, 2=extra3, 3=4, 4=5, 5=6, 6=7, 7=8)
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
  
  Wire.begin();
  // B1001100 0x4C floating , B1001010 0x4A vcc, B1001000 0x48 gnd
  if (chip==0) Wire.beginTransmission(0x4C);
  if (chip==1) Wire.beginTransmission(0x48);
  Wire.write(CA + DAC);    //CA byte
  Wire.write(MSDB2);  //MSDB
  Wire.write(LSDB2);  //LSDB
  Wire.endTransmission();
}

#include <XantoI2C.h>
const uint8_t PIN_SCL = 9;
const uint8_t PIN_SDA = 11;

XantoI2C i2c(PIN_SCL, PIN_SDA);

void sendConfigOutputCommand() {
  Serial.println("sendConfigOutputCommand");
  i2c.start();  
  i2c.writeByte(0x40);
  if (i2c.readAck()) {     }
  i2c.writeByte(0x03);
  if (i2c.readAck()) {     }
  i2c.writeByte(0x00);
  if (i2c.readAck()) {     }  
  i2c.stop();
}

void sendOutputCommandOff() {
  Serial.println("sendOutputCommandOff");
  i2c.start();  
  i2c.writeByte(0x40);
  if (i2c.readAck()) {      }
  i2c.writeByte(0x01);
  if (i2c.readAck()) {      }
  i2c.writeByte(0xFE); // TX off, Red LED on
  if (i2c.readAck()) {      }  
  i2c.stop();
}

void sendOutputCommandOn() {
  Serial.println("sendOutputCommandOn");
  i2c.start();  
  i2c.writeByte(0x40);
  if (i2c.readAck()) {      }
  i2c.writeByte(0x01);
  if (i2c.readAck()) {      }
  i2c.writeByte(0xF9); // TX on, Green LED on
  if (i2c.readAck()) {      }  
  i2c.stop();
}

void setup() {
  Serial.begin(115200);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  pinMode(PIN_SCL, OUTPUT);
  pinMode(PIN_SDA, OUTPUT);

  //program outputs
  sendConfigOutputCommand();
  delay(100);
  sendOutputCommandOff();
  delay(1000);
  sendOutputCommandOn();
  delay(100);

//  writeDAC(500, 0, 0); // pulse amplitudes
//  writeDAC(0, 1, 0);
//  writeDAC(0, 2, 0);
//  writeDAC(0, 3, 0);
//  writeDAC(0, 4, 0);
//  writeDAC(0, 5, 0);
//  writeDAC(0, 6, 0);
//  writeDAC(0, 7, 0);
//  
//  writeDAC(0, 0, 1); // offset1 adjust
//  writeDAC(0, 1, 1); // offset2 adjust
//  
//  writeDAC(0, 2, 1); // extras
//  writeDAC(0, 3, 1);
//  writeDAC(0, 4, 1);
//  writeDAC(0, 5, 1);
//  writeDAC(0, 6, 1);
//  writeDAC(0, 7, 1);
}

void loop() {
  digitalWrite(5,HIGH);
  digitalWrite(6,HIGH);
  
  digitalWrite(LED_BUILTIN,HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN,LOW);
  delay(1000);
}
