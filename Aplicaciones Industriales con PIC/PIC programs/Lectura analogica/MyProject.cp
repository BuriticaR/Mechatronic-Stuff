#line 1 "D:/PIC programs/Lectura analogica/MyProject.c"
unsigned int temp_res;

void main() {

 TRISA = 0xFF;
 TRISC = 0;
 TRISB = 0;

 do {
 temp_res = ADC_Read(2);
 PORTB = temp_res;
 PORTC = temp_res >> 8;
 } while(1);
}
