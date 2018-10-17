
void main() {
TRISB0_bit = 1; //s1
TRISB1_bit = 1; //s2
TRISB2_bit = 0; // Motor
TRISB3_bit = 0; // Tolba actuador
TRISB4_bit = 0; // Barra que no deja pasar el producto

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

