#line 1 "D:/PIC programs/Segundo parcial/MyProject.c"
#line 7 "D:/PIC programs/Segundo parcial/MyProject.c"
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
 PORTB=0x00;
 TRISB=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 do {
 temp_res = ADC_Read(0);
 IntToStr(temp_res, txt);

 if(temp_res >800)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 4, "Bomba activada  :");
 Lcd_Out(2, 1, txt);
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 RB6_bit=1;
 }
 else{
 RB6_bit=0;
 }
 if(temp_res<100)
 {

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 4, "Bomba desactivada  :");
 Lcd_Out(2, 1, txt);
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 RB7_bit=1;

 }
 else {
 RB7_bit=0;
 }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Segundo parcial");
 delay_ms(400);
 Lcd_Cmd(_LCD_CLEAR);



 } while(1);
}
