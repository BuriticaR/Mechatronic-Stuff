#line 1 "C:/Users/Ricardo Buriticá/Desktop/Diseño de sistemas embedidos/New folder (2)/PARCIALModi.c"

void main() {
TRISB0_bit = 1;
TRISB1_bit = 1;
TRISB2_bit = 0;
TRISB3_bit = 0;
TRISB4_bit = 0;

TRISC = 0x00;
TRISD = 0x00;

inicio:
display:0x06;
delay_ms(300);
display:0x5B;
delay_ms(300);
display:0x4F;
delay_ms(300);
display:0x66;
delay_ms(300);
display:0x6D;
delay_ms(300);
display:0x7D;
delay_ms(300);
display:0x07;
delay_ms(300);
display:0x7F;
delay_ms(300);
display:0x67;
delay_ms(300);
}
