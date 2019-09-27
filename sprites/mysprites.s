
; 3 sprites generated with spritemate on 1/6/2019, 11:42:14 PM
; Byte 64 of each sprite contains multicolor (high nibble) & color (low nibble) information

.org $03c0

LDA #$08 ; sprite multicolor 1
STA $D025
LDA #$06 ; sprite multicolor 2
STA $D026


; sprite 1 / singlecolor / color: $01
sprite_1
.byte $20,$80,$00,$91,$20,$00,$bf,$a0
.byte $00,$ee,$e0,$00,$ff,$e0,$00,$7f
.byte $c0,$00,$20,$80,$00,$40,$40,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01

; sprite 2 / singlecolor / color: $01
sprite_2
.byte $20,$80,$00,$11,$00,$00,$3f,$80
.byte $00,$6e,$c0,$00,$ff,$e0,$00,$bf
.byte $a0,$00,$a0,$a0,$00,$1b,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01

; sprite 3 / singlecolor / color: $01
sprite_3
.byte $04,$00,$00,$0e,$00,$00,$0e,$00
.byte $00,$7f,$c0,$00,$ff,$e0,$00,$ff
.byte $e0,$00,$ff,$e0,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$01
