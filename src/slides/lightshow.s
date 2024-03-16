light_show:
  // On first entry turn lights off
  lda first_time_entry
  bne do_regulary_light_things
  inc first_time_entry
  jmp turn_light_off

  do_regulary_light_things:
  inc is_light_on
  bne do_no_light_change
  inc is_light_on+1
  lda is_light_on+1
  cmp #50
  bne do_no_light_change
  lda #0
  sta is_light_on+1
  inc is_light_on+2
  lda is_light_on+2
  and #1
  beq turn_light_off

  turn_light_on:
    jmp start

  turn_light_off:
    lda #COLOR_BLACK
    sta SCREEN_BG_COLOR
    sta SCREEN_BORDER

    ldy #0
    ls_loop:
      lda #COLOR_DARK_GREY
      sta $d800, y // Color
      sta $d800+$100,y
      sta $d800+$200,y
      sta $d800+$2e8,y
      iny
      bne ls_loop
  do_no_light_change:
    jmp no_light // go back


is_light_on: .byte 0, 0, 0
first_time_entry: .byte 0
