; acme --cpu 6510 --format cbm --outfile foo.prg foo.asm
;* = $0801                             ; BASIC start address (#2049) */
;!byte $0d,$08,$dc,$07,$9e,$20,$34,$39 ; BASIC loader to start at $c000...
;!byte $31,$35,$32,$00,$00,$00         ; puts BASIC line 2012 SYS 49152
;* = $c000                             ; start address for 6502 code


.org $0801
.byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00,$00,$00

jsr initIRQs

set_pointers
  lda page_offset
  sta page_math
  lda #<screen_000
  clc
  adc #2
  sta zpPtr1
  lda #>screen_000
  adc #0
  sta zpPtr1+1
do_offset
  lda page_math
  beq set_page_vals
  lda zpPtr1
  clc
  adc #$D2 ; 2,002 to get to the next page
  sta zpPtr1
  lda zpPtr1+1
  adc #$07
  sta zpPtr1+1
  dec page_math
  jmp do_offset
set_page_vals
  lda zpPtr1
  sta zpPtr2
  sta zpPtr3
  lda zpPtr1+1
  sta zpPtr2+1
  sta zpPtr3+1

  inc zpPtr2+1 ; +256

  inc zpPtr3+1
  inc zpPtr3+1 ; +512

  clc
  lda zpPtr1
  adc #$e8
  sta zpPtr4
  lda zpPtr1+1
  adc #$02
  sta zpPtr4+1
; Do color sets
  clc
  lda zpPtr1
  adc #$e8 ; add 1,000
  sta zpPtr5
  sta zpPtr6
  sta zpPtr7
  lda zpPtr1+1
  adc #$03 ; add 1,000
  sta zpPtr5+1
  sta zpPtr6+1
  sta zpPtr7+1
  inc zpPtr6+1
  inc zpPtr7+1
  inc zpPtr7+1

  clc
  lda zpPtr5
  adc #$e8
  sta zpPtr8
  lda zpPtr5+1
  adc #$02
  sta zpPtr8+1




start
s_border_color
    lda zpPtr1
    sec
    sbc #2
    sta zpPtr9
    lda zpPtr1+1
    sbc #0
    sta zpPtr9+1
    ldy #0
    lda (zpPtr9), y
    sta SCREEN_BORDER
s_bg_color
    iny
    lda (zpPtr9), y
    sta SCREEN_BG_COLOR

screen_load_main_loop
    ldy #0
loop
lchar_1
    lda (zpPtr1), y
    sta SCREENMEM, y ; Screen Data
lchar_2
    lda (zpPtr2), y
    sta $0400+$100, y
lchar_3
    lda (zpPtr3), y
    sta $0400+$200, y
lchar_4
    lda (zpPtr4), y
    sta $0400+$02e8, y

lcolor_1
    lda (zpPtr5), y
    sta $d800, y ; Color
lcolor_2
    lda (zpPtr6), y
    sta $d800+$100,y
lcolor_3
    lda (zpPtr7), y
    sta $d800+$200,y
lcolor_4
    lda (zpPtr8), y
    sta $d800+$2e8,y
    iny
    bne loop



infloop
wait_first_line
    ldx $d012
    lda $d011
    and #$80
    bne wait_first_line
    jsr updateJoyPos
    lda page_offset
    cmp #PAGE_FOR_COLOR_CYCLE
    bne no_old_school
    jsr oldschool
    no_old_school

    lda page_offset
    cmp #PAGE_FOR_PROCESSING
    bne no_processing
    jsr processing
    no_processing

    lda page_offset
    cmp #PAGE_FOR_LIGHT
    bne no_light
    jmp light_show
    no_light

    lda page_offset
    cmp #PAGE_FOR_TALKING
    bne no_talking
    jsr talk_now
    no_talking

    lda page_offset
    cmp #PAGE_FOR_EARTH
    bne no_earth
    jsr transform_earth
    no_earth

    cpx #0
    bne wait_first_line
    jmp infloop


page_offset .byte 0
page_math   .byte 0
just_flipped_page .byte 0
