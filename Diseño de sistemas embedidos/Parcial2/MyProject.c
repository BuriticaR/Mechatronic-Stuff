/*
Program: Pump Activation Between Two Levels
By: Ricardo Buritica - Daniel Rodriguez - Yaritza Perez
Subject: Embeded Systems Teacher - Josè Colomo
This example code is in the public domain.
Date:11-23-2017
*/
unsigned int temp_res;
char txt[7];
// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

void main() {
  ADCON1 =0x80;              // Configure AN2 pin as analog
  TRISA =0xFF;                 // Configure other AN pins as digital I/O
  TRISA  = 0xFF;              // PORTA is input
  TRISD  = 0;                 // PORTC is output
  TRISC  = 0;                 // PORTB is output
  portb=0x00;
  trisb=0;
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off

  do {
    temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
    IntToStr(temp_res, txt);  //Data convertion between Int To Sting
    
  if(temp_res==1023)       //Pump Activation
   {
   RB6_bit=1;
   }
   if(temp_res==808)      // Pump Desactivation
   {
   RB6_bit=0;
   }
   
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1, 4, "Pump State  :");
    Lcd_Out(2, 1, txt);            // Display Pump State
    delay_ms(400);
    Lcd_Cmd(_LCD_CLEAR);

  } while(1);
}