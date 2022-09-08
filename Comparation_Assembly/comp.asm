segment .data
LF              equ 0xA  ; Line Feed
NULL            equ 0xd  ; Final da cadeia de caracteres
SYS_CALL        equ 0x80 ; Envia informação ao SO 
; EAX
SYS_EXIT        equ 0x1  ; Código de chamda para finalizar
SYS_READ        equ 0X3  ; Operação de leitura
SYS_WRITE       equ 0x4  ; Operaão de escrita
; EBX
RET_EXIT        equ 0x0  ; Operação realizada com sucesso
STD_IN          equ 0x0  ; Entrada padrão 
STD_OUT         equ 0x1  ; Saída padrão

section .data
    x dd 14
    y dd 87

    msg1 db 'X é maior que Y', LF, NULL
    tam1 equ $-msg1

    msg2 db 'Y é maior que X', LF, NULL
    tam2 equ $-msg2

section .text
global _start

_start:
    mov EAX, DWORD[x]
    mov EDX, DWORD[y]

    ; Estrutura condicional, semelhante ao 'if'
    cmp EAX, EDX ; Haverá a comparação dos valores
    ; Tipo de comparaçao: je: = _ jg > _ jge >= _ jl < _ jle <= _ jne !=
    jge maior ; Define o tipo de combinação
    mov ECX, msg2
    mov EDX, tam2
    ; Salto incondicional ( jmp )
    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL