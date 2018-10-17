char counting=0, state=0;
//RB0_bit = Sensor1
//RB1_bit = Sensor 2
//RB2_bit = Actuador Tolba
//RB3_bit = Barra que no deja pasar el material
//RB4_bit = Motor de la banda transportadora
void main () {
 portc=0;
 portb=0x00;
 trisb=0;
 portd=0;
 trisc=0b10000000;
 trisd=0b10000000;

  while (1)   {
   if (Button(&PORTB, 0, 1, 1) && RB1_bit==1) 
   { 
   state=1;
   RB4_bit=1;
   delay_ms(200);
   RB2_bit=1;

   }
   if (state==1 && Button(&PORTB, 0, 1, 0))
    {
    counting = counting+1;
    RB3_bit=0; //Barra que no deja pasar el material
    if (counting>20)
      {
     RB3_bit=1;
     RB2_bit=0;
     RB4_bit=0;
     delay_ms (500);
     counting=0;

      }

    if (RB1_bit==0)
      {  
      counting=0; 
      RB2_bit=0;
      }




    state=0;
   }



   switch(counting) {
   case 0: PORTC=0x3F; PORTD=0x3F; break;
   case 1: PORTC=0x3F; PORTD=0x06; break;
   case 2: PORTC=0x3F; PORTD=0x5B; break;
   case 3: PORTC=0x3F; PORTD=0x4F; break;
   case 4: PORTC=0x3F; PORTD=0x66; break;
   case 5: PORTC=0x3F; PORTD=0x6D; break;
   case 6: PORTC=0x3F; PORTD=0x7D; break;
   case 7: PORTC=0x3F; PORTD=0x07; break;
   case 8: PORTC=0x3F;  PORTD=0x7F; break;
   case 9: PORTC=0x3F;  PORTD=0x67; break;
   case 10: PORTC=0x06; PORTD=0x3F; break;
   case 11: PORTC=0x06; PORTD=0x06; break;
   case 12: PORTC=0x06; PORTD=0x5B; break;
   case 13: PORTC=0x06; PORTD=0x4F; break;
   case 14: PORTC=0x06; PORTD=0x66; break;
   case 15: PORTC=0x06; PORTD=0x6D; break;
   case 16: PORTC=0x06; PORTD=0x7D; break;
   case 17: PORTC=0x06; PORTD=0x07; break;
   case 18: PORTC=0x06; PORTD=0x7F; break;
   case 19: PORTC=0x06; PORTD=0x67; break;
   case 20: PORTC=0x5B; PORTD=0x3F; break;
  }
 }
}