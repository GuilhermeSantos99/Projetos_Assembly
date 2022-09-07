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
