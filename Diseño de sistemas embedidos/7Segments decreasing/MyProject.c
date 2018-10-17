  int i;
  unsigned int display[] = {0x6F,0x7F,0x07,0x7D,0x6D,0x66,0x4F,0x5B,0x06,0x3F};
void main() {
  TRISB = 0X00;
  PORTB = 0X00;

 for(;;)
 {

 for(i = 0; i < 10; i++)
   {
    PORTB = display[i];
    delay_ms (100);
   }

 }
 }
