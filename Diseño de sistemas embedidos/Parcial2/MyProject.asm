
_main:

;MyProject.c,26 :: 		void main() {
;MyProject.c,27 :: 		ADCON1 =0x80;              // Configure AN2 pin as analog
	MOVLW      128
	MOVWF      ADCON1+0
;MyProject.c,28 :: 		TRISA =0xFF;                 // Configure other AN pins as digital I/O
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,29 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,30 :: 		TRISD  = 0;                 // PORTC is output
	CLRF       TRISD+0
;MyProject.c,31 :: 		TRISC  = 0;                 // PORTB is output
	CLRF       TRISC+0
;MyProject.c,32 :: 		portb=0x00;
	CLRF       PORTB+0
;MyProject.c,33 :: 		trisb=0;
	CLRF       TRISB+0
;MyProject.c,34 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,37 :: 		do {
L_main0:
;MyProject.c,38 :: 		temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;MyProject.c,39 :: 		PORTC = temp_res;         // Send lower 8 bits to PORTB
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;MyProject.c,40 :: 		PORTD = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;MyProject.c,42 :: 		IntToStr(temp_res, txt);  //Data convertion between Int To Sting
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,44 :: 		if(temp_res==1023)       //Pump Activation
	MOVF       _temp_res+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      255
	XORWF      _temp_res+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;MyProject.c,46 :: 		RB6_bit=1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,47 :: 		}
L_main3:
;MyProject.c,48 :: 		if(temp_res==808)      // Pump Desactivation
	MOVF       _temp_res+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      40
	XORWF      _temp_res+0, 0
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;MyProject.c,50 :: 		RB6_bit=0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,51 :: 		}
L_main4:
;MyProject.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,54 :: 		Lcd_Out(1, 4, "Pump State  :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,55 :: 		Lcd_Out(2, 1, txt);            // Display Pump State
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,56 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;MyProject.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,59 :: 		} while(1);
	GOTO       L_main0
;MyProject.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
