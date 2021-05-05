; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

;-----------------;
;      IDEIA
;-----------------;
; if R[0] > R[1]:  --> subtrair um do outro e ver se deu negativo
;   R[2] = R[0]
;
; if R[0] < R[1]:
;   R[2] = R[1]

; ESCREVENDO RAM[0] NA RAM[2] INDEPENDENTEMENTE DOS VALORES
leaw $0, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

; FAZ A SUBTRAÇÃO DA ROM[0] PELA RAM[1] PARA VERIFICAR SE O RESULTADO É NEGATIVO
leaw $0, %A
movw (%A), %D
leaw $1, %A
subw %D, (%A), %D

; DEPENDENDO DO RESULTDO DA SUBTRAÇÃO, SUBSCREVE A RAM[2] PELO VALOR DA RAM[1]. CASO CONTRÁRIO PULA
leaw $PULA, %A
jg %D
nop
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
PULA:
