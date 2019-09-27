
SCREENMEM       .equ $0400 ; Start of character screen map, color map is + $D400
SCREENMEM2      .equ $3800
COLOR_MAP       .equ $4400
COLORMEM        .equ $D800
VMEM            .equ $D000
SCREEN_BORDER   .equ VMEM + 32
SCREEN_BG_COLOR .equ VMEM + 33
COLOR_BLACK     .equ $00
COLOR_WHITE     .equ $01
COLOR_RED       .equ $02
COLOR_CYAN      .equ $03
COLOR_MAGENTA   .equ $04
COLOR_GREEN     .equ $05
COLOR_BLUE      .equ $06
COLOR_YELLOW    .equ $07
COLOR_ORANGE    .equ $08
COLOR_BROWN     .equ $09
COLOR_PINK      .equ $0a
COLOR_DARK_GREY .equ $0b
COLOR_GREY      .equ $0c
COLOR_L_GREEN   .equ $0d
COLOR_L_BLUE    .equ $0e
COLOR_L_GREY    .equ $0f

zpPtr1          .equ $ba
zpPtr2          .equ $bc
zpPtr3          .equ $be
zpPtr4          .equ $d5

zpPtr5          .equ $d7
zpPtr6          .equ $d9
zpPtr7          .equ $db
zpPtr8          .equ $de
zpPtr9          .equ $e0

SPRITE1_COLOR   .equ VMEM + 39
SPRITE2_COLOR   .equ VMEM + 40
SPRITE3_COLOR   .equ VMEM + 41
SPRITE4_COLOR   .equ VMEM + 42
SPRITE5_COLOR   .equ VMEM + 43
SPRITE6_COLOR   .equ VMEM + 44
SPRITE7_COLOR   .equ VMEM + 45
SPRITE8_COLOR   .equ VMEM + 46

SPRITE1_X_POS   .equ $d000
SPRITE1_Y_POS   .equ $d001
SPRITE2_X_POS   .equ $d002
SPRITE2_Y_POS   .equ $d003
SPRITE3_X_POS   .equ $d004
SPRITE3_Y_POS   .equ $d005
SPRITE4_X_POS   .equ $d006
SPRITE4_Y_POS   .equ $d007
SPRITE5_X_POS   .equ $d008
SPRITE5_Y_POS   .equ $d009
SPRITE6_X_POS   .equ $d00a
SPRITE6_Y_POS   .equ $d00b
SPRITE7_X_POS   .equ $d00c
SPRITE7_Y_POS   .equ $d00d
SPRITE8_X_POS   .equ $d00e
SPRITE8_Y_POS   .equ $d00f

SPRITES_ENABLED         .equ VMEM + 21
SPRITES_MULTI_COLOR     .equ VMEM + 28
SPRITES_SHARED_COLOR1   .equ VMEM + 37
SPRITES_SHARED_COLOR2   .equ VMEM + 38
SPRITE_Z_PRIORITY_Y     .equ 170 ; Less than 170 set to behind, greater than over the top

COLS_TO_COPY            .equ 39
SCROLL_SCREEN_FRAMES    .equ 20 ; Reset counter
LVL_CPY_PT1_FRAME       .equ 1 ; We're also flipping the screen here
LVL_CPY_PT2_FRAME       .equ 10
; $D016 %1111 1000 ; 0 - 7 values where 7 = LEFT? 0 is default
H_SCROLL_1_FRAME        .equ 3 ; After copying 2nd part swap screen buff to write to.
H_SCROLL_2_FRAME        .equ 5
H_SCROLL_3_FRAME        .equ 8
H_SCROLL_4_FRAME        .equ 10
H_SCROLL_5_FRAME        .equ 13
H_SCROLL_6_FRAME        .equ 15
H_SCROLL_7_FRAME        .equ 18
DO_COLOR_2_FRAME        .equ 2

SCREEN_BUF1_MASK        .equ %00010000 ; $0400
SCREEN_BUF2_MASK        .equ %11100000 ; $3800

LVL_RAM                 .equ $9000
CLEAR_LVL_CHAR          .equ 32
LVL_COLUMNS             .equ 200

PAGE_FOR_LOADING     .equ 2
PAGE_FOR_PROCESSING  .equ 3
PAGE_FOR_LIGHT       .equ 4
PAGE_FOR_COLOR_CYCLE .equ 7
PAGE_FOR_TALKING     .equ 8
PAGE_FOR_EARTH       .equ 9

MAX_PAGES               .equ 9 ; page - 1
