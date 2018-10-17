
_main:

;MyProject.c,25 :: 		void main() {
;MyProject.c,26 :: 		ADCON1 =0x80;              // Configure AN2 pin as analog
	MOVLW      128
	MOVWF      ADCON1+0
;MyProject.c,27 :: 		TRISA =0xFF;                 // Configure other AN pins as digital I/O
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,28 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,29 :: 		PORTB=0x00;
	CLRF       PORTB+0
;MyProject.c,30 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,31 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,34 :: 		do {
L_main0:
;MyProject.c,35 :: 		temp_res = ADC_Read(0);   //  AD conversion   Analog pin 0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;MyProject.c,36 :: 		IntToStr(temp_res, txt);  //Data convertion between Int To Sting
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,38 :: 		if(temp_res >800)       //Pump Activation
	MOVF       _temp_res+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _temp_res+0, 0
	SUBLW      32
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,41 :: 		Lcd_Out(1, 4, "Bomba activada  :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,42 :: 		Lcd_Out(2, 1, txt);            // Display Pump State
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,43 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;MyProject.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,46 :: 		RB6_bit=1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,47 :: 		}
	GOTO       L_main5
L_main3:
;MyProject.c,49 :: 		RB6_bit=0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,50 :: 		}
L_main5:
;MyProject.c,51 :: 		if(temp_res<100)      // Pump Desactivation
	MOVLW      0
	SUBWF      _temp_res+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      100
	SUBWF      _temp_res+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;MyProject.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,55 :: 		Lcd_Out(1, 4, "Bomba desactivada  :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,56 :: 		Lcd_Out(2, 1, txt);            // Display Pump State
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,57 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;MyProject.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,59 :: 		RB7_bit=1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;MyProject.c,61 :: 		}
	GOTO       L_main8
L_main6:
;MyProject.c,63 :: 		RB7_bit=0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;MyProject.c,64 :: 		}
L_main8:
;MyProject.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,66 :: 		Lcd_Out(2, 1, "Segundo parcial");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,67 :: 		delay_ms(400);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;MyProject.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,72 :: 		} while(1);
	GOTO       L_main0
;MyProject.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
