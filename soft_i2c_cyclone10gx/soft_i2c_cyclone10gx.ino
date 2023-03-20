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

  //for power to level shifter
  pinMode(6,OUTPUT);
  digitalWrite(6,HIGH);
  delay(100);

  //program outputs
  sendConfigOutputCommand();
  delay(100);
  sendOutputCommandOff();
  delay(1000);
  sendOutputCommandOn();
  delay(100);
}

bool controlpin;
void loop() {
  bool tempcontrolpin = digitalRead(2);
  if (controlpin != tempcontrolpin){
    controlpin = tempcontrolpin;
    Serial.print("control pin now "); Serial.println(controlpin);
    if (controlpin) sendOutputCommandOn();
    else sendOutputCommandOff();
  }
  digitalWrite(LED_BUILTIN,HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN,LOW);
  delay(1000);
}
