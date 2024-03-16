.label SCREENMEM = $0400 // Start of character screen map, color map is + $D400
.label SCREENMEM2      = $3800
.label COLOR_MAP       = $4400
.label COLORMEM        = $D800
.label VMEM            = $D000
.label SCREEN_BORDER   = VMEM + 32
.label SCREEN_BG_COLOR = VMEM + 33
.label COLOR_BLACK     = $00
.label COLOR_WHITE     = $01
.label COLOR_RED       = $02
.label COLOR_CYAN      = $03
.label COLOR_MAGENTA   = $04
.label COLOR_GREEN     = $05
.label COLOR_BLUE      = $06
.label COLOR_YELLOW    = $07
.label COLOR_ORANGE    = $08
.label COLOR_BROWN     = $09
.label COLOR_PINK      = $0a
.label COLOR_DARK_GREY = $0b
.label COLOR_GREY      = $0c
.label COLOR_L_GREEN   = $0d
.label COLOR_L_BLUE    = $0e
.label COLOR_L_GREY    = $0f

.label zpPtr1          = $ba
.label zpPtr2          = $bc
.label zpPtr3          = $be
.label zpPtr4          = $d5

.label zpPtr5          = $d7
.label zpPtr6          = $d9
.label zpPtr7          = $db
.label zpPtr8          = $de
.label zpPtr9          = $e0

.label SPRITE1_COLOR   = VMEM + 39
.label SPRITE2_COLOR   = VMEM + 40
.label SPRITE3_COLOR   = VMEM + 41
.label SPRITE4_COLOR   = VMEM + 42
.label SPRITE5_COLOR   = VMEM + 43
.label SPRITE6_COLOR   = VMEM + 44
.label SPRITE7_COLOR   = VMEM + 45
.label SPRITE8_COLOR   = VMEM + 46

.label SPRITE1_X_POS   = $d000
.label SPRITE1_Y_POS   = $d001
.label SPRITE2_X_POS   = $d002
.label SPRITE2_Y_POS   = $d003
.label SPRITE3_X_POS   = $d004
.label SPRITE3_Y_POS   = $d005
.label SPRITE4_X_POS   = $d006
.label SPRITE4_Y_POS   = $d007
.label SPRITE5_X_POS   = $d008
.label SPRITE5_Y_POS   = $d009
.label SPRITE6_X_POS   = $d00a
.label SPRITE6_Y_POS   = $d00b
.label SPRITE7_X_POS   = $d00c
.label SPRITE7_Y_POS   = $d00d
.label SPRITE8_X_POS   = $d00e
.label SPRITE8_Y_POS   = $d00f

.label SPRITES_ENABLED         = VMEM + 21
.label SPRITES_MULTI_COLOR     = VMEM + 28
.label SPRITES_SHARED_COLOR1   = VMEM + 37
.label SPRITES_SHARED_COLOR2   = VMEM + 38
.label SPRITE_Z_PRIORITY_Y     = 170 // Less than 170 set to behind, greater than over the top
 
.label COLS_TO_COPY            = 39
.label SCROLL_SCREEN_FRAMES    = 20 // Reset counter
.label LVL_CPY_PT1_FRAME       = 1 // We're also flipping the screen here
.label LVL_CPY_PT2_FRAME       = 10
// $D016 %1111 1000 // 0 - 7 values where 7 = LEFT? 0 is default
.label H_SCROLL_1_FRAME        = 3 // After copying 2nd part swap screen buff to write to.
.label H_SCROLL_2_FRAME        = 5
.label H_SCROLL_3_FRAME        = 8
.label H_SCROLL_4_FRAME        = 10
.label H_SCROLL_5_FRAME        = 13
.label H_SCROLL_6_FRAME        = 15
.label H_SCROLL_7_FRAME        = 18
.label DO_COLOR_2_FRAME        = 2

.label SCREEN_BUF1_MASK        = %00010000 // $0400
.label SCREEN_BUF2_MASK        = %11100000 // $3800

.label LVL_RAM                 = $9000
.label CLEAR_LVL_CHAR          = 32
.label LVL_COLUMNS             = 200

.label PAGE_FOR_LOADING     = 2
.label PAGE_FOR_PROCESSING  = 3
.label PAGE_FOR_LIGHT       = 4
.label PAGE_FOR_COLOR_CYCLE = 7
.label PAGE_FOR_TALKING     = 8
.label PAGE_FOR_EARTH       = 9

.label MAX_PAGES               = 9 // page - 1
