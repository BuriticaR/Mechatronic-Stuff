unsigned int temp_res;

void main() {

  TRISA  = 0xFF;              // PORTA is input
  TRISC  = 0;                 // PORTC is output
  TRISB  = 0;                 // PORTB is output

  do {
    temp_res = ADC_Read(2);   // Get 10-bit results of AD conversion
    PORTB = temp_res;         // Send lower 8 bits to PORTB
    PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
  } while(1);
}