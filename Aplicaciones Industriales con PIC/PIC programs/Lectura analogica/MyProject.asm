
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,5 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,6 :: 		TRISC  = 0;                 // PORTC is output
	CLRF       TRISC+0
;MyProject.c,7 :: 		TRISB  = 0;                 // PORTB is output
	CLRF       TRISB+0
;MyProject.c,9 :: 		do {
L_main0:
;MyProject.c,10 :: 		temp_res = ADC_Read(2);   // Get 10-bit results of AD conversion
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;MyProject.c,11 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,12 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTC+0
;MyProject.c,13 :: 		} while(1);
	GOTO       L_main0
;MyProject.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
