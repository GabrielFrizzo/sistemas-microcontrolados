; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 12/03/2018
; Gabriel Branco Frizzo
; Mateus Vieira Freitas

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declara��es EQU - Defines
POS_BASE EQU 0x20000000
; -------------------------------------------------------------------------------
; �rea de Dados - Declara��es de vari�veis
		AREA  DATA, ALIGN=2
		; Se alguma vari�vel for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a vari�vel <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma vari�vel de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posi��o da RAM		

; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a fun��o Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma fun��o externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; fun��o <func>

; -------------------------------------------------------------------------------
; Fun��o main()
Start  
; Comece o c�digo aqui <======================================================
	LDR R0, =POS_BASE			; ponteiro
	MOV R1, #1					; atual
	MOV R2, #0					; count
loop
	CMP R1, #0xFF				; atual > 255
	ITT LE
		ADDLE R1, #1			; atual++
		BLE testaPrimo
		
	NOP
	
testaPrimo
	MOV R7, #2					; divisor
loopDivisor
	CMP R7, R1					; divisor >= atual?
	ITT GE
		STRGE R1, [R0], #2		; *ponteiro = atual; ponteiro++
		BGE returnTestaPrimo	; return
	UDIV R11, R1, R7			; R11 = R1/R7 (sem resto)
	MLS R12, R7, R11, R1		; R12 = R1 - R11*R7 (resto)
	CMP R12, #0
	ITT NE
		ADDNE R7, #1			; divisor++
		BNE loopDivisor

returnTestaPrimo
	B loop				; return

    ALIGN                           ; garante que o fim da se��o est� alinhada 
    END                             ; fim do arquivo
