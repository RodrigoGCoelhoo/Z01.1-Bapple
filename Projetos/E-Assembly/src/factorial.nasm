; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $ZERO, %A
je %D
nop

leaw $3, %A
movw %D, (%A)
leaw $1, %A
movw %D, (%A)

MAIN:
leaw $0, %A
movw (%A), %D
leaw $2, %A
subw %D, %A, %D
movw %D, (%A)

leaw $END, %A
jle %D
nop

LOOPSOMA:
; somando
leaw $3, %A 
movw (%A), %D
leaw $1, %A
addw (%A), %D, %D
movw %D, (%A)
; subtraindo
leaw $2, %A 
movw (%A), %D 
leaw $1, %A
subw %D, %A, %D 
leaw $2, %A
movw %D, (%A)
leaw $LOOPSOMA, %A
jg %D
nop

leaw $1, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

leaw $0, %A
movw (%A), %D
leaw $1, %A
subw %D, %A, %D
leaw $0, %A
movw %D, (%A)
leaw $MAIN, %A
jg %D
nop

ZERO:
leaw $1, %A
movw %A, %D
movw %D, (%A)

END: