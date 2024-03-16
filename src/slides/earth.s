transform_earth:
    lda just_flipped_page
    beq page_did_not_just_flip
    inc wait_for_earth_rot_enabled
    lda #0
    sta wait_for_earth_rot_counter
    sta wait_for_earth_rot_counter+1
    sta just_flipped_page
    page_did_not_just_flip:

    lda wait_for_earth_rot_enabled
    beq do_transform_earth
    inc wait_for_earth_rot_counter
    lda wait_for_earth_rot_counter
    cmp #50
    beq wait_some_more
    rts
    wait_some_more:
    lda #0
    sta wait_for_earth_rot_counter
    inc wait_for_earth_rot_enabled
    rts
    do_transform_earth:

    ldy #0
    earth_loop:
      lda $d012
      eor $dc04
      sbc $dc05
      tax
      and #%11111100
      cmp #%11111100
      bne no_change_this_iteration
      txa
      and #1
      beq earth_is_zero
      lda #49 // '1'
      jmp earth_chosen_char
      earth_is_zero:
      lda #48 //'0'
      earth_chosen_char:

      sta SCREENMEM, y // Color

      lda $d012
      eor $dc04
      sbc $dc05
      and #1
      beq earth_is_zero_2
      lda #49 // '1'
      jmp earth_chosen_char_2
      earth_is_zero_2:
      lda #48 //'0'
      earth_chosen_char_2:

      sta SCREENMEM+$100,y

      lda $d012
      eor $dc04
      sbc $dc05
      and #1
      beq earth_is_zero_3
      lda #49 // '1'
      jmp earth_chosen_char_3
      earth_is_zero_3:
      lda #48 //'0'
      earth_chosen_char_3:

      sta SCREENMEM+$200,y

      lda $d012
      eor $dc04
      sbc $dc05
      and #1
      beq earth_is_zero_4
      lda #49 // '1'
      jmp earth_chosen_char_4
      earth_is_zero_4:
      lda #48 //'0'
      earth_chosen_char_4:

      sta SCREENMEM+$2e8,y
      no_change_this_iteration:
      iny
      bne earth_loop
    rts

wait_for_earth_rot_enabled: .byte 0
wait_for_earth_rot_counter: .byte 0, 0
