; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 12/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declara��es EQU - Defines
;<NOME>         EQU <VALOR>
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
	;MOV R0, #65 	;A
	;LDR R1, =0x1B001B00	;B
	;LDR R2, =0x12345678	;C
	;LDR R3, =0x20000040	;D
	;STR R0, [R3]	;D
	;STR R1, [R3, #4]!	;E
	;STR R2, [R3, #4]!	;F
	;LDR R4, =0xF0001	;G
	;STR R4, [R3, #4]!	;G
	;MOV R5, #0xCD	;H
	;STRB R5, [R3, #-6]!	;H
	;LDR R7, [R3, #-6]!	;I
	;LDR R8, [R3, #8]!	;J
	;MOV R9, R7	;K
	
	;MOV R9, #0xF0	;A
	;ANDS R0, R9, #2_01010101	;A
	;MOV R8, #2_11001100	;B
	;ANDS R1, R8, #2_00110011	;B
	;MOV R7, #2_10000000	;C
	;ORRS R2, R7, #2_00110111	;C
	;MOV R6, #0xABCD	;D
	;MOVT R6, #0xABCD
	;MOV R5, #0xFFFF
	;BICS R3, R6, R5

	MOV R1, #701	;A
	LSRS R2, R1, #5	;A
	MOV R3, #32067	;B
	NEG R3, R3	;B
	LSRS R4, R3, #4	;B
	ASRS R5, R1, #3	;C
	ASRS R6, R3, #5	;D
	MOV R7, #255	;E
	LSRS R8, R7, #8	;E
	MOV R9, #-58982	;F
	LSRS R9, R9, #18	;F
	LDR R10, =0xFABC1234	;G
	RORS R10, R10, #10	;G
	MOV R11, #0x4321
	RORS R11, R11, #2
	RORS R11, R11, #2
	
	
	
	
	NOP
    ALIGN                           ; garante que o fim da se��o est� alinhada 
    END                             ; fim do arquivo
