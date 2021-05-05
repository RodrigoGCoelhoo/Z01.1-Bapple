leaw $2, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

leaw $1, %A
movw (%A), %D
leaw $3, %A
subw %D, %A, %D ; %D = RAM[1] - 3
leaw $END, %A
jne %D ; verifica se RAM[1] - 3 != 0
nop 

leaw $0, %A
movw $1, (%A) ; Se RAM[1]-3 == 0, RAM[0] = 1

END:

;PSEUDO 
; RAM[0] = 2
; if (RAM[0] + RAM[1]) - 3 >= 0:
;     RAM[0] = 1

;RAM[0] = 2
leaw $2, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

;RAM[3] = RAM[0] + RAM[1]
leaw $0, A%
movw (%A), %D
addw



