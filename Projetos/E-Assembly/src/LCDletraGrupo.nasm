; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

movw $-1, %D

leaw $18755, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18775, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18795, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18815, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18835, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18855, %A
movw %D, (%A)

leaw $18858, %A
movw %D, (%A)

leaw $18875, %A
movw %D, (%A)

leaw $18878, %A
movw %D, (%A)

leaw $18895, %A
movw %D, (%A)

leaw $18898, %A
movw %D, (%A)

leaw $18915, %A
movw %D, (%A)

leaw $18918, %A
movw %D, (%A)

leaw $18935, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18955, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18975, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $18995, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19015, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19035, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19055, %A
movw %D, (%A)

leaw $19058, %A
movw %D, (%A)

leaw $19075, %A
movw %D, (%A)

leaw $19078, %A
movw %D, (%A)

leaw $19095, %A
movw %D, (%A)

leaw $19098, %A
movw %D, (%A)

leaw $19115, %A
movw %D, (%A)

leaw $19118, %A
movw %D, (%A)

leaw $19135, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19155, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19175, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $19195, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)