
_main:

;PARCIAL.c,2 :: 		void main()      {
;PARCIAL.c,3 :: 		TRISB0_bit = 1;    // S1
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;PARCIAL.c,4 :: 		TRISB1_bit = 1;    // S2
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;PARCIAL.c,5 :: 		TRISB2_bit = 0;    // Motor
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;PARCIAL.c,6 :: 		TRISB3_bit = 0;    // Tolba B1 A
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;PARCIAL.c,7 :: 		TRISB4_bit = 0;    // Barra B2
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;PARCIAL.c,9 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;PARCIAL.c,10 :: 		TRISC = 0X00;
	CLRF       TRISC+0
;PARCIAL.c,12 :: 		PORTB = 0B00000100;
	MOVLW      4
	MOVWF      PORTB+0
;PARCIAL.c,13 :: 		PORTD = 0B00000000;
	CLRF       PORTD+0
;PARCIAL.c,14 :: 		PORTC = 0B00000000;
	CLRF       PORTC+0
;PARCIAL.c,17 :: 		do {
L_main0:
;PARCIAL.c,18 :: 		if (Button(&PORTB, 0, 1, 1)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;PARCIAL.c,19 :: 		TRISB2_bit = 0;
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;PARCIAL.c,20 :: 		TRISB3_bit = 0;
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;PARCIAL.c,22 :: 		if (Button(&PORTB, 1, 1, 1)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;PARCIAL.c,24 :: 		for (i = 0 ; i<10 ;i++){
	CLRF       _i+0
L_main5:
	MOVLW      10
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;PARCIAL.c,25 :: 		i = trisb1_bit;
	MOVLW      0
	BTFSC      TRISB1_bit+0, BitPos(TRISB1_bit+0)
	MOVLW      1
	MOVWF      _i+0
;PARCIAL.c,27 :: 		if (i == 1){
	MOVF       _i+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;PARCIAL.c,28 :: 		PORTC = 0B00000110;
	MOVLW      6
	MOVWF      PORTC+0
;PARCIAL.c,29 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,30 :: 		}
L_main8:
;PARCIAL.c,31 :: 		if (i == 2){
	MOVF       _i+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;PARCIAL.c,32 :: 		PORTC = 0B11011011;
	MOVLW      219
	MOVWF      PORTC+0
;PARCIAL.c,33 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,34 :: 		}
L_main9:
;PARCIAL.c,35 :: 		if (i == 3){
	MOVF       _i+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;PARCIAL.c,36 :: 		PORTC = 0B11001111;
	MOVLW      207
	MOVWF      PORTC+0
;PARCIAL.c,37 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,38 :: 		}
L_main10:
;PARCIAL.c,39 :: 		if (i == 4){
	MOVF       _i+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;PARCIAL.c,40 :: 		PORTC = 0B11100110;
	MOVLW      230
	MOVWF      PORTC+0
;PARCIAL.c,41 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,42 :: 		}
L_main11:
;PARCIAL.c,43 :: 		if (i == 5){
	MOVF       _i+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;PARCIAL.c,44 :: 		PORTC = 0B101101101;
	MOVLW      109
	MOVWF      PORTC+0
;PARCIAL.c,45 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,46 :: 		}
L_main12:
;PARCIAL.c,47 :: 		if (i == 6){
	MOVF       _i+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;PARCIAL.c,48 :: 		PORTC = 0B00000110;
	MOVLW      6
	MOVWF      PORTC+0
;PARCIAL.c,49 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,50 :: 		}
L_main13:
;PARCIAL.c,51 :: 		if (i == 7){
	MOVF       _i+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;PARCIAL.c,52 :: 		PORTC = 0B11011011;
	MOVLW      219
	MOVWF      PORTC+0
;PARCIAL.c,53 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,54 :: 		}
L_main14:
;PARCIAL.c,55 :: 		if (i == 8){
	MOVF       _i+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;PARCIAL.c,56 :: 		PORTC = 0B11001111;
	MOVLW      207
	MOVWF      PORTC+0
;PARCIAL.c,57 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,58 :: 		}
L_main15:
;PARCIAL.c,59 :: 		if (i == 9){
	MOVF       _i+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;PARCIAL.c,60 :: 		PORTC = 0B11100110;
	MOVLW      230
	MOVWF      PORTC+0
;PARCIAL.c,61 :: 		PORTD = 0B00111111;
	MOVLW      63
	MOVWF      PORTD+0
;PARCIAL.c,62 :: 		}
L_main16:
;PARCIAL.c,24 :: 		for (i = 0 ; i<10 ;i++){
	INCF       _i+0, 1
;PARCIAL.c,63 :: 		}
	GOTO       L_main5
L_main6:
;PARCIAL.c,64 :: 		}
L_main4:
;PARCIAL.c,65 :: 		}
L_main3:
;PARCIAL.c,66 :: 		}while(1);
	GOTO       L_main0
;PARCIAL.c,67 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
