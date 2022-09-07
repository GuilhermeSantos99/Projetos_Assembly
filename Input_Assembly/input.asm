segment .data
   LF        equ 0xA  ; Line Feed
   NULL      equ 0xd  ; Final da cadeia de caracteres
   SYS_CALL  equ 0x80 ; Envia informação ao SO 
   ; EAX
   SYS_EXIT  equ 0x1  ; Código de chamda para finalizar
   SYS_READ  equ 0X3  ; Operação de leitura
   SYS_WRITE equ 0x4  ; Operaão de escrita
   ; EBX
   RET_EXIT  equ 0x0  ; Operação realizada com sucesso
   STD_IN    equ 0x0  ; Entrada padrão 
   STD_OUT   equ 0x1  ; Saída padrão

section .data
   msg db 'Insira seu nome: ', LF, NULL
   tam equ $- msg

section .bss
   nome resb 1

section .text

global _start

_start:
   mov EAX, SYS_WRITE
   mov EBX, STD_OUT
   mov ECX, msg
   mov EDX, tam
   int SYS_CALL

   mov EAX, SYS_READ
   mov EBX, STD_IN
   mov ECX, nome
   mov EDX, 0xA
   int SYS_CALL

   mov EAX, SYS_EXIT
   mov EBX, RET_EXIT
   int SYS_CALL 
