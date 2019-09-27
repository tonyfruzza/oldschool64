
oldschool
ldy #0
os_loop
os_lcolor_1
  lda (zpPtr5), y
  cmp #COLOR_WHITE
  beq do_os_lcolor_1
  cmp #COLOR_L_GREEN
  beq do_os_lcolor_1
  cmp #COLOR_BLUE
  beq do_os_lcolor_1
  cmp #COLOR_CYAN
  beq do_os_lcolor_1
  jmp os_lcolor_2
  do_os_lcolor_1
  tax
  lda color_val, x ; get the color index
  clc
  adc color_offset ; add the current color offset
  tax
  lda color_groups, x ; what's the new color?
  sta $d800, y ; Color
os_lcolor_2
  lda (zpPtr6), y
  cmp #COLOR_WHITE
  beq do_os_lcolor_2
  cmp #COLOR_L_GREEN
  beq do_os_lcolor_2
  cmp #COLOR_BLUE
  beq do_os_lcolor_2
  cmp #COLOR_CYAN
  beq do_os_lcolor_2
  jmp os_lcolor_3
  do_os_lcolor_2
  bne os_lcolor_3
  tax
  lda color_val, x ; get the color index
  clc
  adc color_offset ; add the current color offset
  tax
  lda color_groups, x ; what's the new color?
  sta $d800+$100,y
os_lcolor_3
  lda (zpPtr7), y
  cmp #COLOR_WHITE
  beq do_os_lcolor_3
  cmp #COLOR_L_GREEN
  beq do_os_lcolor_3
  cmp #COLOR_BLUE
  beq do_os_lcolor_3
  cmp #COLOR_CYAN
  beq do_os_lcolor_3
  jmp os_lcolor_4
  do_os_lcolor_3
  tax
  lda color_val, x ; get the color index
  clc
  adc color_offset ; add the current color offset
  tax
  lda color_groups, x ; what's the new color?
  sta $d800+$200,y
os_lcolor_4
  lda (zpPtr8), y
  cmp #COLOR_WHITE
  beq do_os_lcolor_4
  cmp #COLOR_L_GREEN
  beq do_os_lcolor_4
  cmp #COLOR_BLUE
  beq do_os_lcolor_4
  cmp #COLOR_CYAN
  beq do_os_lcolor_4
  jmp os_lcolor_done
  do_os_lcolor_4
  tax
  lda color_val, x ; get the color index
  clc
  adc color_offset ; add the current color offset
  tax
  lda color_groups, x ; what's the new color?
  sta $d800+$2e8,y
os_lcolor_done
  iny
  beq os_loop_done
  jmp os_loop
  os_loop_done
  ldx color_offset
  lda color_groups, x
  sta SCREEN_BORDER
rts

color_offset .byte 0
; COLOR_WHITE = 0
; COLOR_L_GREEN = 1
; COLOR_CYAN = 2
; COLOR_BLUE = 3
color_val    .byte 4, 0, 4, 2, 4, 4, 3, 4, 4, 4, 4, 4, 4, 1 ; only need values filled in for white, green and blue
color_groups .byte COLOR_WHITE, COLOR_L_GREEN, COLOR_CYAN, COLOR_BLUE, COLOR_WHITE, COLOR_L_GREEN, COLOR_CYAN, COLOR_BLUE
