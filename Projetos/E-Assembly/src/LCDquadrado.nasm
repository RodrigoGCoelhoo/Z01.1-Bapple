; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD
leaw $65280, %A
movw %A, %D
leaw $16892, %A
movw %D, (%A)
leaw $65280, %A
movw %A, %D
leaw $17032, %A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $16912,%A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $16932,%A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $16952,%A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $16972,%A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $16992,%A
movw %D, (%A)
leaw $33024, %A
movw %A, %D
leaw $17012,%A
movw %D, (%A)