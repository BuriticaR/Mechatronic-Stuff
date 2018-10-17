char  i=0;
void main()      {
      TRISB0_bit = 1;    // S1
      TRISB1_bit = 1;    // S2
      TRISB2_bit = 0;    // Motor
      TRISB3_bit = 0;    // Tolba B1 A
      TRISB4_bit = 0;    // Barra B2

      TRISD = 0x00;
      TRISC = 0X00;

      PORTB = 0B00000100;
      PORTD = 0B00000000;
      PORTC = 0B00000000;
      
      
        do {
         if (Button(&PORTB, 0, 1, 1)){
           TRISB2_bit = 0;
           TRISB3_bit = 0;
         
            if (Button(&PORTB, 1, 1, 1)){
            
               for (i = 0 ; i<10 ;i++){
                  i = trisb1_bit;

                  if (i == 1){
                     PORTC = 0B00000110;
                     PORTD = 0B00111111;
                           }
                  if (i == 2){
                    PORTC = 0B11011011;
                    PORTD = 0B00111111;
                            }
                  if (i == 3){
                    PORTC = 0B11001111;
                    PORTD = 0B00111111;
                             }
                  if (i == 4){
                    PORTC = 0B11100110;
                    PORTD = 0B00111111;
                             }
                  if (i == 5){
                     PORTC = 0B101101101;
                     PORTD = 0B00111111;
                             }
                  if (i == 6){
                     PORTC = 0B00000110;
                     PORTD = 0B00111111;
                             }
                  if (i == 7){
                    PORTC = 0B11011011;
                    PORTD = 0B00111111;
                             }
                  if (i == 8){
                    PORTC = 0B11001111;
                    PORTD = 0B00111111;
                             }
                  if (i == 9){
                    PORTC = 0B11100110;
                    PORTD = 0B00111111;
                            }
               }
            }
         }
     }while(1);
   }
