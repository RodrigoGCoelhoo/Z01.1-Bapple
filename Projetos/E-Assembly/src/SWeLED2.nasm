; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

leaw $21185, %A 
movw (%A), %D
movw %D, %A 
addw %A, %D, %D 
leaw $0, %A 
;salva o SW shiftado em RAM[0]
movw %D, (%A)
;Agora tentando extrair o !SW7 e salvando em RAM[1]
leaw $21185, %A 
movw (%A), %D 
notw %D
leaw $65407, %A 
orw %A, %D, %D 
leaw $1, %A 
movw %D, (%A)
;agora tem que extrair SW0 do shiftado e salvar em RAM[2]
leaw $0, %A 
movw (%A), %D 
leaw $65533, %A 
orw %A, %D, %D
leaw $2, %A 
movw %D, (%A)
;agora falta apenas extrair o digito 3 da RAM[5]
leaw $5, %A
movw (%A), %D 
leaw $65527, %A 
orw %A, %D, %D 
leaw $3, %A 
;guarda na RAM[3]
movw %D, (%A)

;mascara SW8 
leaw $21185, %A 
movw (%A), %D 
leaw %65279, %A 
orw %A, %D, %D
leaw $4, %A 
movw %D, (%A)

;agora temos que aplicar as mascaras
leaw $1, %A
movw (%A), %D 
leaw $2, %A 
andw (%A), %D, %D 
leaw $3, %A 
andw (%A), %D, %D 
leaw $4, %A 
andw (%A), %D, %D
leaw $446, %A 
andw %A, %D, %D 
leaw $21184, %A 
movw %D, (%A)