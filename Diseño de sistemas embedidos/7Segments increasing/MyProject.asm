
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,4 :: 		TRISB = 0X00;
	CLRF       TRISB+0
;MyProject.c,5 :: 		PORTB = 0X00;
	CLRF       PORTB+0
;MyProject.c,7 :: 		for(;;)
L_main0:
;MyProject.c,10 :: 		for(i = 0; i < 10; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      10
	SUBWF      _i+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,12 :: 		PORTB = display[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _display+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,13 :: 		delay_ms (100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;MyProject.c,10 :: 		for(i = 0; i < 10; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,14 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,16 :: 		}
	GOTO       L_main0
;MyProject.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
