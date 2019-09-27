SCREEN_LOC_MOUTH1 .equ SCREENMEM + 27 + 40 + 40 + 40 + 40 + 40 + 40
SCREEN_LOC_MOUTH2 .equ SCREENMEM + 9 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 + 40 +40

NOISE_LOC .equ COLORMEM + 15

talk_now
inc is_mouth_open
bne do_no_mouth_change
inc is_mouth_open+1
lda is_mouth_open+1
cmp #3
bne do_no_mouth_change
lda #0
sta is_mouth_open+1
inc is_mouth_open+2
lda is_mouth_open+2
and #1
beq partial_teeth_on
lda #ALL_TEETH
ldy #COLOR_GREY
jmp teeth_selected
partial_teeth_on
lda #PARTIAL_TEETH
ldy #COLOR_BLACK
teeth_selected
  ldx #0
  t_loop
    sta SCREEN_LOC_MOUTH1, x
    sta SCREEN_LOC_MOUTH2, x
    inx
    cpx #3
    bne t_loop
  ldx #0
  sty NOISE_LOC
  sty NOISE_LOC+1
  sty NOISE_LOC+40
  sty NOISE_LOC+41
  sty NOISE_LOC+80
  sty NOISE_LOC+81
  sty NOISE_LOC+80+40
  sty NOISE_LOC+81+40

  do_no_mouth_change
; Do we cycle of the noise?
ldx #0

rts

ALL_TEETH .equ 160
PARTIAL_TEETH .equ 120

is_mouth_open .byte 0, 0, 0
