
_Move_Delay:

;MyProject.c,24 :: 		void Move_Delay() {                  // Function used for text moving
;MyProject.c,25 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
;MyProject.c,26 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;MyProject.c,28 :: 		void main(){
;MyProject.c,29 :: 		PORTB=0x00;
	CLRF       PORTB+0
;MyProject.c,30 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,35 :: 		Lcd_Out(1,6,txt3);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,37 :: 		Lcd_Out(2,6,txt4);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,38 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;MyProject.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,41 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,42 :: 		Lcd_Out(2,5,txt2);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,44 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,49 :: 		while(1) {
L_main3:
;MyProject.c,50 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,51 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;MyProject.c,52 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;MyProject.c,53 :: 		Delay_ms(1000);                         // Endless loop
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;MyProject.c,56 :: 		}
	GOTO       L_main3
;MyProject.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
