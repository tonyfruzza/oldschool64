.label JOY1                    = 56320 // Joystick flag byte
.label JOY2                    = 56320
.label MOVE_REPEAT_TIME        = 100
.label JOY_BIT_UP              = 1
.label JOY_BIT_DOWN            = 2
.label JOY_BIT_LEFT            = 4
.label JOY_BIT_RIGHT           = 8
.label JOY_BIT_FIRE            = 16

incPageCount:
  lda page_offset
  cmp #MAX_PAGES
  beq ipc_done
  inc page_offset
  lda #1
  sta just_flipped_page
  jmp set_pointers
ipc_done:
  rts

decPageCount:
  lda page_offset
  beq dpc_done
  dec page_offset
  jmp set_pointers
dpc_done:
  rts

updateJoyPos:
    ldx JOY2 // cache JOY1 value in x
    ldy #0   // for zeroing out
nextJoy1:
    txa // Cache joystick input values
    and #JOY_BIT_DOWN
    bne nextJoy2
    lda d_repeatTime
    cmp #MOVE_REPEAT_TIME
    bcc nextJoy2 // Less than repeat time, do not move down yet
    sty d_repeatTime
nextJoy2: // Left
    txa
    and #JOY_BIT_LEFT
    bne LeftNotPressed
    lda l_repeatTime
    cmp #MOVE_REPEAT_TIME
    bcc nextJoy3
    sty l_repeatTime // Reset repeat time back to 0
    jsr decPageCount
    jmp nextJoy3
LeftNotPressed:
    lda #MOVE_REPEAT_TIME
    sta l_repeatTime

nextJoy3: // Right
    txa
    and #JOY_BIT_RIGHT
    bne RightNotPressed
    lda r_repeatTime
    cmp #MOVE_REPEAT_TIME
    bcc nextJoy4
    sty r_repeatTime
    jsr incPageCount
    jmp nextJoy4
RightNotPressed:
    lda #MOVE_REPEAT_TIME
    sta r_repeatTime // allow the key to be pressed again immediately after being picked up
nextJoy4:
    txa
    and #JOY_BIT_UP
    bne finishJoy
    lda u_repeatTime
    cmp #MOVE_REPEAT_TIME
    bcc finishJoy
    sty u_repeatTime
finishJoy:
    rts

d_repeatTime:    .byte MOVE_REPEAT_TIME
u_repeatTime:    .byte MOVE_REPEAT_TIME
l_repeatTime:    .byte MOVE_REPEAT_TIME
r_repeatTime:    .byte MOVE_REPEAT_TIME
