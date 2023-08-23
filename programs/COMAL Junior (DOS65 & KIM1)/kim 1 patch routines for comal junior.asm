; KIM-1 Comal patch routines
;
; Hans Otten, June 2023
;
		.ORG $0300

GETCH   = $1E5A             ; GETCH (serial, with hardware echo)
OUTCH   = $1EA0             ; OUTCH (serial)
XSAVE	= $0400
YSAVE	= $0401
;
INKIM	STX XSAVE
		STY YSAVE
		JSR GETCH
		LDX XSAVE
		LDY YSAVE
		RTS
;	
OUTKIM  STA XSAVE
		STY YSAVE
		PHA
		JSR OUTCH
		LDX XSAVE
		LDY YSAVE
		PLA
		RTS
;		
CRLF	PHA
		LDA #$0D 		; CR
		JSR OUTKIM
		LDA #$0A		; LF 
		JSR OUTKIM
		PLA
		RTS

BREAK	
		RTS

.END
