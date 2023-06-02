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
}

void loop() {
  digitalWrite(5,HIGH);
  digitalWrite(6,HIGH);
  
  digitalWrite(LED_BUILTIN,HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN,LOW);
  delay(1000);
}
