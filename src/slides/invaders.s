invaders:
lda #%00000011 // enable first 2 sprites
sta SPRITES_ENABLED
lda #%00000000 // None are multi color
sta SPRITES_MULTI_COLOR

lda #COLOR_WHITE
sta SPRITE1_COLOR
sta SPRITE2_COLOR
