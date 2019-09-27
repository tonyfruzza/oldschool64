RASTER_TO_START         .equ 0
RASTER_TO_START_COLOR   .equ COLOR_BLACK
RASTER_TO_STOP          .equ 84
RASTER_TO_STOP_COLOR    .equ COLOR_WHITE


initIRQs
    sei          ; turn off interrupts
    lda #$7f
    sta $dc0d  ; disable timer interrupts from CIA1
    sta $dd0d  ; and CIA2
    lda $dc0d  ; by reading this two registers we negate any pending CIA irqs.
    lda $dd0d  ; if we don't do this, a pending CIA irq might occur after we finish setting up our irq.
           ;we don't want that to happen.
    lda #$01   ;this is how to tell the VICII to generate a raster interrupt
    sta $d01a
    ; Configure ROM/RAM
    lda #$35   ;we turn off the BASIC and KERNAL rom here
    sta $01    ;the cpu now sees RAM everywhere except at $d000-$e000, where still the registers of
           ;SID/VICII/etc are visible

    ; Set video mode
    lda #%00011011 ; screen on, 25 rows : this is default
    sta $d011
;    lda #%00001000 ; 40 columns, single color mode, alighed to the right
;    lda #%11110111 ; 38 columns, single color mode, aligned right
;    sta $d016

    lda #RASTER_TO_START   ; line to trigger interrupt
    sta $d012

    lda #<irq_start    ; low part of address of interrupt handler code
    sta $fffe
    lda #>irq_start    ; high part of address of interrupt handler code
    sta $ffff
    cli          ; turn interrupts back on
    rts



irq_start
    pha        ;store register A in stack
    txa
    pha        ;store register X in stack
    tya
    pha        ;store register Y in stack
    ldx #RASTER_TO_START_COLOR
isw_loop
    lda $d012
    cmp #RASTER_TO_START+1
    bne isw_loop

    inc switch_color_group
    lda switch_color_group
    cmp #10
    bne no_group_inc
    lda #0
    sta switch_color_group

    inc color_offset
    lda color_offset
    cmp #4 ; total number of colors
    bne no_color_offset_reset
    lda #0
    sta color_offset
    no_color_offset_reset
    no_group_inc

    ;stx SCREEN_BG_COLOR
;    stx SCREEN_BORDER
;    lda #RASTER_TO_STOP      ; line to trigger interrupt
;    sta $d012
;    lda #<irq_end ; next
;    sta $fffe
;    lda #>irq_end ; next
;    sta $ffff
    asl $d019
    pla
    tay
    pla
    tax
    pla
    rti          ; return from interrupt


switch_color_group .byte 1 ; when overflow inc color group offset
