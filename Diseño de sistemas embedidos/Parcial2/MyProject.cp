#line 1 "C:/Users/Ricardo Buriticá/Desktop/Parcial2/MyProject.c"
#line 8 "C:/Users/Ricardo Buriticá/Desktop/Parcial2/MyProject.c"
unsigned int temp_res;
char txt[7];

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


void main() {
 ADCON1 =0x80;
 TRISA =0xFF;
 TRISA = 0xFF;
 TRISD = 0;
 TRISC = 0;
 portb=0x00;
 trisb=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 do {
 temp_res = ADC_Read(0);
 PORTC = temp_res;
 PORTD = temp_res >> 8;

 IntToStr(temp_res, txt);

 if(temp_res==1023)
 {
 RB6_bit=1;
 }
 if(temp_res==808)
 {
 RB6_bit=0;
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 4, "Pump State  :");
 Lcd_Out(2, 1, txt);
 delay_ms(400);
 Lcd_Cmd(_LCD_CLEAR);

 } while(1);
}
