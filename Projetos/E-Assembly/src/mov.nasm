; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------
; >> Colocando o valor da Ram[0] na Ram[2]
leaw $0, %A; - Carrega a constante 1 em %A
movw (%A), %D; - Copia o valor da Ram[%A] para %D
leaw $2, %A; - Carrega a constante 2 em %A
movw %D, (%A); - Copia o valor de %D na Ram[%A]


; >> Colocando o valor de Ram[1] em Ram[0]
leaw $1, %A; - Carrega a constante 1 em %A
movw (%A), %D; - Copia o valor da Ram[%A] para %D
leaw $0, %A; - Carrega a constante 0 em %A
movw %D, (%A); -Copia o valor de %D para RAM[%A]

; -----------------------
; RAM[1] = RAM[0]
; -----------------------
leaw $2, %A; - Carrega a constante 2 em %A
movw (%A), %D; - Copia o valor da Ram[%A] para %D
leaw $1, %A; - Carrega a constante 2 em %A
movw %D, (%A); - Copia o valor de %D para Ram[%A]


; -----------------------
; RAM[3] = 1
; -----------------------
leaw $3, %A; - Carrega a constante 3 em %A
movw 1, (%A); -Copia o valor de 1 para RAM[%A]
