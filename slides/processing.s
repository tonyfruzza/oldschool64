processing
  ldx #0

  lda #<SCREEN_POS_START
  sta zpPtr1
  lda #>SCREEN_POS_START
  sta zpPtr1+1

  processing_loop_next_line
  ldy #0
  processing_loop
  ; Get character to print
  lda $d012
  eor $dc04
  sbc $dc05
  and #1
  beq is_zero
  lda #49 ; '1'
  jmp chosen_char
  is_zero
  lda #48 ;'0'
  chosen_char
  sta (zpPtr1), y
  iny
  cpy #8
  bne processing_loop
  inx
  cpx #5
  beq no_more_lines
  clc
  lda #40
  adc zpPtr1
  sta zpPtr1
  lda #0
  adc zpPtr1+1
  sta zpPtr1+1
  jmp processing_loop_next_line
  no_more_lines
  rts

SCREEN_POS_START .equ SCREENMEM + 2 + 40 + 40 + 40 + 40 + 40 + 40
