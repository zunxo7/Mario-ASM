.386
.model flat, stdcall
option casemap:none

NULL equ 0
FALSE equ 0
TRUE equ 1

WS_OVERLAPPED equ 00000000h
WS_CAPTION equ 00C00000h
WS_SYSMENU equ 00080000h
WS_MINIMIZEBOX equ 00020000h
WS_VISIBLE equ 10000000h

CS_HREDRAW equ 0002h
CS_VREDRAW equ 0001h

SW_SHOW equ 5
SW_SHOWDEFAULT equ 10

WM_CREATE equ 0001h
WM_DESTROY equ 0002h
WM_KEYDOWN equ 0100h
WM_KEYUP equ 0101h
WM_CHAR equ 0102h
WM_LBUTTONDOWN equ 0201h
WM_TIMER equ 0113h
WM_PAINT equ 000Fh

VK_LEFT equ 25h
VK_UP equ 26h
VK_RIGHT equ 27h
VK_DOWN equ 28h
VK_SPACE equ 20h
VK_RETURN equ 0Dh
VK_ESCAPE equ 1Bh
VK_BACK equ 08h
VK_SHIFT equ 10h

SRCCOPY equ 00CC0020h
SRCAND equ 008800C6h
SRCINVERT equ 00660046h
PATCOPY equ 00F00021h
PATINVERT equ 005A0049h
SRCPAINT equ 00EE0086h
NOTSRCCOPY equ 00330008h
TRANSPARENT equ 1
FW_NORMAL equ 400
FW_BOLD equ 700

IMAGE_BITMAP equ 0
LR_LOADFROMFILE equ 00000010h

COLOR_WINDOW equ 5

CW_USEDEFAULT equ 80000000h
IDC_ARROW equ 32512
IDI_APPLICATION equ 32512

GENERIC_READ equ 80000000h
GENERIC_WRITE equ 40000000h
CREATE_ALWAYS equ 2
OPEN_EXISTING equ 3
FILE_ATTRIBUTE_NORMAL equ 80h

POINT STRUCT
 x DWORD ?
 y DWORD ?
POINT ENDS

RECT STRUCT
 left DWORD ?
 top DWORD ?
 right DWORD ?
 bottom DWORD ?
RECT ENDS

MSG STRUCT
 hwnd DWORD ?
 message DWORD ?
 wParam DWORD ?
 lParam DWORD ?
 time DWORD ?
 pt POINT < >
MSG ENDS

WNDCLASSEX STRUCT
 cbSize DWORD ?
 style DWORD ?
 lpfnWndProc DWORD ?
 cbClsExtra DWORD ?
 cbWndExtra DWORD ?
 hInstance DWORD ?
 hIcon DWORD ?
 hCursor DWORD ?
 hbrBackground DWORD ?
 lpszMenuName DWORD ?
 lpszClassName DWORD ?
 hIconSm DWORD ?
WNDCLASSEX ENDS

PAINTSTRUCT STRUCT
 hdc DWORD ?
 fErase DWORD ?
 rcPaint RECT < >
 fRestore DWORD ?
 fIncUpdate DWORD ?
 rgbReserved BYTE 32 dup(?)
PAINTSTRUCT ENDS

MARIO_STRUCT STRUCT
 x DWORD ?
 y DWORD ?
 velX DWORD ?
 velY DWORD ?
 state DWORD ?
 hitboxH DWORD ?
 onGround DWORD ?
 jumping DWORD ?
 facing DWORD ?
 walking DWORD ?
 crouching DWORD ?
 shooting DWORD ?
 animFrame DWORD ?
 accel DWORD ?
 maxSpeed DWORD ?
 isRunning DWORD ?
 jumpHeld DWORD ?
 jumpTimer DWORD ?
 suddenStop DWORD ?
MARIO_STRUCT ENDS

ENEMY_STRUCT STRUCT
 etype DWORD ?
 x DWORD ?
 y DWORD ?
 velX DWORD ?
 velY DWORD ?
 state DWORD ?
 frame DWORD ?
 timer DWORD ?
 baseY DWORD ?
 facing DWORD ?
 hitCount DWORD ?
 mouthState DWORD ?
ENEMY_STRUCT ENDS

PLATFORM_STRUCT STRUCT
 x DWORD ?
 y DWORD ?
 ptype DWORD ?
 dir DWORD ?
 minPos DWORD ?
 maxPos DWORD ?
 active DWORD ?
 startX DWORD ?
 startY DWORD ?
 platWidth DWORD ?
PLATFORM_STRUCT ENDS

POWERUP_STRUCT STRUCT
 ptype DWORD ?
 x DWORD ?
 y DWORD ?
 velX DWORD ?
 velY DWORD ?
 active DWORD ?
 rising DWORD ?
 riseY DWORD ?
 frame DWORD ?
POWERUP_STRUCT ENDS

FIREBALL_STRUCT STRUCT
 x DWORD ?
 y DWORD ?
 velX DWORD ?
 velY DWORD ?
 active DWORD ?
 frame DWORD ?
 owner DWORD ?
FIREBALL_STRUCT ENDS

PARTICLE_STRUCT STRUCT
 x DWORD ?
 y DWORD ?
 velX DWORD ?
 velY DWORD ?
 ptype DWORD ?
 frame DWORD ?
PARTICLE_STRUCT ENDS

LUCKYBLOCK_STRUCT STRUCT
 row DWORD ?
 col DWORD ?
 blockType DWORD ?
 coinsLeft DWORD ?
 timer DWORD ?
 bounceFrame DWORD ?
 used DWORD ?
LUCKYBLOCK_STRUCT ENDS

SAVE_SLOT_STRUCT STRUCT
 name BYTE 12 dup(?)
 lives DWORD ?
 coins DWORD ?
 score DWORD ?
 world DWORD ?
 stage DWORD ?
 timeLeft DWORD ?
 marioState DWORD ?
 powerState DWORD ?
SAVE_SLOT_STRUCT ENDS

ExitProcess PROTO STDCALL :DWORD
GetModuleHandleA PROTO STDCALL :DWORD

CreateFileA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
ReadFile PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
WriteFile PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
GetStdHandle PROTO STDCALL :DWORD
WriteConsoleA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
AllocConsole PROTO STDCALL
CloseHandle PROTO STDCALL :DWORD
GetFileSize PROTO STDCALL :DWORD, :DWORD
SetFilePointer PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD
CreateDirectoryA PROTO STDCALL :DWORD, :DWORD
CopyFileA PROTO STDCALL :DWORD, :DWORD, :DWORD

FILE_SHARE_READ equ 00000001h
INVALID_HANDLE_VALUE equ - 1

RegisterClassExA PROTO STDCALL :DWORD
CreateWindowExA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
ShowWindow PROTO STDCALL :DWORD, :DWORD
UpdateWindow PROTO STDCALL :DWORD
GetMessageA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD
TranslateMessage PROTO STDCALL :DWORD
DispatchMessageA PROTO STDCALL :DWORD
DefWindowProcA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD
PostQuitMessage PROTO STDCALL :DWORD
LoadIconA PROTO STDCALL :DWORD, :DWORD
PlaySoundA PROTO STDCALL :DWORD, :DWORD, :DWORD
OutputDebugStringA PROTO STDCALL :DWORD
LoadCursorA PROTO STDCALL :DWORD, :DWORD
GetDC PROTO STDCALL :DWORD
ReleaseDC PROTO STDCALL :DWORD, :DWORD
CreateCompatibleDC PROTO STDCALL :DWORD
CreateCompatibleBitmap PROTO STDCALL :DWORD, :DWORD, :DWORD
SelectObject PROTO STDCALL :DWORD, :DWORD
DeleteObject PROTO STDCALL :DWORD
DeleteDC PROTO STDCALL :DWORD
BitBlt PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
CreateSolidBrush PROTO STDCALL :DWORD
PatBlt PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
FillRect PROTO STDCALL :DWORD, :DWORD, :DWORD
SetTextColor PROTO STDCALL :DWORD, :DWORD
SetBkMode PROTO STDCALL :DWORD, :DWORD
SetBkColor PROTO STDCALL :DWORD, :DWORD
CreateBitmap PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
TextOutA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
CreateFontA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
SetTimer PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD
KillTimer PROTO STDCALL :DWORD, :DWORD
BeginPaint PROTO STDCALL :DWORD, :DWORD
EndPaint PROTO STDCALL :DWORD, :DWORD
LoadImageA PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
TransparentBlt PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
StretchBlt PROTO STDCALL :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD

DrawSpriteFlipped PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
SpawnPlatform PROTO :DWORD, :DWORD, :DWORD
SpawnEnemy PROTO :DWORD, :DWORD, :DWORD
SpawnFloatingScore PROTO :DWORD, :DWORD, :DWORD
ResetEnemiesToSpawn PROTO
KillEnemyOnBlock PROTO :DWORD, :DWORD
CheckCoinOnBlock PROTO :DWORD, :DWORD
LoadPipes PROTO
CheckScoreMilestone PROTO
LoadPlatforms PROTO
LoadFirebars PROTO
DrawCameraBounds PROTO
LoadBackgroundFromFile PROTO
LoadLevelBackgroundImage PROTO
EnemyApplyGravityAndGround PROTO :DWORD, :DWORD, :DWORD
EnemyCheckSideCollision PROTO :DWORD, :DWORD, :DWORD
EnemyCheckPit PROTO :DWORD, :DWORD, :DWORD
ApplyGravityToAABB PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
UpdateGoombaEnemy PROTO :DWORD
UpdatePiranhaEnemy PROTO :DWORD
UpdateBowserEnemy PROTO :DWORD
UpdateFlyTurtleEnemy PROTO :DWORD
UpdateTurtleEnemy PROTO :DWORD
UpdateBowserFireEnemy PROTO :DWORD

WINDOW_WIDTH equ 960
WINDOW_HEIGHT equ 540
MARIO_WIDTH equ 20
MARIO_HEIGHT equ TILE_SIZE
HITBOX_WIDTH equ MARIO_WIDTH
HITBOX_HEIGHT equ MARIO_HEIGHT
GRAVITY equ 1
JUMP_STRENGTH equ - 15
MOVE_SPEED equ 5
GROUND_Y equ (TILE_SIZE * 16)
COIN_SIZE equ 16
TILE_SIZE equ 32
QBLOCK_SIZE equ TILE_SIZE
PIPE_CAP_HEIGHT equ 16
MAX_TILE_ROWS equ 100
MAX_TILE_COLS equ 200
UNDERGROUND_START equ 20
LEVEL_SAVE_BUFFER_SIZE equ 32768
LEVEL_SAVE_BUFFER_LIMIT equ (LEVEL_SAVE_BUFFER_SIZE - 512)

TILE_AIR equ 0
TILE_GROUND equ 1
TILE_BRICK equ 2
TILE_COIN equ 3
TILE_STAIR equ 4

TILE_PIPE_VERT_TL equ 10
TILE_PIPE_VERT_TR equ 11
TILE_PIPE_VERT_BL equ 12
TILE_PIPE_VERT_BR equ 13
TILE_PIPE_HORIZ_TL equ 14
TILE_PIPE_HORIZ_BL equ 15
TILE_PIPE_HORIZ_TR equ 16
TILE_PIPE_HORIZ_BR equ 17
TILE_PIPE_IN equ 18
TILE_PIPE_OUT equ 19
TILE_PIPE_HORIZ_IN equ 20

TILE_LUCKY_COIN equ 21
TILE_LUCKY_MULTICOIN equ 22
TILE_LUCKY_MULTICOIN2 equ 90
TILE_LUCKY_MUSHROOM equ 23
TILE_LUCKY_FLOWER equ 24
TILE_LUCKY_STAR equ 25
TILE_LUCKY_GOLDMUSH equ 26
TILE_LUCKY_1UP equ 27
TILE_LUCKY_INVISIBLE equ 28
TILE_LUCKY_USED equ 29
TILE_HIDDEN_LUCKY_MUSHROOM equ 91
TILE_HIDDEN_LUCKY_FLOWER equ 92
TILE_HIDDEN_LUCKY_STAR equ 93
TILE_HIDDEN_LUCKY_GOLDMUSH equ 94
TILE_HIDDEN_LUCKY_1UP equ 95

TILE_FLAGPOLE_BASE equ 30
TILE_FLAGPOLE_POLE equ 31
TILE_FLAGPOLE_TOP equ 32
TILE_FLAGPOLE_FLAG equ 33
TILE_CASTLE_FLAG equ 34
TILE_END_BLOCK equ 35

TILE_BRICK2 equ 36
TILE_PIPE_DECOR1 equ 87
TILE_PIPE_DECOR2 equ 88
TILE_PIPE_DECOR3 equ 89

TILE_MARIO_SPAWN equ 40

TILE_DEATH equ 41
TILE_INVISIBLE_WALL equ 42
TILE_INVISIBLE_WALL_2 equ 43

TILE_LEAF_LEFT equ 50
TILE_LEAF_MIDDLE equ 51
TILE_LEAF_RIGHT equ 52
TILE_BARK equ 53

TILE_LAVA_TOP equ 55
TILE_LAVA_BOTTOM equ 56
TILE_FIREBLOCK equ 57

TILE_PLATFORM_SPAWN equ 60

TILE_GOOMBA_SPAWN equ 70
TILE_PIRANHA_SPAWN equ 71
TILE_BOWSER_SPAWN equ 72
TILE_FLY_TURTLE_SPAWN equ 73
TILE_TURTLE_SPAWN equ 74
TILE_FIREBAR_SPAWN equ 75

TILE_BG_CLOUD_S equ 80
TILE_BG_CLOUD_L equ 81
TILE_BG_BUSH_S equ 82
TILE_BG_BUSH_L equ 83
TILE_BG_HILL_S equ 84
TILE_BG_HILL_L equ 85
TILE_BG_CASTLE equ 86

ENEMY_NONE equ 0
ENEMY_GOOMBA equ 1
ENEMY_PIRANHA equ 2
ENEMY_BOWSER equ 3
ENEMY_FLYING_TURTLE equ 4
ENEMY_TURTLE equ 5
ENEMY_BOWSER_FIREBALL equ 6

ESTATE_INACTIVE equ 0
ESTATE_ACTIVE equ 1
ESTATE_DYING equ 2
ESTATE_DEAD equ 3
ESTATE_SHELL_IDLE equ 4
ESTATE_SHELL_SLIDE equ 5

PIRANHA_MOUTH_OPEN equ 0
PIRANHA_MOUTH_CLOSED equ 1

STATE_TITLE equ 0
STATE_MENU equ 1
STATE_INSTRUCTIONS equ 2
STATE_GAMEPLAY equ 3
STATE_PAUSE equ 4
STATE_NAME_ENTRY equ 5
STATE_GAME_OVER equ 6
STATE_LEVEL_TITLE equ 7
STATE_GAME_COMPLETE equ 8
STATE_FLAGPOLE equ 9
STATE_HIGH_SCORES equ 10
STATE_LEVEL_SELECT equ 11

.data
 className db "MarioGameClass", 0
 windowName db "SUPER MARIO BROS - I24 - 0531", 0
 titleText db "SUPER MARIO BROS", 0
 titleText1 db "SUPER", 0
 titleText2 db "MARIO BROS.", 0
 authorText db "MADE BY ZUNNOON", 0
 rollNumber db "I24 - 0531", 0
 menuStart db "NEW GAME", 0
 menuContinue db "CONTINUE", 0
 menuHighScore db "HIGH SCORES", 0
 menuExit db "EXIT", 0
 topScoreText db "HIGH SCORES", 0
 dashText db " - ", 0
 copyrightText db "( I24 - 0531 - ZUNNOON JAWAD", 0
 pauseText db "PAUSED", 0
 pauseResume db "RESUME", 0
 pauseSave db "SAVE", 0
 pauseExit db "MAIN MENU", 0
 instructText1 db "INSTRUCTIONS", 0
 instructText2 db "Arrow Keys: Move Left / Right", 0
 instructText3 db "SPACE: Jump", 0
 instructText4 db "P: Pause Game", 0
 instructText5 db "ESC: Exit to Menu", 0
 instructText6 db "Press ENTER to Start", 0
 questionChar db "?", 0
 scoreText db "SCORE", 0
 coinsText db "COINS", 0
 worldText db "WORLD", 0
 worldNum db "1 - 1", 0
 midasText db "MIDAS", 0
 kickText db "KICK", 0
 goldenText db "GOLDEN!", 0
 timerText db "TIME", 0
 livesText db "MARIO", 0
 crossText db "x", 0
levelSelectTitle db "LEVEL SELECT", 0
levelText db "LEVEL ", 0
cursorText db "->", 0

 hInstance dd ?
 hWnd dd ?
 hdc dd ?
 hdcMem dd ?
 hBitmap dd ?
 hOldBitmap dd ?

 SND_ASYNC equ 1
 SND_FILENAME equ 20000h
 SND_LOOP equ 8

 hdcTiles dd ?
 hTileSheet dd ?
 tileSheetPath db "asset\tiles.bmp", 0

 hdcMario dd ?
 hMarioSheet dd ?
 marioSheetPath db "asset\mario.bmp", 0

 hdcMask dd ?
 hMaskSheet dd ?
 maskSheetPath db "asset\mask.bmp", 0

 hdcObjects dd ?
 hObjectsSheet dd ?
 objectsSheetPath db "asset\\objects.bmp", 0
 objectsSheetPathAlt db "..\\asset\\objects.bmp", 0

 hdcFont dd ?
 hFontSheet dd ?
 fontSheetPath db "asset\font.bmp", 0
 FONT_CHAR_WIDTH equ 16
 FONT_CHAR_HEIGHT equ 16
 FONT_CHAR_GAP equ 2

coinSoundPath db "sounds\\coin.wav", 0
jumpSmallSoundPath db "sounds\\jumpsmall.wav", 0
jumpSuperSoundPath db "sounds\\jumpsuper.wav", 0
deathSoundPath db "sounds\\death.wav", 0
stompSoundPath db "sounds\\stomp.wav", 0
pauseSoundPath db "sounds\\pause.wav", 0
gameOverSoundPath db "sounds\\gameover.wav", 0
fireballSoundPath db "sounds\\fireball.wav", 0
blockBreakSoundPath db "sounds\\bricksmash.wav", 0
shellKickSoundPath db "sounds\\kick.wav", 0
powerupAppearSoundPath db "sounds\\powerupappears.wav", 0
powerupCollectSoundPath db "sounds\\powerup.wav", 0
flagpoleSoundPath db "sounds\\flagpole.wav", 0
bumpSoundPath db "sounds\\bump.wav", 0
oneUpSoundPath db "sounds\\1up.wav", 0
bowserFallSoundPath db "sounds\\bowserfalls.wav", 0
bowserFireSoundPath db "sounds\\bowserfire.wav", 0
fireworksSoundPath db "sounds\\fireworks.wav", 0
pipeTravelSoundPath db "sounds\\pipetravel.wav", 0
timeWarningSoundPath db "sounds\\timewarning.wav", 0

level1MusicPath db "sounds\\level1.wav", 0
level2MusicPath db "sounds\\level2.wav", 0
level3MusicPath db "sounds\\level3.wav", 0
level4MusicPath db "sounds\\level4.wav", 0
undergroundMusicPath db "sounds\\underground.wav", 0
castleMusicPath db "sounds\\castle.wav", 0
victoryMusicPath db "sounds\\stageclear.wav", 0
worldClearMusicPath db "sounds\\worldclear.wav", 0
menuMusicPath db "sounds\\menu.wav", 0

currentBgm dd -1

SFX_COIN equ 0
SFX_JUMPSMALL equ 1
SFX_JUMPSUPER equ 2
SFX_DEATH equ 3
SFX_STOMP equ 4
SFX_PAUSE equ 5
SFX_GAMEOVER equ 6
SFX_FIREBALL equ 7
SFX_BLOCKBREAK equ 8
SFX_SHELLKICK equ 9
SFX_POWERUPAPPEAR equ 10
SFX_POWERUPCOLLECT equ 11
SFX_FLAGPOLE equ 12
SFX_BUMP equ 13
SFX_ONEUP equ 14
SFX_BOWSERFALL equ 15
SFX_BOWSERFIRE equ 16
SFX_FIREWORKS equ 17
SFX_PIPETRAVEL equ 18
SFX_COUNT equ 19

BGM_MENU equ 0
BGM_LEVEL1 equ 1
BGM_LEVEL2 equ 2
BGM_LEVEL3 equ 3
BGM_LEVEL4 equ 4
BGM_UNDERGROUND equ 5
BGM_CASTLE equ 6
BGM_VICTORY equ 7
BGM_COUNT equ 8

currentMusicAlias dd -1

 currentLevel dd 1

 TILE_ROWS dd 40
 TILE_COLS dd 60
 levelFilePath db "levels\level1.txt", 0
 levelFile2 db "levels\level2.txt", 0
 levelFile3 db "levels\level3.txt", 0
 levelFile4 db "levels\level4.txt", 0
 levelFileBuffer db 32768 dup(0)
 levelFileHandle dd ?
 backgroundFile1 db "levels\level1background.txt", 0
 backgroundFile2 db "levels\level2background.txt", 0
 backgroundFile3 db "levels\level3background.txt", 0
 backgroundFile4 db "levels\level4background.txt", 0
 backgroundFileBuffer db 32768 dup(0)
 pipeFile1 db "levels\level1_pipes.txt", 0
 pipeFile2 db "levels\level2_pipes.txt", 0
 pipeFile3 db "levels\level3_pipes.txt", 0
 pipeFile4 db "levels\level4_pipes.txt", 0
 pipeFileBuffer db 2048 dup(0)

 levelSaveBuffer db LEVEL_SAVE_BUFFER_SIZE dup(0)
 levelBytesRead dd ?
 cameraFile db "levels\level_setup.txt", 0
 cameraFileBuffer db 256 dup(0)
 platformFile1 db "levels\level1platforms.txt", 0
 platformFile2 db "levels\level2platforms.txt", 0
 platformFile3 db "levels\level3platforms.txt", 0
 platformFile4 db "levels\level4platforms.txt", 0
 platformFileBuffer db 4096 dup(0)
 firebarFile1 db "levels\level1firebars.txt", 0
 firebarFile2 db "levels\level2firebars.txt", 0
 firebarFile3 db "levels\level3firebars.txt", 0
 firebarFile4 db "levels\level4firebars.txt", 0
 firebarFileBuffer db 4096 dup(0)
 cameraSnapYOverworld dd 0
 cameraSnapYUnderground dd 0
 cameraSnapYUnderground2 dd 0
 cameraSnapLevelOverworld dd 0, 0, 0, 0
 cameraSnapLevelUnderground dd 0, 0, 0, 0
 cameraSnapLevelUnderground2 dd 0, 0, 0, 0
 levelBackgroundHeightArray dd 400, 400, 400, 400  ; Background height per level
 levelBackgroundOffsetYArray dd 0, 0, 0, 0  ; Background Y offset per level
 backgroundTileRowOffset dd 1

 saveFilePath db "saves.txt", 0
 levelStateDir db "data\", 0
 levelStateFile db "data\levelstate_", 0
 levelStateExt db ".dat", 0
 levelStatePathBuffer db 128 dup(0)
 levelStateBuffer db 40100 dup(0)

 MARIO_COL_GAP equ 2
 MARIO_ROW_GAP equ 0

 MARIO_SMALL_Y equ 0
 MARIO_SMALL_H equ 32

 MARIO_BIG_Y equ 32
 MARIO_BIG_H equ 64

 MARIO_FIRE_Y equ 96
 MARIO_FIRE_H equ 64

 MARIO_GROW_Y equ 160

 MARIO_IDLE equ 0
 MARIO_WALK1 equ 1
 MARIO_WALK2 equ 2
 MARIO_WALK3 equ 3
 MARIO_JUMP equ 4
 MARIO_DOWN equ 5
 MARIO_FLAG_GRAB equ 6
 MARIO_FLAG_SLIDE equ 7
 MARIO_FIREBALL_WALK1 equ 8
 MARIO_FIREBALL_WALK2 equ 9
 MARIO_FIREBALL_WALK3 equ 10
 MARIO_FIREBALL_WALK4 equ 11
 MARIO_FIREBALL_WALK5 equ 12

 OBJ_COL_GAP equ 4

 OBJ_POWERUP_Y equ 0
 OBJ_MUSHROOM equ 0
 OBJ_FLOWER_BASE equ 1
 OBJ_STAR_BASE equ 5
 OBJ_GOLDMUSH equ 9
 OBJ_1UP equ 10

 OBJ_PARTICLE_Y equ 32
 OBJ_FIREBALL1 equ 0
 OBJ_FIREBALL2 equ 1
 OBJ_FIREBALL3 equ 2
 OBJ_FIREBALL4 equ 3
 OBJ_BREAK_OVER1 equ 4
 OBJ_BREAK_OVER2 equ 5
 OBJ_BREAK_OVER3 equ 6
 OBJ_BREAK_OVER4 equ 7
 OBJ_BREAK_UNDER1 equ 8
 OBJ_BREAK_UNDER2 equ 9
 OBJ_BREAK_UNDER3 equ 10
 OBJ_BREAK_UNDER4 equ 11
 OBJ_BREAK_CASTLE1 equ 12
 OBJ_BREAK_CASTLE2 equ 13
 OBJ_BREAK_CASTLE3 equ 14
 OBJ_BREAK_CASTLE4 equ 15

 OBJ_EXPLOSION_Y equ 48
 OBJ_EXPLODE1 equ 0
 OBJ_EXPLODE2 equ 1
 OBJ_EXPLODE3 equ 2

 OBJ_POPUP_COIN_Y equ 80
 OBJ_COIN_POP1 equ 0
 OBJ_COIN_POP2 equ 1
 OBJ_COIN_POP3 equ 2
 OBJ_COIN_POP4 equ 3

 OBJ_ENDLEVEL_Y equ 112
 OBJ_FLAGPOLE_BASE equ 0
 OBJ_FLAGPOLE_POLE equ 1
 OBJ_FLAGPOLE_TOP equ 2
 OBJ_FLAGPOLE_FLAG equ 3
 OBJ_CASTLE_FLAG equ 4
 OBJ_END_BLOCK equ 5

 TILE_ROW_OVER equ 0
 TILE_ROW_UNDER equ 32

 TILE_ROW_SKY equ 64

 TILE_ROW_CASTLE equ 96

 TILE_ROW_PIPE1 equ 128

 TILE_ROW_PIPE2 equ 160

 TILE_ROW_PLATFORM equ 192

 TILE_ROW_LAVA equ 208

 TILE_ROW_EXTRA equ 240

 TILE_COL_GAP equ 2
 TILE_COL_GROUND equ 0
 TILE_COL_PLATFORM equ 1
 TILE_COL_PYRAMID equ 2
 TILE_COL_LUCKY1 equ 3
 TILE_COL_LUCKY2 equ 4
 TILE_COL_LUCKY3 equ 5
 TILE_COL_LUCKY_HIT equ 6
 TILE_COL_COIN1 equ 7
 TILE_COL_COIN2 equ 8
 TILE_COL_COIN3 equ 9

 TILE_COL_INVISIBLE equ 0
 TILE_COL_DEATH equ 1
 TILE_COL_CAMSNAP equ 2

 currentTheme dd 0

 gameState dd STATE_TITLE
 menuSelection dd 0
 pauseSelection dd 0
 levelSelectSelection dd 0
 levelSelectFromGameplay dd 0
 menuOffsetY dd 30
 levelSelectMenuCenterX dd 480
 levelSelectMenuCenterY dd 250
 levelSelectMenuWidth dd 400
 levelSelectMenuHeight dd 400
 score dd 0
 coins dd 0
 timer dd 400
 lives dd 5
 lastScoreMilestone dd 0

midasActive dd 0
midasBar dd 0
midasKeyCount dd 0
midasLastPress dd 0
midasUsesLeft dd 1
MAX_MIDAS_USES equ 1
 keyM dd 0
 ; Midas coin delay: coin at (col,row) not collectible until timer reaches 0 (so player can see it)
midasCoinDelayCol dd 8 dup(0)
midasCoinDelayRow dd 8 dup(0)
midasCoinDelayTimer dd 8 dup(0)
MIDAS_COIN_DELAY_FRAMES equ 45

 isInvincible dd 0
 invincibleTimer dd 0
 goldenMushroomX dd - 100
 goldenMushroomY dd 0
 goldenMushroomVelX dd 2
 goldenMushroomVelY dd 0
 goldenMushroomActive dd 0
 goldenMushroomRising dd 0
 goldenMushroomRiseY dd 0
 qBlockHitCount dd 0

 MAX_GOOMBAS equ 8
 GOOMBA_SIZE equ 16
 GOOMBA_SPEED equ 1
 goombaX dd 8 dup(0)
 goombaY dd 8 dup(0)
 goombaVelX dd 8 dup( - 1)
 goombaState dd 8 dup(0)
 goombaFrame dd 0

 marioState dd 0

 marioHitboxHeight dd HITBOX_HEIGHT
 highScore dd 0

 marioAnimFrame dd 0
 marioFacing dd 1
 marioWalking dd 0
 marioCrouching dd 0
 marioPrevCrouching dd 0
 marioShooting dd 0

 SPEED_INCREASE_RATE equ 1
 SPEED_DIVISOR equ 2
 MAX_SPEED equ 8
 SPEED_THRESHOLD_SLOW equ 2
 SPEED_THRESHOLD_MED equ 4
 SPEED_THRESHOLD_FAST equ 6

 ANIM_SPEED_SLOW equ 12
 ANIM_SPEED_MED equ 6
 ANIM_SPEED_FAST equ 3
 ANIM_SPEED_MAX equ 2

 marioHoldTimer dd 0
 marioWasWalking dd 0
 keyRun dd 0

 MAX_LUCKY_BLOCKS equ 32

 LUCKY_TYPE_COIN equ 21
 LUCKY_TYPE_MULTICOIN equ 22
 LUCKY_TYPE_MUSHROOM equ 23
 LUCKY_TYPE_FLOWER equ 24
 LUCKY_TYPE_STAR equ 25
 LUCKY_TYPE_GOLDMUSH equ 26
 LUCKY_TYPE_1UP equ 27
 LUCKY_TYPE_INVISIBLE equ 28
 LUCKY_TYPE_USED equ 29

 luckyBlockRow dd 32 dup( - 1)
 luckyBlockCol dd 32 dup( - 1)
 luckyBlockType dd 32 dup(0)
 luckyBlockCoins dd 32 dup(0)
 luckyBlockTimer dd 32 dup(0)
 luckyBlockUsed dd 32 dup(0)

 oneUpX dd - 100
 oneUpY dd 0
 oneUpVelX dd 2
 oneUpVelY dd 0
 oneUpActive dd 0
 oneUpRising dd 0
 oneUpRiseY dd 0

 marioTransition dd 0
 transitionFrame dd 0
 transitionTimer dd 0

 starPowerActive dd 0
 starPowerTimer dd 0
 starColorFrame dd 0

 marioSpawnRow dd - 1
 marioSpawnCol dd - 1

 MAX_FIREBALLS equ 2
 fireballX dd 2 dup( - 100)
 fireballY dd 2 dup(0)
 fireballVelX dd 2 dup(0)
 fireballVelY dd 2 dup(0)
 fireballFrame dd 2 dup(0)
 fireballActive dd 2 dup(0)
 keyFire dd 0

 mushroomX dd - 100
 mushroomY dd 0
 mushroomVelX dd 2
 mushroomVelY dd 0
 mushroomActive dd 0
 mushroomRising dd 0
 mushroomRiseY dd 0

 flowerX dd - 100
 flowerY dd 0
 flowerActive dd 0
 flowerFrame dd 0

 starX dd - 100
 starY dd 0
 starVelX dd 3
 starVelY dd - 8
 starActive dd 0
 starFrame dd 0

 animFrame dd 0
 cloudOffset dd 0
 qBlockBounce dd 0
 coinSpin dd 0
 textBlink dd 0

 MAX_BRICK_BOUNCES equ 8
 BOUNCE_KEYFRAMES equ 10
 brickBounceRow dd 8 dup( - 1)
 brickBounceCol dd 8 dup( - 1)
 brickBounceFrame dd 8 dup( - 1)
 bounceOffsets dd 0, - 4, - 8, - 12, - 16, - 12, - 8, - 4, - 2, - 1, 0

 MAX_COIN_POPUPS equ 8
 coinPopupX dd 8 dup(0)
 coinPopupY dd 8 dup(0)
 coinPopupVelY dd 8 dup(0)
 coinPopupFrame dd 8 dup( - 1)

 MAX_MULTICOIN equ 4
 multiCoinRow dd 4 dup( - 1)
 multiCoinCol dd 4 dup( - 1)
 multiCoinTimer dd 4 dup(0)

 MAX_BRICK_DEBRIS equ 16
 debrisX dd 16 dup(0)
 debrisY dd 16 dup(0)
 debrisVelX dd 16 dup(0)
 debrisVelY dd 16 dup(0)
 debrisFrame dd 16 dup( - 1)

 MARIO_SMALL equ 0
 MARIO_SUPER equ 1
 MARIO_FIRE equ 2

 MAX_ENEMIES equ 16
 enemyType dd 16 dup(0)
 enemyX dd 16 dup(0)
 enemyY dd 16 dup(0)
 enemyVelX dd 16 dup(0)
 enemyVelY dd 16 dup(0)
 enemyState dd 16 dup(0)
 enemyFrame dd 16 dup(0)
 enemyTimer dd 16 dup(0)
 enemyBaseY dd 16 dup(0)
 enemyMouthState dd 16 dup(0)
 enemyPipeHiddenY dd 16 dup(0)
 enemyPipeVisibleY dd 16 dup(0)
 enemyPipeMovingUp dd 16 dup(0)
 enemyMouthTimer dd 16 dup(0)
 enemyFacing dd 16 dup(1)
 enemyHitCount dd 16 dup(0)
 enemyKickCount dd 16 dup(0)
 enemyAnimTimer dd 0
 enemySpawnX dd 16 dup(0)
 enemySpawnY dd 16 dup(0)

 hdcEnemies dd ?
 hEnemiesSheet dd ?
 enemiesSheetPath db "asset\enemies.bmp", 0

 hdcUI dd ?
 hUISheet dd ?
 uiSheetPath db "asset\ui.bmp", 0

 UI_TITLE_W equ 352
 UI_TITLE_H equ 176
 UI_ROW_TITLE equ 0

 UI_CURSOR_W equ 16
 UI_CURSOR_H equ 16
 UI_ROW_HUD equ 176
 UI_COL_MENU_CURSOR equ 0
 UI_COL_COIN_HUD equ 1
 UI_COL_LIVES_HUD equ 2
 UI_COL_PAUSE_CURSOR equ 3

 UI_PRINCESS_W equ 32
 UI_PRINCESS_H equ 48
 UI_ROW_PRINCESS equ 192

 hdcBackground dd ?
 hBackgroundSheet dd ?
 backgroundSheetPath db "asset\background.bmp", 0
 hdcLevelBackground dd ?
 hLevelBackgroundBitmap dd ?

 levelBackground1Path db "asset\level1background.bmp", 0
 levelBackground2Path db "asset\level3background.bmp", 0
 levelBackground3Path db "asset\level3background.bmp", 0
 levelBackground4Path db "asset\level4background.bmp", 0

 levelBackgroundWidth dd 1536
 levelBackgroundHeight dd 400
 levelBackgroundOffsetY dd 61

 CLOUD_SMALL_W equ 64
 CLOUD_SMALL_H equ 48
 CLOUD_LONG_W equ 96
 CLOUD_LONG_H equ 48
 BUSH_SMALL_W equ 64
 BUSH_SMALL_H equ 32
 BUSH_LONG_W equ 128
 BUSH_LONG_H equ 32
 HILL_SMALL_W equ 96
 HILL_SMALL_H equ 64
 HILL_BIG_W equ 160
 HILL_BIG_H equ 96
 CASTLE_W equ 160
 CASTLE_H equ 160

 BG_ROW_CLOUD_SMALL equ 0
 BG_ROW_CLOUD_LONG equ 48
 BG_ROW_BUSH_SMALL equ 96
 BG_ROW_BUSH_LONG equ 128
 BG_ROW_HILL_SMALL equ 160
 BG_ROW_HILL_BIG equ 224
 BG_ROW_CASTLE equ 320

 ENEMY_COL_GAP equ 4
 GOOMBA_W equ 32
 GOOMBA_H equ 32
 PIRANHA_W equ 32
 PIRANHA_H equ 48
 BOWSER_W equ 64
 BOWSER_H equ 64
 FLY_TURTLE_W equ 32
 FLY_TURTLE_H equ 48
 TURTLE_W equ 32
 TURTLE_H equ 48
 BOWSER_FIRE_W equ 48
 BOWSER_FIRE_H equ 16

 ENEMY_ROW_GOOMBA equ 0
 GOOMBA_WALK1 equ 0
 GOOMBA_WALK2 equ 1
 GOOMBA_SQUISHED equ 2
 GOOMBA_UNDER_OFFSET equ 3
 GOOMBA_SKY_OFFSET equ 6

 ENEMY_ROW_PIRANHA equ 32
 PIRANHA_OPEN equ 0
 PIRANHA_CLOSED equ 1
 piranhaVertOffset dd 16
 piranhaHorizOffset dd 16

 ENEMY_ROW_BOWSER equ 80
 BOWSER_WALK1 equ 0
 BOWSER_WALK2 equ 1
 BOWSER_SHOOT equ 2
 BOWSER_FIREBALL_TIMER equ 180

 ENEMY_ROW_FLYTURTLE equ 144
 FLYTURTLE_FLY1 equ 0
 FLYTURTLE_FLY2 equ 1
 FLYTURTLE_DEATH equ 2

 ENEMY_ROW_TURTLE equ 192
 TURTLE_WALK1 equ 0
 TURTLE_WALK2 equ 1
 TURTLE_DEATH equ 2
 TURTLE_SHELL equ 3
 TURTLE_UNDER_OFFSET equ 4
 TURTLE_SKY_OFFSET equ 8

 ENEMY_ROW_BFIRE equ 240
 BFIRE_FRAME1 equ 0
 BFIRE_FRAME2 equ 1

 BOWSER_FIRE_OFFSET_X equ 0
 BOWSER_FIRE_OFFSET_Y equ 16

 MAX_PLATFORMS equ 16
 platX dd 16 dup(0)
 platY dd 16 dup(0)
 platType dd 16 dup(0)
 platDir dd 16 dup(1)
 platMinPos dd 16 dup(0)
 platMaxPos dd 16 dup(0)
 platActive dd 16 dup(0)
 platStartX dd 16 dup(0)
 platStartY dd 16 dup(0)
 platWidth dd 16 dup(3)
 platWrapMode dd 16 dup(0)
 platRange dd 16 dup(0)
 platSpeed dd 16 dup(1)
 platformCount dd 0
 PLATFORM_DEFAULT_SPEED equ 1
 PLATFORM_H equ 16
 PLAT_MOVE_HORIZONTAL equ 0
 PLAT_MOVE_VERTICAL equ 1
 PLAT_MOVE_STATIC equ 2
 PLAT_WRAP_NORMAL equ 0
 PLAT_WRAP_UP equ 1
 PLAT_WRAP_DOWN equ 2

 MAX_FIREBARS equ 16
 firebarX dd 16 dup(0)
 firebarY dd 16 dup(0)
 firebarAngle dd 16 dup(0)
 firebarSpeed dd 16 dup(2)
 firebarDir dd 16 dup(1)
 firebarLength dd 16 dup(4)
 firebarActive dd 16 dup(0)
 firebarFrame dd 16 dup(0)
 firebarFrameTimer dd 16 dup(0)
 firebarCount dd 0
 FIREBAR_ANIM_SPEED equ 4
 FIREBALL_RADIUS equ 8
 fireballSpacing dd 13

 sinTable dd 0, 4, 9, 13, 18, 22, 27, 31, 36, 40, 44, 49, 53, 58, 62, 66
          dd 71, 75, 79, 83, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, 128, 131
          dd 135, 139, 143, 146, 150, 153, 157, 160, 164, 167, 171, 174, 177, 180, 183, 186
          dd 190, 192, 195, 198, 201, 204, 206, 209, 211, 214, 216, 219, 221, 223, 225, 227
          dd 229, 231, 233, 235, 236, 238, 240, 241, 243, 244, 245, 246, 248, 249, 250, 251
          dd 252, 252, 253, 254, 254, 255, 255, 255, 256, 256, 256

 MAX_PIPE_PAIRS equ 10
 pipeInX dd 10 dup(0)
 pipeInY dd 10 dup(0)
 pipeOutX dd 10 dup(0)
 pipeOutY dd 10 dup(0)
 pipeCount dd 0
 pipeInCount dd 0
 pipeOutCount dd 0

 pipeHorizInX dd 10 dup(0)
 pipeHorizInY dd 10 dup(0)
 pipeHorizOutX dd 10 dup(0)
 pipeHorizOutY dd 10 dup(0)
 pipeHorizCount dd 0
 pipeHorizInCount dd 0
 pipeHorizOutCount dd 0

 levelThemes dd 0, 1, 2, 3

 playerName db 11 dup(0)
 playerNameLen dd 0
 nameEntryText db "ENTER YOUR NAME", 0
 nameCursorPos dd 0

 titleSlideY dd - 200
 titleStarFrame dd 0
 titleBlinkTimer dd 0
 titleShowText dd 1
 pressEnterText db "PRESS ENTER TO START", 0

 worldText2 db "WORLD", 0
 worldNumber db "1 - 1", 0
 levelTitleTimer dd 0
 currentWorld dd 1
 currentStage dd 1

 gameOverText db "GAME OVER", 0
 gameOverTimer dd 0

 thankYouText db "THANK YOU FOR SAVING ME", 0
 gameCompleteTimer dd 0

 flagpoleState dd 0
 flagpoleGrabY dd 0
 flagpoleTimer dd 0
 flagScore dd 0
 flagpoleX dd 0
 flagpoleBaseTileX dd 0
 flagpoleBaseTileY dd 0
 flagpoleTopTileX dd 0
 flagpoleTopTileY dd 0
 flagY dd 0
 flagSlideSpeed equ 4

 FLAGPOLE_SECTION_1 equ 5000
 FLAGPOLE_SECTION_2 equ 4000
 FLAGPOLE_SECTION_3 equ 2000
 FLAGPOLE_SECTION_4 equ 800
 FLAGPOLE_SECTION_5 equ 400
 FLAGPOLE_SECTION_6 equ 100

 endBlockHit dd 0
 castleFlagShow dd 0
 castleFlagX dd 0
 castleFlagY dd 0
 castleFlagTargetY dd 0
 castleFlagRaiseSpeed equ 1
 flagpoleComplete dd 0
 endSequenceDone dd 0
 endBlockTimer dd 0
 timerCountdownActive dd 0

 MAX_EXPLOSIONS equ 8
 explosionX dd 8 dup(0)
 explosionY dd 8 dup(0)
 explosionFrame dd 8 dup( - 1)
 explosionTimer dd 8 dup(0)

 MAX_FIREWORKS equ 16
 fireworkX dd 16 dup(0)
 fireworkY dd 16 dup(0)
 fireworkFrame dd 16 dup( - 1)
 fireworkTimer dd 16 dup(0)
 fireworkDelay dd 16 dup(0)
 fireworksTriggered dd 0
 fireworksBonusActive dd 0
 fireworkCount dd 0
 fireworksAllDone dd 0
 fireworkBonusIndex dd 0
 fireworkBonusPhase dd 0
 recordedBonusTime dd 0

 nameEntryMode dd 0
 playerHasSave dd 0
 resumeFromSave dd 0
 resumeSavedX dd 0
 resumeSavedY dd 0
 MAX_SAVE_SLOTS equ 10
 SAVE_NAME_LEN equ 12

 SAVE_SLOT_SIZE equ 60
 SAVE_TOTAL_BYTES equ 600

 SAVE_OFF_WORLD equ 12
 SAVE_OFF_STAGE equ 16
 SAVE_OFF_SCORE equ 20
 SAVE_OFF_LIVES equ 24
 SAVE_OFF_COINS equ 28
 SAVE_OFF_TIME equ 32
 SAVE_OFF_STATE equ 36
 SAVE_OFF_POWER equ 40
 SAVE_OFF_MARIO_X equ 44
 SAVE_OFF_MARIO_Y equ 48
 SAVE_OFF_MIDAS equ 52
 SAVE_OFF_UNDERGROUND equ 56

 saveBuffer db SAVE_TOTAL_BYTES dup(0)
 saveTextBuffer db 4096 dup(0)
 currentSaveSlot dd - 1

 HIGH_SCORE_COUNT equ 10
 HIGH_SCORE_NAMES_SIZE equ (HIGH_SCORE_COUNT * SAVE_NAME_LEN)
 highScoreNames db HIGH_SCORE_NAMES_SIZE dup(0)
 highScoreValues dd HIGH_SCORE_COUNT dup(0)

 SCORE_GOOMBA equ 100
 SCORE_KOOPA equ 100
 SCORE_TURTLE equ 100
 SCORE_BOWSER equ 5000
 SCORE_SHELL_HIT1 equ 100
 SCORE_SHELL_HIT2 equ 200
 SCORE_SHELL_HIT3 equ 400
 SCORE_SHELL_HIT4 equ 800
 SCORE_FIREBALL_KILL equ 200
 SCORE_COIN equ 200
 SCORE_MUSHROOM equ 1000
 SCORE_FLOWER equ 1000
 SCORE_STAR equ 1000
 SCORE_1UP equ 1000
 SCORE_FLAG_TOP equ 5000
 SCORE_FLAG_MID equ 2000
 SCORE_FLAG_BOT equ 100
 SCORE_TIME_BONUS equ 50

 shellComboCount dd 0
 kickCooldownTimer dd 0

 MAX_FLOAT_SCORES equ 16
 floatScoreX dd 16 dup(0)
 floatScoreY dd 16 dup(0)
 floatScoreValue dd 16 dup(0)
 floatScoreTimer dd 16 dup(-1)
 FLOAT_SCORE_DURATION equ 60
 FLOAT_SCORE_SPEED equ 2

 scoreText100 db "100", 0
 scoreText200 db "200", 0
 scoreText400 db "400", 0
 scoreText800 db "800", 0
 scoreText1000 db "1000", 0
 scoreText2000 db "2000", 0
 scoreText5000 db "5000", 0
 scoreText1UP db "1UP", 0
 scoreTextBuffer db 8 dup(0)

 marioX dd 100
 marioY dd GROUND_Y - MARIO_HEIGHT
 marioVelX dd 0
 marioVelY dd 0
 marioOnGround dd 1
 marioJumping dd 0
 marioDeathActive dd 0
 marioDeathTimer dd 0
 respawnPauseTimer dd 0

 cameraX dd 0
 cameraY dd 0

 isUnderground dd 0
 onWarpPipe dd 0
 warpPipeX dd 0
 warpPipeY dd 0

 fadeAlpha dd 0
 fadeDirection dd 0

 pipeTransition dd 0
 pipeTransFrame dd 0
 pipeTransTimer dd 0
 pipeDestX dd 0
 pipeDestY dd 0
 pipeDestCamX dd 0
 pipeDestCamY dd 0
 pipeDestUnder dd 0
 pipeExitHasCap dd 0
 pipeExitBottomY dd 0

 keyLeft dd 0
 keyRight dd 0
 keySpace dd 0
 keyDown dd 0
 keyP dd 0
 keyEsc dd 0
 keyEnter dd 0
 key1 dd 0
 key2 dd 0
 key3 dd 0
 keyK dd 0

 numCoins dd 0
 MAX_COINS equ 200
 coinData dd (MAX_COINS * 3) dup(0)

 colorSky dd 00FC9838h
 colorGround dd 000058C0h
 colorPlatform dd 00008CFFh
 colorUnderSky dd 00000000h
 colorBlack dd 000000000h
 colorWhite dd 00FFFFFFh
 colorBrick dd 000048C0h
 colorBrickLight dd 000068E0h
 colorBlackLine dd 000000000h
 colorMagenta dd 00FF00FFh
 colorBanner dd 00003898h
 colorBannerDark dd 00002070h
 colorGoldCoin dd 0000FFFFh
 colorGoldGlow dd 0000E8FFh
 colorGoldBar dd 0000B7FFh
 colorKickBar dd 00008000h
 colorFireballFallback dd 000000FFh

 level1 db 20000 dup(0)

 levelBackground db 20000 dup(0)

 qUsedMap db 20000 dup(0)

 numBuffer db 16 dup(0)

 tempY dd 0

.code
DrawRectangle proc uses ebx ecx edx esi edi, xPos:DWORD, yPos:DWORD, w:DWORD, h:DWORD, col:DWORD
 local hBrush:DWORD
 local rect:RECT

 mov eax, xPos
 mov rect.left, eax
 mov eax, yPos
 mov rect.top, eax
 mov eax, xPos
 add eax, w
 mov rect.right, eax
 mov eax, yPos
 add eax, h
 mov rect.bottom, eax

 invoke CreateSolidBrush, col
 mov hBrush, eax
 invoke FillRect, hdcMem, addr rect, hBrush
 invoke DeleteObject, hBrush

 ret
DrawRectangle endp

DrawSpriteFlipped proc uses eax ebx ecx edx esi edi, pHdcSrc:DWORD, destX:DWORD, destY:DWORD, spriteW:DWORD, spriteH:DWORD, srcX:DWORD, srcY:DWORD, direction:DWORD, transColor:DWORD
 local tempDC:DWORD
 local tempBmp:DWORD
 local oldBmp:DWORD
 local flipDestX:DWORD
 local fillRect:RECT

 mov eax, direction
 cmp eax, - 1
 jne draw_normal_flip

 invoke CreateCompatibleDC, hdcMem
 mov tempDC, eax
 invoke CreateCompatibleBitmap, hdcMem, spriteW, spriteH
 mov tempBmp, eax
 invoke SelectObject, tempDC, tempBmp
 mov oldBmp, eax

 mov eax, 0
 mov fillRect.left, eax
 mov fillRect.top, eax
 mov eax, spriteW
 mov fillRect.right, eax
 mov eax, spriteH
 mov fillRect.bottom, eax
 invoke CreateSolidBrush, transColor
 push eax
 invoke FillRect, tempDC, addr fillRect, eax
 pop eax
 invoke DeleteObject, eax

 invoke BitBlt, tempDC, 0, 0, spriteW, spriteH, pHdcSrc, srcX, srcY, SRCCOPY
 mov eax, spriteW
 dec eax
 mov flipDestX, eax
 mov eax, spriteW
 neg eax

 invoke StretchBlt, tempDC, flipDestX, 0, eax, spriteH, \
 tempDC, 0, 0, spriteW, spriteH, SRCCOPY

 invoke TransparentBlt, hdcMem, destX, destY, spriteW, spriteH, \
 tempDC, 0, 0, spriteW, spriteH, transColor

 invoke SelectObject, tempDC, oldBmp
 invoke DeleteObject, tempBmp
 invoke DeleteDC, tempDC
 jmp flip_done

draw_normal_flip:

 invoke TransparentBlt, hdcMem, destX, destY, spriteW, spriteH, \
 pHdcSrc, srcX, srcY, spriteW, spriteH, transColor

flip_done:
 ret

DrawSpriteFlipped endp

DrawTileFromSheet proc uses ebx ecx edx, destX:DWORD, destY:DWORD, srcCol:DWORD, srcRow:DWORD

 TILE_GAP equ 2
 mov eax, srcCol
 mov ebx, 32
 add ebx, TILE_GAP
 imul eax, ebx
 mov ebx, eax

 mov ecx, srcRow

 invoke TransparentBlt, hdcMem, destX, destY, 32, 32, hdcTiles, ebx, ecx, 32, 32, 00FF00FFh
 ret

DrawTileFromSheet endp

DrawGroundTile proc uses eax, destX:DWORD, destY:DWORD
 mov eax, currentTheme
 cmp eax, 1
 je ground_underground
 cmp eax, 3
 je ground_castle

 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_OVER
 ret
ground_underground:
 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_UNDER
 ret
ground_castle:
 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_CASTLE
 ret
DrawGroundTile endp

DrawBrickBlockTile proc uses eax, destX:DWORD, destY:DWORD
 mov eax, currentTheme
 cmp eax, 1
 je brick_underground
 cmp eax, 3
 je brick_castle

 invoke DrawTileFromSheet, destX, destY, 1, TILE_ROW_OVER
 ret
brick_underground:
 invoke DrawTileFromSheet, destX, destY, 1, TILE_ROW_UNDER
 ret
brick_castle:
 invoke DrawTileFromSheet, destX, destY, 1, TILE_ROW_CASTLE
 ret
DrawBrickBlockTile endp

DrawBrick2Tile proc uses eax, destX:DWORD, destY:DWORD
 mov eax, currentTheme
 cmp eax, 1
 je brick2_underground
 cmp eax, 3
 je brick2_castle

 invoke DrawTileFromSheet, destX, destY, 10, TILE_ROW_OVER
 ret
brick2_underground:
 invoke DrawTileFromSheet, destX, destY, 10, TILE_ROW_UNDER
 ret
brick2_castle:
 invoke DrawTileFromSheet, destX, destY, 10, TILE_ROW_CASTLE
 ret
DrawBrick2Tile endp

DrawStairTile proc uses eax, destX:DWORD, destY:DWORD
 mov eax, currentTheme
 cmp eax, 1
 je stair_underground
 cmp eax, 3
 je stair_castle

 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_OVER
 ret
stair_underground:
 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_UNDER
 ret
stair_castle:
 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_CASTLE
 ret
DrawStairTile endp

DrawTreeLeafLeft proc destX:DWORD, destY:DWORD
 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_SKY
 ret
DrawTreeLeafLeft endp

DrawTreeLeafMiddle proc destX:DWORD, destY:DWORD
 invoke DrawTileFromSheet, destX, destY, 1, TILE_ROW_SKY
 ret
DrawTreeLeafMiddle endp

DrawTreeLeafRight proc destX:DWORD, destY:DWORD
 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_SKY
 ret
DrawTreeLeafRight endp

DrawTreeBark proc destX:DWORD, destY:DWORD
 invoke DrawTileFromSheet, destX, destY, 3, TILE_ROW_SKY
 ret
DrawTreeBark endp

DrawLuckyBlockTile proc uses eax ebx, destX:DWORD, destY:DWORD, isUsed:DWORD

 mov eax, isUsed
 test eax, eax
 jnz lucky_used

 mov eax, animFrame
 shr eax, 3
 and eax, 3

 cmp eax, 3
 jne lucky_no_pingpong
 mov eax, 1
lucky_no_pingpong:
 add eax, 3

 mov ebx, currentTheme
 cmp ebx, 1
 je lucky_underground
 cmp ebx, 3
 je lucky_castle

 invoke DrawTileFromSheet, destX, destY, eax, TILE_ROW_OVER
 ret
lucky_underground:
 invoke DrawTileFromSheet, destX, destY, eax, TILE_ROW_UNDER
 ret
lucky_castle:
 invoke DrawTileFromSheet, destX, destY, eax, TILE_ROW_CASTLE
 ret

lucky_used:

 mov ebx, currentTheme
 cmp ebx, 1
 je lucky_used_underground
 cmp ebx, 3
 je lucky_used_castle

 invoke DrawTileFromSheet, destX, destY, 6, TILE_ROW_OVER
 ret
lucky_used_underground:
 invoke DrawTileFromSheet, destX, destY, 6, TILE_ROW_UNDER
 ret
lucky_used_castle:
 invoke DrawTileFromSheet, destX, destY, 6, TILE_ROW_CASTLE
 ret
DrawLuckyBlockTile endp

DrawCoinTile proc uses eax ebx ecx edx, destX:DWORD, destY:DWORD
 local srcX:DWORD
 local srcY:DWORD
 local coinCol:DWORD

 mov eax, animFrame
 add eax, 17
 shr eax, 4
 and eax, 3

 cmp eax, 3
 jne coin_no_pingpong
 mov eax, 1
coin_no_pingpong:
 add eax, 7
 mov coinCol, eax

 mov ebx, 34
 imul eax, ebx
 mov srcX, eax

 mov ebx, currentTheme
 cmp ebx, 1
 je coin_src_underground
 cmp ebx, 3
 je coin_src_castle

 mov srcY, TILE_ROW_OVER
 jmp coin_draw_scaled
coin_src_underground:
 mov srcY, TILE_ROW_UNDER
 jmp coin_draw_scaled
coin_src_castle:
 mov srcY, TILE_ROW_CASTLE

coin_draw_scaled:

 mov eax, destX
 add eax, 3
 mov ebx, destY
 add ebx, 3

 invoke TransparentBlt, hdcMem, eax, ebx, 26, 26, hdcTiles, srcX, srcY, 32, 32, 00FF00FFh
 ret
DrawCoinTile endp

DrawPipeCapSheet proc uses eax, destX:DWORD, destY:DWORD

 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_PIPE1

 mov eax, destX
 add eax, 32
 invoke DrawTileFromSheet, eax, destY, 1, TILE_ROW_PIPE1
 ret
DrawPipeCapSheet endp

DrawPipeBodySheet proc uses eax, destX:DWORD, destY:DWORD

 invoke DrawTileFromSheet, destX, destY, 0, TILE_ROW_PIPE2

 mov eax, destX
 add eax, 32
 invoke DrawTileFromSheet, eax, destY, 1, TILE_ROW_PIPE2
 ret
DrawPipeBodySheet endp

DrawHorizPipeCapSheet proc uses eax, destX:DWORD, destY:DWORD

 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_PIPE1

 mov eax, destY
 add eax, 32
 invoke DrawTileFromSheet, destX, eax, 3, TILE_ROW_PIPE1
 ret
DrawHorizPipeCapSheet endp

DrawHorizPipeBodySheet proc uses eax, destX:DWORD, destY:DWORD

 invoke DrawTileFromSheet, destX, destY, 2, TILE_ROW_PIPE2

 mov eax, destY
 add eax, 32
 invoke DrawTileFromSheet, destX, eax, 3, TILE_ROW_PIPE2
 ret
DrawHorizPipeBodySheet endp

DrawFlagpoleBase proc uses eax ebx ecx edx, xPos:DWORD, yPos:DWORD

 mov eax, hObjectsSheet
 test eax, eax
 jz flagpole_base_done

 mov eax, OBJ_FLAGPOLE_BASE
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, xPos, yPos, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

flagpole_base_done:
 ret
DrawFlagpoleBase endp

DrawFlagpolePole proc uses eax ebx ecx edx, xPos:DWORD, yPos:DWORD

 mov eax, hObjectsSheet
 test eax, eax
 jz flagpole_pole_done

 mov eax, OBJ_FLAGPOLE_POLE
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, xPos, yPos, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

flagpole_pole_done:
 ret
DrawFlagpolePole endp

DrawFlagpoleTop proc uses eax ebx ecx edx, xPos:DWORD, yPos:DWORD

 mov eax, hObjectsSheet
 test eax, eax
 jz flagpole_top_done

 mov eax, OBJ_FLAGPOLE_TOP
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, xPos, yPos, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

flagpole_top_done:
 ret
DrawFlagpoleTop endp

IntToStr proc uses ebx ecx edx esi edi, value:DWORD, buffer:DWORD
 mov eax, value
 mov edi, buffer
 mov ecx, 10
 mov ebx, 0

 test eax, eax
 jnz convert_loop_start
 mov byte ptr [edi], '0'
 mov byte ptr [edi + 1], 0
 ret

convert_loop_start:

push_digits:
 test eax, eax
 jz reverse_digits
 xor edx, edx
 div ecx
 add edx, '0'
 push edx
 inc ebx
 jmp push_digits

reverse_digits:
 test ebx, ebx
 jz done_convert
 pop edx
 mov [edi], dl
 inc edi
 dec ebx
 jmp reverse_digits

done_convert:
 mov byte ptr [edi], 0
 ret
IntToStr endp

StrLen proc uses edi, pStr:DWORD
 mov edi, pStr
 xor eax, eax
count_loop:
 cmp byte ptr [edi], 0
 je count_done
 inc eax
 inc edi
 jmp count_loop
count_done:
 ret
StrLen endp

UpdateWorldNumber proc uses eax ebx ecx edx esi edi
 local stageBuf[4]:BYTE

 lea eax, stageBuf
 invoke IntToStr, currentStage, eax

 lea edi, worldNumber

 mov byte ptr [edi], '1'
 inc edi
 mov byte ptr [edi], '-'
 inc edi

 lea esi, stageBuf
copy_stage:
 mov al, [esi]
 test al, al
 jz stage_done
 mov [edi], al
 inc edi
 inc esi
 jmp copy_stage
stage_done:

 mov byte ptr [edi], 0

 ret
UpdateWorldNumber endp

DrawFontChar proc uses ebx ecx edx esi edi, charCode:DWORD, xPos:DWORD, yPos:DWORD
 local srcX:DWORD
 local charIndex:DWORD

 mov eax, hdcFont
 test eax, eax
 jz draw_font_char_done

 mov eax, charCode

 cmp al, '0'
 jb check_upper_alpha
 cmp al, '9'
 ja check_upper_alpha

 sub al, '0'
 movzx eax, al
 mov charIndex, eax
 jmp calc_src_x

check_upper_alpha:

 cmp al, 'A'
 jb check_lower_alpha
 cmp al, 'Z'
 ja check_lower_alpha
 sub al, 'A'
 movzx eax, al
 add eax, 10
 mov charIndex, eax
 jmp calc_src_x

check_lower_alpha:

 cmp al, 'a'
 jb check_special
 cmp al, 'z'
 ja check_special
 sub al, 'a'
 movzx eax, al
 add eax, 10
 mov charIndex, eax
 jmp calc_src_x

check_special:
 cmp al, '-'
 jne check_x
 mov charIndex, 36
 jmp calc_src_x

check_x:
 cmp al, 'x'
 jne check_X_upper
 mov charIndex, 38
 jmp calc_src_x

check_X_upper:
 cmp al, 'X'
 jne check_exclaim
 mov charIndex, 38
 jmp calc_src_x

check_exclaim:
 cmp al, '!'
 jne check_period
 mov charIndex, 40
 jmp calc_src_x

check_period:
 cmp al, '.'
 jne check_copyright_symbol
 mov charIndex, 42
 jmp calc_src_x

check_copyright_symbol:
 cmp al, 169
 jne check_space

 jmp draw_font_char_done

check_space:

 jmp draw_font_char_done

calc_src_x:

 mov eax, charIndex
 mov ebx, FONT_CHAR_WIDTH + FONT_CHAR_GAP
 imul eax, ebx
 mov srcX, eax

 invoke TransparentBlt, hdcMem, xPos, yPos, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT, \
 hdcFont, srcX, 0, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT, 00FF00FFh

draw_font_char_done:
 ret
DrawFontChar endp

DrawFontText proc uses ebx ecx edx esi edi, pText:DWORD, xPos:DWORD, yPos:DWORD
 local currentX:DWORD

 mov eax, hdcFont
 test eax, eax
 jz draw_font_text_fallback

 mov eax, xPos
 mov currentX, eax
 mov esi, pText

draw_font_loop:
 movzx eax, byte ptr [esi]
 test al, al
 jz draw_font_text_done

 cmp al, ' '
 jne draw_char
 add currentX, FONT_CHAR_WIDTH
 jmp next_char

draw_char:

 invoke DrawFontChar, eax, currentX, yPos
 add currentX, FONT_CHAR_WIDTH

next_char:
 inc esi
 jmp draw_font_loop

draw_font_text_done:
 ret

draw_font_text_fallback:

 invoke SetBkMode, hdcMem, TRANSPARENT
 invoke SetTextColor, hdcMem, colorWhite
 invoke StrLen, pText
 mov currentX, eax
 invoke TextOutA, hdcMem, xPos, yPos, pText, currentX
 ret
DrawFontText endp

DrawTextBitmap proc uses ebx ecx edx esi edi, pText:DWORD, xPos:DWORD, yPos:DWORD
 invoke DrawFontText, pText, xPos, yPos
 ret
DrawTextBitmap endp

DrawMario proc uses ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local spriteCol:DWORD
 local spriteRow:DWORD
 local spriteW:DWORD
 local spriteH:DWORD
 local srcX:DWORD
 local srcY:DWORD
 local spriteSheetHandle:DWORD
 local pHdcSrc:DWORD
 local tempMaskDC:DWORD
 local tempMaskBmp:DWORD
 local oldMaskBmp:DWORD
 local flipMaskX:DWORD
 local fillRect:RECT
 local tempColorDC:DWORD
 local tempColorBmp:DWORD
 local oldColorBmp:DWORD
 local cycleColor:DWORD
 local tempColorFillDC:DWORD
 local tempColorFillBmp:DWORD
 local oldColorFillBmp:DWORD
 local tempOrigMaskDC:DWORD
 local tempOrigMaskBmp:DWORD
 local oldOrigMaskBmp:DWORD
 local tempMagentaFillDC:DWORD
 local tempMagentaFillBmp:DWORD
 local oldMagentaFillBmp:DWORD
 local tempColorBrushDC:DWORD
 local tempColorBrushBmp:DWORD
 local oldColorBrushBmp:DWORD
 local tempMaskRestoreDC:DWORD
 local tempMaskRestoreBmp:DWORD
 local oldMaskRestoreBmp:DWORD
 local tempNotMagentaDC:DWORD
 local tempNotMagentaBmp:DWORD
 local oldNotMagentaBmp:DWORD

 mov eax, marioX
 sub eax, cameraX
 mov screenX, eax
 mov eax, marioY
 sub eax, cameraY
 mov screenY, eax

 mov eax, marioState

 cmp eax, MARIO_SUPER
 je mario_crouch_draw_offset
 cmp eax, MARIO_FIRE
 jne mario_pos_done
 mario_crouch_draw_offset:
 mov eax, marioCrouching
 test eax, eax
 jz mario_pos_done
 mov eax, screenY
 sub eax, TILE_SIZE
 mov screenY, eax
 mario_pos_done:

 mov eax, hMarioSheet
 mov spriteSheetHandle, eax
 mov eax, hdcMario
 mov pHdcSrc, eax

 mov eax, spriteSheetHandle
 test eax, eax
 jz mario_draw_done

 mov eax, marioTransition
 test eax, eax
 jnz mario_draw_transition

 mov eax, flagpoleState
 test eax, eax
 jz mario_determine_frame
 mov eax, animFrame
 and eax, 8
 jz mario_flagpole_grab_frame
 mov spriteCol, MARIO_FLAG_SLIDE
 jmp mario_frame_done
mario_flagpole_grab_frame:
 mov spriteCol, MARIO_FLAG_GRAB
 jmp mario_frame_done

mario_draw_transition:

 mov eax, marioTransition
 cmp eax, 1
 je mario_growing

 mov eax, transitionFrame
 mov ebx, 2
 sub ebx, eax
 jmp mario_transition_draw
mario_growing:
 mov ebx, transitionFrame

mario_transition_draw:

 mov eax, ebx
 mov ecx, 34
 imul eax, ecx
 mov srcX, eax
 mov srcY, MARIO_GROW_Y
 mov spriteW, 32
 mov spriteH, 64

 mov eax, screenY
 sub eax, 32
 mov screenY, eax
 jmp mario_final_draw

mario_determine_frame:

 mov spriteCol, MARIO_IDLE

 mov eax, pipeTransition
 test eax, eax
 jnz mario_crouch_frame

 mov eax, marioOnGround
 test eax, eax
 jz mario_jumping_frame

 mov eax, marioCrouching
 test eax, eax
 jnz mario_crouch_frame

 mov eax, marioWalking
 test eax, eax
 jz mario_idle_frame

 mov eax, marioState
 cmp eax, MARIO_FIRE
 jne mario_normal_walk
 mov eax, marioShooting
 test eax, eax
 jnz mario_fireball_walk

mario_normal_walk:

 mov eax, marioAnimFrame
 and eax, 3
 cmp eax, 0
 je mario_walk1
 cmp eax, 1
 je mario_walk2
 cmp eax, 2
 je mario_walk3

 mov spriteCol, MARIO_WALK2
 jmp mario_frame_done
mario_walk1:
 mov spriteCol, MARIO_WALK1
 jmp mario_frame_done
mario_walk2:
 mov spriteCol, MARIO_WALK2
 jmp mario_frame_done
mario_walk3:
 mov spriteCol, MARIO_WALK3
 jmp mario_frame_done

mario_fireball_walk:

 mov eax, marioAnimFrame
 and eax, 7
 cmp eax, 0
 je mario_fireball_walk1
 cmp eax, 1
 je mario_fireball_walk2
 cmp eax, 2
 je mario_fireball_walk3
 cmp eax, 3
 je mario_fireball_walk4
 cmp eax, 4
 je mario_fireball_walk5
 cmp eax, 5
 je mario_fireball_walk4
 cmp eax, 6
 je mario_fireball_walk3

 mov spriteCol, MARIO_FIREBALL_WALK2
 jmp mario_frame_done
mario_fireball_walk1:
 mov spriteCol, MARIO_FIREBALL_WALK1
 jmp mario_frame_done
mario_fireball_walk2:
 mov spriteCol, MARIO_FIREBALL_WALK2
 jmp mario_frame_done
mario_fireball_walk3:
 mov spriteCol, MARIO_FIREBALL_WALK3
 jmp mario_frame_done
mario_fireball_walk4:
 mov spriteCol, MARIO_FIREBALL_WALK4
 jmp mario_frame_done
mario_fireball_walk5:
 mov spriteCol, MARIO_FIREBALL_WALK5
 jmp mario_frame_done

mario_idle_frame:

 mov eax, marioState
 cmp eax, MARIO_FIRE
 jne mario_idle_normal
 mov eax, marioShooting
 test eax, eax
 jz mario_idle_normal
 mov spriteCol, MARIO_FIREBALL_WALK1
 jmp mario_frame_done
mario_idle_normal:
 mov spriteCol, MARIO_IDLE
 jmp mario_frame_done

mario_jumping_frame:
 mov spriteCol, MARIO_JUMP
 jmp mario_frame_done

mario_crouch_frame:
 mov spriteCol, MARIO_DOWN
 jmp mario_frame_done

mario_frame_done:

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je mario_small_row
 cmp eax, MARIO_SUPER
 je mario_big_row
 cmp eax, MARIO_FIRE
 je mario_fire_row

 jmp mario_small_row

mario_small_row:
 mov srcY, MARIO_SMALL_Y
 mov spriteH, MARIO_SMALL_H
 mov spriteW, 32
 jmp mario_calc_src_x

 mario_big_row:
 mov srcY, MARIO_BIG_Y
 mov spriteH, MARIO_BIG_H
 mov spriteW, 32
 jmp mario_calc_src_x

 mario_fire_row:
 mov srcY, MARIO_FIRE_Y
 mov spriteH, MARIO_FIRE_H
 mov spriteW, 32
 jmp mario_calc_src_x

mario_calc_src_x:

 mov eax, spriteCol
 mov ebx, 32
 add ebx, MARIO_COL_GAP
 imul eax, ebx
 mov srcX, eax

mario_final_draw:

 mov eax, marioFacing
 cmp eax, - 1
 je mario_flip_left

 invoke TransparentBlt, hdcMem, screenX, screenY, spriteW, spriteH, \
 pHdcSrc, srcX, srcY, spriteW, spriteH, 00FF00FFh
 jmp mario_draw_mask

mario_flip_left:

 invoke DrawSpriteFlipped, pHdcSrc, screenX, screenY, spriteW, spriteH, \
 srcX, srcY, marioFacing, 00FF00FFh

mario_draw_mask:

 mov eax, starPowerActive
 test eax, eax
 jz mario_draw_done
 mov eax, hMaskSheet
 test eax, eax
 jz mario_draw_done

 invoke CreateCompatibleDC, hdcMem
 mov tempColorDC, eax
 invoke CreateCompatibleBitmap, hdcMem, spriteW, spriteH
 mov tempColorBmp, eax
 invoke SelectObject, tempColorDC, tempColorBmp
 mov oldColorBmp, eax

 mov eax, 0
 mov fillRect.left, eax
 mov fillRect.top, eax
 mov eax, spriteW
 mov fillRect.right, eax
 mov eax, spriteH
 mov fillRect.bottom, eax
 invoke CreateSolidBrush, 00FF00FFh
 push eax
 invoke FillRect, tempColorDC, addr fillRect, eax
 pop eax
 invoke DeleteObject, eax

 mov eax, marioFacing
 cmp eax, - 1
 je mario_mask_copy_flip

 invoke BitBlt, tempColorDC, 0, 0, spriteW, spriteH, hdcMask, srcX, srcY, SRCCOPY

 jmp mario_mask_apply_color
mario_mask_copy_flip:

 invoke BitBlt, tempColorDC, 0, 0, spriteW, spriteH, hdcMask, srcX, srcY, SRCCOPY
 mov eax, spriteW
 dec eax
 mov flipMaskX, eax
 mov eax, spriteW
 neg eax
 invoke StretchBlt, tempColorDC, flipMaskX, 0, eax, spriteH, \
 tempColorDC, 0, 0, spriteW, spriteH, SRCCOPY

mario_mask_apply_color:
 mov eax, starColorFrame
 shr eax, 2
 and eax, 6
 cmp eax, 0
 je mask_color_red
 cmp eax, 1
 je mask_color_yellow
 cmp eax, 2
 je mask_color_green
 cmp eax, 3
 je mask_color_cyan
 cmp eax, 4
 je mask_color_blue
 cmp eax, 5
 je mask_color_magenta

 mov cycleColor, 000080FFh
 jmp mask_color_applied
mask_color_red:
 mov cycleColor, 000000FFh
 jmp mask_color_applied
mask_color_yellow:
 mov cycleColor, 0000FFFFh
 jmp mask_color_applied
mask_color_green:
 mov cycleColor, 0000FF00h
 jmp mask_color_applied
mask_color_cyan:
 mov cycleColor, 00FFFF00h
 jmp mask_color_applied
mask_color_blue:
 mov cycleColor, 00FF0000h
 jmp mask_color_applied
mask_color_magenta:
 mov cycleColor, 00FF00FFh

mask_color_applied:

 invoke CreateCompatibleDC, hdcMem
 mov tempColorFillDC, eax
 invoke CreateCompatibleBitmap, hdcMem, spriteW, spriteH
 mov tempColorFillBmp, eax
 invoke SelectObject, tempColorFillDC, tempColorFillBmp
 mov oldColorFillBmp, eax
 invoke CreateSolidBrush, cycleColor
 push eax
 invoke FillRect, tempColorFillDC, addr fillRect, eax
 pop eax
 invoke DeleteObject, eax

 invoke BitBlt, tempColorDC, 0, 0, spriteW, spriteH, tempColorFillDC, 0, 0, SRCAND

 invoke CreateCompatibleDC, hdcMem
 mov tempOrigMaskDC, eax
 invoke CreateCompatibleBitmap, hdcMem, spriteW, spriteH
 mov tempOrigMaskBmp, eax
 invoke SelectObject, tempOrigMaskDC, tempOrigMaskBmp
 mov oldOrigMaskBmp, eax

 mov eax, marioFacing
 cmp eax, - 1

 je mario_orig_mask_flip

 invoke BitBlt, tempOrigMaskDC, 0, 0, spriteW, spriteH, hdcMask, srcX, srcY, SRCCOPY

 jmp mario_restore_magenta
mario_orig_mask_flip:

 invoke BitBlt, tempOrigMaskDC, 0, 0, spriteW, spriteH, hdcMask, srcX, srcY, SRCCOPY
 mov eax, spriteW
 dec eax
 mov flipMaskX, eax
 mov eax, spriteW
 neg eax
 invoke StretchBlt, tempOrigMaskDC, flipMaskX, 0, eax, spriteH, \
 tempOrigMaskDC, 0, 0, spriteW, spriteH, SRCCOPY

mario_restore_magenta:
 invoke CreateCompatibleDC, hdcMem
 mov tempMagentaFillDC, eax
 invoke CreateCompatibleBitmap, hdcMem, spriteW, spriteH
 mov tempMagentaFillBmp, eax
 invoke SelectObject, tempMagentaFillDC, tempMagentaFillBmp
 mov oldMagentaFillBmp, eax
 invoke CreateSolidBrush, 00FF00FFh
 push eax
 invoke FillRect, tempMagentaFillDC, addr fillRect, eax
 pop eax
 invoke DeleteObject, eax

 invoke BitBlt, tempOrigMaskDC, 0, 0, spriteW, spriteH, tempMagentaFillDC, 0, 0, SRCAND
 invoke BitBlt, tempColorDC, 0, 0, spriteW, spriteH, tempOrigMaskDC, 0, 0, SRCPAINT

 invoke SelectObject, tempMagentaFillDC, oldMagentaFillBmp
 invoke DeleteObject, tempMagentaFillBmp
 invoke DeleteDC, tempMagentaFillDC
 invoke SelectObject, tempOrigMaskDC, oldOrigMaskBmp
 invoke DeleteObject, tempOrigMaskBmp
 invoke DeleteDC, tempOrigMaskDC
 invoke SelectObject, tempColorFillDC, oldColorFillBmp
 invoke DeleteObject, tempColorFillBmp
 invoke DeleteDC, tempColorFillDC

 invoke TransparentBlt, hdcMem, screenX, screenY, spriteW, spriteH, \
 tempColorDC, 0, 0, spriteW, spriteH, 00FF00FFh

 invoke SelectObject, tempColorDC, oldColorBmp
 invoke DeleteObject, tempColorBmp
 invoke DeleteDC, tempColorDC

mario_draw_done:
 ret

DrawMario endp

DrawHUD proc uses ebx ecx edx esi edi
 local buffer[16]:BYTE
 local len:DWORD

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, 50, colorBlack
 invoke DrawRectangle, 0, 48, WINDOW_WIDTH, 2, colorBannerDark

 invoke DrawTextBitmap, addr livesText, 30, 8

 mov eax, hUISheet
 test eax, eax
 jz lives_icon_done
 invoke TransparentBlt, hdcMem, 30, 24, 16, 16, \
 hdcUI, 36, UI_ROW_HUD, 16, 16, 00FF00FFh
lives_icon_done:

 invoke DrawTextBitmap, addr crossText, 54, 28
 lea eax, buffer
 invoke IntToStr, lives, eax
 invoke DrawTextBitmap, addr buffer, 72, 28

 invoke DrawTextBitmap, addr scoreText, 150, 8
 lea eax, buffer
 invoke IntToStr, score, eax
 invoke DrawTextBitmap, addr buffer, 150, 28

 mov eax, hUISheet
 test eax, eax
 jz coin_icon_done
 invoke TransparentBlt, hdcMem, 320, 24, 16, 16, \
 hdcUI, 18, UI_ROW_HUD, 16, 16, 00FF00FFh
coin_icon_done:
 invoke DrawTextBitmap, addr crossText, 338, 28
 lea eax, buffer
 invoke IntToStr, coins, eax
 invoke DrawTextBitmap, addr buffer, 356, 28

 invoke DrawTextBitmap, addr worldText, 480, 8
 invoke DrawTextBitmap, addr worldNumber, 490, 28

 invoke DrawTextBitmap, addr timerText, 650, 8
 lea eax, buffer
 invoke IntToStr, timer, eax
 invoke DrawTextBitmap, addr buffer, 660, 28

 mov eax, kickCooldownTimer
 cmp eax, 0
 jg after_midas

 ; Show Midas block when we have uses left OR when Midas is currently active (bar counting down)
 mov eax, midasUsesLeft
 test eax, eax
 jnz do_midas_ui
 mov eax, midasActive
 test eax, eax
 jz after_midas
do_midas_ui:

 mov eax, midasActive
 test eax, eax
 jz check_midas_count

 invoke DrawTextBitmap, addr midasText, 780, 8

 invoke DrawRectangle, 780, 24, 102, 14, colorBlackLine

 mov eax, midasBar
 test eax, eax
 jz show_midas_uses
 invoke DrawRectangle, 781, 25, eax, 12, colorGoldBar
 jmp show_midas_uses

check_midas_count:

 mov eax, midasKeyCount
 test eax, eax
 jz show_midas_uses_only

 invoke DrawTextBitmap, addr midasText, 780, 8
 lea eax, buffer
 invoke IntToStr, midasKeyCount, eax
 invoke DrawTextBitmap, addr buffer, 860, 8
 jmp show_midas_uses

show_midas_uses_only:
 invoke DrawTextBitmap, addr midasText, 780, 8

show_midas_uses:
 lea eax, buffer
 invoke IntToStr, midasUsesLeft, eax
 invoke DrawTextBitmap, addr buffer, 900, 8

after_midas:

 mov eax, kickCooldownTimer
 cmp eax, 0
 jle check_invincible

 invoke DrawTextBitmap, addr kickText, 780, 8

 invoke DrawRectangle, 780, 24, 102, 14, colorBlackLine

 mov eax, 180
 sub eax, kickCooldownTimer
 mov ebx, 100
 imul eax, ebx
 push edx
 mov ebx, 180
 xor edx, edx
 div ebx
 pop edx
 cmp eax, 100
 jle kick_bar_width_ok
 mov eax, 100
kick_bar_width_ok:
 test eax, eax
 jz check_invincible

 invoke DrawRectangle, 781, 25, eax, 12, colorKickBar

check_invincible:

 mov eax, isInvincible
 test eax, eax
 jz hud_done

 ; When Midas is active, show only the Midas bar (like KICK), not the invincibility flash
 mov eax, midasActive
 test eax, eax
 jnz hud_done

 mov eax, invincibleTimer
 cmp eax, 30
 jle hud_done

 mov eax, animFrame
 and eax, 8
 jz hud_done
 invoke DrawRectangle, 0, 48, WINDOW_WIDTH, 4, colorGoldGlow

hud_done:
 ret

DrawHUD endp

DrawTitleScreen proc uses ebx ecx edx esi edi
 local textY:DWORD
 local titleX:DWORD
 local blinkShow:DWORD

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 mov eax, titleStarFrame
 and eax, 31
 cmp eax, 16
 jge stars_set_a

 invoke DrawRectangle, 80, 60, 3, 3, colorWhite
 invoke DrawRectangle, 200, 120, 3, 3, colorWhite
 invoke DrawRectangle, 350, 40, 3, 3, colorWhite
 invoke DrawRectangle, 520, 90, 3, 3, colorWhite
 invoke DrawRectangle, 670, 55, 3, 3, colorWhite
 invoke DrawRectangle, 820, 100, 3, 3, colorWhite
 invoke DrawRectangle, 900, 35, 3, 3, colorWhite
 invoke DrawRectangle, 130, 500, 2, 2, colorWhite
 invoke DrawRectangle, 420, 480, 2, 2, colorWhite
 invoke DrawRectangle, 750, 520, 2, 2, colorWhite
stars_set_a:
 mov eax, titleStarFrame
 add eax, 16
 and eax, 31
 cmp eax, 16
 jge stars_set_b

 invoke DrawRectangle, 140, 80, 3, 3, colorWhite
 invoke DrawRectangle, 290, 55, 3, 3, colorWhite
 invoke DrawRectangle, 460, 110, 3, 3, colorWhite
 invoke DrawRectangle, 600, 45, 3, 3, colorWhite
 invoke DrawRectangle, 740, 85, 3, 3, colorWhite
 invoke DrawRectangle, 870, 60, 3, 3, colorWhite
 invoke DrawRectangle, 60, 540, 2, 2, colorWhite
 invoke DrawRectangle, 580, 490, 2, 2, colorWhite
 invoke DrawRectangle, 880, 510, 2, 2, colorWhite
stars_set_b:

 mov eax, titleSlideY
 cmp eax, 150
 jge title_at_position

 add eax, 6
 cmp eax, 150
 jle title_slide_ok
 mov eax, 150
title_slide_ok:
 mov titleSlideY, eax
title_at_position:
 mov textY, eax

 mov eax, hUISheet
 test eax, eax
 jz title_fallback

 mov eax, WINDOW_WIDTH
 sub eax, UI_TITLE_W
 shr eax, 1
 mov titleX, eax

 invoke TransparentBlt, hdcMem, titleX, textY, UI_TITLE_W, UI_TITLE_H, \
 hdcUI, 0, UI_ROW_TITLE, UI_TITLE_W, UI_TITLE_H, 00FF00FFh
 jmp title_draw_done

title_fallback:

 invoke DrawTextBitmap, addr titleText, 320, textY

title_draw_done:

 mov eax, textY
 add eax, UI_TITLE_H
 add eax, 20
 invoke DrawFontText, addr copyrightText, 280, eax

 mov eax, titleSlideY
 cmp eax, 150
 jl skip_press_enter

 inc titleBlinkTimer
 mov eax, titleBlinkTimer
 shr eax, 4
 and eax, 1
 jz skip_press_enter

 mov eax, textY
 add eax, UI_TITLE_H
 add eax, 80
 invoke DrawFontText, addr pressEnterText, 280, eax

skip_press_enter:

 inc titleStarFrame

 ret

DrawTitleScreen endp

DrawGameOverScreen proc uses ebx ecx edx esi edi

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 invoke DrawFontText, addr gameOverText, 380, 300

 dec gameOverTimer
 cmp gameOverTimer, 0
 jg game_over_done
 mov gameState, STATE_MENU
 call PlayMenuMusic
game_over_done:
 ret

DrawGameOverScreen endp

DrawLevelTitleScreen proc uses ebx ecx edx esi edi
 local buffer[16]:BYTE
 local centerY:DWORD
 local livesY:DWORD

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 mov eax, WINDOW_HEIGHT
 shr eax, 1
 sub eax, 40
 mov centerY, eax

 mov eax, centerY
 add eax, 100
 mov livesY, eax

 mov ecx, centerY
 invoke DrawFontText, addr worldText2, 400, ecx

 mov ecx, centerY
 add ecx, 40
 invoke DrawFontText, addr worldNumber, 420, ecx

 mov eax, hUISheet
 test eax, eax
 jz level_title_no_sprite
 mov ecx, livesY
 invoke TransparentBlt, hdcMem, 440, ecx, 16, 16, \
 hdcUI, 36, UI_ROW_HUD, 16, 16, 00FF00FFh
level_title_no_sprite:

 mov ecx, livesY
 add ecx, 4
 invoke DrawFontText, addr crossText, 462, ecx
 lea eax, buffer
 invoke IntToStr, lives, eax
 mov ecx, livesY
 add ecx, 4
 invoke DrawFontText, addr buffer, 482, ecx

 dec levelTitleTimer
 cmp levelTitleTimer, 0
 jg level_title_done

 call LoadLevelFromFile
 call UpdateWorldNumber
 call InitLevel

 cmp resumeFromSave, 1
 jne level_title_skip_resume

 ; Guard against stale/corrupt resume coordinates when switching levels.
 ; If saved position is outside the current level bounds, ignore resume.
 mov eax, TILE_COLS
 imul eax, TILE_SIZE
 sub eax, HITBOX_WIDTH
 mov ebx, resumeSavedX
 cmp ebx, 0
 jl level_title_ignore_resume
 cmp ebx, eax
 jg level_title_ignore_resume

 mov eax, TILE_ROWS
 imul eax, TILE_SIZE
 mov ebx, resumeSavedY
 cmp ebx, 0
 jl level_title_ignore_resume
 cmp ebx, eax
 jg level_title_ignore_resume
 jmp level_title_resume_ok

level_title_ignore_resume:
 mov resumeFromSave, 0
 jmp level_title_skip_resume

level_title_resume_ok:

 mov eax, resumeSavedX
 mov marioX, eax
 mov eax, resumeSavedY
 mov marioY, eax

 mov eax, marioX
 add eax, HITBOX_WIDTH / 2
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge lvl_camx_ok
 mov eax, 0
lvl_camx_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, WINDOW_WIDTH
 cmp eax, ebx
 jle lvl_camx_store
 mov eax, ebx
lvl_camx_store:
 mov cameraX, eax

 mov eax, isUnderground
 test eax, eax
 jnz lvl_camy_underground
 mov eax, cameraSnapYOverworld
 sub eax, WINDOW_HEIGHT
 jmp lvl_camy_store
lvl_camy_underground:
 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT
lvl_camy_store:
 mov cameraY, eax
 mov resumeFromSave, 0
level_title_skip_resume:
 mov gameState, STATE_GAMEPLAY
 call PlayLevelMusic
level_title_done:
 ret

DrawLevelTitleScreen endp

DrawNameEntryScreen proc uses ebx ecx edx esi edi

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 invoke DrawRectangle, 200, 140, 560, 260, colorBanner
 invoke DrawRectangle, 210, 150, 540, 240, colorBlackLine

 invoke DrawFontText, addr nameEntryText, 320, 180

 invoke DrawFontText, addr playerName, 320, 240

 mov eax, animFrame
 shr eax, 4
 and eax, 1
 jz name_cursor_hidden
 mov eax, playerNameLen
 imul eax, 18
 add eax, 320
 invoke DrawRectangle, eax, 260, 16, 3, colorWhite
name_cursor_hidden:

 invoke DrawFontText, addr pressEnterText, 300, 300

 ret

DrawNameEntryScreen endp

DrawGameCompleteScreen proc uses ebx ecx edx esi edi

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 invoke DrawFontText, addr thankYouText, 220, 250

 invoke DrawFontText, addr playerName, 220, 290

 mov eax, hUISheet
 test eax, eax
 jz complete_no_sprite
 invoke TransparentBlt, hdcMem, 650, 240, UI_PRINCESS_W, UI_PRINCESS_H, \
 hdcUI, 0, UI_ROW_PRINCESS, UI_PRINCESS_W, UI_PRINCESS_H, 00FF00FFh
complete_no_sprite:

 dec gameCompleteTimer
 cmp gameCompleteTimer, 0
 jg complete_done
 mov gameState, STATE_MENU
 call PlayMenuMusic
complete_done:
 ret

DrawGameCompleteScreen endp

DrawHighScoresScreen proc uses ebx ecx edx esi edi
 local buffer[16]:BYTE

 call UpdateHighScores

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorBlack

 invoke DrawFontText, addr topScoreText, 380, 120

 mov edx, 0
 mov ebx, 0
draw_hs_screen_loop:
 cmp edx, HIGH_SCORE_COUNT
 jge draw_hs_screen_done

 mov eax, edx
 imul eax, SAVE_NAME_LEN
 lea esi, [highScoreNames + eax]
 mov eax, ebx
 imul eax, 22
 add eax, 180
 mov ecx, eax
 mov al, [esi]
 test al, al
 jnz draw_hs_screen_name
 invoke DrawFontText, addr questionChar, 360, ecx
 jmp draw_hs_screen_dash
draw_hs_screen_name:
 invoke DrawFontText, esi, 360, ecx
draw_hs_screen_dash:
 invoke DrawFontText, addr dashText, 460, ecx
 lea eax, buffer
 mov edi, [highScoreValues + edx * 4]
 invoke IntToStr, edi, eax
 invoke DrawFontText, addr buffer, 520, ecx
 inc edx
 inc ebx
 jmp draw_hs_screen_loop

draw_hs_screen_done:
 ret

DrawHighScoresScreen endp

DrawMenuScreen proc uses ebx ecx edx esi edi
 local buffer[16]:BYTE
 local cloudOff:DWORD
 local groundY:DWORD
 local menuBaseY:DWORD
 local titleY:DWORD

 ; Always draw menu using overworld tiles (prevents theme "leaking" from gameplay/level select)
 mov currentTheme, 0

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorSky

 mov eax, WINDOW_HEIGHT
 sub eax, 64
 mov groundY, eax

 mov eax, WINDOW_HEIGHT
 shr eax, 1
 sub eax, 20
 mov menuBaseY, eax

 mov eax, WINDOW_HEIGHT
 mov ecx, 9
 xor edx, edx
 div ecx
 mov titleY, eax

 mov eax, hBackgroundSheet
 test eax, eax
 jz clouds_done
 invoke TransparentBlt, hdcMem, 50, 55, CLOUD_SMALL_W, CLOUD_SMALL_H, \
 hdcBackground, 0, BG_ROW_CLOUD_SMALL, CLOUD_SMALL_W, CLOUD_SMALL_H, 00FF00FFh

 invoke TransparentBlt, hdcMem, 280, 85, CLOUD_LONG_W, CLOUD_LONG_H, \
 hdcBackground, 0, BG_ROW_CLOUD_LONG, CLOUD_LONG_W, CLOUD_LONG_H, 00FF00FFh

 invoke TransparentBlt, hdcMem, 550, 45, CLOUD_SMALL_W, CLOUD_SMALL_H, \
 hdcBackground, 0, BG_ROW_CLOUD_SMALL, CLOUD_SMALL_W, CLOUD_SMALL_H, 00FF00FFh

 invoke TransparentBlt, hdcMem, 780, 70, CLOUD_LONG_W, CLOUD_LONG_H, \
 hdcBackground, 0, BG_ROW_CLOUD_LONG, CLOUD_LONG_W, CLOUD_LONG_H, 00FF00FFh
clouds_done:

 mov eax, animFrame
 shr eax, 2
 and eax, 15
 cmp eax, 8
 jl qblock_bounce_up
 mov ecx, 16
 sub ecx, eax
 mov eax, ecx
qblock_bounce_up:
 mov cloudOff, eax

 mov eax, groundY
 sub eax, 64
 sub eax, cloudOff
 mov edx, eax
 mov ebx, hdcTiles
 test ebx, ebx
 jz qblock1_done
 invoke DrawLuckyBlockTile, 180, edx, 0
qblock1_done:

 mov eax, groundY
 mov ecx, WINDOW_HEIGHT
 sub ecx, eax
 invoke DrawRectangle, 0, eax, WINDOW_WIDTH, ecx, colorGround

 mov eax, hdcTiles
 test eax, eax
 jz ground_done
 mov ebx, 0
ground_tile_loop:
 cmp ebx, 30
 jge ground_done
 mov eax, ebx
 imul eax, 32
 push eax

 mov ecx, groundY
 invoke DrawGroundTile, eax, ecx

 pop eax
 mov ecx, groundY
 add ecx, 32
 invoke DrawGroundTile, eax, ecx
 inc ebx
 jmp ground_tile_loop
ground_done:

 mov eax, hBackgroundSheet
 test eax, eax
 jz hills_done

 mov ecx, groundY
 sub ecx, 96
 invoke TransparentBlt, hdcMem, 0, ecx, HILL_BIG_W, HILL_BIG_H, \
 hdcBackground, 0, BG_ROW_HILL_BIG, HILL_BIG_W, HILL_BIG_H, 00FF00FFh
hills_done:

 mov eax, hBackgroundSheet
 test eax, eax
 jz bushes_done

 mov ecx, groundY
 sub ecx, 32
 invoke TransparentBlt, hdcMem, 280, ecx, BUSH_SMALL_W, BUSH_SMALL_H, \
 hdcBackground, 0, BG_ROW_BUSH_SMALL, BUSH_SMALL_W, BUSH_SMALL_H, 00FF00FFh

 mov ecx, groundY
 sub ecx, 32
 invoke TransparentBlt, hdcMem, 520, ecx, BUSH_LONG_W, BUSH_LONG_H, \
 hdcBackground, 0, BG_ROW_BUSH_LONG, BUSH_LONG_W, BUSH_LONG_H, 00FF00FFh
bushes_done:

 mov eax, hBackgroundSheet
 test eax, eax
 jz castle_done

 mov ecx, groundY
 sub ecx, 160
 invoke TransparentBlt, hdcMem, 745, ecx, CASTLE_W, CASTLE_H, \
 hdcBackground, 0, BG_ROW_CASTLE, CASTLE_W, CASTLE_H, 00FF00FFh
castle_done:

 mov eax, hUISheet
 test eax, eax
 jz title_done

 mov ecx, titleY
 invoke TransparentBlt, hdcMem, 304, ecx, UI_TITLE_W, UI_TITLE_H, \
 hdcUI, 0, UI_ROW_TITLE, UI_TITLE_W, UI_TITLE_H, 00FF00FFh
title_done:

 mov eax, menuSelection
 imul eax, 40
 add eax, menuBaseY
 add eax, menuOffsetY
 mov ebx, eax

 mov eax, hUISheet
 test eax, eax
 jz menu_cursor_fallback

 mov ecx, ebx
 sub ecx, 2
 invoke TransparentBlt, hdcMem, 330, ecx, UI_CURSOR_W, UI_CURSOR_H, \
 hdcUI, 0, UI_ROW_HUD, UI_CURSOR_W, UI_CURSOR_H, 00FF00FFh
 jmp menu_cursor_done

menu_cursor_fallback:

menu_cursor_done:

 cmp playerHasSave, 0
 je menu_draw_new_user
 cmp currentSaveSlot, - 1
 je menu_draw_new_user

 mov ecx, menuBaseY
 add ecx, menuOffsetY
 invoke DrawTextBitmap, addr menuContinue, 400, ecx
 mov ecx, menuBaseY
 add ecx, menuOffsetY
 add ecx, 40
 invoke DrawTextBitmap, addr menuHighScore, 400, ecx
 mov ecx, menuBaseY
 add ecx, menuOffsetY
 add ecx, 80
 invoke DrawTextBitmap, addr menuExit, 400, ecx
 jmp menu_text_done
menu_draw_new_user:

 mov ecx, menuBaseY
 add ecx, menuOffsetY
 invoke DrawTextBitmap, addr menuStart, 400, ecx
 mov ecx, menuBaseY
 add ecx, menuOffsetY
 add ecx, 40
 invoke DrawTextBitmap, addr menuHighScore, 400, ecx
 mov ecx, menuBaseY
 add ecx, menuOffsetY
 add ecx, 80
 invoke DrawTextBitmap, addr menuExit, 400, ecx
menu_text_done:

 mov eax, hdcTiles
 test eax, eax
 jz coins_done

 mov eax, animFrame
 add eax, 17
 shr eax, 4
 and eax, 3
 cmp eax, 3
 jne menu_coin_no_pingpong
 mov eax, 1
menu_coin_no_pingpong:
 add eax, 7

 mov ebx, 34
 imul eax, ebx
 mov ecx, eax

 mov edx, TILE_ROW_OVER

 invoke TransparentBlt, hdcMem, 620, 380, 32, 32, hdcTiles, ecx, edx, 32, 32, 00FF00FFh

 invoke TransparentBlt, hdcMem, 660, 380, 32, 32, hdcTiles, ecx, edx, 32, 32, 00FF00FFh
coins_done:
 ret

DrawMenuScreen endp

DrawLevelSelectScreen proc uses ebx ecx edx esi edi
 local buffer[16]:BYTE

 ; Use main menu background (sky, ground, bushes, castle)
 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorSky

 mov eax, hBackgroundSheet
 test eax, eax
 jz ls_clouds_done
 invoke TransparentBlt, hdcMem, 50, 55, CLOUD_SMALL_W, CLOUD_SMALL_H, \
 hdcBackground, 0, BG_ROW_CLOUD_SMALL, CLOUD_SMALL_W, CLOUD_SMALL_H, 00FF00FFh
 invoke TransparentBlt, hdcMem, 280, 85, CLOUD_LONG_W, CLOUD_LONG_H, \
 hdcBackground, 0, BG_ROW_CLOUD_LONG, CLOUD_LONG_W, CLOUD_LONG_H, 00FF00FFh
 invoke TransparentBlt, hdcMem, 550, 45, CLOUD_SMALL_W, CLOUD_SMALL_H, \
 hdcBackground, 0, BG_ROW_CLOUD_SMALL, CLOUD_SMALL_W, CLOUD_SMALL_H, 00FF00FFh
 invoke TransparentBlt, hdcMem, 780, 70, CLOUD_LONG_W, CLOUD_LONG_H, \
 hdcBackground, 0, BG_ROW_CLOUD_LONG, CLOUD_LONG_W, CLOUD_LONG_H, 00FF00FFh
ls_clouds_done:

; Draw castle first so the ground covers its base (castle appears "behind" ground)
mov eax, hBackgroundSheet
test eax, eax
jz ls_castle_pre_done
invoke TransparentBlt, hdcMem, 745, 324, CASTLE_W, CASTLE_H, \
       hdcBackground, 0, BG_ROW_CASTLE, CASTLE_W, CASTLE_H, 00FF00FFh
ls_castle_pre_done:

 ; Draw ground strip like the main menu
 mov eax, WINDOW_HEIGHT
 sub eax, 64
 mov ecx, eax              ; groundY equivalent
 mov edx, WINDOW_HEIGHT
 sub edx, ecx
 invoke DrawRectangle, 0, ecx, WINDOW_WIDTH, edx, colorGround

 mov eax, hdcTiles
 test eax, eax
 jz ls_ground_done
 mov ebx, 0
ls_ground_tile_loop:
 cmp ebx, 30
 jge ls_ground_done
 mov eax, ebx
 imul eax, 32
 push eax

 mov edx, ecx
 invoke DrawGroundTile, eax, edx

 pop eax
 mov edx, ecx
 add edx, 32
 invoke DrawGroundTile, eax, edx
 inc ebx
 jmp ls_ground_tile_loop
ls_ground_done:

mov eax, hBackgroundSheet
test eax, eax
jz ls_castle_done

; Hill positioned relative to ground (like main menu)
mov edx, ecx            ; groundY
sub edx, 96
invoke TransparentBlt, hdcMem, 0, edx, HILL_BIG_W, HILL_BIG_H, \
       hdcBackground, 0, BG_ROW_HILL_BIG, HILL_BIG_W, HILL_BIG_H, 00FF00FFh

; Bushes moved slightly further down (additional ~10px)
invoke TransparentBlt, hdcMem, 280, 446, BUSH_SMALL_W, BUSH_SMALL_H, \
       hdcBackground, 0, BG_ROW_BUSH_SMALL, BUSH_SMALL_W, BUSH_SMALL_H, 00FF00FFh
invoke TransparentBlt, hdcMem, 520, 446, BUSH_LONG_W, BUSH_LONG_H, \
       hdcBackground, 0, BG_ROW_BUSH_LONG, BUSH_LONG_W, BUSH_LONG_H, 00FF00FFh

ls_castle_done:

 ; Level select container, centered more vertically above the ground
 invoke DrawRectangle, 340, 160, 280, 260, colorBlackLine
 invoke DrawRectangle, 344, 164, 272, 252, colorBanner
 invoke DrawRectangle, 348, 168, 264, 4,   colorBannerDark
 invoke DrawRectangle, 348, 168, 4,   248, colorBannerDark

 ; Center "LEVEL SELECT" roughly within the 280px-wide container
 ; Container X: 340..620, center ~480. With ~176px text width, left ≈ 392 -> use 400.
 invoke DrawTextBitmap, addr levelSelectTitle, 400, 186

 mov eax, levelSelectSelection
 imul eax, 50
 add eax, 240
 mov ebx, eax

 mov eax, hUISheet
 test eax, eax
 jz level_cursor_done

 mov ecx, ebx
 sub ecx, 2
 invoke TransparentBlt, hdcMem, 380, ecx, UI_CURSOR_W, UI_CURSOR_H, \
 hdcUI, 0, UI_ROW_HUD, UI_CURSOR_W, UI_CURSOR_H, 00FF00FFh
level_cursor_done:

 lea esi, buffer
 mov byte ptr [esi], 'L'
 mov byte ptr [esi + 1], 'E'
 mov byte ptr [esi + 2], 'V'
 mov byte ptr [esi + 3], 'E'
 mov byte ptr [esi + 4], 'L'
 mov byte ptr [esi + 5], ' '
 mov byte ptr [esi + 6], '1'
 mov byte ptr [esi + 7], 0
invoke DrawTextBitmap, addr buffer, 420, 240

 mov byte ptr [esi + 6], '2'
invoke DrawTextBitmap, addr buffer, 420, 290

 mov byte ptr [esi + 6], '3'
invoke DrawTextBitmap, addr buffer, 420, 340

 mov byte ptr [esi + 6], '4'
invoke DrawTextBitmap, addr buffer, 420, 390

 ret

DrawLevelSelectScreen endp

DrawInstructionsScreen proc uses ebx ecx edx esi edi

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorSky

 invoke DrawRectangle, 0, 500, WINDOW_WIDTH, 100, colorGround

 invoke DrawTextBitmap, addr instructText1, 320, 80

 invoke DrawTextBitmap, addr instructText2, 180, 180
 invoke DrawTextBitmap, addr instructText3, 300, 210
 invoke DrawTextBitmap, addr instructText4, 290, 240
 invoke DrawTextBitmap, addr instructText5, 260, 270

 invoke DrawTextBitmap, addr instructText6, 260, 350

 ret

DrawInstructionsScreen endp

UpdateFlagpoleSequence proc uses ebx ecx edx esi edi
 local flagDrawY:DWORD

 mov eax, flagpoleState

 cmp eax, 1
 jne flag_check_slide

 mov ebx, flagpoleTopTileY
 test ebx, ebx
 jz flag_init_done
 cmp flagY, ebx
 jge flag_init_done
 mov flagY, ebx
flag_init_done:
 inc flagpoleTimer
 cmp flagpoleTimer, 30
 jl flag_draw
 mov flagpoleState, 2
 mov flagpoleTimer, 0

 mov marioAnimFrame, MARIO_FLAG_SLIDE
 jmp flag_draw

flag_check_slide:

 cmp eax, 2
 jne flag_draw

 mov eax, flagScore
 test eax, eax
 jnz flag_score_already_calculated

 mov eax, flagpoleGrabY
 mov ebx, flagpoleTopTileY
 mov ecx, flagpoleBaseTileY

 test ebx, ebx
 jz flag_score_fallback
 test ecx, ecx
 jz flag_score_fallback

 mov edx, eax
 sub edx, ebx

 cmp edx, 0
 jl flag_section_1_top

 mov eax, edx
 mov edx, 0
 mov ecx, TILE_SIZE
 div ecx

 cmp eax, 5
 jge flag_section_6_base

 cmp eax, 0
 je flag_section_1_top
 cmp eax, 1
 je flag_section_2
 cmp eax, 2
 je flag_section_3
 cmp eax, 3
 je flag_section_4
 cmp eax, 4
 je flag_section_5
 jmp flag_section_6_base

flag_section_1_top:
 mov ebx, FLAGPOLE_SECTION_1
 jmp flag_score_set
flag_section_2:
 mov ebx, FLAGPOLE_SECTION_2
 jmp flag_score_set
flag_section_3:
 mov ebx, FLAGPOLE_SECTION_3
 jmp flag_score_set
flag_section_4:
 mov ebx, FLAGPOLE_SECTION_4
 jmp flag_score_set
flag_section_5:
 mov ebx, FLAGPOLE_SECTION_5
 jmp flag_score_set
flag_section_6_base:
 mov ebx, FLAGPOLE_SECTION_6
 jmp flag_score_set

flag_score_fallback:

 mov ebx, FLAGPOLE_SECTION_6

flag_score_set:
 mov flagScore, ebx

flag_score_already_calculated:

 mov eax, marioY
 add eax, flagSlideSpeed
 mov marioY, eax

 mov eax, flagY
 test eax, eax
 jnz flag_already_moving

 mov eax, flagpoleTopTileY
 test eax, eax
 jnz flag_use_top_pos
 mov eax, flagpoleGrabY
flag_use_top_pos:
 mov flagY, eax
flag_already_moving:

 mov ecx, flagpoleBaseTileY
 test ecx, ecx
 jz flag_slide_no_limit
 sub ecx, TILE_SIZE

 mov eax, flagY
 cmp eax, ecx
 jge flag_at_last_pole

 add eax, flagSlideSpeed
 mov flagY, eax
 jmp flag_check_mario

flag_at_last_pole:

 mov flagY, ecx
 jmp flag_check_mario

flag_slide_no_limit:

 mov eax, flagY
 add eax, flagSlideSpeed
 mov flagY, eax

flag_check_mario:

 mov ebx, flagpoleBaseTileY
 test ebx, ebx
 jz flag_check_ground_y

 add ebx, TILE_SIZE
 sub ebx, MARIO_HEIGHT
 cmp marioY, ebx
 jge flag_reached_bottom
 jmp flag_draw

flag_check_ground_y:

 mov ebx, GROUND_Y
 sub ebx, MARIO_HEIGHT
 cmp marioY, ebx
 jl flag_draw

flag_reached_bottom:

 mov eax, flagScore
 test eax, eax
 jz flag_score_already_added
 add score, eax
 push eax
 mov ebx, flagpoleTopTileX
 imul ebx, TILE_SIZE
 mov ecx, flagpoleTopTileY
 imul ecx, TILE_SIZE
 invoke SpawnFloatingScore, eax, ebx, ecx
 pop eax
 mov flagScore, 0
flag_score_already_added:
 mov flagpoleComplete, 1
 mov flagpoleState, 0
 mov flagpoleTimer, 0
 mov marioVelX, 0
 mov marioVelY, 0

 mov ebx, flagpoleBaseTileY
 test ebx, ebx
 jz flag_base_fallback
 sub ebx, TILE_SIZE
 mov flagY, ebx
 jmp flag_pos_set
flag_base_fallback:

 mov ebx, GROUND_Y
 sub ebx, MARIO_HEIGHT
 sub ebx, TILE_SIZE
 mov flagY, ebx
flag_pos_set:

 mov ebx, flagpoleBaseTileY
 test ebx, ebx
 jz mario_base_fallback

 add ebx, TILE_SIZE
 sub ebx, MARIO_HEIGHT

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je mario_y_no_adjust

 sub ebx, TILE_SIZE
mario_y_no_adjust:
 mov marioY, ebx
 jmp mario_pos_set
mario_base_fallback:

 mov ebx, GROUND_Y
 sub ebx, MARIO_HEIGHT

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je mario_y_fallback_no_adjust

 sub ebx, TILE_SIZE
mario_y_fallback_no_adjust:
 mov marioY, ebx
mario_pos_set:
 mov marioOnGround, 1
 mov marioJumping, 0

 mov eax, flagpoleX
 add eax, TILE_SIZE
 mov marioX, eax

 mov gameState, STATE_GAMEPLAY
 jmp flag_draw

flag_draw:

 ret

UpdateFlagpoleSequence endp

DrawPauseScreen proc uses ebx ecx edx esi edi

 invoke DrawRectangle, 340, 220, 280, 200, colorBlackLine

 invoke DrawRectangle, 344, 224, 272, 192, colorBanner

 invoke DrawRectangle, 348, 228, 264, 4, colorBannerDark
 invoke DrawRectangle, 348, 228, 4, 188, colorBannerDark

 invoke DrawTextBitmap, addr pauseText, 420, 246

 mov eax, pauseSelection
 imul eax, 60
 add eax, 300
 mov ebx, eax

 mov eax, hUISheet
 test eax, eax
 jz pause_cursor_done

 mov ecx, ebx
 sub ecx, 2
 invoke TransparentBlt, hdcMem, 380, ecx, UI_CURSOR_W, UI_CURSOR_H, \
 hdcUI, 0, UI_ROW_HUD, UI_CURSOR_W, UI_CURSOR_H, 00FF00FFh
pause_cursor_done:

 invoke DrawTextBitmap, addr pauseResume, 420, 300
 invoke DrawTextBitmap, addr pauseExit, 420, 360

 ret
DrawPauseScreen endp

DrawBackground proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local tileValue:DWORD

 mov ebx, 0
bg_tile_row:
 mov eax, TILE_ROWS
 cmp ebx, eax
 jge bg_tiles_done
 mov ecx, 0
bg_tile_col:
 mov eax, TILE_COLS
 cmp ecx, eax
 jge bg_next_row

 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx
 cmp eax, 20000
 jge bg_skip_tile
 lea esi, levelBackground
 add esi, eax
 movzx edx, byte ptr [esi]
 mov tileValue, edx

 cmp dl, 0
 je bg_skip_tile

 cmp dl, TILE_BG_CASTLE
 jne bg_skip_tile

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, cameraX
 cmp eax, -200
 jl bg_skip_tile
 cmp eax, WINDOW_WIDTH + 200
 jg bg_skip_tile
 mov screenX, eax

 mov eax, ebx
 inc eax
 imul eax, TILE_SIZE
 sub eax, cameraY
 cmp eax, -200
 jl bg_skip_tile
 cmp eax, WINDOW_HEIGHT + 200
 jg bg_skip_tile
 mov screenY, eax

bg_struct_castle:
 mov eax, screenY
 sub eax, CASTLE_H
 invoke TransparentBlt, hdcMem, screenX, eax, CASTLE_W, CASTLE_H, \
  hdcBackground, 0, BG_ROW_CASTLE, CASTLE_W, CASTLE_H, 00FF00FFh
 jmp bg_skip_tile

bg_skip_tile:
 inc ecx
 jmp bg_tile_col
bg_next_row:
 inc ebx
 jmp bg_tile_row
bg_tiles_done:
 ret

DrawBackground endp

DrawFlagpoleFlag proc uses eax ebx ecx edx
 local screenX:DWORD
 local screenY:DWORD

 mov eax, flagpoleTopTileX
 test eax, eax
 jz flag_draw_done

 mov eax, hObjectsSheet
 test eax, eax
 jz flag_draw_done

 mov ebx, flagY
 test ebx, ebx
 jnz flag_use_flagY

 mov ebx, flagpoleTopTileY
 test ebx, ebx
 jz flag_draw_done

flag_use_flagY:

calc_flag_screen_pos:

 mov eax, flagpoleTopTileX

 sub eax, 19
 sub eax, cameraX
 mov screenX, eax
 mov eax, ebx
 add eax, 30
 sub eax, cameraY
 mov screenY, eax

 cmp screenX, - 50
 jle flag_draw_done

 cmp screenX, WINDOW_WIDTH + 50
 jge flag_draw_done
 cmp screenY, - 50
 jle flag_draw_done
 cmp screenY, WINDOW_HEIGHT + 50
 jge flag_draw_done

 mov eax, OBJ_FLAGPOLE_FLAG
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

flag_draw_done:
 ret

DrawFlagpoleFlag endp

DrawLevel proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local bgDestY:DWORD

 mov eax, currentLevel
 cmp eax, 4
 je theme_preserved
 mov eax, isUnderground
 test eax, eax
 jz set_overworld_theme
 mov currentTheme, 1
 jmp theme_set
set_overworld_theme:
 mov currentTheme, 0
theme_set:
theme_preserved:

 mov eax, isUnderground
 test eax, eax
 jnz level_bg_done

 mov eax, hLevelBackgroundBitmap
 test eax, eax
 jz level_bg_done
 mov eax, cameraX
 mov edx, 0
 mov ecx, levelBackgroundWidth
 test ecx, ecx
 jz level_bg_done
 div ecx
 mov eax, edx
 push eax
 mov ecx, WINDOW_HEIGHT
 sub ecx, levelBackgroundHeight
 sub ecx, levelBackgroundOffsetY
 mov eax, currentLevel
 cmp eax, 1
 je bg_add_offset
 cmp eax, 4
 jne bg_dest_y_set
bg_add_offset:
 add ecx, -3
bg_dest_y_set:
 mov bgDestY, ecx
 mov ebx, 0
 mov edi, 0
 mov esi, 0
bg_tile_loop:
 cmp esi, WINDOW_WIDTH
 jge bg_tile_done
 mov eax, [esp]
 mov edx, levelBackgroundWidth
 sub edx, eax
 push edx
 mov edx, WINDOW_WIDTH
 sub edx, esi
 pop ecx
 cmp ecx, edx
 jle bg_tile_width_ok
 mov ecx, edx
bg_tile_width_ok:
 push eax
 push ebx
 push ecx
 push edi
 push esi
 mov edx, bgDestY
 mov esi, levelBackgroundHeight
 invoke BitBlt, hdcMem, edi, edx, ecx, esi, hdcLevelBackground, eax, ebx, SRCCOPY
 pop esi
 pop edi
 pop ecx
 pop ebx
 pop eax
 pop edx
 add edi, ecx
 add esi, ecx
 add eax, ecx
 mov edx, levelBackgroundWidth
 cmp eax, edx
 jl bg_tile_continue
 sub eax, edx
bg_tile_continue:
 mov [esp], eax
 jmp bg_tile_loop
bg_tile_done:
 pop eax
level_bg_done:

 mov eax, TILE_ROWS
 test eax, eax
 jz skip_castle_tiles
 mov eax, TILE_COLS
 test eax, eax
 jz skip_castle_tiles

 mov ebx, 0
castle_tile_row:
 mov eax, TILE_ROWS
 cmp ebx, eax
 jge castle_tiles_done
 mov ecx, 0
castle_tile_col:
 mov eax, TILE_COLS
 cmp ecx, eax
 jge castle_next_row
 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx

 cmp eax, 20000
 jge castle_skip_tile
 lea esi, level1
 add esi, eax
 movzx edx, byte ptr [esi]
 cmp dl, 0
 je castle_skip_tile

 cmp dl, TILE_MARIO_SPAWN
 je castle_skip_tile
 cmp dl, 37
 je castle_skip_tile
 cmp dl, 38
 je castle_skip_tile
 cmp dl, 39
 je castle_skip_tile

 cmp dl, TILE_BG_CASTLE
 jne castle_skip_tile

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, cameraX
 mov screenX, eax

 mov eax, ebx
 add eax, backgroundTileRowOffset
 inc eax
 imul eax, TILE_SIZE
 sub eax, cameraY
 mov screenY, eax

castle_cull_check:
 mov eax, screenX
 add eax, CASTLE_W
 cmp eax, 0
 jle castle_skip_tile
 mov eax, screenX
 cmp eax, WINDOW_WIDTH
 jge castle_skip_tile
 mov eax, screenY
 sub eax, CASTLE_H
 cmp eax, WINDOW_HEIGHT
 jge castle_skip_tile
 mov eax, screenY
 cmp eax, 0
 jle castle_skip_tile
 jmp t_bg_castle

castle_skip_tile:
 inc ecx
 jmp castle_tile_col
castle_next_row:
 inc ebx
 jmp castle_tile_row
castle_tiles_done:
skip_castle_tiles:

 call DrawPiranhasBehindPipes

 ; Check if Mario is in pipe transition - draw him behind all tiles during entire transition
 mov eax, pipeTransition
 test eax, eax
 jz draw_mario_after_tiles_check
 ; During any pipe transition, draw Mario behind all tiles
 call DrawMario

draw_mario_after_tiles_check:

 mov eax, TILE_ROWS
 test eax, eax
 jz skip_tiles
 mov eax, TILE_COLS
 test eax, eax
 jz skip_tiles

 mov ebx, 0
tile_row:
 mov eax, TILE_ROWS
 cmp ebx, eax
 jge tiles_done
 mov ecx, 0
tile_col:
 mov eax, TILE_COLS
 cmp ecx, eax
 jge next_row
 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx

 cmp eax, 20000
 jge skip_tile
 lea esi, level1
 add esi, eax
 movzx edx, byte ptr [esi]
 cmp dl, 0
 je skip_tile

 cmp dl, TILE_MARIO_SPAWN
 je skip_tile
 cmp dl, 37
 je skip_tile
 cmp dl, 38
 je skip_tile
 cmp dl, 39
 je skip_tile

 cmp dl, TILE_BG_CLOUD_S
 jb not_bg_tile
 cmp dl, TILE_BG_CASTLE
 jbe skip_tile
 ja not_bg_tile
not_bg_tile:

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, cameraX
 cmp eax, - TILE_SIZE
 jle skip_tile
 cmp eax, WINDOW_WIDTH
 jge skip_tile
 mov screenX, eax

 mov eax, ebx
 imul eax, TILE_SIZE
 sub eax, cameraY
 cmp eax, - TILE_SIZE
 jle skip_tile
 cmp eax, WINDOW_HEIGHT
 jge skip_tile
 mov screenY, eax

 cmp dl, TILE_GROUND
 je t_ground
 cmp dl, TILE_BRICK
 je t_plat
 cmp dl, TILE_COIN
 je t_coin
 cmp dl, TILE_STAIR
 je t_stair

 cmp dl, TILE_PIPE_VERT_TL
 je t_pipe_cap_left
 cmp dl, TILE_PIPE_VERT_TR
 je t_pipe_cap_right
 cmp dl, TILE_PIPE_VERT_BL
 je t_pipe_body_left
 cmp dl, TILE_PIPE_VERT_BR
 je t_pipe_body_right
 cmp dl, TILE_PIPE_HORIZ_TL
 je t_sideways_top
 cmp dl, TILE_PIPE_HORIZ_BL
 je t_sideways_bottom
 cmp dl, TILE_PIPE_HORIZ_TR
 je t_horiz_body_top
 cmp dl, TILE_PIPE_HORIZ_BR
 je t_horiz_body_bottom
 cmp dl, TILE_PIPE_IN
 je skip_tile
 cmp dl, TILE_PIPE_OUT
 je skip_tile
 cmp dl, TILE_PIPE_HORIZ_IN
 je skip_tile

 cmp dl, TILE_LUCKY_COIN
 je t_lucky_block
 cmp dl, TILE_LUCKY_MULTICOIN
 je t_lucky_block
 cmp dl, TILE_LUCKY_MULTICOIN2
 je t_lucky_block
 cmp dl, TILE_LUCKY_MUSHROOM
 je t_lucky_block
 cmp dl, TILE_LUCKY_FLOWER
 je t_lucky_block
 cmp dl, TILE_LUCKY_STAR
 je t_lucky_block
 cmp dl, TILE_LUCKY_GOLDMUSH
 je t_lucky_block
 cmp dl, TILE_LUCKY_1UP
 je t_lucky_block
 cmp dl, TILE_LUCKY_INVISIBLE
 jne check_used_lucky_visible

 push eax
 push edi
 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 pop edi
 pop eax
 je skip_tile
 mov dl, TILE_LUCKY_USED
 jmp t_lucky_block
check_used_lucky_visible:
 cmp dl, TILE_LUCKY_USED
 je t_lucky_block

 cmp dl, TILE_FLAGPOLE_BASE
 je t_flagpole_base
 cmp dl, TILE_FLAGPOLE_POLE
 je t_flagpole_pole
 cmp dl, TILE_FLAGPOLE_TOP
 je t_flagpole_top
 cmp dl, TILE_FLAGPOLE_FLAG
 je skip_tile
 cmp dl, TILE_CASTLE_FLAG
 je t_castle_flag
 cmp dl, TILE_END_BLOCK
 je t_end_block

 cmp dl, TILE_BRICK2
 je t_brick2
 cmp dl, TILE_HIDDEN_LUCKY_MUSHROOM
 je t_brick2
 cmp dl, TILE_HIDDEN_LUCKY_FLOWER
 je t_brick2
 cmp dl, TILE_HIDDEN_LUCKY_STAR
 je t_brick2
 cmp dl, TILE_HIDDEN_LUCKY_GOLDMUSH
 je t_brick2
 cmp dl, TILE_HIDDEN_LUCKY_1UP
 je t_brick2
 cmp dl, TILE_PIPE_DECOR1
 je t_pipe_decor1
 cmp dl, TILE_PIPE_DECOR2
 je t_pipe_decor2
 cmp dl, TILE_PIPE_DECOR3
 je t_pipe_decor3

 cmp dl, TILE_MARIO_SPAWN
 je skip_tile
 cmp dl, TILE_DEATH
 je t_death_block
 cmp dl, TILE_INVISIBLE_WALL
 je t_invisible_wall
 cmp dl, TILE_INVISIBLE_WALL_2
 je t_invisible_wall_2

 cmp dl, TILE_LEAF_LEFT
 je t_tree_leaf_left
 cmp dl, TILE_LEAF_MIDDLE
 je t_tree_leaf_mid
 cmp dl, TILE_LEAF_RIGHT
 je t_tree_leaf_right
 cmp dl, TILE_BARK
 je t_tree_bark

 cmp dl, TILE_LAVA_TOP
 je t_lava_top
 cmp dl, TILE_LAVA_BOTTOM
 je t_lava_bottom
 cmp dl, TILE_FIREBLOCK
 je skip_tile

 cmp dl, TILE_PLATFORM_SPAWN
 je skip_tile

 cmp dl, TILE_FIREBAR_SPAWN
 je skip_tile

 cmp dl, TILE_GOOMBA_SPAWN
 je skip_tile

 cmp dl, TILE_PIRANHA_SPAWN
 je skip_tile
 cmp dl, TILE_BOWSER_SPAWN
 je skip_tile
 cmp dl, TILE_FLY_TURTLE_SPAWN
 je skip_tile
 cmp dl, TILE_TURTLE_SPAWN
 je skip_tile

 cmp dl, TILE_PIPE_IN
 je skip_tile
 cmp dl, TILE_PIPE_OUT
 je skip_tile
 cmp dl, TILE_PIPE_HORIZ_IN
 je skip_tile
 cmp dl, TILE_LAVA_TOP
 je t_lava_top
 cmp dl, TILE_LAVA_BOTTOM
 je t_lava_bottom

 cmp dl, TILE_GOOMBA_SPAWN
 je skip_tile

 cmp dl, TILE_PIRANHA_SPAWN
 je skip_tile
 cmp dl, TILE_BOWSER_SPAWN
 je skip_tile
 cmp dl, TILE_FLY_TURTLE_SPAWN
 je skip_tile
 cmp dl, TILE_TURTLE_SPAWN
 je skip_tile

 jmp skip_tile

t_ground:

 invoke DrawGroundTile, screenX, screenY
 jmp skip_tile

t_brick:

 jmp t_plat

t_plat:

 push ebx
 push ecx
 push esi

 xor esi, esi
 mov eax, screenY
check_brick_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge brick_no_bounce

 cmp dword ptr [brickBounceRow + esi * 4], ebx
 jne next_brick_bounce_slot
 cmp dword ptr [brickBounceCol + esi * 4], ecx
 jne next_brick_bounce_slot

 mov edx, [brickBounceFrame + esi * 4]
 cmp edx, - 1
 jle brick_no_bounce
 cmp edx, BOUNCE_KEYFRAMES
 jle brick_bounce_index_ok
 mov edx, BOUNCE_KEYFRAMES
brick_bounce_index_ok:
 lea eax, bounceOffsets
 mov edx, [eax + edx * 4]
 mov eax, screenY
 add eax, edx
 jmp brick_no_bounce
next_brick_bounce_slot:
 inc esi
 jmp check_brick_bounce
brick_no_bounce:
 mov edi, eax

 pop esi
 pop ecx
 pop ebx

 invoke DrawBrickBlockTile, screenX, edi
 jmp skip_tile

t_hidden_lucky:

 push ebx
 push ecx
 push esi

 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx
 lea edi, qUsedMap
 add edi, eax
 movzx eax, byte ptr [edi]
 push eax

 xor esi, esi
 mov eax, screenY
check_hidden_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge hidden_no_bounce
 cmp dword ptr [brickBounceRow + esi * 4], ebx
 jne next_hidden_bounce
 cmp dword ptr [brickBounceCol + esi * 4], ecx
 jne next_hidden_bounce
 mov edx, [brickBounceFrame + esi * 4]
 cmp edx, - 1
 jle hidden_no_bounce
 cmp edx, BOUNCE_KEYFRAMES
 jle hidden_bounce_index_ok
 mov edx, BOUNCE_KEYFRAMES
hidden_bounce_index_ok:
 lea eax, bounceOffsets
 mov edx, [eax + edx * 4]
 mov eax, screenY
 add eax, edx
 jmp hidden_no_bounce
next_hidden_bounce:
 inc esi
 jmp check_hidden_bounce
hidden_no_bounce:
 mov edi, eax

 pop eax
 pop esi
 pop ecx
 pop ebx

 test eax, eax
 jnz t_hidden_used

 invoke DrawBrickBlockTile, screenX, edi
 jmp skip_tile

t_hidden_used:

 invoke DrawLuckyBlockTile, screenX, edi, 1
 jmp skip_tile

t_qblock:

 jmp t_lucky_block

t_death_block:

 jmp skip_tile

t_invisible_wall:

 jmp skip_tile

t_invisible_wall_2:

 jmp skip_tile

t_castle_flag:

 mov eax, castleFlagShow
 test eax, eax
 jz skip_tile

 push ebx
 push ecx
 push edx
 mov eax, castleFlagY
 test eax, eax
 jz use_tile_y
 mov ebx, eax
 jmp calc_castle_flag_screen
use_tile_y:

 mov eax, ebx

 imul eax, TILE_SIZE
 mov ebx, eax
calc_castle_flag_screen:
 mov eax, castleFlagX
 test eax, eax
 jz use_tile_x
 jmp calc_castle_flag_screen2
use_tile_x:

 mov eax, ecx
 imul eax, TILE_SIZE
calc_castle_flag_screen2:
 sub eax, cameraX
 mov edx, screenX
 mov screenX, eax
 mov eax, ebx
 sub eax, cameraY
 mov ebx, screenY
 mov screenY, eax

 mov eax, OBJ_CASTLE_FLAG
 mov ecx, 36
 imul eax, ecx
 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

 mov screenX, edx
 mov screenY, ebx
 pop edx
 pop ecx
 pop ebx
 jmp skip_tile

t_end_block:

 push ebx
 push ecx
 mov eax, OBJ_END_BLOCK
 mov ebx, 36
 imul eax, ebx
 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh
 pop ecx
 pop ebx
 jmp skip_tile

t_lucky_block:

 push ebx
 push ecx
 push esi

 mov eax, ebx
 imul eax, dword ptr [TILE_COLS]
 add eax, ecx
 lea edi, qUsedMap
 add edi, eax
 movzx eax, byte ptr [edi]
 push eax

 xor esi, esi
 mov eax, screenY
check_lucky_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge lucky_no_bounce
 cmp dword ptr [brickBounceRow + esi * 4], ebx
 jne next_lucky_bounce
 cmp dword ptr [brickBounceCol + esi * 4], ecx
 jne next_lucky_bounce
 mov edx, [brickBounceFrame + esi * 4]
 cmp edx, - 1
 jle lucky_no_bounce
 cmp edx, BOUNCE_KEYFRAMES
 jle lucky_bounce_index_ok
 mov edx, BOUNCE_KEYFRAMES
lucky_bounce_index_ok:
 lea eax, bounceOffsets
 mov edx, [eax + edx * 4]
 mov eax, screenY
 add eax, edx
 jmp lucky_no_bounce
next_lucky_bounce:
 inc esi
 jmp check_lucky_bounce
lucky_no_bounce:
 mov tempY, eax

 pop eax
 mov edi, eax
 pop esi
 pop ecx
 pop ebx

 mov eax, ebx
 imul eax, dword ptr [TILE_COLS]
 add eax, ecx

 cmp eax, 20000
 jge skip_tile
 lea esi, level1
 add esi, eax
 movzx edx, byte ptr [esi]

 mov eax, edi

 cmp edx, TILE_LUCKY_USED
 je lucky_draw_used

 test eax, eax
 jnz lucky_draw_used

 cmp edx, TILE_LUCKY_MULTICOIN
 je lucky_draw_brick
 cmp edx, TILE_LUCKY_MULTICOIN2
 je lucky_draw_brick2

 mov eax, tempY
 invoke DrawLuckyBlockTile, screenX, eax, 0
 jmp skip_tile

lucky_draw_brick:

 mov eax, tempY
 invoke DrawBrickBlockTile, screenX, eax
 jmp skip_tile

lucky_draw_brick2:

 mov eax, tempY
 invoke DrawBrick2Tile, screenX, eax
 jmp skip_tile

lucky_draw_used:

 mov eax, tempY
 invoke DrawLuckyBlockTile, screenX, eax, 1
 jmp skip_tile

t_pipe_cap_left:

 invoke DrawTileFromSheet, screenX, screenY, 0, TILE_ROW_PIPE1
 jmp skip_tile

t_pipe_body_left:

 invoke DrawTileFromSheet, screenX, screenY, 0, TILE_ROW_PIPE2
 jmp skip_tile

t_pipe_cap_right:

 invoke DrawTileFromSheet, screenX, screenY, 1, TILE_ROW_PIPE1
 jmp skip_tile

t_pipe_body_right:

 invoke DrawTileFromSheet, screenX, screenY, 1, TILE_ROW_PIPE2
 jmp skip_tile

t_sideways_top:

 invoke DrawTileFromSheet, screenX, screenY, 2, TILE_ROW_PIPE1
 jmp skip_tile

t_sideways_bottom:

 invoke DrawTileFromSheet, screenX, screenY, 3, TILE_ROW_PIPE1
 jmp skip_tile

t_horiz_body_top:

 invoke DrawTileFromSheet, screenX, screenY, 2, TILE_ROW_PIPE2
 jmp skip_tile

t_horiz_body_bottom:

 invoke DrawTileFromSheet, screenX, screenY, 3, TILE_ROW_PIPE2
 jmp skip_tile

t_lava_top:

 push ebx
 push ecx
 mov eax, 0
 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcTiles, eax, TILE_ROW_LAVA, 32, 32, 00FF00FFh
 pop ecx
 pop ebx
 jmp skip_tile

t_lava_bottom:

 push ebx
 push ecx
 mov eax, 34
 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcTiles, eax, TILE_ROW_LAVA, 32, 32, 00FF00FFh
 pop ecx
 pop ebx
 jmp skip_tile

t_brick2:

 push ebx
 push ecx
 push esi

 xor esi, esi
 mov eax, screenY
check_brick2_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge brick2_no_bounce

 cmp dword ptr [brickBounceRow + esi * 4], ebx
 jne next_brick2_bounce_slot
 cmp dword ptr [brickBounceCol + esi * 4], ecx
 jne next_brick2_bounce_slot

 mov edx, [brickBounceFrame + esi * 4]
 cmp edx, - 1
 jle brick2_no_bounce
 cmp edx, BOUNCE_KEYFRAMES
 jle brick2_bounce_index_ok
 mov edx, BOUNCE_KEYFRAMES
brick2_bounce_index_ok:
 lea eax, bounceOffsets
 mov edx, [eax + edx * 4]
 mov eax, screenY
 add eax, edx
 jmp brick2_no_bounce
next_brick2_bounce_slot:
 inc esi
 jmp check_brick2_bounce
brick2_no_bounce:
 mov edi, eax

 pop esi
 pop ecx
 pop ebx

 invoke DrawBrick2Tile, screenX, edi
 jmp skip_tile

t_pipe_decor1:

 invoke DrawTileFromSheet, screenX, screenY, 4, TILE_ROW_PIPE2
 jmp skip_tile

t_pipe_decor2:

 invoke DrawTileFromSheet, screenX, screenY, 5, TILE_ROW_PIPE2
 jmp skip_tile

t_pipe_decor3:

 invoke DrawTileFromSheet, screenX, screenY, 6, TILE_ROW_PIPE2
 jmp skip_tile

t_bg_castle:
 mov eax, ebx
 add eax, backgroundTileRowOffset
 inc eax
 imul eax, TILE_SIZE
 sub eax, cameraY
 sub eax, CASTLE_H
 invoke TransparentBlt, hdcMem, screenX, eax, CASTLE_W, CASTLE_H, \
  hdcBackground, 0, BG_ROW_CASTLE, CASTLE_W, CASTLE_H, 00FF00FFh
 jmp castle_skip_tile

t_stair:

 invoke DrawStairTile, screenX, screenY
 jmp skip_tile
t_flagpole_base:
 invoke DrawFlagpoleBase, screenX, screenY
 jmp skip_tile
t_flagpole_pole:
 invoke DrawFlagpolePole, screenX, screenY
 jmp skip_tile
t_flagpole_top:
 invoke DrawFlagpoleTop, screenX, screenY
 jmp skip_tile
t_hill:

 jmp skip_tile
t_coin:

 invoke DrawCoinTile, screenX, screenY
 jmp skip_tile

t_gold_coin:

 mov eax, screenX
 add eax, 4
 mov edx, screenY
 add edx, 4

 push colorGoldGlow
 push 24
 push 24
 push edx
 push eax
 call DrawRectangle

 mov eax, screenX
 add eax, 6
 mov edx, screenY
 add edx, 6
 push colorBlackLine
 push 20
 push 20
 push edx
 push eax
 call DrawRectangle

 mov eax, screenX
 add eax, 8
 mov edx, screenY
 add edx, 8
 push colorGoldCoin
 push 16
 push 16
 push edx
 push eax
 call DrawRectangle

 mov eax, screenX
 add eax, 10
 mov edx, screenY
 add edx, 10
 push colorWhite
 push 6
 push 6
 push edx
 push eax
 call DrawRectangle
 jmp skip_tile

t_tree_leaf_left:

 invoke DrawTreeLeafLeft, screenX, screenY
 jmp skip_tile

t_tree_leaf_mid:

 invoke DrawTreeLeafMiddle, screenX, screenY
 jmp skip_tile

t_tree_leaf_right:

 invoke DrawTreeLeafRight, screenX, screenY
 jmp skip_tile

t_tree_bark:

 invoke DrawTreeBark, screenX, screenY
 jmp skip_tile

t_struct_castle:

 mov eax, screenY
 sub eax, CASTLE_H
 invoke TransparentBlt, hdcMem, screenX, eax, CASTLE_W, CASTLE_H, \
 hdcBackground, 0, BG_ROW_CASTLE, CASTLE_W, CASTLE_H, 00FF00FFh
 jmp skip_tile

skip_tile:
 inc ecx
 jmp tile_col
next_row:
 inc ebx
 jmp tile_row
tiles_done:
 jmp after_tiles
skip_tiles:

after_tiles:

 call DrawFlagpoleFlag

 call DrawExplosions
 call DrawFireworks

 call DrawBowserFireballs

 ; Draw Mario after tiles, but skip if he was already drawn behind tiles during pipe transition
 mov eax, pipeTransition
 test eax, eax
 jz draw_mario_normal
 ; During pipe transition, Mario was already drawn behind tiles, so skip here
 jmp mario_draw_skipped

draw_mario_normal:
 call DrawMario

mario_draw_skipped:
 call DrawHUD

 call DrawGoldenMushroom

 call DrawGoombas

 call DrawEnemies

 call DrawPlatforms

 call DrawFirebars

 call DrawCoinPopups

 call DrawFloatingScores

 call DrawBrickDebris

 call DrawFireballs

 call DrawPowerups

 call DrawCameraBounds

 ; Underground: draw fireballs again on top of camera bounds so they are visible
 mov eax, isUnderground
 test eax, eax
 jz draw_level_done
 call DrawFireballs

draw_level_done:
 ret

DrawLevel endp

DrawCameraBounds proc uses eax ebx ecx edx
 local barTop:DWORD
 local barHeight:DWORD

 mov eax, isUnderground
 test eax, eax
 jnz draw_underground_bounds

 mov eax, cameraSnapYOverworld
 sub eax, cameraY
 mov barTop, eax

 cmp eax, WINDOW_HEIGHT
 jge bounds_done
 cmp eax, 0
 jl bounds_done

 mov ebx, WINDOW_HEIGHT
 sub ebx, eax
 mov barHeight, ebx

 invoke DrawRectangle, 0, barTop, WINDOW_WIDTH, barHeight, 0
 jmp bounds_done

draw_underground_bounds:

 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT
 sub eax, cameraY
 cmp eax, 0
 jle skip_top_bar
 cmp eax, WINDOW_HEIGHT
 jge skip_top_bar
 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, eax, 0

skip_top_bar:
 mov eax, cameraSnapYUnderground
 sub eax, cameraY
 mov barTop, eax

 cmp eax, WINDOW_HEIGHT
 jge bounds_done
 cmp eax, 0
 jl bounds_done

 mov ebx, WINDOW_HEIGHT
 sub ebx, eax
 invoke DrawRectangle, 0, barTop, WINDOW_WIDTH, ebx, 0

bounds_done:
 ret
DrawCameraBounds endp

DrawGoldenMushroom proc uses eax ebx ecx edx

 mov eax, hObjectsSheet
 test eax, eax
 jz gm_done

 mov eax, goldenMushroomActive
 test eax, eax
 jz gm_done

 mov eax, goldenMushroomX
 sub eax, cameraX
 mov ebx, goldenMushroomY
 sub ebx, cameraY

 cmp eax, - 32
 jl gm_done

 cmp eax, WINDOW_WIDTH
 jg gm_done

 push eax
 push ebx
 mov ecx, animFrame
 and ecx, 7
 cmp ecx, 4
 jl gm_no_glow

 sub eax, 4
 sub ebx, 4
 invoke DrawRectangle, eax, ebx, 40, 40, colorGoldGlow
gm_no_glow:
 pop ebx
 pop eax

 mov ecx, OBJ_GOLDMUSH
 imul ecx, 36
 invoke TransparentBlt, hdcMem, eax, ebx, 32, 32, \
 hdcObjects, ecx, OBJ_POWERUP_Y, 32, 32, 00FF00FFh

gm_done:
 ret

DrawGoldenMushroom endp

DrawCoinPopups proc uses eax ebx ecx edx esi

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_popup_done

 xor esi, esi
draw_popup_loop:
 cmp esi, MAX_COIN_POPUPS
 jge draw_popup_done
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je next_popup_draw

 mov eax, [coinPopupX + esi * 4]
 sub eax, cameraX

 cmp eax, - 16
 jl next_popup_draw

 cmp eax, WINDOW_WIDTH
 jg next_popup_draw
 mov ebx, [coinPopupY + esi * 4]
 sub ebx, cameraY
 cmp ebx, - 32
 jl next_popup_draw
 cmp ebx, WINDOW_HEIGHT
 jg next_popup_draw

 push esi
 mov ecx, animFrame
 shr ecx, 2
 and ecx, 3

 push eax
 mov edx, ecx
 imul edx, 20

 invoke TransparentBlt, hdcMem, eax, ebx, 16, 32, \
 hdcObjects, edx, OBJ_POPUP_COIN_Y, 16, 32, 00FF00FFh
 pop eax
 pop esi

next_popup_draw:
 inc esi
 jmp draw_popup_loop
draw_popup_done:
 ret

DrawCoinPopups endp

SpawnFloatingScore proc uses eax ebx ecx edx esi, scoreVal:DWORD, xPos:DWORD, yPos:DWORD
 xor esi, esi
find_float_slot:
 cmp esi, MAX_FLOAT_SCORES
 jge spawn_float_done
 cmp dword ptr [floatScoreTimer + esi * 4], -1
 je found_float_slot
 inc esi
 jmp find_float_slot

found_float_slot:
 mov eax, xPos
 mov [floatScoreX + esi * 4], eax
 mov eax, yPos
 mov [floatScoreY + esi * 4], eax
 mov eax, scoreVal
 mov [floatScoreValue + esi * 4], eax
 mov dword ptr [floatScoreTimer + esi * 4], FLOAT_SCORE_DURATION

spawn_float_done:
 ret
SpawnFloatingScore endp

CheckScoreMilestone proc uses eax ebx ecx edx
 local currentMilestone:DWORD

 mov eax, score
 xor edx, edx
 mov ecx, 50000
 div ecx
 mov currentMilestone, eax

 mov eax, currentMilestone
 cmp eax, lastScoreMilestone
 jle milestone_check_done

 inc lives
 call PlayOneUpSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, 9999, eax, ebx

 mov eax, currentMilestone
 mov lastScoreMilestone, eax

milestone_check_done:
 ret
CheckScoreMilestone endp

UpdateFloatingScores proc uses eax ebx ecx edx esi
 xor esi, esi
update_float_loop:
 cmp esi, MAX_FLOAT_SCORES
 jge update_float_done
 cmp dword ptr [floatScoreTimer + esi * 4], -1
 je next_float_update

 mov eax, [floatScoreY + esi * 4]
 sub eax, FLOAT_SCORE_SPEED
 mov [floatScoreY + esi * 4], eax

 dec dword ptr [floatScoreTimer + esi * 4]
 cmp dword ptr [floatScoreTimer + esi * 4], 0
 jg next_float_update
 mov dword ptr [floatScoreTimer + esi * 4], -1

next_float_update:
 inc esi
 jmp update_float_loop
update_float_done:
 ret
UpdateFloatingScores endp

DrawFloatingScores proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local scorePtr:DWORD

 mov eax, hdcFont
 test eax, eax
 jz draw_float_scores_done

 xor esi, esi
draw_float_score_loop:
 cmp esi, MAX_FLOAT_SCORES
 jge draw_float_scores_done
 cmp dword ptr [floatScoreTimer + esi * 4], -1
 je next_float_score

 mov eax, [floatScoreX + esi * 4]
 sub eax, cameraX
 cmp eax, -50
 jl next_float_score
 cmp eax, WINDOW_WIDTH
 jg next_float_score
 mov screenX, eax

 mov eax, [floatScoreY + esi * 4]
 sub eax, cameraY
 cmp eax, -50
 jl next_float_score
 cmp eax, WINDOW_HEIGHT
 jg next_float_score
 mov screenY, eax

 mov eax, [floatScoreValue + esi * 4]
 cmp eax, 9999
 je float_text_1up
 cmp eax, 100
 je float_text_100
 cmp eax, 200
 je float_text_200
 cmp eax, 400
 je float_text_400
 cmp eax, 800
 je float_text_800
 cmp eax, 1000
 je float_text_1000
 cmp eax, 2000
 je float_text_2000
 cmp eax, 5000
 je float_text_5000
 jmp float_text_custom

float_text_1up:
 lea eax, scoreText1UP
 jmp draw_float_text
float_text_100:
 lea eax, scoreText100
 jmp draw_float_text
float_text_200:
 lea eax, scoreText200
 jmp draw_float_text
float_text_400:
 lea eax, scoreText400
 jmp draw_float_text
float_text_800:
 lea eax, scoreText800
 jmp draw_float_text
float_text_1000:
 lea eax, scoreText1000
 jmp draw_float_text
float_text_2000:
 lea eax, scoreText2000
 jmp draw_float_text
float_text_5000:
 lea eax, scoreText5000
 jmp draw_float_text

float_text_custom:
 push esi
 mov eax, [floatScoreValue + esi * 4]
 lea edi, scoreTextBuffer
 call IntToString
 pop esi
 lea eax, scoreTextBuffer
 jmp draw_float_text

draw_float_text:
 mov scorePtr, eax
 push esi
 invoke DrawFontText, scorePtr, screenX, screenY
 pop esi

next_float_score:
 inc esi
 jmp draw_float_score_loop

draw_float_scores_done:
 ret
DrawFloatingScores endp

IntToString proc uses ebx ecx edx esi
 local tempBuf[12]:BYTE

 lea esi, tempBuf
 add esi, 11
 mov byte ptr [esi], 0
 dec esi

 mov ecx, 10
int_to_str_loop:
 xor edx, edx
 div ecx
 add dl, '0'
 mov [esi], dl
 dec esi
 test eax, eax
 jnz int_to_str_loop

 inc esi
copy_str_loop:
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 test al, al
 jnz copy_str_loop

 ret
IntToString endp

DrawBrickDebris proc uses eax ebx ecx edx esi
 mov eax, hObjectsSheet
 test eax, eax
 jz draw_debris_done

 xor esi, esi
draw_debris_loop:
 cmp esi, MAX_BRICK_DEBRIS
 jge draw_debris_done
 cmp dword ptr [debrisFrame + esi * 4], - 1
 je next_debris_draw

 mov eax, [debrisX + esi * 4]
 sub eax, cameraX

 cmp eax, - 16
 jl next_debris_draw

 cmp eax, WINDOW_WIDTH
 jg next_debris_draw
 mov ebx, [debrisY + esi * 4]
 sub ebx, cameraY
 cmp ebx, - 16
 jl next_debris_draw
 cmp ebx, WINDOW_HEIGHT
 jg next_debris_draw

 push eax
 push ebx
 push esi
 mov ecx, [debrisFrame + esi * 4]
 and ecx, 3

 mov edx, isUnderground
 test edx, edx
 jz debris_overworld

 mov edx, OBJ_BREAK_UNDER1
 add edx, ecx
 jmp debris_sprite_set

debris_overworld:
 mov edx, OBJ_BREAK_OVER1
 add edx, ecx

debris_sprite_set:
 mov eax, edx
 mov edx, 20
 imul eax, edx
 mov ecx, eax
 pop esi
 pop ebx
 pop eax

 invoke TransparentBlt, hdcMem, eax, ebx, 16, 16, \
 hdcObjects, ecx, OBJ_PARTICLE_Y, 16, 16, 00FF00FFh

next_debris_draw:
 inc esi
 jmp draw_debris_loop
draw_debris_done:
 ret

DrawBrickDebris endp

DrawFireballs proc uses eax ebx ecx edx esi edi ; include edi to avoid clobbering callers

 xor esi, esi
draw_fireball_loop:
 cmp esi, MAX_FIREBALLS
 jge draw_fireballs_done
 cmp dword ptr [fireballActive + esi * 4], 0
 je next_fireball_draw

 mov eax, [fireballX + esi * 4]
 sub eax, cameraX
 mov ebx, [fireballY + esi * 4]
 sub ebx, cameraY

 ; Skip if way off-screen (allow some margin so fireball is visible when spawning)
 cmp eax, - 24
 jl next_fireball_draw
 cmp eax, WINDOW_WIDTH + 24
 jg next_fireball_draw
 cmp ebx, - 24
 jl next_fireball_draw
 cmp ebx, WINDOW_HEIGHT + 24
 jg next_fireball_draw

 ; Underground: use fallback rect so fireball is visible (sprite can be invisible on dark bg)
 mov eax, isUnderground
 test eax, eax
 jnz draw_fireball_fallback

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_fireball_fallback

 mov eax, [fireballX + esi * 4]
 sub eax, cameraX
 mov ebx, [fireballY + esi * 4]
 sub ebx, cameraY

 mov ecx, [fireballFrame + esi * 4]
 and ecx, 3

 push eax
 mov eax, ecx
 mov edx, 20
 imul eax, edx
 mov ecx, eax
 pop eax

 invoke TransparentBlt, hdcMem, eax, ebx, 16, 16, \
 hdcObjects, ecx, OBJ_PARTICLE_Y, 16, 16, 00FF00FFh
 jmp next_fireball_draw

draw_fireball_fallback:
 ; Objects sheet missing or fireball sprite not at OBJ_PARTICLE_Y: draw visible placeholder
 mov eax, [fireballX + esi * 4]
 sub eax, cameraX
 mov ebx, [fireballY + esi * 4]
 sub ebx, cameraY
 invoke DrawRectangle, eax, ebx, 12, 12, colorFireballFallback

next_fireball_draw:
 inc esi
 jmp draw_fireball_loop

draw_fireballs_done:
 ret
DrawFireballs endp

DrawPowerups proc uses eax ebx ecx edx esi

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_powerups_done

 mov eax, mushroomActive
 test eax, eax
 jz draw_flower

 mov eax, mushroomX
 sub eax, cameraX
 mov ebx, mushroomY
 sub ebx, cameraY

 cmp eax, - 32
 jl draw_flower

 cmp eax, WINDOW_WIDTH
 jg draw_flower
 cmp ebx, - 32
 jl draw_flower
 cmp ebx, WINDOW_HEIGHT
 jg draw_flower

 mov ecx, OBJ_MUSHROOM
 imul ecx, 36
 invoke TransparentBlt, hdcMem, eax, ebx, 32, 32, \
 hdcObjects, ecx, OBJ_POWERUP_Y, 32, 32, 00FF00FFh

draw_flower:

 mov eax, flowerActive
 test eax, eax
 jz draw_star

 mov eax, flowerX
 sub eax, cameraX
 mov ebx, flowerY
 sub ebx, cameraY

 cmp eax, - 32
 jl draw_star
 cmp eax, WINDOW_WIDTH
 jg draw_star
 cmp ebx, - 32
 jl draw_star
 cmp ebx, WINDOW_HEIGHT
 jg draw_star

 mov edx, flowerFrame
 and edx, 3
 add edx, OBJ_FLOWER_BASE
 push eax
 mov eax, edx
 mov ecx, 36
 imul eax, ecx
 mov edx, eax
 pop eax

 invoke TransparentBlt, hdcMem, eax, ebx, 32, 32, \
 hdcObjects, edx, OBJ_POWERUP_Y, 32, 32, 00FF00FFh

draw_star:

 mov eax, starActive
 test eax, eax
 jz draw_oneup

 mov eax, starX
 sub eax, cameraX
 mov ebx, starY
 sub ebx, cameraY

 cmp eax, - 32
 jl draw_powerups_done
 cmp eax, WINDOW_WIDTH
 jg draw_powerups_done
 cmp ebx, - 32
 jl draw_powerups_done
 cmp ebx, WINDOW_HEIGHT
 jg draw_powerups_done

 mov edx, starFrame
 and edx, 3
 add edx, OBJ_STAR_BASE
 push eax
 mov eax, edx
 mov ecx, 36
 imul eax, ecx
 mov edx, eax
 pop eax

 invoke TransparentBlt, hdcMem, eax, ebx, 32, 32, \
 hdcObjects, edx, OBJ_POWERUP_Y, 32, 32, 00FF00FFh

draw_oneup:

 mov eax, oneUpActive
 test eax, eax
 jz draw_powerups_done
 mov eax, oneUpX
 sub eax, cameraX
 mov ebx, oneUpY
 sub ebx, cameraY
 cmp eax, - 32
 jl draw_powerups_done
 cmp eax, WINDOW_WIDTH
 jg draw_powerups_done
 cmp ebx, - 32
 jl draw_powerups_done
 cmp ebx, WINDOW_HEIGHT
 jg draw_powerups_done
 mov ecx, OBJ_1UP
 imul ecx, 36
 invoke TransparentBlt, hdcMem, eax, ebx, 32, 32, \
 hdcObjects, ecx, OBJ_POWERUP_Y, 32, 32, 00FF00FFh

draw_powerups_done:
 ret

DrawPowerups endp

InitLevel proc uses eax ebx ecx edx esi edi

 lea esi, playerName
 cmp byte ptr [esi], 'T'
 jne init_level_normal
 cmp byte ptr [esi + 1], 'E'
 jne init_level_normal
 cmp byte ptr [esi + 2], 'S'
 jne init_level_normal
 cmp byte ptr [esi + 3], 'T'
 jne init_level_normal
 cmp byte ptr [esi + 4], 0
 jne init_level_normal
 mov lives, 99
init_level_normal:

 mov eax, marioState

 cmp eax, MARIO_SMALL
 je init_level_small
 cmp eax, MARIO_SUPER
 je init_level_super
 cmp eax, MARIO_FIRE
 je init_level_fire

init_level_small:
 mov marioHitboxHeight, HITBOX_HEIGHT
 jmp init_level_hitbox_done
init_level_super:
 mov marioHitboxHeight, TILE_SIZE * 2
 jmp init_level_hitbox_done
init_level_fire:
 mov marioHitboxHeight, TILE_SIZE * 2
init_level_hitbox_done:

 mov flagpoleState, 0
 mov flagpoleComplete, 0
 mov flagpoleGrabY, 0
 mov flagpoleTimer, 0
 mov flagScore, 0
 mov flagY, 0
 mov endBlockHit, 0
 mov endSequenceDone, 0
 mov endBlockTimer, 0
 mov timerCountdownActive, 0
 mov fireworksTriggered, 0
 mov fireworksBonusActive, 0
 mov fireworkCount, 0
 mov fireworksAllDone, 0
 mov fireworkBonusIndex, 0
 mov fireworkBonusPhase, 0
 mov recordedBonusTime, 0

 mov eax, score
 xor edx, edx
 mov ecx, 50000
 div ecx
 mov lastScoreMilestone, eax

 mov eax, resumeFromSave
 test eax, eax
 jnz skip_spawn_position

 mov eax, marioSpawnRow
 cmp eax, - 1
 je spawn_not_found
 mov ebx, marioSpawnRow
 mov ecx, marioSpawnCol

 mov eax, ecx
 imul eax, TILE_SIZE
 mov marioX, eax
 mov eax, ebx
 inc eax
 imul eax, TILE_SIZE
 mov edx, marioHitboxHeight
 sub eax, edx
 mov marioY, eax

 mov eax, marioX
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge cam_x_spawn_ok
 mov eax, 0
cam_x_spawn_ok:

 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, WINDOW_WIDTH
 cmp eax, ebx
 jle cam_x_spawn_max_ok
 mov eax, ebx
cam_x_spawn_max_ok:
 mov cameraX, eax

 ; Determine underground state BEFORE snapping cameraY.
 mov eax, marioSpawnRow
 mov ebx, UNDERGROUND_START
 cmp eax, ebx
 jl spawn_overworld
 mov isUnderground, 1
 jmp spawn_underground_done
spawn_overworld:
 mov isUnderground, 0
spawn_underground_done:

 mov eax, isUnderground
 test eax, eax
 jnz cam_y_spawn_underground
 mov eax, cameraSnapYOverworld
 sub eax, WINDOW_HEIGHT
 jmp cam_y_spawn_set
cam_y_spawn_underground:
 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT
cam_y_spawn_set:
 mov cameraY, eax
cam_y_spawn_done:

mario_will_be_visible:

skip_spawn_position:

 mov goldenMushroomX, - 100
 mov goldenMushroomY, 0
 mov goldenMushroomVelY, 0
 mov goldenMushroomActive, 0
 mov goldenMushroomRising, 0
 mov goldenMushroomRiseY, 0
 mov oneUpRising, 0
 mov oneUpRiseY, 0
 mov qBlockHitCount, 0

 call ClearBrickBounces

 call InitGoombas
 ret

spawn_not_found:

 mov marioX, 100
 mov marioY, 400

 mov goldenMushroomX, - 100
 mov goldenMushroomY, 0
 mov goldenMushroomVelY, 0
 mov goldenMushroomActive, 0
 mov qBlockHitCount, 0

 mov flagpoleState, 0
 mov flagpoleTimer, 0
 mov flagScore, 0
 mov flagY, 0
 mov flagpoleBaseTileX, 0
 mov flagpoleBaseTileY, 0
 mov flagpoleTopTileX, 0
 mov flagpoleTopTileY, 0

 call ClearBrickBounces

 call InitGoombas
 ret

InitLevel endp

LoadLevelFromFile proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local currentRow:DWORD
 local currentCol:DWORD
 local currentValue:DWORD
 local maxCols:DWORD
 local levelPath:DWORD

 call ClearEnemies
 call ClearPlatforms

 mov pipeCount, 0
 mov pipeInCount, 0
 mov pipeOutCount, 0
 mov pipeHorizCount, 0

 mov marioSpawnRow, - 1
 mov marioSpawnCol, - 1

 call LoadPipes
 call LoadPlatforms
 call LoadFirebars

 ; Disable Midas in level 4
 mov eax, currentLevel
 cmp eax, 4
 jne midas_level_not4
 mov midasUsesLeft, 0
 mov midasActive, 0

midas_level_not4:

 mov eax, currentLevel
 dec eax
 cmp eax, 4
 jl theme_index_ok
 xor eax, eax
theme_index_ok:
 lea ebx, levelThemes
 mov eax, [ebx + eax * 4]
 mov currentTheme, eax

 mov eax, currentLevel
 cmp eax, 1
 jne check_level2
 lea eax, levelFilePath
 jmp set_level_base
check_level2:
 cmp eax, 2
 jne check_level3
 lea eax, levelFile2
 jmp set_level_base
check_level3:
 cmp eax, 3
 jne check_level4
 lea eax, levelFile3
 jmp set_level_base
check_level4:
 lea eax, levelFile4
set_level_base:
 mov levelPath, eax

load_level_open:

 invoke CreateFileA, levelPath, GENERIC_READ, FILE_SHARE_READ, \
 NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_level_failed
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr levelFileBuffer, 32000, addr bytesRead, NULL

 invoke CloseHandle, fileHandle

 ; Null-terminate read data so parsing stops correctly.
 ; (Buffers are larger than 32000, so this is safe.)
 mov eax, bytesRead
 mov byte ptr [levelFileBuffer + eax], 0

 mov currentRow, 0
 mov currentCol, 0
 mov maxCols, 0
 lea esi, levelFileBuffer

count_loop:
 movzx eax, byte ptr [esi]
 test al, al
 jz count_done

 cmp al, 10
 je count_newline
 cmp al, 13
 je count_next
cmp al, ','
 je count_comma
 jmp count_next

count_comma:
 inc currentCol
 jmp count_next

count_newline:
 inc currentCol

 mov eax, currentCol
 cmp eax, maxCols
 jle no_update_max
 mov maxCols, eax
no_update_max:
 inc currentRow
 mov currentCol, 0
 jmp count_next

count_next:
 inc esi
 jmp count_loop

count_done:

 mov eax, currentCol
 test eax, eax
 jz skip_last_row
 inc eax
 cmp eax, maxCols
 jle no_update_max2
 mov maxCols, eax
no_update_max2:
 inc currentRow
skip_last_row:

 mov eax, currentRow
 test eax, eax
 jz load_level_failed
 mov TILE_ROWS, eax
 mov eax, maxCols
 test eax, eax
 jz load_level_failed
 mov TILE_COLS, eax

 push ecx
 push edi
 lea edi, level1
 mov ecx, 20000
 xor eax, eax
clear_level_loop:
 mov byte ptr [edi], al
 inc edi
 dec ecx
 jnz clear_level_loop
 pop edi
 pop ecx

 push ecx
 push edi
 lea edi, qUsedMap
 mov ecx, 20000
clear_used_loop:
 mov byte ptr [edi], al
 inc edi
 dec ecx
 jnz clear_used_loop
 pop edi
 pop ecx

 mov currentRow, 0
 mov currentCol, 0
 mov currentValue, 0
 lea esi, levelFileBuffer
 lea edi, level1

parse_loop:
 movzx eax, byte ptr [esi]
 test al, al
 jz parse_done

 cmp al, 10
 je new_line
 cmp al, 13
 je skip_char
 cmp al, ','
 je store_value

 cmp al, '0'
 jl skip_char
 cmp al, '9'
 jg skip_char

 sub al, '0'
 mov ebx, currentValue
 imul ebx, 10
 add ebx, eax
 mov currentValue, ebx
 jmp next_char

store_value:
 mov eax, currentValue
 mov byte ptr [edi], al

 cmp al, TILE_MARIO_SPAWN
 je check_mario_spawn

 cmp al, TILE_FLAGPOLE_BASE
 je check_flagpole_base

 cmp al, TILE_FLAGPOLE_TOP
 je check_flagpole_top

 cmp al, TILE_FLAGPOLE_FLAG
 je check_flag_tile

 cmp al, TILE_CASTLE_FLAG
 je check_castle_flag

 cmp al, TILE_PLATFORM_SPAWN
 je store_value_done

 cmp al, TILE_PIPE_IN
 je store_value_done
 cmp al, TILE_PIPE_OUT
 je store_value_done
 cmp al, TILE_PIPE_HORIZ_IN
 je store_value_done

 cmp al, TILE_GOOMBA_SPAWN

 je check_enemy_spawn
 cmp al, TILE_PIRANHA_SPAWN
 je check_enemy_spawn
 cmp al, TILE_BOWSER_SPAWN
 je check_enemy_spawn
 cmp al, TILE_FLY_TURTLE_SPAWN
 je check_enemy_spawn
 cmp al, TILE_TURTLE_SPAWN
 je check_enemy_spawn

 jmp store_value_done

check_mario_spawn:
 mov eax, currentRow
 mov marioSpawnRow, eax
 mov eax, currentCol
 mov marioSpawnCol, eax
 jmp store_value_done

check_flagpole_base:

 mov eax, currentCol
 imul eax, TILE_SIZE
 mov flagpoleBaseTileX, eax
 mov eax, currentRow
 imul eax, TILE_SIZE
 mov flagpoleBaseTileY, eax
 jmp store_value_done

check_flagpole_top:

 mov eax, currentCol
 imul eax, TILE_SIZE
 mov flagpoleTopTileX, eax
 mov eax, currentRow
 imul eax, TILE_SIZE
 mov flagpoleTopTileY, eax
 jmp store_value_done

check_flag_tile:

 jmp store_value_done

check_castle_flag:

 mov eax, currentCol
 imul eax, TILE_SIZE
 mov castleFlagX, eax
 mov eax, currentRow
 imul eax, TILE_SIZE
 mov castleFlagTargetY, eax

 add eax, TILE_SIZE
 mov castleFlagY, eax
 jmp store_value_done

check_enemy_spawn:
 push edi
 push eax
 mov eax, currentCol

 imul eax, TILE_SIZE
 mov ebx, eax
 mov eax, currentRow
 imul eax, TILE_SIZE
 mov ecx, eax
 pop eax

 cmp al, TILE_GOOMBA_SPAWN
 jne not_goomba_spawn

 invoke SpawnEnemy, ENEMY_GOOMBA, ebx, ecx
 jmp enemy_spawn_done
not_goomba_spawn:
 cmp al, TILE_PIRANHA_SPAWN
 jne not_piranha_spawn
 invoke SpawnEnemy, ENEMY_PIRANHA, ebx, ecx
 jmp enemy_spawn_done
not_piranha_spawn:
 cmp al, TILE_BOWSER_SPAWN
 jne not_bowser_spawn

 add ecx, TILE_SIZE
 sub ecx, BOWSER_H

 invoke SpawnEnemy, ENEMY_BOWSER, ebx, ecx
 jmp enemy_spawn_done
not_bowser_spawn:
 cmp al, TILE_FLY_TURTLE_SPAWN
 jne not_flyturtle_spawn
 invoke SpawnEnemy, ENEMY_FLYING_TURTLE, ebx, ecx
 jmp enemy_spawn_done
not_flyturtle_spawn:
 cmp al, TILE_TURTLE_SPAWN
 jne enemy_spawn_done
 invoke SpawnEnemy, ENEMY_TURTLE, ebx, ecx

enemy_spawn_done:
 pop edi

 mov byte ptr [edi], 0
 jmp store_value_done

store_value_done:
 inc edi
 inc currentCol
 mov currentValue, 0
 jmp next_char

new_line:

 mov eax, currentValue
 test eax, eax
 jz skip_newline_store

 mov byte ptr [edi], al
 inc edi
 inc currentCol
 mov currentValue, 0

skip_newline_store:

 mov eax, currentCol
 mov ebx, TILE_COLS
fill_row_loop:
 cmp eax, ebx
 jge row_filled
 mov byte ptr [edi], 0
 inc edi
 inc eax
 jmp fill_row_loop

row_filled:
 inc currentRow
 mov currentCol, 0
 mov currentValue, 0
 jmp next_char

skip_char:
next_char:
 inc esi
 jmp parse_loop

parse_done:

 mov eax, currentCol
 test eax, eax
 jz load_level_done
 mov eax, currentValue
 mov byte ptr [edi], al
 inc edi
 inc currentCol

 mov eax, currentCol
pad_final:
 mov ebx, TILE_COLS
 cmp eax, ebx
 jge load_level_done
 mov byte ptr [edi], 0
 inc edi
 inc eax
 jmp pad_final

load_level_done:

 call LoadBackgroundFromFile
 call LoadLevelBackgroundImage

 call LoadCameraSnapFromFile
 ret

load_level_failed:

 mov TILE_ROWS, 17
 mov TILE_COLS, 60
 ret

LoadLevelFromFile endp

LoadBackgroundFromFile proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local currentRow:DWORD
 local currentCol:DWORD
 local currentValue:DWORD
 local maxCols:DWORD
 local levelPath:DWORD

 mov ecx, 20000
 lea edi, levelBackground
 xor al, al
 rep stosb

 mov ecx, 20000
 lea edi, qUsedMap
 xor al, al
 rep stosb

 mov eax, currentLevel
 cmp eax, 1
 jne bg_check_level2
 lea eax, backgroundFile1

 jmp bg_open_file
bg_check_level2:
 cmp eax, 2
 jne bg_check_level3
 lea eax, backgroundFile1
 jmp bg_open_file
bg_check_level3:
 cmp eax, 3
 jne bg_check_level4
 lea eax, backgroundFile3
 jmp bg_open_file
bg_check_level4:
 cmp eax, 4
 jne bg_load_failed
 lea eax, backgroundFile4
bg_open_file:
 mov levelPath, eax
 invoke CreateFileA, eax, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je bg_load_failed
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr backgroundFileBuffer, 32000, addr bytesRead, NULL
 invoke CloseHandle, fileHandle

 ; Null-terminate read data so parsing stops correctly.
 mov eax, bytesRead
 mov byte ptr [backgroundFileBuffer + eax], 0

 lea esi, backgroundFileBuffer
 lea edi, levelBackground
 mov currentRow, 0
 mov currentCol, 0
 mov currentValue, 0
 mov maxCols, 0

bg_parse_loop:
 movzx eax, byte ptr [esi]
 test eax, eax
 jz bg_parse_done

 cmp al, ','
 je bg_store_value
 cmp al, 13
 je bg_new_line
 cmp al, 10
 je bg_new_line
 cmp al, ' '
 je bg_skip_char
 cmp al, 9
 je bg_skip_char

 cmp al, '0'
 jb bg_skip_char
 cmp al, '9'
 ja bg_skip_char
 sub al, '0'
 mov ebx, currentValue
 imul ebx, 10
 add bl, al
 mov currentValue, ebx
 jmp bg_next_char

bg_store_value:
 mov eax, currentValue
 mov byte ptr [edi], al
 inc edi
 inc currentCol
 mov currentValue, 0
 jmp bg_next_char

bg_new_line:
 mov eax, currentValue
 test eax, eax
 jz bg_skip_newline_store
 mov byte ptr [edi], al
 inc edi
 inc currentCol
 mov currentValue, 0

bg_skip_newline_store:

 mov eax, currentCol
 cmp eax, maxCols
 jle bg_no_new_max
 mov maxCols, eax
bg_no_new_max:

 mov ebx, TILE_COLS
 cmp ebx, 0
 jg bg_use_foreground_width
 mov ebx, maxCols
 cmp ebx, 0
 jg bg_use_max_cols
 mov ebx, 60
bg_use_max_cols:
bg_use_foreground_width:
bg_fill_row_loop:
 mov eax, currentCol
 cmp eax, ebx
 jge bg_row_filled
 mov byte ptr [edi], 0
 inc edi
 inc currentCol
 jmp bg_fill_row_loop

bg_row_filled:
 inc currentRow
 mov currentCol, 0
 mov currentValue, 0
 jmp bg_next_char

bg_skip_char:
bg_next_char:
 inc esi
 jmp bg_parse_loop

bg_parse_done:

 mov eax, currentCol
 test eax, eax
 jz bg_load_done
 mov eax, currentValue
 mov byte ptr [edi], al
 inc edi
 inc currentCol

 mov eax, currentCol
 cmp eax, maxCols
 jle bg_no_final_max
 mov maxCols, eax
bg_no_final_max:

bg_load_done:

 ret

bg_load_failed:

 ret

LoadBackgroundFromFile endp

LoadLevelBackgroundImage proc uses eax ebx ecx edx esi edi
 local bgPath:DWORD

 mov eax, hLevelBackgroundBitmap
 test eax, eax
 jz load_new_bg
 invoke DeleteObject, eax
 mov hLevelBackgroundBitmap, 0

load_new_bg:
 mov eax, currentLevel
 cmp eax, 1
 jne check_bg_level2
 lea eax, levelBackground1Path
 jmp load_bg_image

check_bg_level2:
 cmp eax, 2
 jne check_bg_level3
 lea eax, levelBackground2Path
 jmp load_bg_image

check_bg_level3:
 cmp eax, 3
 jne check_bg_level4
 lea eax, levelBackground3Path
 jmp load_bg_image

check_bg_level4:
 cmp eax, 4
 jne load_bg_done
 lea eax, levelBackground4Path
 ; Set level 4 background dimensions
 mov levelBackgroundWidth, 1536
 mov levelBackgroundHeight, 500
 jmp load_bg_image

load_bg_image:
 mov bgPath, eax
 cmp byte ptr [eax], 0
 je load_bg_done

 invoke LoadImageA, NULL, bgPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hLevelBackgroundBitmap, eax
 test eax, eax
 jz load_bg_done

 invoke SelectObject, hdcLevelBackground, hLevelBackgroundBitmap

load_bg_done:
 ret

LoadLevelBackgroundImage endp

LoadCameraSnapFromFile proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local cameraPath:DWORD
 local currentLevelIdx:DWORD
 local overworldY:DWORD
 local undergroundY:DWORD
 local underground2Y:DWORD
 local bgHeight:DWORD
 local bgOffsetY:DWORD
 local currentValue:DWORD

 mov ecx, 0
cam_init_loop:
 cmp ecx, 4
 jge cam_init_done
 mov dword ptr [cameraSnapLevelOverworld + ecx * 4], 0
 mov dword ptr [cameraSnapLevelUnderground + ecx * 4], 0
 mov dword ptr [cameraSnapLevelUnderground2 + ecx * 4], 0
 mov dword ptr [levelBackgroundHeightArray + ecx * 4], 400  ; Default height
 mov dword ptr [levelBackgroundOffsetYArray + ecx * 4], 0    ; Default offset
 inc ecx
 jmp cam_init_loop
cam_init_done:

 mov cameraSnapYOverworld, 0
 mov cameraSnapYUnderground, 0
 mov cameraSnapYUnderground2, 0

 lea eax, cameraFile
cam_open_file:
 mov cameraPath, eax

 invoke CreateFileA, cameraPath, GENERIC_READ, FILE_SHARE_READ, \
 NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je cam_load_failed
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr cameraFileBuffer, 255, addr bytesRead, NULL
 test eax, eax
 jz close_cam_file
 cmp bytesRead, 0
 je close_cam_file

 mov eax, bytesRead
 mov byte ptr [cameraFileBuffer + eax], 0

 lea esi, cameraFileBuffer
 mov currentLevelIdx, 0  ; Start with level 1 (index 0)

cam_parse_loop:
 ; Check if we've processed all 4 levels
 mov eax, currentLevelIdx
 cmp eax, 4
 jge cam_load_finish

 movzx eax, byte ptr [esi]
 test eax, eax
 jz cam_load_finish
 cmp al, 13
 je cam_next_line
 cmp al, 10
 je cam_next_line

 ; Skip whitespace and non-numeric characters
 cmp al, '0'
 jb cam_skip_char
 cmp al, '9'
 ja cam_skip_char

 ; Found a digit - check if we have a valid level index
 mov eax, currentLevelIdx
 cmp eax, 0
 jl cam_skip_char
 cmp eax, 4
 jge cam_skip_char

 mov overworldY, 0
 mov undergroundY, 0
 mov underground2Y, 0
 mov bgHeight, 0
 mov bgOffsetY, 0
 mov bgHeight, 0
 mov bgOffsetY, 0

cam_parse_overworld:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb cam_overworld_done
 cmp al, '9'
 ja cam_overworld_done
 sub al, '0'
 movzx eax, al
 mov ebx, overworldY
 imul ebx, 10
 add ebx, eax
 mov overworldY, ebx
 inc esi
 jmp cam_parse_overworld
cam_overworld_done:

cam_skip_ws1:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je cam_next_ws1
 cmp al, 9
 je cam_next_ws1
 cmp al, 13
 je cam_next_line
 cmp al, 10
 je cam_next_line
 jmp cam_parse_underground
cam_next_ws1:
 inc esi
 jmp cam_skip_ws1

cam_parse_underground:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb cam_underground_done
 cmp al, '9'
 ja cam_underground_done
 sub al, '0'
 movzx eax, al
 mov ebx, undergroundY
 imul ebx, 10
 add ebx, eax
 mov undergroundY, ebx
 inc esi
 jmp cam_parse_underground
cam_underground_done:

cam_skip_ws2:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je cam_next_ws2
 cmp al, 9
 je cam_next_ws2
 cmp al, 13
 je cam_next_line
 cmp al, 10
 je cam_next_line
 jmp cam_parse_underground2
cam_next_ws2:
 inc esi
 jmp cam_skip_ws2

cam_parse_underground2:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb cam_underground2_done
 cmp al, '9'
 ja cam_underground2_done
 sub al, '0'
 movzx eax, al
 mov ebx, underground2Y
 imul ebx, 10
 add ebx, eax
 mov underground2Y, ebx
 inc esi
 jmp cam_parse_underground2
cam_underground2_done:

 ; Skip whitespace before background height
cam_skip_ws3:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je cam_next_ws3
 cmp al, 9
 je cam_next_ws3
 cmp al, 13
 je cam_store_values
 cmp al, 10
 je cam_store_values
 jmp cam_parse_bg_height
cam_next_ws3:
 inc esi
 jmp cam_skip_ws3

cam_parse_bg_height:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb cam_bg_height_done
 cmp al, '9'
 ja cam_bg_height_done
 sub al, '0'
 movzx eax, al
 mov ebx, bgHeight
 imul ebx, 10
 add ebx, eax
 mov bgHeight, ebx
 inc esi
 jmp cam_parse_bg_height
cam_bg_height_done:

 ; Skip whitespace before background offset
cam_skip_ws4:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je cam_next_ws4
 cmp al, 9
 je cam_next_ws4
 cmp al, 13
 je cam_store_values
 cmp al, 10
 je cam_store_values
 jmp cam_parse_bg_offset
cam_next_ws4:
 inc esi
 jmp cam_skip_ws4

cam_parse_bg_offset:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb cam_bg_offset_done
 cmp al, '9'
 ja cam_bg_offset_done
 sub al, '0'
 movzx eax, al
 mov ebx, bgOffsetY
 imul ebx, 10
 add ebx, eax
 mov bgOffsetY, ebx
 inc esi
 jmp cam_parse_bg_offset
cam_bg_offset_done:

cam_store_values:
 mov eax, currentLevelIdx
 mov ebx, overworldY
 mov [cameraSnapLevelOverworld + eax * 4], ebx
 mov ebx, undergroundY
 mov [cameraSnapLevelUnderground + eax * 4], ebx
 mov ebx, underground2Y
 mov [cameraSnapLevelUnderground2 + eax * 4], ebx
 mov ebx, bgHeight
 mov [levelBackgroundHeightArray + eax * 4], ebx
 mov ebx, bgOffsetY
 mov [levelBackgroundOffsetYArray + eax * 4], ebx

 cmp undergroundY, 0
 jne cam_next_line
 mov ebx, overworldY
 mov [cameraSnapLevelUnderground + eax * 4], ebx

cam_next_line:
 ; Move to next level index
 mov eax, currentLevelIdx
 inc eax
 mov currentLevelIdx, eax
 ; Skip to end of line
cam_skip_to_end:
 inc esi
 movzx eax, byte ptr [esi]
 test eax, eax
 jz cam_load_finish
 cmp al, 13
 je cam_skip_to_end
 cmp al, 10
 je cam_skip_to_end
 jmp cam_parse_loop

cam_skip_char:
 inc esi
 jmp cam_parse_loop

cam_skip_line_break:
 ; Skip line break and move to next level
 mov eax, currentLevelIdx
 inc eax
 mov currentLevelIdx, eax
 inc esi
 movzx eax, byte ptr [esi]
 cmp al, 13
 je cam_skip_line_break
 cmp al, 10
 je cam_skip_line_break
 test eax, eax
 jz cam_load_finish
 jmp cam_parse_loop

cam_load_finish:
 mov eax, currentLevel
 dec eax
 ; Check bounds: eax must be 0-3 (for levels 1-4)
 cmp eax, 0
 jl cam_set_defaults
 cmp eax, 3
 jg cam_set_defaults
 ; Valid level index, load from arrays
 mov ebx, [cameraSnapLevelOverworld + eax * 4]
 mov cameraSnapYOverworld, ebx
 mov ebx, [cameraSnapLevelUnderground + eax * 4]
 mov cameraSnapYUnderground, ebx
 mov ebx, [cameraSnapLevelUnderground2 + eax * 4]
 mov cameraSnapYUnderground2, ebx
 ; Load background height and offset for current level
 mov ebx, [levelBackgroundHeightArray + eax * 4]
 mov levelBackgroundHeight, ebx
 mov ebx, [levelBackgroundOffsetYArray + eax * 4]
 mov levelBackgroundOffsetY, ebx
 jmp close_cam_file

cam_set_defaults:
 ; If currentLevel is invalid, use level 1 (index 0) as default
 mov eax, 0
 mov ebx, [cameraSnapLevelOverworld + eax * 4]
 mov cameraSnapYOverworld, ebx
 mov ebx, [cameraSnapLevelUnderground + eax * 4]
 mov cameraSnapYUnderground, ebx
 mov ebx, [cameraSnapLevelUnderground2 + eax * 4]
 mov cameraSnapYUnderground2, ebx
 ; Load background height and offset for level 1
 mov ebx, [levelBackgroundHeightArray + eax * 4]
 mov levelBackgroundHeight, ebx
 mov ebx, [levelBackgroundOffsetYArray + eax * 4]
 mov levelBackgroundOffsetY, ebx

close_cam_file:
 invoke CloseHandle, fileHandle

cam_load_failed:

 ret

LoadCameraSnapFromFile endp

LoadPipes proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local currentX:DWORD
 local currentY:DWORD
 local currentDir:DWORD
 local pipePath:DWORD

 mov pipeCount, 0
 mov pipeInCount, 0
 mov pipeOutCount, 0
 mov pipeHorizCount, 0
 mov pipeHorizInCount, 0
 mov pipeHorizOutCount, 0

 mov eax, currentLevel
 cmp eax, 1

 jne check_pipe_level2
 lea eax, pipeFile1

 jmp open_pipe_file

check_pipe_level2:
 cmp eax, 2
 jne check_pipe_level3
 lea eax, pipeFile2

 jmp open_pipe_file

check_pipe_level3:
 cmp eax, 3
 jne check_pipe_level4
 lea eax, pipeFile3

 jmp open_pipe_file

check_pipe_level4:
 lea eax, pipeFile4

open_pipe_file:
 mov pipePath, eax

 invoke CreateFileA, pipePath, GENERIC_READ, FILE_SHARE_READ, \
 NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_pipes_done
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr pipeFileBuffer, 2047, addr bytesRead, NULL
 test eax, eax

 jz close_pipe_file
 cmp bytesRead, 0
 je close_pipe_file

 mov eax, bytesRead
 mov byte ptr [pipeFileBuffer + eax], 0

 lea esi, pipeFileBuffer

parse_line:

 movzx eax, byte ptr [esi]
 test al, al
 jz close_pipe_file
 cmp al, 13
 je skip_line_end
 cmp al, 10
 je skip_line_end
 cmp al, ' '
 je skip_char
 cmp al, 9
 je skip_char

 mov currentX, 0
parse_x:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb x_done
 cmp al, '9'
 ja x_done
 sub al, '0'
 movzx eax, al
 mov ebx, currentX
 imul ebx, 10
 add ebx, eax
 mov currentX, ebx
 inc esi
 jmp parse_x
x_done:

skip_x_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_char_x
 cmp al, 9
 je skip_char_x
 jmp parse_y

skip_char_x:
 inc esi
 jmp skip_x_ws

parse_y:
 mov currentY, 0
parse_y_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb y_done
 cmp al, '9'
 ja y_done
 sub al, '0'
 movzx eax, al
 mov ebx, currentY
 imul ebx, 10
 add ebx, eax
 mov currentY, ebx
 inc esi
 jmp parse_y_loop
y_done:

skip_y_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_char_y
 cmp al, 9
 je skip_char_y
 jmp parse_dir

skip_char_y:
 inc esi
 jmp skip_y_ws

parse_dir:
 mov currentDir, 0
parse_dir_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb dir_done
 cmp al, '9'
 ja dir_done
 sub al, '0'
 movzx eax, al
 mov currentDir, eax
 inc esi
 jmp parse_dir_loop
dir_done:

 mov eax, currentDir
 test eax, eax
 jz store_horizontal_pipe

store_vertical_pipe:

 mov eax, pipeInCount
 cmp eax, pipeOutCount
 jg store_vertical_out

store_vertical_in:

 mov ecx, pipeInCount
 cmp ecx, MAX_PIPE_PAIRS
 jge skip_to_next_line
 mov eax, currentX
 mov [pipeInX + ecx * 4], eax
 mov eax, currentY
 mov [pipeInY + ecx * 4], eax
 inc pipeInCount

 mov eax, pipeInCount
 mov ebx, pipeOutCount
 cmp eax, ebx
 jle update_vert_count
 mov eax, ebx
update_vert_count:
 mov pipeCount, eax
 jmp skip_to_next_line

store_vertical_out:

 mov ecx, pipeOutCount
 cmp ecx, MAX_PIPE_PAIRS
 jge skip_to_next_line
 mov eax, currentX
 mov [pipeOutX + ecx * 4], eax
 mov eax, currentY
 mov [pipeOutY + ecx * 4], eax
 inc pipeOutCount

 mov eax, pipeInCount
 mov ebx, pipeOutCount
 cmp eax, ebx
 jle update_vert_count2
 mov eax, ebx
update_vert_count2:
 mov pipeCount, eax
 jmp skip_to_next_line

store_horizontal_pipe:

 mov eax, pipeHorizInCount
 cmp eax, pipeHorizOutCount
 jg store_horizontal_out

store_horizontal_in:

 mov ecx, pipeHorizInCount
 cmp ecx, MAX_PIPE_PAIRS
 jge skip_to_next_line
 mov eax, currentX
 mov [pipeHorizInX + ecx * 4], eax
 mov eax, currentY
 mov [pipeHorizInY + ecx * 4], eax
 inc pipeHorizInCount

 mov eax, pipeHorizInCount
 mov ebx, pipeHorizOutCount
 cmp eax, ebx
 jle update_horiz_count
 mov eax, ebx
update_horiz_count:
 mov pipeHorizCount, eax
 jmp skip_to_next_line

store_horizontal_out:

 mov ecx, pipeHorizOutCount
 cmp ecx, MAX_PIPE_PAIRS
 jge skip_to_next_line
 mov eax, currentX
 mov [pipeHorizOutX + ecx * 4], eax
 mov eax, currentY
 mov [pipeHorizOutY + ecx * 4], eax
 inc pipeHorizOutCount

 mov eax, pipeHorizInCount
 mov ebx, pipeHorizOutCount
 cmp eax, ebx
 jle update_horiz_count2
 mov eax, ebx
update_horiz_count2:
 mov pipeHorizCount, eax
 jmp skip_to_next_line

skip_char:
 inc esi
 jmp parse_line

skip_to_next_line:

 movzx eax, byte ptr [esi]
 test al, al
 jz close_pipe_file
 cmp al, 10
 je skip_line_end
 cmp al, 13
 je skip_line_end
 inc esi
 jmp skip_to_next_line

skip_line_end:

 movzx eax, byte ptr [esi]
 cmp al, 13
 jne check_lf
 inc esi
check_lf:
 movzx eax, byte ptr [esi]
 cmp al, 10
 jne parse_line
 inc esi
 jmp parse_line

close_pipe_file:
 invoke CloseHandle, fileHandle

load_pipes_done:
 ret

LoadPipes endp

LoadPlatforms proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local platPath:DWORD
 local curX:DWORD
 local curY:DWORD
 local curWidth:DWORD
 local curMoveType:DWORD
 local curWrapMode:DWORD
 local curRange:DWORD
 local curSpeed:DWORD
 local platIdx:DWORD

 call ClearPlatforms
 mov platformCount, 0
 mov platIdx, 0

 mov eax, currentLevel
 cmp eax, 1
 jne check_plat_level2
 lea eax, platformFile1
 jmp open_plat_file

check_plat_level2:
 cmp eax, 2
 jne check_plat_level3
 lea eax, platformFile2
 jmp open_plat_file

check_plat_level3:
 cmp eax, 3
 jne check_plat_level4
 lea eax, platformFile3
 jmp open_plat_file

check_plat_level4:
 lea eax, platformFile4

open_plat_file:
 mov platPath, eax

 invoke CreateFileA, platPath, GENERIC_READ, FILE_SHARE_READ, \
  NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_plat_done
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr platformFileBuffer, 4095, addr bytesRead, NULL
 test eax, eax
 jz close_plat_file
 cmp bytesRead, 0
 je close_plat_file

 mov eax, bytesRead
 mov byte ptr [platformFileBuffer + eax], 0

 lea esi, platformFileBuffer

parse_plat_line:
 movzx eax, byte ptr [esi]
 test al, al
 jz close_plat_file
 cmp al, 13
 je skip_plat_line_end
 cmp al, 10
 je skip_plat_line_end
 cmp al, ' '
 je skip_plat_char
 cmp al, 9
 je skip_plat_char

 cmp al, '#'
 je skip_to_plat_next_line

 mov eax, platIdx
 cmp eax, MAX_PLATFORMS
 jge close_plat_file

 mov curX, 0
parse_plat_x:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_x_done
 cmp al, '9'
 ja plat_x_done
 sub al, '0'
 movzx eax, al
 mov ebx, curX
 imul ebx, 10
 add ebx, eax
 mov curX, ebx
 inc esi
 jmp parse_plat_x
plat_x_done:

skip_plat_x_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_x_char
 cmp al, 9
 je skip_plat_x_char
 jmp parse_plat_y
skip_plat_x_char:
 inc esi
 jmp skip_plat_x_ws

parse_plat_y:
 mov curY, 0
parse_plat_y_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_y_done
 cmp al, '9'
 ja plat_y_done
 sub al, '0'
 movzx eax, al
 mov ebx, curY
 imul ebx, 10
 add ebx, eax
 mov curY, ebx
 inc esi
 jmp parse_plat_y_loop
plat_y_done:

skip_plat_y_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_y_char
 cmp al, 9
 je skip_plat_y_char
 jmp parse_plat_width
skip_plat_y_char:
 inc esi
 jmp skip_plat_y_ws

parse_plat_width:
 mov curWidth, 0
parse_plat_width_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_width_done
 cmp al, '9'
 ja plat_width_done
 sub al, '0'
 movzx eax, al
 mov ebx, curWidth
 imul ebx, 10
 add ebx, eax
 mov curWidth, ebx
 inc esi
 jmp parse_plat_width_loop
plat_width_done:

 mov eax, curWidth
 test eax, eax
 jnz width_ok
 mov curWidth, 3
width_ok:

skip_plat_width_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_width_char
 cmp al, 9
 je skip_plat_width_char
 jmp parse_plat_move_type
skip_plat_width_char:
 inc esi
 jmp skip_plat_width_ws

parse_plat_move_type:
 mov curMoveType, 0
parse_plat_move_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_move_done
 cmp al, '9'
 ja plat_move_done
 sub al, '0'
 movzx eax, al
 mov curMoveType, eax
 inc esi
 jmp parse_plat_move_loop
plat_move_done:

skip_plat_move_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_move_char
 cmp al, 9
 je skip_plat_move_char
 jmp parse_plat_wrap
skip_plat_move_char:
 inc esi
 jmp skip_plat_move_ws

parse_plat_wrap:
 mov curWrapMode, 0
parse_plat_wrap_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_wrap_done
 cmp al, '9'
 ja plat_wrap_done
 sub al, '0'
 movzx eax, al
 mov curWrapMode, eax
 inc esi
 jmp parse_plat_wrap_loop
plat_wrap_done:

skip_plat_wrap_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_wrap_char
 cmp al, 9
 je skip_plat_wrap_char
 jmp parse_plat_range
skip_plat_wrap_char:
 inc esi
 jmp skip_plat_wrap_ws

parse_plat_range:
 mov curRange, 0
parse_plat_range_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_range_done
 cmp al, '9'
 ja plat_range_done
 sub al, '0'
 movzx eax, al
 mov ebx, curRange
 imul ebx, 10
 add ebx, eax
 mov curRange, ebx
 inc esi
 jmp parse_plat_range_loop
plat_range_done:

skip_plat_range_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_plat_range_char
 cmp al, 9
 je skip_plat_range_char
 jmp parse_plat_speed
skip_plat_range_char:
 inc esi
 jmp skip_plat_range_ws

parse_plat_speed:
 mov curSpeed, 1
parse_plat_speed_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb plat_speed_done
 cmp al, '9'
 ja plat_speed_done
 mov ebx, curSpeed
 cmp ebx, 1
 jne speed_not_first
 mov curSpeed, 0
speed_not_first:
 sub al, '0'
 movzx eax, al
 mov ebx, curSpeed
 imul ebx, 10
 add ebx, eax
 mov curSpeed, ebx
 inc esi
 jmp parse_plat_speed_loop
plat_speed_done:
 mov eax, curSpeed
 test eax, eax
 jnz speed_ok
 mov curSpeed, 1
speed_ok:

 mov ecx, platIdx

 mov eax, curX
 mov ebx, curWidth
 imul ebx, 8
 add eax, ebx
 mov [platX + ecx * 4], eax
 mov [platStartX + ecx * 4], eax

 mov eax, curY
 add eax, 8
 mov [platY + ecx * 4], eax
 mov [platStartY + ecx * 4], eax

 mov eax, curWidth
 mov [platWidth + ecx * 4], eax

 mov eax, curMoveType
 mov [platType + ecx * 4], eax

 mov eax, curWrapMode
 mov [platWrapMode + ecx * 4], eax

 mov eax, curRange
 mov [platRange + ecx * 4], eax

 mov eax, curSpeed
 mov [platSpeed + ecx * 4], eax

 mov dword ptr [platDir + ecx * 4], 1

 mov eax, curWrapMode
 test eax, eax
 jnz store_wrap_bounds

 mov eax, curMoveType
 cmp eax, PLAT_MOVE_HORIZONTAL
 jne calc_vert_bounds

 mov eax, curRange
 imul eax, 16
 mov ebx, curX
 sub ebx, eax
 mov [platMinPos + ecx * 4], ebx
 mov ebx, curX
 add ebx, eax
 mov [platMaxPos + ecx * 4], ebx
 jmp store_plat_active

calc_vert_bounds:
 cmp eax, PLAT_MOVE_VERTICAL
 jne store_static_bounds

 mov eax, curRange
 imul eax, 16
 mov ebx, curY
 sub ebx, eax
 mov [platMinPos + ecx * 4], ebx
 mov ebx, curY
 add ebx, eax
 mov [platMaxPos + ecx * 4], ebx
 jmp store_plat_active

store_static_bounds:
 mov eax, curX
 mov [platMinPos + ecx * 4], eax
 mov [platMaxPos + ecx * 4], eax
 jmp store_plat_active

store_wrap_bounds:
 mov dword ptr [platMinPos + ecx * 4], 0
 mov dword ptr [platMaxPos + ecx * 4], 0

store_plat_active:
 mov dword ptr [platActive + ecx * 4], 1

 inc platIdx
 mov eax, platIdx
 mov platformCount, eax

skip_to_plat_next_line:
 movzx eax, byte ptr [esi]
 test al, al
 jz close_plat_file
 cmp al, 10
 je skip_plat_line_end
 cmp al, 13
 je skip_plat_line_end
 inc esi
 jmp skip_to_plat_next_line

skip_plat_char:
 inc esi
 jmp parse_plat_line

skip_plat_line_end:
 movzx eax, byte ptr [esi]
 cmp al, 13
 jne check_plat_lf
 inc esi
check_plat_lf:
 movzx eax, byte ptr [esi]
 cmp al, 10
 jne parse_plat_line
 inc esi
 jmp parse_plat_line

close_plat_file:
 invoke CloseHandle, fileHandle

load_plat_done:
 ret
LoadPlatforms endp

LoadFirebars proc uses eax ebx ecx edx esi edi
 local fileHandle:DWORD
 local bytesRead:DWORD
 local firebarPath:DWORD
 local curX:DWORD
 local curY:DWORD
 local curLength:DWORD
 local curSpeed:DWORD
 local curDir:DWORD
 local barIdx:DWORD

 mov ecx, 0
clear_firebar_loop:
 cmp ecx, MAX_FIREBARS
 jge clear_firebar_done
 mov dword ptr [firebarActive + ecx * 4], 0
 mov dword ptr [firebarAngle + ecx * 4], 0
 mov dword ptr [firebarFrame + ecx * 4], 0
 mov dword ptr [firebarFrameTimer + ecx * 4], 0
 inc ecx
 jmp clear_firebar_loop
clear_firebar_done:
 mov firebarCount, 0
 mov barIdx, 0

 mov eax, currentLevel
 cmp eax, 1
 jne check_firebar_level2
 lea eax, firebarFile1
 jmp open_firebar_file

check_firebar_level2:
 cmp eax, 2
 jne check_firebar_level3
 lea eax, firebarFile2
 jmp open_firebar_file

check_firebar_level3:
 cmp eax, 3
 jne check_firebar_level4
 lea eax, firebarFile3
 jmp open_firebar_file

check_firebar_level4:
 lea eax, firebarFile4

open_firebar_file:
 mov firebarPath, eax

 invoke CreateFileA, firebarPath, GENERIC_READ, FILE_SHARE_READ, \
  NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_firebar_done
 mov fileHandle, eax

 invoke ReadFile, fileHandle, addr firebarFileBuffer, 4095, addr bytesRead, NULL
 test eax, eax
 jz close_firebar_file
 cmp bytesRead, 0
 je close_firebar_file

 mov eax, bytesRead
 mov byte ptr [firebarFileBuffer + eax], 0

 lea esi, firebarFileBuffer

parse_firebar_line:
 movzx eax, byte ptr [esi]
 test al, al
 jz close_firebar_file
 cmp al, 13
 je skip_firebar_line_end
 cmp al, 10
 je skip_firebar_line_end
 cmp al, ' '
 je skip_firebar_char
 cmp al, 9
 je skip_firebar_char

 cmp al, '#'
 je skip_to_firebar_next_line

 mov eax, barIdx
 cmp eax, MAX_FIREBARS
 jge close_firebar_file

 mov curX, 0
parse_firebar_x:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb firebar_x_done
 cmp al, '9'
 ja firebar_x_done
 sub al, '0'
 movzx eax, al
 mov ebx, curX
 imul ebx, 10
 add ebx, eax
 mov curX, ebx
 inc esi
 jmp parse_firebar_x
firebar_x_done:

skip_firebar_x_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_firebar_x_char
 cmp al, 9
 je skip_firebar_x_char
 jmp parse_firebar_y
skip_firebar_x_char:
 inc esi
 jmp skip_firebar_x_ws

parse_firebar_y:
 mov curY, 0
parse_firebar_y_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb firebar_y_done
 cmp al, '9'
 ja firebar_y_done
 sub al, '0'
 movzx eax, al
 mov ebx, curY
 imul ebx, 10
 add ebx, eax
 mov curY, ebx
 inc esi
 jmp parse_firebar_y_loop
firebar_y_done:

skip_firebar_y_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_firebar_y_char
 cmp al, 9
 je skip_firebar_y_char
 jmp parse_firebar_length
skip_firebar_y_char:
 inc esi
 jmp skip_firebar_y_ws

parse_firebar_length:
 mov curLength, 4
parse_firebar_length_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb firebar_length_done
 cmp al, '9'
 ja firebar_length_done
 mov ebx, curLength
 cmp ebx, 4
 jne length_not_first
 mov curLength, 0
length_not_first:
 sub al, '0'
 movzx eax, al
 mov ebx, curLength
 imul ebx, 10
 add ebx, eax
 mov curLength, ebx
 inc esi
 jmp parse_firebar_length_loop
firebar_length_done:
 mov eax, curLength
 test eax, eax
 jnz length_not_zero
 mov curLength, 4
length_not_zero:
 cmp eax, 8
 jle length_ok
 mov curLength, 8
length_ok:

skip_firebar_length_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_firebar_length_char
 cmp al, 9
 je skip_firebar_length_char
 jmp parse_firebar_speed
skip_firebar_length_char:
 inc esi
 jmp skip_firebar_length_ws

parse_firebar_speed:
 mov curSpeed, 2
parse_firebar_speed_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb firebar_speed_done
 cmp al, '9'
 ja firebar_speed_done
 mov ebx, curSpeed
 cmp ebx, 2
 jne speed_not_first_fb
 mov curSpeed, 0
speed_not_first_fb:
 sub al, '0'
 movzx eax, al
 mov ebx, curSpeed
 imul ebx, 10
 add ebx, eax
 mov curSpeed, ebx
 inc esi
 jmp parse_firebar_speed_loop
firebar_speed_done:
 mov eax, curSpeed
 test eax, eax
 jnz speed_ok_fb
 mov curSpeed, 2
speed_ok_fb:

skip_firebar_speed_ws:
 movzx eax, byte ptr [esi]
 cmp al, ' '
 je skip_firebar_speed_char
 cmp al, 9
 je skip_firebar_speed_char
 jmp parse_firebar_dir
skip_firebar_speed_char:
 inc esi
 jmp skip_firebar_speed_ws

parse_firebar_dir:
 mov curDir, 1
parse_firebar_dir_loop:
 movzx eax, byte ptr [esi]
 cmp al, '0'
 jb firebar_dir_done
 cmp al, '9'
 ja firebar_dir_done
 sub al, '0'
 movzx eax, al
 test eax, eax
 jz dir_clockwise
 mov curDir, -1
 jmp dir_set
dir_clockwise:
 mov curDir, 1
dir_set:
 inc esi
 jmp parse_firebar_dir_loop
firebar_dir_done:

 mov ecx, barIdx

 mov eax, curX
 add eax, 8
 mov [firebarX + ecx * 4], eax

 mov eax, curY
 add eax, 8
 mov [firebarY + ecx * 4], eax

 mov eax, curLength
 mov [firebarLength + ecx * 4], eax

 mov eax, curSpeed
 mov [firebarSpeed + ecx * 4], eax

 mov eax, curDir
 mov [firebarDir + ecx * 4], eax

 mov dword ptr [firebarAngle + ecx * 4], 0

 mov dword ptr [firebarFrame + ecx * 4], 0
 mov dword ptr [firebarFrameTimer + ecx * 4], 0

 mov dword ptr [firebarActive + ecx * 4], 1

 inc barIdx
 mov eax, barIdx
 mov firebarCount, eax

skip_to_firebar_next_line:
 movzx eax, byte ptr [esi]
 test al, al
 jz close_firebar_file
 cmp al, 10
 je skip_firebar_line_end
 cmp al, 13
 je skip_firebar_line_end
 inc esi
 jmp skip_to_firebar_next_line

skip_firebar_char:
 inc esi
 jmp parse_firebar_line

skip_firebar_line_end:
 movzx eax, byte ptr [esi]
 cmp al, 13
 jne check_firebar_lf
 inc esi
check_firebar_lf:
 movzx eax, byte ptr [esi]
 cmp al, 10
 jne parse_firebar_line
 inc esi
 jmp parse_firebar_line

close_firebar_file:
 invoke CloseHandle, fileHandle

load_firebar_done:
 ret
LoadFirebars endp

ParseInt proc uses ebx ecx edx
 local value:DWORD
 mov value, 0
parse_int_loop:
 mov al, [esi]
 cmp al, '0'
 jb parse_int_done
 cmp al, '9'
 ja parse_int_done

 sub al, '0'
 movzx eax, al
 mov ebx, value
 imul ebx, 10
 add ebx, eax
 mov value, ebx
 inc esi
 jmp parse_int_loop
parse_int_done:
 mov eax, value
 ret
ParseInt endp

SkipSpaces proc
skip_spaces_loop:
 mov al, [esi]
 cmp al, ' '
 je skip_adv
 cmp al, 9
 jne skip_done
skip_adv:
 inc esi
 jmp skip_spaces_loop
skip_done:
 ret
SkipSpaces endp

AppendInt proc uses eax ebx ecx edx
 local digits[16]:BYTE
 local digitCount:DWORD
 local tempNum:DWORD
 local pDigits:DWORD

 mov tempNum, eax
 mov digitCount, 0
 lea eax, digits
 mov pDigits, eax

 mov eax, tempNum
 cmp eax, 0
 jne convert_loop
 mov eax, pDigits
 mov byte ptr [eax], '0'
 mov digitCount, 1
 jmp reverse_digits

convert_loop:
 mov eax, tempNum
 cmp eax, 0
 je reverse_digits
 xor edx, edx
 mov ecx, 10
 div ecx
 mov tempNum, eax
 add edx, '0'
 mov eax, pDigits
 mov ecx, digitCount
 mov [eax + ecx], dl
 inc digitCount
 jmp convert_loop

reverse_digits:

 mov ecx, digitCount
 dec ecx
 mov eax, pDigits
append_digits_loop:
 cmp ecx, 0
 jl append_done
 mov dl, [eax + ecx]
 mov [esi], dl
 inc esi
 dec ecx
 jmp append_digits_loop

append_done:
 ret
AppendInt endp

FindPlayerSlot proc uses ebx ecx edx esi edi
 xor ecx, ecx

find_slot_loop:
 cmp ecx, MAX_SAVE_SLOTS
 jge slot_not_found

 mov eax, ecx
 imul eax, SAVE_SLOT_SIZE
 lea esi, [saveBuffer + eax]

 cmp byte ptr [esi], 0
 je check_next_slot

 lea edi, playerName
 push ecx
 xor ecx, ecx

compare_name:
 cmp ecx, 11
 jge names_match
 mov al, [esi + ecx]
 mov bl, [edi + ecx]
 cmp al, bl
 jne names_different
 test al, al
 jz names_match
 inc ecx
 jmp compare_name

names_different:
 pop ecx
 jmp check_next_slot

names_match:
 pop ecx
 mov eax, ecx
 ret

check_next_slot:
 inc ecx
 jmp find_slot_loop

slot_not_found:
 mov eax, - 1
 ret
FindPlayerSlot endp

FindEmptySlot proc uses ebx ecx edx esi
 xor ecx, ecx

find_empty_loop:
 cmp ecx, MAX_SAVE_SLOTS
 jge no_empty_slot

 mov eax, ecx
 imul eax, SAVE_SLOT_SIZE
 lea esi, [saveBuffer + eax]

 cmp byte ptr [esi], 0
 je found_empty

 inc ecx
 jmp find_empty_loop

no_empty_slot:
 mov eax, - 1
 ret

found_empty:
 mov eax, ecx
 ret
FindEmptySlot endp

SavePlayerProgress proc uses eax ebx ecx edx esi edi

 lea esi, playerName
 cmp byte ptr [esi], 'T'
 jne check_test_continue
 cmp byte ptr [esi + 1], 'E'
 jne check_test_continue
 cmp byte ptr [esi + 2], 'S'
 jne check_test_continue
 cmp byte ptr [esi + 3], 'T'
 jne check_test_continue
 cmp byte ptr [esi + 4], 0
 jne check_test_continue
 jmp save_prog_done
check_test_continue:

 call FindPlayerSlot
 cmp eax, - 1
 jne has_slot

 call FindEmptySlot
 cmp eax, - 1
 je save_prog_done

has_slot:
 mov currentSaveSlot, eax

 imul eax, SAVE_SLOT_SIZE
 lea edi, [saveBuffer + eax]

 lea esi, playerName
 xor ecx, ecx
copy_name_save:
 cmp ecx, 11
 jge copy_name_done
 mov al, [esi + ecx]
 mov [edi + ecx], al
 test al, al
 jz copy_name_done
 inc ecx
 jmp copy_name_save
copy_name_done:
 mov byte ptr [edi + ecx], 0

 mov eax, currentWorld
 mov [edi + SAVE_OFF_WORLD], eax

 mov eax, currentStage
 mov [edi + SAVE_OFF_STAGE], eax

 mov eax, score
 mov [edi + SAVE_OFF_SCORE], eax

 mov eax, lives
 mov [edi + SAVE_OFF_LIVES], eax

 mov eax, coins
 mov [edi + SAVE_OFF_COINS], eax

 mov eax, timer
 mov [edi + SAVE_OFF_TIME], eax

 mov eax, marioState
 mov [edi + SAVE_OFF_STATE], eax

 mov eax, 0
 mov ebx, starPowerActive
 test ebx, ebx
 jz check_golden_power
 add eax, 10
check_golden_power:
 mov ebx, isInvincible
 test ebx, ebx
 jz power_state_done
 add eax, 20
power_state_done:
 mov [edi + SAVE_OFF_POWER], eax

 mov eax, marioX

 mov [edi + SAVE_OFF_MARIO_X], eax
 mov eax, marioY
 mov [edi + SAVE_OFF_MARIO_Y], eax

 mov eax, midasUsesLeft
 mov [edi + SAVE_OFF_MIDAS], eax

 mov eax, isUnderground
 mov [edi + SAVE_OFF_UNDERGROUND], eax

save_prog_done:
 call UpdateHighScores
 ret

SavePlayerProgress endp

LoadPlayerProgress proc uses eax ebx ecx edx esi edi
 call FindPlayerSlot
 cmp eax, - 1
 je load_prog_new_player

 mov currentSaveSlot, eax

 imul eax, SAVE_SLOT_SIZE
 lea esi, [saveBuffer + eax]

 mov eax, [esi + SAVE_OFF_WORLD]
 mov currentWorld, eax

 mov eax, [esi + SAVE_OFF_STAGE]
 mov currentStage, eax
 mov currentLevel, eax

 mov eax, [esi + SAVE_OFF_SCORE]
 mov score, eax

 mov eax, [esi + SAVE_OFF_LIVES]
 mov lives, eax

 mov eax, [esi + SAVE_OFF_COINS]
 mov coins, eax

 mov eax, [esi + SAVE_OFF_TIME]
 mov timer, eax

 mov eax, [esi + SAVE_OFF_STATE]
 mov marioState, eax

 mov eax, [esi + SAVE_OFF_POWER]
 mov ebx, eax
 and ebx, 10
 jz check_golden_load
 mov starPowerActive, 1
 mov starPowerTimer, 600
 jmp check_golden_load
check_golden_load:
 mov ebx, eax
 and ebx, 20
 jz power_load_done
 mov isInvincible, 1
 mov invincibleTimer, 300
power_load_done:

 mov eax, [esi + SAVE_OFF_MARIO_X]
 mov marioX, eax
 mov resumeSavedX, eax
 mov eax, [esi + SAVE_OFF_MARIO_Y]
 mov marioY, eax
 mov resumeSavedY, eax
 mov resumeFromSave, 1

 mov eax, [esi + SAVE_OFF_MIDAS]
 mov midasUsesLeft, eax

 mov eax, [esi + SAVE_OFF_UNDERGROUND]
 mov isUnderground, eax

 ret

load_prog_new_player:

 mov currentSaveSlot, - 1
 mov currentWorld, 1
 mov currentStage, 1
 mov currentLevel, 1
 mov score, 0
 mov lives, 5
 mov coins, 0
 mov timer, 400
 mov marioState, 0
 mov starPowerActive, 0
 mov isInvincible, 0
 mov marioX, 0
 mov marioY, 0
 mov resumeFromSave, 0
 mov midasUsesLeft, MAX_MIDAS_USES
 mov isUnderground, 0
 ret

LoadPlayerProgress endp

CheckUserDataExists proc uses eax

 call LoadSaveDataFromFile
 call FindPlayerSlot
 cmp eax, - 1
 jne has_save_entry

 mov currentSaveSlot, - 1
 mov resumeFromSave, 0
 xor eax, eax
 ret
has_save_entry:
 mov currentSaveSlot, eax
 mov eax, 1
 ret
CheckUserDataExists endp

SaveUserData proc uses eax ebx ecx edx esi edi

 call SavePlayerProgress
 call SaveSaveDataToFile
 ret
SaveUserData endp

LoadUserData proc uses eax ebx ecx edx esi edi

 call LoadSaveDataFromFile
 call LoadPlayerProgress
 ret
LoadUserData endp

SaveLevelState proc uses eax ebx ecx edx esi edi
 local hFile:DWORD
 local bytesWritten:DWORD
 local fileSize:DWORD

 cmp playerNameLen, 0
 jle save_lvl_done

 lea edi, levelStatePathBuffer
 lea esi, levelStateFile
copy_lvl_state_path:
 mov al, [esi]
 test al, al
 jz append_player_name_save
 mov [edi], al
 inc esi
 inc edi
 jmp copy_lvl_state_path

append_player_name_save:
 lea esi, playerName
 mov ecx, playerNameLen
copy_player_name_save:
 test ecx, ecx
 jz append_level_num_save
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jmp copy_player_name_save

append_level_num_save:
 mov byte ptr [edi], '_'
 inc edi
 mov eax, currentLevel
 add eax, '0'
 mov [edi], al
 inc edi

 lea esi, levelStateExt
copy_ext_save:
 mov al, [esi]
 mov [edi], al
 test al, al
 jz do_save_lvl_state
 inc esi
 inc edi
 jmp copy_ext_save

do_save_lvl_state:
 lea edi, levelStateBuffer

 lea esi, qUsedMap
 mov ecx, 20000
copy_qused_save:
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jnz copy_qused_save

 lea esi, level1
 mov ecx, 20000
copy_level1_save:
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jnz copy_level1_save

 mov ecx, 0
copy_enemy_state_save:
 cmp ecx, MAX_ENEMIES
 jge write_lvl_state_file
 mov eax, [enemyState + ecx * 4]
 mov [edi], eax
 add edi, 4
 inc ecx
 jmp copy_enemy_state_save

write_lvl_state_file:
 lea eax, levelStatePathBuffer
 invoke CreateFileA, eax, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je save_lvl_done
 mov hFile, eax

 mov eax, 20000
 add eax, 20000
 mov ebx, MAX_ENEMIES
 imul ebx, 4
 add eax, ebx
 mov fileSize, eax

 invoke WriteFile, hFile, addr levelStateBuffer, fileSize, addr bytesWritten, NULL
 invoke CloseHandle, hFile

save_lvl_done:
 ret
SaveLevelState endp

LoadLevelState proc uses eax ebx ecx edx esi edi
 local hFile:DWORD
 local bytesRead:DWORD
 local fileSize:DWORD

 cmp resumeFromSave, 1
 jne load_lvl_done

 cmp playerNameLen, 0
 jle load_lvl_done

 lea edi, levelStatePathBuffer
 lea esi, levelStateFile
copy_lvl_state_path_load:
 mov al, [esi]
 test al, al
 jz append_player_name_load
 mov [edi], al
 inc esi
 inc edi
 jmp copy_lvl_state_path_load

append_player_name_load:
 lea esi, playerName
 mov ecx, playerNameLen
copy_player_name_load:
 test ecx, ecx
 jz append_level_num_load
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jmp copy_player_name_load

append_level_num_load:
 mov byte ptr [edi], '_'
 inc edi
 mov eax, currentLevel
 add eax, '0'
 mov [edi], al
 inc edi

 lea esi, levelStateExt
copy_ext_load:
 mov al, [esi]
 mov [edi], al
 test al, al
 jz do_load_lvl_state
 inc esi
 inc edi
 jmp copy_ext_load

do_load_lvl_state:
 lea eax, levelStatePathBuffer
 invoke CreateFileA, eax, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_lvl_done
 mov hFile, eax

 mov eax, 20000
 add eax, 20000
 mov ebx, MAX_ENEMIES
 imul ebx, 4
 add eax, ebx
 mov fileSize, eax

 invoke ReadFile, hFile, addr levelStateBuffer, fileSize, addr bytesRead, NULL
 invoke CloseHandle, hFile

 cmp bytesRead, 0
 jle load_lvl_done

 lea esi, levelStateBuffer
 lea edi, qUsedMap
 mov ecx, 20000
copy_qused_load:
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jnz copy_qused_load

 lea edi, level1
 mov ecx, 20000
copy_level1_load:
 mov al, [esi]
 mov [edi], al
 inc esi
 inc edi
 dec ecx
 jnz copy_level1_load

 mov ecx, 0
copy_enemy_state_load:
 cmp ecx, MAX_ENEMIES
 jge reinit_active_enemies
 mov eax, [esi]
 mov [enemyState + ecx * 4], eax
 cmp eax, ESTATE_DEAD
 je clear_enemy_on_load
 cmp eax, ESTATE_INACTIVE
 je clear_enemy_on_load
 jmp enemy_state_load_next
clear_enemy_on_load:
 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
enemy_state_load_next:
 add esi, 4
 inc ecx
 jmp copy_enemy_state_load

reinit_active_enemies:
 mov ecx, 0
reinit_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge load_lvl_done
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_ACTIVE
 jne reinit_enemy_next
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je reinit_enemy_next
 mov ebx, [enemyVelX + ecx * 4]
 cmp ebx, 0
 jne reinit_enemy_next
 cmp eax, ENEMY_GOOMBA
 je set_enemy_vel_left
 cmp eax, ENEMY_TURTLE
 je set_enemy_vel_left
 cmp eax, ENEMY_FLYING_TURTLE
 je set_enemy_vel_left
 cmp eax, ENEMY_BOWSER
 je set_enemy_vel_left
 jmp reinit_enemy_next
set_enemy_vel_left:
 mov dword ptr [enemyVelX + ecx * 4], -1
reinit_enemy_next:
 inc ecx
 jmp reinit_enemy_loop

load_lvl_done:
 ret
LoadLevelState endp

LoadSaveDataFromFile proc uses eax ebx ecx edx esi edi
 local hFile:DWORD
 local bytesRead:DWORD
 local slotIndex:DWORD
 local linePos:DWORD

 xor eax, eax
 mov ecx, SAVE_TOTAL_BYTES
 lea edi, saveBuffer
 rep stosb

 mov currentSaveSlot, - 1
 mov slotIndex, 0

 lea eax, saveFilePath

 invoke CreateFileA, eax, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je load_save_done
 mov hFile, eax

 invoke ReadFile, hFile, addr saveTextBuffer, 4095, addr bytesRead, NULL
 invoke CloseHandle, hFile

 cmp bytesRead, 0
 jle load_save_done
 mov eax, bytesRead
 mov byte ptr [saveTextBuffer + eax], 0

 lea esi, saveTextBuffer
parse_line:

 mov eax, slotIndex
 cmp eax, MAX_SAVE_SLOTS
 jge load_save_done

skip_ws:
 mov al, [esi]
 cmp al, 0
 je load_save_done
 cmp al, 13
 je skip_cr
 cmp al, 10
 jne start_name
skip_cr:
 inc esi
 jmp skip_ws

start_name:

 mov edi, slotIndex
 imul edi, SAVE_SLOT_SIZE
 lea edi, [saveBuffer + edi]
 mov ecx, 0
copy_name_load:
 mov al, [esi]
 cmp al, 0
 je load_save_done
 cmp al, ':'
 je name_done
 cmp al, 10
 je name_done
 cmp al, 13
 je name_done
 cmp ecx, (SAVE_NAME_LEN - 1)
 jge skip_to_colon
 mov [edi + ecx], al
 inc ecx
skip_to_colon:
 inc esi
 jmp copy_name_load

name_done:
 mov byte ptr [edi + ecx], 0
 cmp byte ptr [esi], ':'
 jne advance_next_line
 inc esi

skip_space_after_colon:
 mov al, [esi]
 cmp al, ' '
 jne parse_lives
 inc esi
 jmp skip_space_after_colon

parse_lives:
 call ParseInt
 mov [edi + SAVE_OFF_LIVES], eax
cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_COINS], eax
cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_SCORE], eax
cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_WORLD], eax
 call SkipSpaces
 cmp byte ptr [esi], '-'
 jne advance_next_line
 inc esi
 call SkipSpaces
 call ParseInt
 mov [edi + SAVE_OFF_STAGE], eax
 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt

 mov [edi + SAVE_OFF_MARIO_X], eax
 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_MARIO_Y], eax

 mov dword ptr [edi + SAVE_OFF_TIME], 400
 mov dword ptr [edi + SAVE_OFF_STATE], 0
 mov dword ptr [edi + SAVE_OFF_POWER], 0

 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_STATE], eax
 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_POWER], eax

 mov dword ptr [edi + SAVE_OFF_MIDAS], MAX_MIDAS_USES
 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_MIDAS], eax

 mov dword ptr [edi + SAVE_OFF_UNDERGROUND], 0
 cmp byte ptr [esi], ','
 jne advance_next_line
 inc esi
 call SkipSpaces

 call ParseInt
 mov [edi + SAVE_OFF_UNDERGROUND], eax

advance_next_line:

 mov linePos, 0
skip_to_eol:
 mov al, [esi]
 cmp al, 0
 je inc_slot
 cmp al, 10
 je eol_found
 cmp al, 13
 je eol_found
 inc esi
 jmp skip_to_eol
eol_found:

 cmp byte ptr [esi], 13
 jne check_lf
 inc esi
check_lf:
 cmp byte ptr [esi], 10
 jne inc_slot
 inc esi
inc_slot:
 mov eax, slotIndex
 inc eax
 mov slotIndex, eax
 jmp parse_line

load_save_done:
 call UpdateHighScores
 ret

LoadSaveDataFromFile endp

SaveSaveDataToFile proc uses eax ebx ecx edx esi edi
 local hFile:DWORD
 local bytesWritten:DWORD

 lea esi, playerName
 cmp byte ptr [esi], 'T'
 jne check_test_save_continue
 cmp byte ptr [esi + 1], 'E'
 jne check_test_save_continue
 cmp byte ptr [esi + 2], 'S'
 jne check_test_save_continue
 cmp byte ptr [esi + 3], 'T'
 jne check_test_save_continue
 cmp byte ptr [esi + 4], 0
 jne check_test_save_continue
 jmp save_write_done
check_test_save_continue:

 lea esi, saveTextBuffer

 xor ecx, ecx
save_slot_loop:
 cmp ecx, MAX_SAVE_SLOTS
 jge write_save_file

 mov eax, ecx
 imul eax, SAVE_SLOT_SIZE
 lea edi, [saveBuffer + eax]

 cmp byte ptr [edi], 0
 je next_save_slot

 push ecx
 mov ecx, 0
copy_save_name_out:
 cmp ecx, (SAVE_NAME_LEN - 1)
 jge name_out_done
 mov al, [edi + ecx]
 cmp al, 0
 je name_out_done
 mov [esi], al
 inc esi
 inc ecx
 jmp copy_save_name_out
name_out_done:
 mov byte ptr [esi], ':'
 inc esi
 mov byte ptr [esi], ' '
 inc esi
 pop ecx

 mov eax, [edi + SAVE_OFF_LIVES]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_COINS]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_SCORE]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_WORLD]
 call AppendInt
mov byte ptr [esi], ' '
inc esi
mov byte ptr [esi], '-'
inc esi
mov byte ptr [esi], ' '
 inc esi
 mov eax, [edi + SAVE_OFF_STAGE]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_MARIO_X]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_MARIO_Y]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_STATE]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_POWER]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_MIDAS]
 call AppendInt
mov byte ptr [esi], ','
 inc esi
 mov byte ptr [esi], ' '
 inc esi

 mov eax, [edi + SAVE_OFF_UNDERGROUND]
 call AppendInt

 mov byte ptr [esi], 13
 inc esi
 mov byte ptr [esi], 10
 inc esi

next_save_slot:
 inc ecx
 jmp save_slot_loop

write_save_file:

 lea eax, saveFilePath

 invoke CreateFileA, eax, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
 cmp eax, INVALID_HANDLE_VALUE
 je save_write_done
 mov hFile, eax

 lea eax, saveTextBuffer
 sub esi, eax
 invoke WriteFile, hFile, addr saveTextBuffer, esi, addr bytesWritten, NULL
 invoke CloseHandle, hFile

save_write_done:
 call UpdateHighScores
 ret

SaveSaveDataToFile endp

UpdateHighScores proc uses eax ebx ecx edx esi edi ebp

 lea esi, playerName
 cmp byte ptr [esi], 'T'
 jne check_test_hs_continue
 cmp byte ptr [esi + 1], 'E'
 jne check_test_hs_continue
 cmp byte ptr [esi + 2], 'S'
 jne check_test_hs_continue
 cmp byte ptr [esi + 3], 'T'
 jne check_test_hs_continue
 cmp byte ptr [esi + 4], 0
 jne check_test_hs_continue
 jmp hs_done
check_test_hs_continue:

 xor ecx, ecx
clear_hs_scores:
 cmp ecx, HIGH_SCORE_COUNT
 jge clear_hs_names
 mov dword ptr [highScoreValues + ecx * 4], 0
 inc ecx
 jmp clear_hs_scores

clear_hs_names:
 xor ecx, ecx
clear_hs_names_loop:
 cmp ecx, HIGH_SCORE_NAMES_SIZE
 jge compute_scores
 mov byte ptr [highScoreNames + ecx], 0
 inc ecx
 jmp clear_hs_names_loop

compute_scores:
 xor ecx, ecx
slot_loop:
 cmp ecx, MAX_SAVE_SLOTS
 jge hs_done

 mov eax, ecx
 imul eax, SAVE_SLOT_SIZE
 lea esi, [saveBuffer + eax]

 cmp byte ptr [esi], 0
 je next_slot_hs

 mov eax, [esi + SAVE_OFF_SCORE]
 mov ebp, 0

find_insert_pos:
 cmp ebp, HIGH_SCORE_COUNT
 jge next_slot_hs

 mov edx, ebp
 imul edx, SAVE_NAME_LEN
 cmp byte ptr [highScoreNames + edx], 0
 je insert_here
 cmp eax, [highScoreValues + ebp * 4]
 jle inc_pos

 mov edx, HIGH_SCORE_COUNT
 dec edx
shift_down:
 cmp edx, ebp
 jl insert_here

 mov eax, edx
 dec eax
 imul eax, 4
 mov ebx, [highScoreValues + eax]
 mov eax, edx
 imul eax, 4
 mov [highScoreValues + eax], ebx

 push ecx
 mov eax, edx
 dec eax
 imul eax, SAVE_NAME_LEN
 lea edi, [highScoreNames + eax]
 mov eax, edx
 imul eax, SAVE_NAME_LEN
 lea ebx, [highScoreNames + eax]
 mov ecx, 0
copy_shift_name:
 cmp ecx, SAVE_NAME_LEN
 jge copy_shift_done
 mov al, [edi + ecx]
 mov [ebx + ecx], al
 inc ecx
 jmp copy_shift_name
copy_shift_done:
 pop ecx
 dec edx
 jmp shift_down

insert_here:
 mov [highScoreValues + ebp * 4], eax

 mov ebx, ebp
 imul ebx, SAVE_NAME_LEN
 lea edi, [highScoreNames + ebx]
 push ecx
 mov ecx, 0
copy_new_hs_name:
 cmp ecx, (SAVE_NAME_LEN - 1)
 jge copy_new_hs_done
 mov al, [esi + ecx]
 mov [edi + ecx], al
 test al, al
 jz copy_new_hs_done
 inc ecx
 jmp copy_new_hs_name
copy_new_hs_done:
 mov byte ptr [edi + ecx], 0
 pop ecx
 jmp next_slot_hs

inc_pos:
 inc ebp
 jmp find_insert_pos

next_slot_hs:
 inc ecx
 jmp slot_loop

hs_done:

 mov eax, [highScoreValues]
 mov highScore, eax
 ret
UpdateHighScores endp

PreloadSounds proc
 mov currentBgm, -1
 ret
PreloadSounds endp

StopAllBgm proc
 invoke PlaySoundA, NULL, NULL, 0
 ret
StopAllBgm endp

PlayMusicMCI proc uses eax esi, aliasNum:DWORD
 call StopAllBgm

 mov eax, aliasNum
 cmp eax, BGM_MENU
 jne pm_check_l1
 lea esi, menuMusicPath
 jmp pm_play
pm_check_l1:
 cmp eax, BGM_LEVEL1
 jne pm_check_l2
 lea esi, level1MusicPath
 jmp pm_play
pm_check_l2:
 cmp eax, BGM_LEVEL2
 jne pm_check_l3
 lea esi, level2MusicPath
 jmp pm_play
pm_check_l3:
 cmp eax, BGM_LEVEL3
 jne pm_check_l4
 lea esi, level3MusicPath
 jmp pm_play
pm_check_l4:
 cmp eax, BGM_LEVEL4
 jne pm_check_und
 lea esi, level4MusicPath
 jmp pm_play
pm_check_und:
 cmp eax, BGM_UNDERGROUND
 jne pm_check_castle
 lea esi, undergroundMusicPath
 jmp pm_play
pm_check_castle:
 cmp eax, BGM_CASTLE
 jne pm_check_victory
 lea esi, castleMusicPath
 jmp pm_play
pm_check_victory:
 lea esi, victoryMusicPath

pm_play:
 mov eax, SND_FILENAME
 or eax, SND_LOOP
 or eax, SND_ASYNC
 invoke PlaySoundA, esi, NULL, eax

 mov eax, aliasNum
 mov currentBgm, eax
 ret
PlayMusicMCI endp

PlayCoinSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr coinSoundPath, NULL, eax
 ret
PlayCoinSound endp

PlayJumpSound proc
 mov eax, marioState
 cmp eax, MARIO_SMALL
 je play_jump_small
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr jumpSuperSoundPath, NULL, eax
 ret
play_jump_small:
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr jumpSmallSoundPath, NULL, eax
 ret
PlayJumpSound endp

PlayDeathSound proc
 call StopMusic
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr deathSoundPath, NULL, eax
 ret
PlayDeathSound endp

PlayStompSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr stompSoundPath, NULL, eax
 ret
PlayStompSound endp

PlayPauseSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr pauseSoundPath, NULL, eax
 ret
PlayPauseSound endp

PlayGameOverSound proc
 call StopMusic
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr gameOverSoundPath, NULL, eax
 ret
PlayGameOverSound endp

PlayFireballSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr fireballSoundPath, NULL, eax
 ret
PlayFireballSound endp

PlayBlockBreakSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr blockBreakSoundPath, NULL, eax
 ret
PlayBlockBreakSound endp

PlayShellKickSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr shellKickSoundPath, NULL, eax
 ret
PlayShellKickSound endp

PlayPowerupAppearSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr powerupAppearSoundPath, NULL, eax
 ret
PlayPowerupAppearSound endp

PlayPowerupCollectSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr powerupCollectSoundPath, NULL, eax
 ret
PlayPowerupCollectSound endp

PlayFlagpoleSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr flagpoleSoundPath, NULL, eax
 ret
PlayFlagpoleSound endp

PlayBumpSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr bumpSoundPath, NULL, eax
 ret
PlayBumpSound endp

PlayOneUpSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr oneUpSoundPath, NULL, eax
 ret
PlayOneUpSound endp

PlayBowserFallSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr bowserFallSoundPath, NULL, eax
 ret
PlayBowserFallSound endp

PlayBowserFireSound proc uses eax
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr bowserFireSoundPath, NULL, eax
 ret
PlayBowserFireSound endp

PlayFireworksSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr fireworksSoundPath, NULL, eax
 ret
PlayFireworksSound endp

PlayPipeTravelSound proc
 mov eax, SND_FILENAME
 or eax, SND_ASYNC
 invoke PlaySoundA, addr pipeTravelSoundPath, NULL, eax
 ret
PlayPipeTravelSound endp

PlayVictoryMusic proc
 call StopMusic
 invoke PlayMusicMCI, BGM_VICTORY
 ret
PlayVictoryMusic endp

PlayMenuMusic proc
 invoke PlayMusicMCI, BGM_MENU
 ret
PlayMenuMusic endp

PlayLevel1Music proc
 invoke PlayMusicMCI, BGM_LEVEL1
 ret
PlayLevel1Music endp

PlayLevel2Music proc
 invoke PlayMusicMCI, BGM_LEVEL2
 ret
PlayLevel2Music endp

PlayLevel3Music proc
 invoke PlayMusicMCI, BGM_LEVEL3
 ret
PlayLevel3Music endp

PlayLevel4Music proc
 invoke PlayMusicMCI, BGM_LEVEL4
 ret
PlayLevel4Music endp

PlayUndergroundMusic proc
 invoke PlayMusicMCI, BGM_UNDERGROUND
 ret
PlayUndergroundMusic endp

PlayCastleMusic proc
 invoke PlayMusicMCI, BGM_CASTLE
 ret
PlayCastleMusic endp

StopMusic proc
 call StopAllBgm
 mov currentBgm, -1
 ret
StopMusic endp

PlayLevelMusic proc uses eax
 mov eax, isUnderground
 test eax, eax
 jnz play_underground_music

 mov eax, currentLevel
 cmp eax, 1
 je play_lvl1
 cmp eax, 2
 je play_lvl2
 cmp eax, 3
 je play_lvl3
 cmp eax, 4
 je play_lvl4
 jmp play_lvl1

play_underground_music:
 call PlayUndergroundMusic
 ret

play_lvl1:
 call PlayLevel1Music
 ret

play_lvl2:
 call PlayLevel2Music
 ret

play_lvl3:
 call PlayLevel3Music
 ret

play_lvl4:
 call PlayLevel4Music
 ret
PlayLevelMusic endp

CollectCoins proc uses eax ebx ecx
 mov ebx, eax

 add coins, eax

 call PlayCoinSound

 imul eax, SCORE_COIN
 add score, eax
 push eax
 mov ecx, marioX
 mov edx, marioY
 invoke SpawnFloatingScore, eax, ecx, edx
 pop eax

 call CheckScoreMilestone

 mov eax, coins
 cmp eax, 100
 jl collect_coins_done

 sub coins, 100
 inc lives
 add score, SCORE_1UP
 call PlayOneUpSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, 9999, eax, ebx

collect_coins_done:
 ret
CollectCoins endp

ClearBrickBounces proc uses ecx

 xor ecx, ecx
clear_bounce_loop:
 cmp ecx, MAX_BRICK_BOUNCES
 jge clear_bounce_done
 mov dword ptr [brickBounceRow + ecx * 4], - 1
 mov dword ptr [brickBounceCol + ecx * 4], - 1
 mov dword ptr [brickBounceFrame + ecx * 4], - 1
 inc ecx
 jmp clear_bounce_loop
clear_bounce_done:

 xor ecx, ecx
clear_popup_loop:
 cmp ecx, MAX_COIN_POPUPS
 jge clear_popup_done
 mov dword ptr [coinPopupFrame + ecx * 4], - 1
 mov dword ptr [coinPopupX + ecx * 4], 0
 mov dword ptr [coinPopupY + ecx * 4], 0
 mov dword ptr [coinPopupVelY + ecx * 4], 0
 inc ecx
 jmp clear_popup_loop
clear_popup_done:

 xor ecx, ecx
clear_multicoin_loop:
 cmp ecx, MAX_MULTICOIN
 jge clear_multicoin_done
 mov dword ptr [multiCoinRow + ecx * 4], - 1
 mov dword ptr [multiCoinCol + ecx * 4], - 1
 mov dword ptr [multiCoinTimer + ecx * 4], 0
 inc ecx
 jmp clear_multicoin_loop
clear_multicoin_done:

 xor ecx, ecx
clear_debris_loop:
 cmp ecx, MAX_BRICK_DEBRIS
 jge clear_debris_done
 mov dword ptr [debrisFrame + ecx * 4], - 1
 mov dword ptr [debrisX + ecx * 4], 0
 mov dword ptr [debrisY + ecx * 4], 0
 mov dword ptr [debrisVelX + ecx * 4], 0
 mov dword ptr [debrisVelY + ecx * 4], 0
 inc ecx
 jmp clear_debris_loop
clear_debris_done:
 ret
ClearBrickBounces endp

InitGoombas proc uses eax ebx ecx

 mov ecx, 0
clear_goombas:
 cmp ecx, MAX_GOOMBAS
 jge goombas_cleared
 mov dword ptr [goombaState + ecx * 4], 0
 inc ecx
 jmp clear_goombas

goombas_cleared:

 ret
InitGoombas endp

UpdateGoombas proc uses eax ebx ecx edx esi

 mov eax, animFrame
 shr eax, 3
 and eax, 1
 mov goombaFrame, eax

 mov ecx, 0
update_goomba_loop:
 cmp ecx, MAX_GOOMBAS
 jge update_goombas_done

 mov eax, [goombaState + ecx * 4]
 cmp eax, 1
 jne next_goomba_update

 mov eax, [goombaX + ecx * 4]
 add eax, [goombaVelX + ecx * 4]
 mov [goombaX + ecx * 4], eax

 cmp eax, 0
 jg check_right_bound
 mov dword ptr [goombaVelX + ecx * 4], 1
 jmp next_goomba_update
check_right_bound:
 cmp eax, 1800
 jl next_goomba_update
 mov dword ptr [goombaVelX + ecx * 4], - 1

next_goomba_update:
 inc ecx
 jmp update_goomba_loop

update_goombas_done:
 ret
UpdateGoombas endp

DrawGoombas proc uses eax ebx ecx edx esi
 local screenX:DWORD
 local screenY:DWORD
 local srcX:DWORD

 mov ecx, 0
draw_goomba_loop:
 cmp ecx, MAX_GOOMBAS
 jge draw_goombas_done

 mov eax, [goombaState + ecx * 4]
 test eax, eax
 jz next_goomba_draw

 mov eax, [goombaX + ecx * 4]
 sub eax, cameraX
 mov screenX, eax

 cmp eax, - 16
 jl next_goomba_draw

 cmp eax, WINDOW_WIDTH
 jg next_goomba_draw

 mov eax, [goombaY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 mov eax, [goombaState + ecx * 4]
 cmp eax, 2
 je goomba_squished_frame

 mov eax, goombaFrame
 imul eax, GOOMBA_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp goomba_select_variant

goomba_squished_frame:
 mov srcX, (GOOMBA_W + ENEMY_COL_GAP) * 2

goomba_select_variant:
 mov eax, isUnderground
 test eax, eax
 jnz goomba_underground_variant
 mov eax, currentLevel
 cmp eax, 2
 jl goomba_draw_sprite
 cmp eax, 3
 jg goomba_draw_sprite
 add srcX, GOOMBA_SKY_OFFSET * (GOOMBA_W + ENEMY_COL_GAP)
 jmp goomba_draw_sprite
goomba_underground_variant:
 add srcX, GOOMBA_UNDER_OFFSET * (GOOMBA_W + ENEMY_COL_GAP)

goomba_draw_sprite:
 push ecx

 invoke TransparentBlt, hdcMem, screenX, screenY, GOOMBA_W, GOOMBA_H, hdcEnemies, srcX, ENEMY_ROW_GOOMBA, GOOMBA_W, GOOMBA_H, 00FF00FFh
 pop ecx

next_goomba_draw:
 inc ecx
 jmp draw_goomba_loop

draw_goombas_done:
 ret

DrawGoombas endp

CheckGoombaCollisions proc uses eax ebx ecx edx esi
 mov ecx, 0
check_goomba_col_loop:
 cmp ecx, MAX_GOOMBAS
 jge check_goomba_col_done

 mov eax, [goombaState + ecx * 4]
 cmp eax, 1
 jne next_goomba_col

 mov eax, marioX

 add eax, HITBOX_WIDTH
 cmp eax, [goombaX + ecx * 4]
 jl next_goomba_col

 mov eax, marioX
 mov ebx, [goombaX + ecx * 4]
 add ebx, 16
 cmp eax, ebx
 jg next_goomba_col

 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, [goombaY + ecx * 4]
 jl next_goomba_col

 mov eax, marioY
 mov ebx, [goombaY + ecx * 4]
 add ebx, 16
 cmp eax, ebx
 jg next_goomba_col

 cmp marioVelY, 0
 jl goomba_hurt_mario

 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 mov ebx, [goombaY + ecx * 4]
 add ebx, 8
 cmp eax, ebx
 jg goomba_hurt_mario

 call PlayStompSound
 mov dword ptr [goombaState + ecx * 4], 2
 add score, 100
 mov marioVelY, - 8
 jmp next_goomba_col

goomba_hurt_mario:

 call MarioDamage
 jmp check_goomba_col_done

next_goomba_col:
 inc ecx
 jmp check_goomba_col_loop

check_goomba_col_done:
 ret

CheckGoombaCollisions endp

ClearEnemies proc uses ecx
 mov ecx, 0

clear_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge clear_enemies_done
 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 mov dword ptr [enemyState + ecx * 4], ESTATE_INACTIVE
 mov dword ptr [enemyX + ecx * 4], 0
 mov dword ptr [enemyY + ecx * 4], 0
 mov dword ptr [enemyVelX + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 0
 mov dword ptr [enemyFrame + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 0
 inc ecx
 jmp clear_enemy_loop
clear_enemies_done:
 ret

ClearEnemies endp

KillEnemyOnBlock proc uses eax ebx ecx edx esi, blockRow:DWORD, blockCol:DWORD

 local blockWorldX:DWORD
 local blockWorldY:DWORD
 local blockTopY:DWORD

 mov eax, blockCol
 imul eax, TILE_SIZE
 mov blockWorldX, eax
 mov eax, blockRow
 imul eax, TILE_SIZE
 mov blockWorldY, eax
 mov eax, blockWorldY
 mov blockTopY, eax

 mov ecx, 0
check_enemy_on_block_loop:
 cmp ecx, MAX_ENEMIES
 jge kill_enemy_on_block_done

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je next_enemy_on_block
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_ACTIVE
 je enemy_state_ok
 cmp eax, ESTATE_SHELL_IDLE
 je next_enemy_on_block
 cmp eax, ESTATE_SHELL_SLIDE
 je next_enemy_on_block
 jmp next_enemy_on_block
enemy_state_ok:

 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]

 mov edx, blockWorldX
 add edx, TILE_SIZE
 cmp eax, edx
 jge next_enemy_on_block

 mov esi, [enemyType + ecx * 4]
 cmp esi, ENEMY_GOOMBA
 je enemy_w_goomba
 cmp esi, ENEMY_TURTLE
 je enemy_w_turtle
 cmp esi, ENEMY_FLYING_TURTLE
 je enemy_w_flyturtle
 cmp esi, ENEMY_BOWSER
 je enemy_w_bowser
 jmp next_enemy_on_block

enemy_w_goomba:
 mov edx, eax
 add edx, GOOMBA_W
 jmp check_enemy_x_overlap
enemy_w_turtle:
 mov edx, eax
 add edx, TURTLE_W
 jmp check_enemy_x_overlap
enemy_w_flyturtle:
 mov edx, eax
 add edx, FLY_TURTLE_W
 jmp check_enemy_x_overlap
enemy_w_bowser:
 mov edx, eax
 add edx, BOWSER_W
 jmp check_enemy_x_overlap

check_enemy_x_overlap:
 cmp edx, blockWorldX
 jle next_enemy_on_block

 mov esi, [enemyType + ecx * 4]
 cmp esi, ENEMY_GOOMBA
 je enemy_h_goomba
 cmp esi, ENEMY_TURTLE
 je enemy_h_turtle
 cmp esi, ENEMY_FLYING_TURTLE
 je enemy_h_flyturtle
 cmp esi, ENEMY_BOWSER
 je enemy_h_bowser
 jmp next_enemy_on_block

enemy_h_goomba:
 mov edx, GOOMBA_H
 jmp check_enemy_y_on_block
enemy_h_turtle:
 mov edx, TURTLE_H
 jmp check_enemy_y_on_block
enemy_h_flyturtle:
 mov edx, FLY_TURTLE_H
 jmp check_enemy_y_on_block
enemy_h_bowser:
 mov edx, BOWSER_H
 jmp check_enemy_y_on_block

check_enemy_y_on_block:
 mov esi, ebx
 add esi, edx

mov edx, blockTopY
sub edx, 6
cmp esi, edx
jl next_enemy_on_block

mov edx, blockTopY
add edx, 10
cmp esi, edx
jg next_enemy_on_block

 mov esi, [enemyType + ecx * 4]
 cmp esi, ENEMY_GOOMBA
 je kill_goomba_on_block
 cmp esi, ENEMY_TURTLE
 je kill_turtle_on_block
 cmp esi, ENEMY_FLYING_TURTLE
 je kill_flyturtle_on_block
 cmp esi, ENEMY_BOWSER
 je kill_bowser_on_block
 jmp next_enemy_on_block

kill_goomba_on_block:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 mov dword ptr [enemyVelY + ecx * 4], -12
 mov eax, [enemyX + ecx * 4]
 add eax, GOOMBA_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jge goomba_knock_right
 mov dword ptr [enemyVelX + ecx * 4], -4
 jmp goomba_knock_done
goomba_knock_right:
 mov dword ptr [enemyVelX + ecx * 4], 4
goomba_knock_done:
 add score, SCORE_GOOMBA
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_GOOMBA, eax, ebx
 pop ecx
 jmp kill_enemy_on_block_done

kill_turtle_on_block:
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_SHELL_IDLE
 je next_enemy_on_block
 cmp eax, ESTATE_SHELL_SLIDE
 je next_enemy_on_block
 mov dword ptr [enemyState + ecx * 4], ESTATE_SHELL_SLIDE
 mov dword ptr [enemyTimer + ecx * 4], 60
 mov dword ptr [enemyVelY + ecx * 4], -12
 mov eax, [enemyX + ecx * 4]
 add eax, TURTLE_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jge turtle_knock_right
 mov dword ptr [enemyVelX + ecx * 4], -4
 jmp turtle_knock_done
turtle_knock_right:
 mov dword ptr [enemyVelX + ecx * 4], 4
turtle_knock_done:
 add score, SCORE_TURTLE
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_TURTLE, eax, ebx
 pop ecx
 jmp kill_enemy_on_block_done

kill_flyturtle_on_block:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 mov dword ptr [enemyVelY + ecx * 4], -12
 mov eax, [enemyX + ecx * 4]
 add eax, FLY_TURTLE_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jge flyturtle_knock_right
 mov dword ptr [enemyVelX + ecx * 4], -4
 jmp flyturtle_knock_done
flyturtle_knock_right:
 mov dword ptr [enemyVelX + ecx * 4], 4
flyturtle_knock_done:
 add score, SCORE_FIREBALL_KILL
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_FIREBALL_KILL, eax, ebx
 pop ecx
 jmp kill_enemy_on_block_done

kill_bowser_on_block:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 mov dword ptr [enemyVelY + ecx * 4], -12
 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jge bowser_knock_right
 mov dword ptr [enemyVelX + ecx * 4], -4
 jmp bowser_knock_done
bowser_knock_right:
 mov dword ptr [enemyVelX + ecx * 4], 4
bowser_knock_done:
 mov dword ptr [enemyTimer + ecx * 4], 10
 add score, SCORE_BOWSER
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_BOWSER, eax, ebx
 pop ecx
 jmp kill_enemy_on_block_done

next_enemy_on_block:
 inc ecx
 jmp check_enemy_on_block_loop

kill_enemy_on_block_done:
 ret
KillEnemyOnBlock endp

CheckCoinOnBlock proc uses eax ebx ecx edx esi, blockRow:DWORD, blockCol:DWORD

 local coinRow:DWORD
 local coinCol:DWORD
 local coinWorldX:DWORD
 local coinWorldY:DWORD

 mov eax, blockRow
 dec eax
 mov coinRow, eax
 mov eax, blockCol
 mov coinCol, eax

 cmp coinRow, 0
 jl check_coin_done
 mov eax, TILE_ROWS
 cmp coinRow, eax
 jge check_coin_done

 mov eax, coinRow
 imul eax, TILE_COLS
 add eax, coinCol
 lea esi, level1
 add esi, eax
 movzx eax, byte ptr [esi]
 cmp al, TILE_COIN
 jne check_coin_done

 mov byte ptr [esi], 0

 mov eax, coinCol
 imul eax, TILE_SIZE
 mov coinWorldX, eax
 mov eax, coinRow
 imul eax, TILE_SIZE
 mov coinWorldY, eax

 xor esi, esi
find_coin_popup_slot_on_block:
 cmp esi, MAX_COIN_POPUPS
 jge coin_popup_done
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je found_coin_popup_slot_on_block
 inc esi
 jmp find_coin_popup_slot_on_block
found_coin_popup_slot_on_block:
 mov eax, coinWorldX
 add eax, 8
 mov [coinPopupX + esi * 4], eax
 mov eax, coinWorldY
 sub eax, 16
 mov [coinPopupY + esi * 4], eax
 mov dword ptr [coinPopupVelY + esi * 4], - 12
 mov dword ptr [coinPopupFrame + esi * 4], 30
coin_popup_done:

 mov eax, 1
 call CollectCoins

check_coin_done:
 ret
CheckCoinOnBlock endp

ResetEnemiesToSpawn proc uses eax ebx ecx edx
 mov ecx, 0

reset_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge reset_enemies_done

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je reset_enemy_next
 cmp eax, ENEMY_BOWSER_FIREBALL
 je reset_enemy_next

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_INACTIVE
 je reset_enemy_next
 cmp eax, ESTATE_DEAD
 je reset_enemy_next

 mov eax, [enemySpawnX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 mov eax, [enemySpawnY + ecx * 4]
 mov [enemyY + ecx * 4], eax
 mov [enemyBaseY + ecx * 4], eax

 mov dword ptr [enemyVelY + ecx * 4], 0

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_GOOMBA
 jne reset_check_turtle
 jmp reset_enemy_next

reset_check_turtle:
 cmp eax, ENEMY_TURTLE
 jne reset_check_flyturtle
 jmp reset_enemy_next

reset_check_flyturtle:
 cmp eax, ENEMY_FLYING_TURTLE
 jne reset_check_piranha
 jmp reset_enemy_next

reset_check_piranha:
 cmp eax, ENEMY_PIRANHA
 jne reset_check_bowser
 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE
 mov dword ptr [enemyMouthState + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 60
 mov dword ptr [enemyVelX + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 0
 mov dword ptr [enemyPipeHiddenY + ecx * 4], 0
 mov dword ptr [enemyPipeVisibleY + ecx * 4], 0
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 0
 jmp reset_enemy_next

reset_check_bowser:
 cmp eax, ENEMY_BOWSER
 jne reset_enemy_next
 mov dword ptr [enemyFrame + ecx * 4], BOWSER_WALK1
 mov dword ptr [enemyMouthState + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], BOWSER_FIREBALL_TIMER
 mov dword ptr [enemyHitCount + ecx * 4], 0
 mov dword ptr [enemyKickCount + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 0
 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE

reset_enemy_next:
 inc ecx
 jmp reset_enemy_loop

reset_enemies_done:
 ret

ResetEnemiesToSpawn endp

EnemyApplyGravityAndGround proc uses eax ebx ecx edx esi edi, idx:DWORD, w:DWORD, h:DWORD
 mov esi, idx

 mov eax, [enemyVelY + esi * 4]
 add eax, GRAVITY
 cmp eax, 12

 jle enemy_grav_ok
 mov eax, 12
enemy_grav_ok:
 mov [enemyVelY + esi * 4], eax
 add [enemyY + esi * 4], eax

 mov eax, [enemyY + esi * 4]
 cmp eax, 0
 jge enemy_y_min_ok
 xor eax, eax
enemy_y_min_ok:
 mov edx, TILE_ROWS

 imul edx, TILE_SIZE
 sub edx, h
 cmp eax, edx

 jle enemy_y_ok
 mov eax, edx
 mov dword ptr [enemyVelY + esi * 4], 0
enemy_y_ok:

 mov edx, h
 add eax, edx
 dec eax

 cmp eax, 0
 jge enemy_y_div_ok
 mov eax, 0
enemy_y_div_ok:
 xor edx, edx

 mov ebx, TILE_SIZE
 div ebx
 mov edi, eax

 mov eax, TILE_ROWS
 dec eax
 cmp edi, eax

 jle enemy_row_ok
 mov edi, eax
enemy_row_ok:

 mov eax, [enemyX + esi * 4]
 cmp eax, 0
 jge enemy_x_min_ok
 xor eax, eax
enemy_x_min_ok:
 mov edx, TILE_COLS

 imul edx, TILE_SIZE
 sub edx, w
 cmp eax, edx

 jle enemy_x_ok
 mov eax, edx
enemy_x_ok:

 cmp eax, 0
 jge enemy_x_div0_ok
 mov eax, 0
enemy_x_div0_ok:
 xor edx, edx

 mov ebx, TILE_SIZE
 div ebx
 mov ebx, eax

 mov eax, [enemyX + esi * 4]
 add eax, w
 dec eax

 cmp eax, 0

 jge enemy_x_div1_ok
 mov eax, 0
enemy_x_div1_ok:
 xor edx, edx

 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax

 mov eax, TILE_COLS
 dec eax
 cmp ebx, eax

 jle enemy_col0_ok
 mov ebx, eax
enemy_col0_ok:
 cmp ecx, eax
 jle enemy_col1_ok
 mov ecx, eax
enemy_col1_ok:

enemy_col_loop:
 cmp ebx, ecx

 jg enemy_gravity_done
 mov edx, edi
 imul edx, TILE_COLS
 add edx, ebx
 lea eax, level1
 movzx edx, byte ptr [eax + edx]

 cmp edx, 39

 je enemy_death_tile
 cmp edx, 1
 jb enemy_not_solid
 cmp edx, 31
 jle enemy_check_common
 cmp edx, TILE_LAVA_TOP
 je enemy_solid
 cmp edx, TILE_LAVA_BOTTOM
 je enemy_solid
 cmp edx, TILE_INVISIBLE_WALL
 je enemy_solid
 cmp edx, TILE_INVISIBLE_WALL_2
 je enemy_solid
 cmp edx, TILE_BRICK2
 je enemy_solid
 cmp edx, TILE_PIPE_HORIZ_TL
 je enemy_solid
 cmp edx, TILE_PIPE_HORIZ_BL
 je enemy_solid
 cmp edx, TILE_PIPE_HORIZ_TR
 je enemy_solid
 cmp edx, TILE_PIPE_HORIZ_BR
 je enemy_solid
 cmp edx, TILE_PIPE_DECOR1
 je enemy_solid
 cmp edx, TILE_PIPE_DECOR2
 je enemy_solid
 cmp edx, TILE_PIPE_DECOR3
 je enemy_solid
 jmp enemy_not_solid
enemy_check_common:
 cmp edx, 7
 je enemy_not_solid
 cmp edx, 22
 je enemy_not_solid
 cmp edx, 32
 je enemy_not_solid
 cmp edx, TILE_PIPE_HORIZ_IN
 je enemy_not_solid
 cmp edx, TILE_FLAGPOLE_FLAG
 je enemy_not_solid
 cmp edx, TILE_CASTLE_FLAG
 je enemy_not_solid

 cmp edx, TILE_MARIO_SPAWN

 je enemy_not_solid
 cmp edx, TILE_BG_CLOUD_S
 je enemy_not_solid
 cmp edx, TILE_BG_CLOUD_L
 je enemy_not_solid
 cmp edx, TILE_BG_BUSH_S
 je enemy_not_solid
 cmp edx, TILE_BG_BUSH_L
 je enemy_not_solid
 cmp edx, TILE_BG_HILL_S
 je enemy_not_solid
 cmp edx, TILE_BG_HILL_L
 je enemy_not_solid
 cmp edx, TILE_BG_CASTLE
 je enemy_not_solid

enemy_solid:
 mov eax, edi

 imul eax, TILE_SIZE
 mov edx, h
 sub eax, edx
 mov [enemyY + esi * 4], eax
 mov dword ptr [enemyVelY + esi * 4], 0
 jmp enemy_gravity_done

enemy_not_solid:
 inc ebx
 jmp enemy_col_loop

enemy_death_tile:

 mov dword ptr [enemyState + esi * 4], ESTATE_DEAD

 jmp enemy_gravity_done
enemy_gravity_done:
 ret
EnemyApplyGravityAndGround endp

EnemyCheckSideCollision proc uses eax ebx ecx edx esi edi, idx:DWORD, w:DWORD, h:DWORD
 mov esi, idx

 mov eax, [enemyX + esi * 4]
 mov ebx, [enemyY + esi * 4]

 mov ecx, [enemyVelX + esi * 4]
 cmp ecx, 0

 jg enemy_check_right_wall
 jl enemy_check_left_wall
 jmp enemy_side_collision_done

enemy_check_left_wall:

 cmp eax, 0
 jge enemy_left_x_ok
 mov eax, 0
enemy_left_x_ok:
 xor edx, edx

 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax

 mov eax, [enemyY + esi * 4]
 add eax, h
 dec eax
 cmp eax, 0

 jge enemy_left_y_ok
 mov eax, 0
enemy_left_y_ok:
 xor edx, edx

 mov ebx, TILE_SIZE
 div ebx

 mov edx, eax
 mov eax, TILE_ROWS
 dec eax
 cmp edx, eax

 jle enemy_left_row_clamped
 mov edx, eax
enemy_left_row_clamped:

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea edi, level1
 movzx eax, byte ptr [edi + eax]

 cmp al, 39
 je enemy_left_death_tile

 cmp al, 1
 jb enemy_side_collision_done
 cmp al, 31
 jle enemy_left_check_common
 cmp al, TILE_LAVA_TOP
 je enemy_left_hit_wall
 cmp al, TILE_LAVA_BOTTOM
 je enemy_left_hit_wall
 cmp al, TILE_INVISIBLE_WALL
 je enemy_left_hit_wall
 cmp al, TILE_INVISIBLE_WALL_2
 je enemy_left_hit_wall
 cmp al, TILE_BRICK2
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_HORIZ_TL
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_HORIZ_BL
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_HORIZ_TR
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_HORIZ_BR
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_DECOR1
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_DECOR2
 je enemy_left_hit_wall
 cmp al, TILE_PIPE_DECOR3
 je enemy_left_hit_wall
 jmp enemy_side_collision_done
enemy_left_check_common:
 cmp al, 7
 je enemy_side_collision_done
 cmp al, 22
 je enemy_side_collision_done
 cmp al, 32
 je enemy_side_collision_done
 cmp al, TILE_PIPE_HORIZ_IN
 je enemy_side_collision_done
 cmp al, TILE_FLAGPOLE_FLAG
 je enemy_side_collision_done
 cmp al, TILE_CASTLE_FLAG
 je enemy_side_collision_done

 cmp al, TILE_MARIO_SPAWN

 je enemy_side_collision_done
 cmp al, TILE_BG_CLOUD_S
 je enemy_side_collision_done
 cmp al, TILE_BG_CLOUD_L
 je enemy_side_collision_done
 cmp al, TILE_BG_BUSH_S
 je enemy_side_collision_done
 cmp al, TILE_BG_BUSH_L
 je enemy_side_collision_done
 cmp al, TILE_BG_HILL_S
 je enemy_side_collision_done
 cmp al, TILE_BG_HILL_L
 je enemy_side_collision_done
 cmp al, TILE_BG_CASTLE
 je enemy_side_collision_done

enemy_left_hit_wall:

 mov eax, [enemyVelX + esi * 4]
 neg eax
 mov [enemyVelX + esi * 4], eax

 mov eax, ecx
 inc eax

 imul eax, TILE_SIZE
 mov [enemyX + esi * 4], eax

 jmp enemy_side_collision_done
enemy_check_right_wall:

 mov eax, [enemyX + esi * 4]
 add eax, w
 dec eax
 cmp eax, 0
 jge enemy_right_x_ok
 mov eax, 0
enemy_right_x_ok:
 xor edx, edx

 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax

 mov eax, [enemyY + esi * 4]
 add eax, h
 dec eax
 cmp eax, 0

 jge enemy_right_y_ok
 mov eax, 0
enemy_right_y_ok:
 xor edx, edx

 mov ebx, TILE_SIZE
 div ebx

 mov edx, eax
 mov eax, TILE_ROWS
 dec eax
 cmp edx, eax

 jle enemy_right_row_clamped
 mov edx, eax
enemy_right_row_clamped:

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea edi, level1
 movzx eax, byte ptr [edi + eax]

 cmp al, 39
 je enemy_right_death_tile

 cmp al, 1
 jb enemy_side_collision_done
 cmp al, 31
 jle enemy_right_check_common
 cmp al, TILE_LAVA_TOP
 je enemy_right_hit_wall
 cmp al, TILE_LAVA_BOTTOM
 je enemy_right_hit_wall
 cmp al, TILE_INVISIBLE_WALL
 je enemy_right_hit_wall
 cmp al, TILE_INVISIBLE_WALL_2
 je enemy_right_hit_wall
 cmp al, TILE_BRICK2
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_HORIZ_TL
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_HORIZ_BL
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_HORIZ_TR
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_HORIZ_BR
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_DECOR1
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_DECOR2
 je enemy_right_hit_wall
 cmp al, TILE_PIPE_DECOR3
 je enemy_right_hit_wall
 jmp enemy_side_collision_done
enemy_right_check_common:
 cmp al, 7
 je enemy_side_collision_done
 cmp al, 22
 je enemy_side_collision_done
 cmp al, 32
 je enemy_side_collision_done
 cmp al, TILE_PIPE_HORIZ_IN
 je enemy_side_collision_done
 cmp al, TILE_FLAGPOLE_FLAG
 je enemy_side_collision_done
 cmp al, TILE_CASTLE_FLAG
 je enemy_side_collision_done

 cmp al, TILE_MARIO_SPAWN

 je enemy_side_collision_done
 cmp al, TILE_BG_CLOUD_S
 je enemy_side_collision_done
 cmp al, TILE_BG_CLOUD_L
 je enemy_side_collision_done
 cmp al, TILE_BG_BUSH_S
 je enemy_side_collision_done
 cmp al, TILE_BG_BUSH_L
 je enemy_side_collision_done
 cmp al, TILE_BG_HILL_S
 je enemy_side_collision_done
 cmp al, TILE_BG_HILL_L
 je enemy_side_collision_done
 cmp al, TILE_BG_CASTLE
 je enemy_side_collision_done

enemy_right_hit_wall:

 mov eax, [enemyVelX + esi * 4]
 neg eax
 mov [enemyVelX + esi * 4], eax

 mov eax, ecx

 imul eax, TILE_SIZE
 sub eax, w
 mov [enemyX + esi * 4], eax

 jmp enemy_side_collision_done
enemy_left_death_tile:

 mov dword ptr [enemyState + esi * 4], ESTATE_DEAD
 jmp enemy_side_collision_done

enemy_right_death_tile:

 mov dword ptr [enemyState + esi * 4], ESTATE_DEAD
 jmp enemy_side_collision_done

enemy_side_collision_done:
 ret

EnemyCheckSideCollision endp

EnemyCheckPit proc uses eax ebx ecx edx esi edi, idx:DWORD, w:DWORD, h:DWORD
 mov esi, idx

 mov eax, [enemyVelX + esi * 4]
 test eax, eax
 jz enemy_pit_check_done

 mov ebx, [enemyX + esi * 4]
 mov ecx, [enemyY + esi * 4]

 cmp eax, 0
 jg enemy_check_pit_right

enemy_check_pit_left:
 add ebx, eax
 jmp enemy_pit_check_tile

enemy_check_pit_right:
 add ebx, eax
 add ebx, w

enemy_pit_check_tile:
 add ecx, h

 cmp ebx, 0
 jl enemy_pit_check_done
 cmp ecx, 0
 jl enemy_pit_check_done

 push ecx
 mov eax, ebx
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ebx, eax
 pop ecx

 push ebx
 mov eax, ecx
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax
 pop ebx

 mov eax, TILE_COLS
 dec eax
 cmp ebx, eax
 jg enemy_pit_check_done
 cmp ebx, 0
 jl enemy_pit_check_done

 mov eax, TILE_ROWS
 dec eax
 cmp ecx, eax
 jg enemy_pit_check_done
 cmp ecx, 0
 jl enemy_pit_check_done

 push ebx
 push ecx
 push esi
 push dword ptr 0
enemy_pit_check_loop:
 mov eax, [esp]
 cmp eax, 10
 jge enemy_pit_found_cleanup

 mov eax, ecx
 add eax, [esp]
 cmp eax, TILE_ROWS
 jge enemy_pit_found_cleanup

 mov eax, ecx
 add eax, [esp]
 imul eax, TILE_COLS
 add eax, ebx
 lea edi, level1
 movzx edx, byte ptr [edi + eax]

 cmp edx, TILE_GROUND
 je enemy_pit_check_done_cleanup

 inc dword ptr [esp]
 jmp enemy_pit_check_loop

enemy_pit_found_cleanup:
 add esp, 4
 pop esi
 pop ecx
 pop ebx
 jmp enemy_pit_found

enemy_pit_check_done_cleanup:
 add esp, 4
 pop esi
 pop ecx
 pop ebx
 jmp enemy_pit_check_done

enemy_pit_found:
 mov eax, [enemyVelX + esi * 4]
 neg eax
 mov [enemyVelX + esi * 4], eax

 cmp eax, 0
 jg enemy_pit_facing_right
 mov dword ptr [enemyFacing + esi * 4], - 1
 jmp enemy_pit_check_done
enemy_pit_facing_right:
 mov dword ptr [enemyFacing + esi * 4], 1

enemy_pit_check_done:
 ret

EnemyCheckPit endp

ApplyGravityToAABB proc uses ebx ecx edx esi edi, pX:DWORD, pY:DWORD, pVelY:DWORD, w:DWORD, h:DWORD
 mov esi, pX
 mov edi, pY
 mov ebx, pVelY

 mov eax, [ebx]
 add eax, GRAVITY
 cmp eax, 12
 jle aabb_grav_ok
 mov eax, 12
aabb_grav_ok:
 mov [ebx], eax
 add [edi], eax

 mov eax, [edi]
 cmp eax, 0
 jge aabb_y_min_ok
 xor eax, eax
aabb_y_min_ok:
 mov edi, TILE_ROWS
 imul edi, TILE_SIZE
 sub edi, h
 cmp eax, edi
 jle aabb_y_ok
 mov eax, edi
 mov edx, pVelY
 mov dword ptr [edx], 0
aabb_y_ok:
 mov edx, h
 add eax, edx
 dec eax

 cmp eax, 0
 jge aabb_y_div_ok
 mov eax, 0
aabb_y_div_ok:
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ebx, eax

 mov eax, TILE_ROWS
 dec eax
 cmp ebx, eax
 jle aabb_row_ok
 mov ebx, eax
aabb_row_ok:

 mov eax, [esi]
 cmp eax, 0
 jge aabb_x_min_ok
 xor eax, eax
aabb_x_min_ok:
 mov edi, TILE_COLS
 imul edi, TILE_SIZE
 sub edi, w
 cmp eax, edi
 jle aabb_x_ok
 mov eax, edi
aabb_x_ok:

 cmp eax, 0
 jge aabb_x_div0_ok
 mov eax, 0
aabb_x_div0_ok:
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax

 mov eax, [esi]
 add eax, w
 dec eax

 cmp eax, 0
 jge aabb_x_div1_ok
 mov eax, 0
aabb_x_div1_ok:
 xor edx, edx
 push ebx
 mov ebx, TILE_SIZE
 div ebx
 pop ebx
 mov edx, eax

 mov eax, TILE_COLS
 dec eax
 cmp ecx, eax
 jle aabb_col0_ok
 mov ecx, eax
aabb_col0_ok:
 cmp edx, eax
 jle aabb_col1_ok
 mov edx, eax
aabb_col1_ok:

 xor eax, eax
aabb_col_loop:
 cmp ecx, edx
 jg aabb_done
 mov esi, ebx
 imul esi, TILE_COLS
 add esi, ecx
 lea edi, level1
 movzx esi, byte ptr [edi + esi]

 cmp esi, 1
 jb aabb_not_solid
 cmp esi, 31
 jle aabb_check_common
 cmp esi, TILE_LAVA_TOP
 je aabb_solid
 cmp esi, TILE_LAVA_BOTTOM
 je aabb_solid
 cmp esi, TILE_BRICK2
 je aabb_solid
 cmp esi, TILE_PIPE_HORIZ_TL
 je aabb_solid
 cmp esi, TILE_PIPE_HORIZ_BL
 je aabb_solid
 cmp esi, TILE_PIPE_HORIZ_TR
 je aabb_solid
 cmp esi, TILE_PIPE_HORIZ_BR
 je aabb_solid
 cmp esi, TILE_PIPE_DECOR1
 je aabb_solid
 cmp esi, TILE_PIPE_DECOR2
 je aabb_solid
 cmp esi, TILE_PIPE_DECOR3
 je aabb_solid
 jmp aabb_not_solid
aabb_check_common:
 cmp esi, 7
 je aabb_not_solid
 cmp esi, 22
 je aabb_not_solid
 cmp esi, 32
 je aabb_not_solid
 cmp esi, TILE_PIPE_HORIZ_IN
 je aabb_not_solid
aabb_solid:
 mov eax, ebx
 imul eax, TILE_SIZE
 mov esi, h
 sub eax, esi
 mov edi, pY
 mov [edi], eax
 mov edi, pVelY
 mov dword ptr [edi], 0
 mov eax, 1
 jmp aabb_done

aabb_not_solid:
 inc ecx
 jmp aabb_col_loop

aabb_done:
 ret
ApplyGravityToAABB endp

SpawnEnemy proc uses eax ebx ecx edx, etype:DWORD, ex:DWORD, ey:DWORD

 mov ecx, 0

find_enemy_slot:
 cmp ecx, MAX_ENEMIES
 jge spawn_enemy_failed
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je found_enemy_slot
 inc ecx
 jmp find_enemy_slot

found_enemy_slot:
 mov eax, etype
 mov [enemyType + ecx * 4], eax
 mov eax, ex
 mov [enemyX + ecx * 4], eax
 mov [enemySpawnX + ecx * 4], eax
 mov eax, ey
 mov [enemyY + ecx * 4], eax
 mov [enemySpawnY + ecx * 4], eax
 mov [enemyBaseY + ecx * 4], eax
 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE
 mov dword ptr [enemyFrame + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 0

 mov eax, etype
 cmp eax, ENEMY_GOOMBA
 jne check_turtle_spawn
 mov dword ptr [enemyVelX + ecx * 4], - 1
 jmp spawn_enemy_done

check_turtle_spawn:
 cmp eax, ENEMY_TURTLE
 jne check_flyturtle_spawn
 mov dword ptr [enemyVelX + ecx * 4], - 1
 jmp spawn_enemy_done

check_flyturtle_spawn:
 cmp eax, ENEMY_FLYING_TURTLE
 jne check_piranha_spawn
 mov dword ptr [enemyVelX + ecx * 4], - 1
 mov dword ptr [enemyVelY + ecx * 4], 0
 jmp spawn_enemy_done

check_piranha_spawn:
 cmp eax, ENEMY_PIRANHA
 jne check_bowser_spawn
 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE
 mov dword ptr [enemyMouthState + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 60
 mov dword ptr [enemyPipeHiddenY + ecx * 4], 0
 mov dword ptr [enemyPipeVisibleY + ecx * 4], 0
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 0
 mov dword ptr [enemyMouthTimer + ecx * 4], 60
 jmp spawn_enemy_done

check_bowser_spawn:
 cmp eax, ENEMY_BOWSER
 jne spawn_enemy_done
 mov dword ptr [enemyVelX + ecx * 4], - 1
 mov dword ptr [enemyFacing + ecx * 4], - 1
 mov dword ptr [enemyFrame + ecx * 4], BOWSER_WALK1
 mov dword ptr [enemyMouthState + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], BOWSER_FIREBALL_TIMER
 mov dword ptr [enemyHitCount + ecx * 4], 0
 mov dword ptr [enemyKickCount + ecx * 4], 0

spawn_enemy_done:
 ret

spawn_enemy_failed:
 ret

SpawnEnemy endp

SpawnBowserFireball proc uses eax ebx ecx edx, fireX:DWORD, fireY:DWORD, bowserFacing:DWORD

 mov ecx, 0
find_fireball_slot:
 cmp ecx, MAX_ENEMIES
 jge spawn_fb_done
 mov eax, [enemyType + ecx * 4]

 cmp eax, ENEMY_NONE
 je found_fireball_slot
 inc ecx
 jmp find_fireball_slot

found_fireball_slot:

 mov dword ptr [enemyType + ecx * 4], ENEMY_BOWSER_FIREBALL
 mov eax, fireX
 mov [enemyX + ecx * 4], eax
 mov eax, fireY
 mov [enemyY + ecx * 4], eax
 mov [enemyBaseY + ecx * 4], eax
 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE
 mov dword ptr [enemyFrame + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 0

 mov eax, bowserFacing
 mov dword ptr [enemyFacing + ecx * 4], eax

 imul eax, 4
 mov dword ptr [enemyVelX + ecx * 4], eax
 call PlayBowserFireSound

spawn_fb_done:
 ret

SpawnBowserFireball endp

UpdateEnemies proc uses eax ebx edx esi edi

 inc enemyAnimTimer

 mov ecx, 0

update_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge update_enemies_done

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je next_enemy_update

 cmp eax, ENEMY_GOOMBA
 je update_goomba_enemy
 cmp eax, ENEMY_PIRANHA
 je update_piranha_enemy
 cmp eax, ENEMY_BOWSER
 je update_bowser_enemy
 cmp eax, ENEMY_FLYING_TURTLE
 je update_flyturtle_enemy
 cmp eax, ENEMY_TURTLE
 je update_turtle_enemy
 cmp eax, ENEMY_BOWSER_FIREBALL
 je update_bowser_fire
 jmp next_enemy_update

update_goomba_enemy:
 invoke UpdateGoombaEnemy, ecx
 jmp next_enemy_update

update_piranha_enemy:
 invoke UpdatePiranhaEnemy, ecx
 jmp next_enemy_update

update_bowser_enemy:
 invoke UpdateBowserEnemy, ecx
 jmp next_enemy_update

update_flyturtle_enemy:
 invoke UpdateFlyTurtleEnemy, ecx
 jmp next_enemy_update

update_turtle_enemy:
 invoke UpdateTurtleEnemy, ecx
 jmp next_enemy_update

update_bowser_fire:
 invoke UpdateBowserFireEnemy, ecx
 jmp next_enemy_update

next_enemy_update:
 inc ecx
 jmp update_enemy_loop

update_enemies_done:
 ret

UpdateEnemies endp

UpdateGoombaEnemy proc uses eax ebx edx esi edi, idx:DWORD
 mov ecx, idx

 mov eax, [enemyState + ecx * 4]

 cmp eax, ESTATE_DYING
 je goomba_dying_update
 cmp eax, ESTATE_DEAD
 je goomba_dead_update
 cmp eax, ESTATE_ACTIVE
 jne goomba_update_done

 invoke EnemyCheckPit, ecx, GOOMBA_W, GOOMBA_H

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 invoke EnemyCheckSideCollision, ecx, GOOMBA_W, GOOMBA_H

 mov eax, [enemyVelX + ecx * 4]
 cmp eax, 0
 jg goomba_facing_right
 mov dword ptr [enemyFacing + ecx * 4], - 1
 jmp goomba_check_bounds
goomba_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], 1

goomba_check_bounds:

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl goomba_reverse_screen
 mov ebx, cameraX

 add ebx, WINDOW_WIDTH
 sub ebx, GOOMBA_W
 cmp eax, ebx
 jg goomba_reverse_screen

 cmp eax, 0
 jl goomba_reverse
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, GOOMBA_W
 cmp eax, ebx
 jg goomba_reverse
 jmp goomba_apply_grav

goomba_reverse_screen:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg goomba_reverse_screen_facing_right
 mov dword ptr [enemyFacing + ecx * 4], - 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_apply_grav
goomba_reverse_screen_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_apply_grav

goomba_reverse:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg goomba_reverse_facing_right
 mov dword ptr [enemyFacing + ecx * 4], - 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_apply_grav
goomba_reverse_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_apply_grav

goomba_apply_grav:
 invoke EnemyApplyGravityAndGround, ecx, GOOMBA_W, GOOMBA_H

 mov eax, [enemyX + ecx * 4]
 cmp eax, 0
 jge goomba_x_min_ok
 mov dword ptr [enemyX + ecx * 4], 0

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg goomba_clamp_min_facing_right
 mov dword ptr [enemyFacing + ecx * 4], - 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_x_min_ok
goomba_clamp_min_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
goomba_x_min_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, GOOMBA_W
 cmp eax, ebx
 jle goomba_x_max_ok
 mov dword ptr [enemyX + ecx * 4], ebx

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg goomba_clamp_max_facing_right
 mov dword ptr [enemyFacing + ecx * 4], - 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 jmp goomba_x_max_ok
goomba_clamp_max_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], 1

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax
goomba_x_max_ok:

goomba_dying_update:

 mov eax, [enemyTimer + ecx * 4]
 cmp eax, 0
 jle goomba_dying_reset
 dec dword ptr [enemyTimer + ecx * 4]
 cmp dword ptr [enemyTimer + ecx * 4], 0
 jg goomba_update_done

 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 mov dword ptr [enemyVelY + ecx * 4], 0
 jmp goomba_update_done

goomba_dying_reset:

 mov dword ptr [enemyState + ecx * 4], ESTATE_ACTIVE
 mov dword ptr [enemyTimer + ecx * 4], 0
 jmp goomba_update_done

goomba_dead_update:

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 mov eax, [enemyVelY + ecx * 4]

 add eax, GRAVITY
 cmp eax, 12
 jle goomba_dead_vel_ok
 mov eax, 12
goomba_dead_vel_ok:
 mov [enemyVelY + ecx * 4], eax
 add [enemyY + ecx * 4], eax

 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 cmp eax, WINDOW_HEIGHT
 jl goomba_update_done

 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
goomba_update_done:
 ret

UpdateGoombaEnemy endp

UpdatePiranhaEnemy proc uses eax ebx ecx edx esi edi, idx:DWORD
 mov ecx, idx

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_DYING
 je piranha_dying_update
 cmp eax, ESTATE_ACTIVE
 jne piranha_update_done

 mov eax, [enemyPipeHiddenY + ecx * 4]
 test eax, eax
 jnz piranha_movement_initialized

 mov eax, [enemySpawnY + ecx * 4]
 sub eax, piranhaVertOffset
 mov [enemyPipeVisibleY + ecx * 4], eax
 mov eax, [enemySpawnY + ecx * 4]
 add eax, 32
 mov [enemyPipeHiddenY + ecx * 4], eax
 mov [enemyY + ecx * 4], eax
 mov eax, [enemySpawnX + ecx * 4]
 mov [enemyX + ecx * 4], eax
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 1
 mov dword ptr [enemyTimer + ecx * 4], 60
 mov dword ptr [enemyMouthTimer + ecx * 4], 60
 jmp piranha_update_done

piranha_movement_initialized:
 dec dword ptr [enemyMouthTimer + ecx * 4]
 cmp dword ptr [enemyMouthTimer + ecx * 4], 0
 jg piranha_check_movement
 mov eax, [enemyMouthState + ecx * 4]
 xor eax, 1
 mov [enemyMouthState + ecx * 4], eax
 test eax, eax
 jz piranha_mouth_open
 mov dword ptr [enemyMouthTimer + ecx * 4], 30
 jmp piranha_check_movement
piranha_mouth_open:
 mov dword ptr [enemyMouthTimer + ecx * 4], 60

piranha_check_movement:
 mov eax, [enemyPipeMovingUp + ecx * 4]
 test eax, eax
 jnz piranha_move_up

 mov eax, [enemyY + ecx * 4]
 add eax, 1
 mov [enemyY + ecx * 4], eax
 mov ebx, [enemyPipeHiddenY + ecx * 4]
 cmp eax, ebx
 jl piranha_update_done
 mov [enemyY + ecx * 4], ebx
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 1
 mov dword ptr [enemyTimer + ecx * 4], 90
 jmp piranha_update_done

piranha_move_up:
 mov eax, [enemyTimer + ecx * 4]
 test eax, eax
 jz piranha_do_move_up
 dec dword ptr [enemyTimer + ecx * 4]
 jmp piranha_update_done

piranha_do_move_up:
 mov eax, [enemyY + ecx * 4]
 sub eax, 1
 mov [enemyY + ecx * 4], eax
 mov ebx, [enemyPipeVisibleY + ecx * 4]
 cmp eax, ebx
 jg piranha_update_done
 mov [enemyY + ecx * 4], ebx
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 120

piranha_update_done:
 ret

piranha_dying_update:
 add dword ptr [enemyY + ecx * 4], 6
 add dword ptr [enemyVelY + ecx * 4], 1
 mov eax, [enemyY + ecx * 4]
 cmp eax, WINDOW_HEIGHT
 jl piranha_update_done
 mov dword ptr [enemyPipeHiddenY + ecx * 4], 0
 mov dword ptr [enemyPipeVisibleY + ecx * 4], 0
 mov dword ptr [enemyPipeMovingUp + ecx * 4], 0
 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 jmp piranha_update_done

UpdatePiranhaEnemy endp

UpdateBowserEnemy proc uses eax ebx ecx edx esi edi, idx:DWORD
 mov ecx, idx

 mov eax, [enemyState + ecx * 4]

 cmp eax, ESTATE_DYING
 je bowser_dying
 cmp eax, ESTATE_ACTIVE
 jne bowser_update_done

bowser_active:

 mov eax, [enemyMouthState + ecx * 4]
 test eax, eax
 jnz bowser_shooting_state

bowser_walking_state:

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX

 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_mario_left

 mov dword ptr [enemyFacing + ecx * 4], 1
 mov dword ptr [enemyVelX + ecx * 4], 1
 jmp bowser_move_towards_mario

bowser_mario_left:

 mov dword ptr [enemyFacing + ecx * 4], - 1
 mov dword ptr [enemyVelX + ecx * 4], - 1

bowser_move_towards_mario:

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl bowser_hit_left_boundary
 mov ebx, cameraX
 add ebx, WINDOW_WIDTH
 sub ebx, BOWSER_W
 cmp eax, ebx
 jg bowser_hit_right_boundary

 cmp eax, 0
 jl bowser_hit_left_boundary
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, BOWSER_W
 cmp eax, ebx
 jg bowser_hit_right_boundary

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 invoke EnemyCheckSideCollision, ecx, BOWSER_W, BOWSER_H

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_recalc_left

 mov dword ptr [enemyFacing + ecx * 4], 1
 mov dword ptr [enemyVelX + ecx * 4], 1
 jmp bowser_check_fireball_timer
bowser_recalc_left:

 mov dword ptr [enemyFacing + ecx * 4], - 1
 mov dword ptr [enemyVelX + ecx * 4], - 1
 jmp bowser_check_fireball_timer

bowser_hit_left_boundary:

 mov dword ptr [enemyVelX + ecx * 4], 0

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_boundary_face_left
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp bowser_check_fireball_timer
bowser_boundary_face_left:
 mov dword ptr [enemyFacing + ecx * 4], - 1
 jmp bowser_check_fireball_timer

bowser_hit_right_boundary:

 mov dword ptr [enemyVelX + ecx * 4], 0

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_boundary_face_left2
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp bowser_check_fireball_timer
bowser_boundary_face_left2:
 mov dword ptr [enemyFacing + ecx * 4], - 1
 jmp bowser_check_fireball_timer

bowser_check_fireball_timer:

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_walking_face_left

 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp bowser_check_timer_continue
bowser_walking_face_left:

 mov dword ptr [enemyFacing + ecx * 4], - 1
bowser_check_timer_continue:

 mov eax, [enemyTimer + ecx * 4]
 dec eax
 mov [enemyTimer + ecx * 4], eax
 cmp eax, 0
 jg bowser_walking_animation

 mov dword ptr [enemyMouthState + ecx * 4], 1
 mov dword ptr [enemyFrame + ecx * 4], BOWSER_SHOOT
 mov dword ptr [enemyHitCount + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], 0
 mov dword ptr [enemyVelX + ecx * 4], 0
 jmp bowser_apply_grav

bowser_walking_animation:

 mov eax, [enemyTimer + ecx * 4]
 shr eax, 3
 and eax, 1
 add eax, BOWSER_WALK1
 mov [enemyFrame + ecx * 4], eax
 jmp bowser_apply_grav

bowser_shooting_state:

 mov ebx, [enemyVelX + ecx * 4]
 test ebx, ebx
 jz bowser_shooting_timer
 mov edx, [enemyX + ecx * 4]
 add edx, ebx
 mov [enemyX + ecx * 4], edx

 invoke EnemyCheckSideCollision, ecx, BOWSER_W, BOWSER_H
bowser_shooting_timer:

 mov eax, [enemyTimer + ecx * 4]
 inc eax
 mov [enemyTimer + ecx * 4], eax

 mov ebx, [enemyHitCount + ecx * 4]
 cmp ebx, 10
 jge bowser_shooting_animation

 push eax
 push ebx
 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W / 2
 mov ebx, marioX
 add ebx, HITBOX_WIDTH / 2
 cmp eax, ebx
 jg bowser_shooting_face_left

 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp bowser_shooting_face_done
bowser_shooting_face_left:

 mov dword ptr [enemyFacing + ecx * 4], - 1
bowser_shooting_face_done:
 pop ebx
 pop eax

 cmp ebx, 0
 jne bowser_check_second_fireball
 cmp eax, 30
 jl bowser_shooting_animation

 ; Preserve ECX (Bowser enemy index) across function call
 ; SpawnBowserFireball uses ECX internally but preserves it via uses clause
 mov edx, [enemyFacing + ecx * 4]
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]

 sub ebx, BOWSER_H
 add ebx, 72
 cmp edx, - 1
 je bowser_fire1_from_left

 add eax, BOWSER_W
 jmp bowser_fire1_spawn
bowser_fire1_from_left:

 add eax, 8
bowser_fire1_spawn:
 push ecx
 invoke SpawnBowserFireball, eax, ebx, edx
 pop ecx
 mov dword ptr [enemyHitCount + ecx * 4], 1
 jmp bowser_shooting_animation

bowser_check_second_fireball:

 cmp ebx, 1
 jne bowser_check_resume_walking
 cmp eax, 31
 jl bowser_shooting_animation

 ; Preserve ECX (Bowser enemy index) across function call
 ; SpawnBowserFireball uses ECX internally but preserves it via uses clause
 mov edx, [enemyFacing + ecx * 4]
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]

 sub ebx, BOWSER_H
 add ebx, 72
 cmp edx, - 1
 je bowser_fire2_from_left

 add eax, BOWSER_W
 jmp bowser_fire2_spawn
bowser_fire2_from_left:

 add eax, 8
bowser_fire2_spawn:
 push ecx
 invoke SpawnBowserFireball, eax, ebx, edx
 pop ecx
 mov dword ptr [enemyHitCount + ecx * 4], 2
 jmp bowser_shooting_animation

bowser_check_resume_walking:

 mov eax, [enemyTimer + ecx * 4]
 cmp eax, 60
 jl bowser_shooting_animation

 mov dword ptr [enemyMouthState + ecx * 4], 0
 mov dword ptr [enemyTimer + ecx * 4], BOWSER_FIREBALL_TIMER
 mov dword ptr [enemyFrame + ecx * 4], BOWSER_WALK1

bowser_shooting_animation:

 mov dword ptr [enemyFrame + ecx * 4], BOWSER_SHOOT
 jmp bowser_apply_grav

bowser_apply_grav:
 invoke EnemyApplyGravityAndGround, ecx, BOWSER_W, BOWSER_H

 mov eax, [enemyY + ecx * 4]
 add eax, BOWSER_H
 cmp eax, 0
 jl bowser_update_done
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edi, eax

 mov eax, [enemyX + ecx * 4]
 cmp eax, 0
 jl bowser_update_done
 xor edx, edx
 div ebx
 mov esi, eax

 mov eax, [enemyX + ecx * 4]
 add eax, BOWSER_W
 dec eax
 cmp eax, 0
 jl bowser_update_done
 xor edx, edx
 div ebx
 mov ebx, eax

 mov eax, TILE_ROWS
 dec eax
 cmp edi, eax
 jle bowser_row_ok
 mov edi, eax
bowser_row_ok:
 mov eax, TILE_COLS
 dec eax
 cmp esi, eax
 jle bowser_col0_ok
 mov esi, eax
bowser_col0_ok:
 cmp ebx, eax
 jle bowser_col1_ok
 mov ebx, eax
bowser_col1_ok:

 mov eax, esi
bowser_lava_check_loop:
 cmp eax, ebx
 jg bowser_update_done

 push eax
 mov edx, edi
 imul edx, TILE_COLS
 add edx, eax
 lea eax, level1
 movzx edx, byte ptr [eax + edx]
 pop eax

 cmp edx, TILE_LAVA_TOP
 je bowser_die_lava
 cmp edx, TILE_LAVA_BOTTOM
 je bowser_die_lava

 inc eax
 jmp bowser_lava_check_loop

bowser_die_lava:

 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyVelY + ecx * 4], - 8
 mov dword ptr [enemyVelX + ecx * 4], 0
 jmp bowser_update_done

bowser_dying:

 mov eax, [enemyVelY + ecx * 4]

 add eax, GRAVITY
 cmp eax, 12
 jle bowser_dying_grav_ok
 mov eax, 12
bowser_dying_grav_ok:
 mov [enemyVelY + ecx * 4], eax
 mov eax, [enemyY + ecx * 4]
 add eax, [enemyVelY + ecx * 4]
 mov [enemyY + ecx * 4], eax

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 mov eax, [enemyY + ecx * 4]
 mov ebx, TILE_ROWS
 imul ebx, TILE_SIZE
 cmp eax, ebx
 jg bowser_remove
 jmp bowser_update_done

bowser_remove:

 ; Bowser fell into lava and is fully gone: mark him as DEAD
 ; (keep enemyType as ENEMY_BOWSER so the boss-death check can see it)
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 jmp bowser_update_done

bowser_update_done:
 ret

UpdateBowserEnemy endp

UpdateFlyTurtleEnemy proc uses eax ebx edx esi edi, idx:DWORD
 mov ecx, idx

 mov eax, [enemyState + ecx * 4]

 cmp eax, ESTATE_DYING
 je flyturtle_dying
 cmp eax, ESTATE_ACTIVE
 jne flyturtle_done

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 invoke EnemyCheckSideCollision, ecx, FLY_TURTLE_W, FLY_TURTLE_H

 mov eax, [enemyVelX + ecx * 4]
 cmp eax, 0
 jg flyturtle_facing_right
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp flyturtle_check_bounds
flyturtle_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], - 1

flyturtle_check_bounds:

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl flyturtle_reverse_screen
 mov ebx, cameraX

 add ebx, WINDOW_WIDTH
 sub ebx, FLY_TURTLE_W
 cmp eax, ebx
 jg flyturtle_reverse_screen

 cmp eax, 0
 jl flyturtle_reverse
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, FLY_TURTLE_W
 cmp eax, ebx
 jg flyturtle_reverse
 jmp flyturtle_sine_movement

flyturtle_reverse_screen:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 mov [enemyFacing + ecx * 4], eax
 jmp flyturtle_sine_movement

flyturtle_reverse:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 mov [enemyFacing + ecx * 4], eax

flyturtle_sine_movement:

 inc dword ptr [enemyFrame + ecx * 4]
 mov eax, [enemyFrame + ecx * 4]
 and eax, 63
 cmp eax, 32
 jge flyturtle_down

 sub dword ptr [enemyY + ecx * 4], 1
 jmp flyturtle_done
flyturtle_down:
 add dword ptr [enemyY + ecx * 4], 1
 jmp flyturtle_done

flyturtle_dying:

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 mov eax, [enemyVelY + ecx * 4]
 test eax, eax
 jnz flyturtle_death_fall
 mov dword ptr [enemyVelY + ecx * 4], 0
flyturtle_death_fall:
 mov eax, [enemyVelY + ecx * 4]
 add eax, GRAVITY
 cmp eax, 12
 jle flyturtle_death_vel_ok
 mov eax, 12
flyturtle_death_vel_ok:
 mov [enemyVelY + ecx * 4], eax
 add [enemyY + ecx * 4], eax
 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 cmp eax, WINDOW_HEIGHT
 jl flyturtle_done

 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
flyturtle_done:
 ret

UpdateFlyTurtleEnemy endp

UpdateTurtleEnemy proc uses eax ebx edx esi edi, idx:DWORD
 mov ecx, idx

 mov eax, [enemyState + ecx * 4]

 cmp eax, ESTATE_DYING
 je turtle_dying

 invoke EnemyApplyGravityAndGround, ecx, TURTLE_W, TURTLE_H
 mov eax, [enemyState + ecx * 4]

 cmp eax, ESTATE_SHELL_IDLE
 je turtle_shell_idle
 cmp eax, ESTATE_SHELL_SLIDE
 je turtle_shell_slide
 cmp eax, ESTATE_ACTIVE
 jne turtle_done

 invoke EnemyCheckPit, ecx, TURTLE_W, TURTLE_H

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 invoke EnemyCheckSideCollision, ecx, TURTLE_W, TURTLE_H

 mov eax, [enemyVelX + ecx * 4]
 cmp eax, 0
 jg turtle_facing_right
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp turtle_check_bounds
turtle_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], - 1

turtle_check_bounds:

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl turtle_reverse_screen
 mov ebx, cameraX

 add ebx, WINDOW_WIDTH
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg turtle_reverse_screen

 cmp eax, 0
 jl turtle_reverse
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg turtle_reverse
 jmp turtle_done

turtle_reverse_screen:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg turtle_reverse_screen_facing_right
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp turtle_done
turtle_reverse_screen_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], - 1
 jmp turtle_done

turtle_reverse:

 mov eax, [enemyVelX + ecx * 4]
 neg eax
 mov [enemyVelX + ecx * 4], eax

 cmp eax, 0
 jg turtle_reverse_level_facing_right
 mov dword ptr [enemyFacing + ecx * 4], 1
 jmp turtle_done
turtle_reverse_level_facing_right:
 mov dword ptr [enemyFacing + ecx * 4], - 1
 jmp turtle_done

turtle_shell_idle:

 jmp turtle_done

turtle_shell_slide:

 mov eax, [enemyTimer + ecx * 4]
 cmp eax, 1
 je shell_infinite_bounce

 mov eax, [enemyVelX + ecx * 4]
 test eax, eax
 jz turtle_shell_stopped
 jns shell_decel_right

 inc eax
 cmp eax, 0
 jge shell_vel_zero
 mov [enemyVelX + ecx * 4], eax
 jmp shell_move
shell_decel_right:

 dec eax
 cmp eax, 0
 jle shell_vel_zero
 mov [enemyVelX + ecx * 4], eax
 jmp shell_move
shell_vel_zero:

 mov dword ptr [enemyVelX + ecx * 4], 0
 jmp turtle_shell_stopped

shell_infinite_bounce:

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl shell_bounce_infinite
 mov ebx, cameraX
 add ebx, WINDOW_WIDTH
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg shell_bounce_infinite

 cmp eax, 0
 jl shell_bounce_infinite
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg shell_bounce_infinite

 invoke EnemyCheckSideCollision, ecx, TURTLE_W, TURTLE_H

 call CheckShellEnemyCollision

 jmp turtle_done

shell_bounce_infinite:

 neg dword ptr [enemyVelX + ecx * 4]
 jmp turtle_done

shell_move:

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 invoke EnemyCheckSideCollision, ecx, TURTLE_W, TURTLE_H

 call CheckShellEnemyCollision

 mov eax, [enemyVelX + ecx * 4]
 test eax, eax
 jz turtle_shell_stopped
 jmp turtle_shell_check_bounds

turtle_shell_stopped:

 mov dword ptr [enemyState + ecx * 4], ESTATE_SHELL_IDLE
 mov dword ptr [enemyVelX + ecx * 4], 0
 jmp turtle_done

turtle_shell_check_bounds:

 mov eax, [enemyTimer + ecx * 4]
 test eax, eax
 jz turtle_shell_check_level_bounds

 mov eax, [enemyX + ecx * 4]
 mov ebx, cameraX
 cmp eax, ebx
 jl turtle_shell_bounce
 mov ebx, cameraX

 add ebx, WINDOW_WIDTH
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg turtle_shell_bounce
 jmp turtle_shell_check_level_bounds

turtle_shell_check_level_bounds:

 mov eax, [enemyX + ecx * 4]
 cmp eax, 0
 jl turtle_shell_bounce
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, TURTLE_W
 cmp eax, ebx
 jg turtle_shell_bounce
 jmp turtle_done

turtle_shell_bounce:

 neg dword ptr [enemyVelX + ecx * 4]
 jmp turtle_done

turtle_dying:

 mov eax, [enemyTimer + ecx * 4]
 test eax, eax
 jnz turtle_death_fall
 mov dword ptr [enemyTimer + ecx * 4], 1
 mov dword ptr [enemyVelY + ecx * 4], 4
 mov dword ptr [enemyVelX + ecx * 4], 0
turtle_death_fall:

 mov eax, [enemyVelY + ecx * 4]
 add eax, GRAVITY
 cmp eax, 12
 jle turtle_death_vel_ok
 mov eax, 12
turtle_death_vel_ok:
 mov [enemyVelY + ecx * 4], eax
 add [enemyY + ecx * 4], eax
 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 cmp eax, WINDOW_HEIGHT
 jl turtle_done

 mov shellComboCount, 0

 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
turtle_done:
 ret

UpdateTurtleEnemy endp

CheckShellEnemyCollision proc uses eax ebx edx esi edi
 local shellLeft:DWORD
 local shellRight:DWORD
 local shellTop:DWORD
 local shellBottom:DWORD
 local enemyIdx:DWORD

 mov eax, [enemyX + ecx * 4]
 mov shellLeft, eax
 add eax, TURTLE_W
 mov shellRight, eax
 mov eax, [enemyY + ecx * 4]
 mov shellTop, eax
 add eax, TURTLE_H
 mov shellBottom, eax

 mov enemyIdx, 0

check_shell_enemy_loop:
 mov eax, enemyIdx
 cmp eax, MAX_ENEMIES
 jge shell_enemy_collision_done

 cmp eax, ecx
 je next_shell_enemy_check

 mov edx, [enemyType + eax * 4]
 cmp edx, ENEMY_NONE
 je next_shell_enemy_check

 mov edx, [enemyState + eax * 4]
 cmp edx, ESTATE_DEAD
 je next_shell_enemy_check
 cmp edx, ESTATE_DYING
 je next_shell_enemy_check
 cmp edx, ESTATE_INACTIVE
 je next_shell_enemy_check

 mov edx, [enemyType + eax * 4]
 cmp edx, ENEMY_GOOMBA
 je shell_check_goomba
 cmp edx, ENEMY_PIRANHA
 je shell_check_piranha
 cmp edx, ENEMY_FLYING_TURTLE
 je shell_check_flyturtle
 cmp edx, ENEMY_TURTLE
 je shell_check_turtle

 jmp next_shell_enemy_check

shell_check_goomba:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, GOOMBA_W
 add ebx, GOOMBA_H
 jmp shell_check_collision

shell_check_piranha:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, PIRANHA_W
 add ebx, PIRANHA_H
 jmp shell_check_collision

shell_check_flyturtle:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, FLY_TURTLE_W
 add ebx, FLY_TURTLE_H
 jmp shell_check_collision

shell_check_turtle:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, TURTLE_W
 add ebx, TURTLE_H
 jmp shell_check_collision

shell_check_collision:

 mov esi, [enemyX + eax * 4]
 mov edi, [enemyY + eax * 4]

 cmp esi, shellRight
 jge next_shell_enemy_check
 cmp edx, shellLeft
 jle next_shell_enemy_check

 cmp edi, shellBottom
 jge next_shell_enemy_check
 cmp ebx, shellTop
 jle next_shell_enemy_check

 mov dword ptr [enemyState + eax * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + eax * 4], 30

 inc shellComboCount
 mov edx, shellComboCount
 cmp edx, 1
 je shell_score_100
 cmp edx, 2
 je shell_score_200
 cmp edx, 3
 je shell_score_400

 mov edx, SCORE_SHELL_HIT4
 jmp shell_add_score
shell_score_100:
 mov edx, SCORE_SHELL_HIT1
 jmp shell_add_score
shell_score_200:
 mov edx, SCORE_SHELL_HIT2
 jmp shell_add_score
shell_score_400:
 mov edx, SCORE_SHELL_HIT3
shell_add_score:
 add score, edx
 push edx
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, edx, eax, ebx
 pop edx

next_shell_enemy_check:
 inc enemyIdx
 jmp check_shell_enemy_loop

shell_enemy_collision_done:
 ret

CheckShellEnemyCollision endp

UpdateBowserFireEnemy proc uses eax ebx edx, idx:DWORD
 mov ecx, idx

 mov eax, [enemyX + ecx * 4]
 add eax, [enemyVelX + ecx * 4]
 mov [enemyX + ecx * 4], eax

 mov ebx, cameraX
 sub ebx, BOWSER_FIRE_W
 cmp eax, ebx
 jl bowser_fire_remove

 mov ebx, cameraX

 add ebx, WINDOW_WIDTH
 add ebx, BOWSER_FIRE_W
 cmp eax, ebx
 jg bowser_fire_remove

 mov eax, [enemyTimer + ecx * 4]
 inc eax
 mov [enemyTimer + ecx * 4], eax
 shr eax, 2
 and eax, 1
 mov [enemyFrame + ecx * 4], eax
 jmp bowser_fire_done

bowser_fire_remove:

 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 mov dword ptr [enemyState + ecx * 4], ESTATE_INACTIVE

bowser_fire_done:
 ret

UpdateBowserFireEnemy endp

DrawEnemies proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local srcX:DWORD
 local srcY:DWORD
 local sprW:DWORD
 local sprH:DWORD

 mov ecx, 0

draw_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge draw_enemies_done

 push ecx
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je next_enemy_draw

 mov eax, [enemyX + ecx * 4]
 sub eax, cameraX
 mov screenX, eax

 cmp eax, - 64
 jl next_enemy_draw

 cmp eax, WINDOW_WIDTH

 jg next_enemy_draw
 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_GOOMBA
 je draw_enemy_goomba
 cmp eax, ENEMY_PIRANHA
 je next_enemy_draw
 cmp eax, ENEMY_BOWSER
 je draw_enemy_bowser
 cmp eax, ENEMY_FLYING_TURTLE
 je draw_enemy_flyturtle
 cmp eax, ENEMY_TURTLE
 je draw_enemy_turtle

 cmp eax, ENEMY_BOWSER_FIREBALL
 je next_enemy_draw
 jmp next_enemy_draw

draw_enemy_goomba:
 mov srcY, ENEMY_ROW_GOOMBA
 mov sprW, GOOMBA_W
 mov sprH, GOOMBA_H

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_DYING
 je goomba_squish_frame

 mov eax, enemyAnimTimer
 shr eax, 3
 and eax, 1
 imul eax, GOOMBA_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp goomba_add_variant_offset
goomba_squish_frame:
 mov srcX, (GOOMBA_W + ENEMY_COL_GAP) * 2
goomba_add_variant_offset:
 mov eax, isUnderground
 test eax, eax
 jnz goomba_underground_enemy
 mov eax, currentLevel
 cmp eax, 2
 jl do_draw_enemy
 cmp eax, 3
 jg do_draw_enemy
 add srcX, GOOMBA_SKY_OFFSET * (GOOMBA_W + ENEMY_COL_GAP)
 jmp do_draw_enemy
goomba_underground_enemy:
 add srcX, GOOMBA_UNDER_OFFSET * (GOOMBA_W + ENEMY_COL_GAP)
 jmp do_draw_enemy

draw_enemy_piranha:
 mov srcY, ENEMY_ROW_PIRANHA
 mov sprW, PIRANHA_W
 mov sprH, PIRANHA_H

 mov eax, enemyAnimTimer
 shr eax, 3
 and eax, 1
 imul eax, PIRANHA_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp do_draw_enemy

draw_enemy_bowser:
 mov srcY, ENEMY_ROW_BOWSER
 mov sprW, BOWSER_W
 mov sprH, BOWSER_H

 mov eax, [enemyFrame + ecx * 4]
 and eax, 3
 imul eax, BOWSER_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp do_draw_enemy

draw_enemy_flyturtle:
 mov srcY, ENEMY_ROW_FLYTURTLE
 mov sprW, FLY_TURTLE_W
 mov sprH, FLY_TURTLE_H
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_DYING
 je flyturtle_dead_frame
 mov eax, enemyAnimTimer
 shr eax, 3
 and eax, 1
 imul eax, FLY_TURTLE_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp do_draw_enemy
flyturtle_dead_frame:
 mov srcX, (FLY_TURTLE_W + ENEMY_COL_GAP) * 2
 jmp do_draw_enemy

draw_enemy_turtle:
 mov srcY, ENEMY_ROW_TURTLE
 mov sprW, TURTLE_W
 mov sprH, TURTLE_H
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_SHELL_IDLE
 je turtle_shell_frame
 cmp eax, ESTATE_SHELL_SLIDE
 je turtle_shell_frame
 cmp eax, ESTATE_DYING
 je turtle_dead_frame

 mov eax, enemyAnimTimer
 shr eax, 3
 and eax, 1
 imul eax, TURTLE_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp turtle_add_variant_offset
turtle_dead_frame:
 mov srcX, (TURTLE_W + ENEMY_COL_GAP) * 2
 jmp turtle_add_variant_offset
turtle_shell_frame:
 mov srcX, (TURTLE_W + ENEMY_COL_GAP) * 3
turtle_add_variant_offset:
 mov eax, isUnderground
 test eax, eax
 jnz turtle_underground_enemy
 mov eax, currentLevel
 cmp eax, 2
 jl do_draw_enemy
 cmp eax, 3
 jg do_draw_enemy
 add srcX, TURTLE_SKY_OFFSET * (TURTLE_W + ENEMY_COL_GAP)
 jmp do_draw_enemy
turtle_underground_enemy:
 add srcX, TURTLE_UNDER_OFFSET * (TURTLE_W + ENEMY_COL_GAP)
 jmp do_draw_enemy

draw_enemy_bfire:
 mov srcY, ENEMY_ROW_BFIRE
 mov sprW, BOWSER_FIRE_W
 mov sprH, BOWSER_FIRE_H
 mov eax, enemyAnimTimer
 shr eax, 2
 and eax, 1
 imul eax, BOWSER_FIRE_W + ENEMY_COL_GAP
 mov srcX, eax
 jmp do_draw_enemy

do_draw_enemy:

 mov ebx, [enemyType + ecx * 4]
 cmp ebx, ENEMY_BOWSER
 je bowser_flip_check

 mov eax, [enemyFacing + ecx * 4]
 cmp eax, - 1
 je draw_enemy_flipped

 invoke TransparentBlt, hdcMem, screenX, screenY, sprW, sprH, \
 hdcEnemies, srcX, srcY, sprW, sprH, 00FF00FFh
 jmp next_enemy_draw

bowser_flip_check:

 mov eax, [enemyFacing + ecx * 4]
 neg eax
 invoke DrawSpriteFlipped, hdcEnemies, screenX, screenY, sprW, sprH, \
 srcX, srcY, eax, 00FF00FFh
 jmp next_enemy_draw

draw_enemy_flipped:

 invoke DrawSpriteFlipped, hdcEnemies, screenX, screenY, sprW, sprH, \
 srcX, srcY, - 1, 00FF00FFh

next_enemy_draw:
 pop ecx
 inc ecx
 jmp draw_enemy_loop

draw_enemies_done:
 ret

DrawEnemies endp

DrawPiranhasBehindPipes proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local srcX:DWORD
 local srcY:DWORD
 local sprW:DWORD
 local sprH:DWORD

 xor ecx, ecx
draw_piranha_loop:
 cmp ecx, MAX_ENEMIES
 jge draw_piranhas_done

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_PIRANHA
 jne next_piranha_draw

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_ACTIVE
 jne next_piranha_draw

 mov eax, [enemyX + ecx * 4]
 add eax, piranhaHorizOffset
 sub eax, cameraX
 mov screenX, eax

 cmp eax, - 64
 jl next_piranha_draw
 cmp eax, WINDOW_WIDTH
 jg next_piranha_draw

 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 mov srcY, ENEMY_ROW_PIRANHA
 mov sprW, PIRANHA_W
 mov sprH, PIRANHA_H

 mov eax, [enemyMouthState + ecx * 4]
 imul eax, PIRANHA_W + ENEMY_COL_GAP
 mov srcX, eax

 invoke TransparentBlt, hdcMem, screenX, screenY, sprW, sprH, \
  hdcEnemies, srcX, srcY, sprW, sprH, 00FF00FFh

next_piranha_draw:
 inc ecx
 jmp draw_piranha_loop

draw_piranhas_done:
 ret
DrawPiranhasBehindPipes endp

DrawBowserFireballs proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local srcX:DWORD

 mov ecx, 0
draw_bowser_fire_loop:
 cmp ecx, MAX_ENEMIES
 jge draw_bowser_fire_done

 mov eax, [enemyType + ecx * 4]

 cmp eax, ENEMY_BOWSER_FIREBALL
 jne next_bowser_fire_draw

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_ACTIVE
 jne next_bowser_fire_draw

 mov eax, [enemyX + ecx * 4]
 sub eax, cameraX
 mov screenX, eax

 cmp eax, - BOWSER_FIRE_W
 jl next_bowser_fire_draw

 cmp eax, WINDOW_WIDTH
 jg next_bowser_fire_draw

 mov eax, [enemyY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 mov eax, [enemyFrame + ecx * 4]
 and eax, 1

 imul eax, BOWSER_FIRE_W + ENEMY_COL_GAP
 mov srcX, eax

 mov eax, [enemyFacing + ecx * 4]
 neg eax
 invoke DrawSpriteFlipped, hdcEnemies, screenX, screenY, BOWSER_FIRE_W, BOWSER_FIRE_H, \
 srcX, ENEMY_ROW_BFIRE, eax, 00FF00FFh

next_bowser_fire_draw:
 inc ecx
 jmp draw_bowser_fire_loop

draw_bowser_fire_done:
 ret

DrawBowserFireballs endp

CheckEnemyCollisions proc uses eax ebx ecx edx esi edi
 local enemyLeft:DWORD
 local enemyRight:DWORD
 local enemyTop:DWORD
 local enemyBottom:DWORD
 local enemyW:DWORD
 local enemyH:DWORD

 mov ecx, 0

check_enemy_col_loop:
 cmp ecx, MAX_ENEMIES
 jge check_enemy_col_done

 push ecx
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je next_enemy_col

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_INACTIVE
 je next_enemy_col
 cmp eax, ESTATE_DEAD
 je next_enemy_col

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_GOOMBA
 jne not_goomba_col
 mov enemyW, GOOMBA_W
 mov enemyH, GOOMBA_H
 jmp do_enemy_col_check
not_goomba_col:
 cmp eax, ENEMY_PIRANHA
 jne not_piranha_col
 mov enemyW, PIRANHA_W
 mov enemyH, PIRANHA_H
 jmp do_enemy_col_check
not_piranha_col:
 cmp eax, ENEMY_BOWSER
 jne not_bowser_col
 mov enemyW, BOWSER_W
 mov enemyH, BOWSER_H
 jmp do_enemy_col_check
not_bowser_col:
 cmp eax, ENEMY_FLYING_TURTLE
 jne not_flyturtle_col
 mov enemyW, FLY_TURTLE_W
 mov enemyH, FLY_TURTLE_H
 jmp do_enemy_col_check
not_flyturtle_col:
 cmp eax, ENEMY_TURTLE
 jne not_turtle_col
 mov enemyW, TURTLE_W
 mov enemyH, TURTLE_H
 jmp do_enemy_col_check
not_turtle_col:
 cmp eax, ENEMY_BOWSER_FIREBALL
 jne next_enemy_col

 mov eax, marioState

 cmp eax, MARIO_SMALL
 jne bowser_fireball_big_mario

 mov enemyW, BOWSER_FIRE_W
 mov enemyH, 4

 jmp do_enemy_col_check_adjusted_small
bowser_fireball_big_mario:

 mov enemyW, BOWSER_FIRE_W
 mov enemyH, BOWSER_FIRE_H
 jmp do_enemy_col_check

do_enemy_col_check_adjusted_small:

 mov eax, [enemyX + ecx * 4]
 mov enemyLeft, eax
 add eax, enemyW
 mov enemyRight, eax

 mov eax, [enemyY + ecx * 4]
 mov enemyTop, eax
 add eax, enemyH
 mov enemyBottom, eax

 jmp do_enemy_col_check_continue

do_enemy_col_check:

 mov eax, [enemyX + ecx * 4]
 mov enemyLeft, eax
 add eax, enemyW
 mov enemyRight, eax

 mov eax, [enemyY + ecx * 4]
 mov enemyTop, eax
 add eax, enemyH
 mov enemyBottom, eax
 jmp do_enemy_col_check_continue

do_enemy_col_check_continue:

 mov eax, marioX

 add eax, HITBOX_WIDTH
 cmp eax, enemyLeft

 jl next_enemy_col
 mov eax, marioX
 cmp eax, enemyRight
 jg next_enemy_col

 mov eax, marioY
 add eax, marioHitboxHeight
 cmp eax, enemyTop
 jl next_enemy_col

 mov eax, marioY
 cmp eax, enemyBottom
 jg next_enemy_col

 mov eax, marioVelY
 cmp eax, 0
 jle enemy_damages_mario

 mov eax, marioY
 add eax, marioHitboxHeight
 mov ebx, enemyTop
 add ebx, 16
 cmp eax, ebx
 jg enemy_damages_mario

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_GOOMBA
 je stomp_goomba
 cmp eax, ENEMY_PIRANHA
 je enemy_damages_mario
 cmp eax, ENEMY_FLYING_TURTLE
 je stomp_flyturtle
 cmp eax, ENEMY_TURTLE
 je stomp_turtle
 cmp eax, ENEMY_BOWSER
 je enemy_damages_mario

 jmp enemy_damages_mario

stomp_goomba:

 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + ecx * 4], 10
 mov marioVelY, - 8
 add score, SCORE_GOOMBA
 mov isInvincible, 1
 mov invincibleTimer, 30
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_GOOMBA, eax, ebx
 pop ecx
 jmp next_enemy_col

stomp_flyturtle:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov marioVelY, - 8
 add score, SCORE_FIREBALL_KILL
 mov isInvincible, 1
 mov invincibleTimer, 30
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_FIREBALL_KILL, eax, ebx
 pop ecx
 jmp next_enemy_col

stomp_turtle:

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_SHELL_IDLE
 je turtle_second_hit
 cmp eax, ESTATE_SHELL_SLIDE
 je turtle_second_hit

 mov dword ptr [enemyState + ecx * 4], ESTATE_SHELL_IDLE
 mov dword ptr [enemyVelX + ecx * 4], 0
 mov marioVelY, - 8
 mov isInvincible, 1
 mov invincibleTimer, 30
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_KOOPA, eax, ebx
 pop ecx
 add score, SCORE_KOOPA
 jmp next_enemy_col

turtle_second_hit:

 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyVelX + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 4
 mov dword ptr [enemyTimer + ecx * 4], 0
 mov marioVelY, - 8
 add score, SCORE_KOOPA
 mov isInvincible, 1
 mov invincibleTimer, 30
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_KOOPA, eax, ebx
 pop ecx

 mov shellComboCount, 0
 jmp next_enemy_col

enemy_damages_mario:

 mov eax, starPowerActive
 test eax, eax
 jnz enemy_star_kill

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_BOWSER_FIREBALL
 jne check_shell_safe

 mov eax, marioState

 cmp eax, MARIO_SMALL
 je normal_damage

 mov eax, marioCrouching
 test eax, eax
 jz normal_damage

 mov eax, [enemyY + ecx * 4]
 mov ebx, marioY
 cmp eax, ebx
 jl normal_damage

 jmp next_enemy_col
check_shell_safe:

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_SHELL_IDLE
 je next_enemy_col

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_BOWSER_FIREBALL
 jne normal_damage

 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 call MarioDamage
 jmp next_enemy_col

normal_damage:

 call MarioDamage
 jmp next_enemy_col

enemy_star_kill:

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_DYING
 je next_enemy_col
 cmp eax, ESTATE_DEAD
 je next_enemy_col

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_BOWSER
 je star_kill_bowser
 cmp eax, ENEMY_GOOMBA
 je star_kill_goomba
 cmp eax, ENEMY_TURTLE
 je star_kill_turtle
 cmp eax, ENEMY_FLYING_TURTLE
 je star_kill_turtle
 cmp eax, ENEMY_BOWSER_FIREBALL
 je star_kill_projectile

 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + ecx * 4], 30
 add score, SCORE_FIREBALL_KILL
 jmp next_enemy_col

star_kill_bowser:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 ; Let the main update loop detect Bowser's death and trigger game complete
 add score, SCORE_FIREBALL_KILL
 jmp next_enemy_col

star_kill_goomba:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + ecx * 4], 10
 add score, SCORE_GOOMBA
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_GOOMBA, eax, ebx
 pop ecx
 jmp next_enemy_col

star_kill_turtle:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DYING
 mov dword ptr [enemyVelX + ecx * 4], 0
 mov dword ptr [enemyVelY + ecx * 4], 4
 mov dword ptr [enemyTimer + ecx * 4], 0
 add score, SCORE_KOOPA
 push ecx
 mov eax, [enemyX + ecx * 4]
 mov ebx, [enemyY + ecx * 4]
 invoke SpawnFloatingScore, SCORE_KOOPA, eax, ebx
 pop ecx
 jmp next_enemy_col

star_kill_projectile:
 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 add score, SCORE_FIREBALL_KILL
 jmp next_enemy_col

next_enemy_col:
 pop ecx
 inc ecx
 jmp check_enemy_col_loop

check_enemy_col_done:
 ret

CheckEnemyCollisions endp

MarioDamage proc uses eax

 mov eax, isInvincible
 test eax, eax

 jnz mario_damage_done
 mov eax, marioState
 cmp eax, MARIO_SMALL
 je mario_dies

 mov marioState, MARIO_SMALL
 mov marioHitboxHeight, HITBOX_HEIGHT
 ; Keep feet on same spot: was (marioY + 64), now (marioY + 32), so move origin down 32
 mov eax, TILE_SIZE
 add marioY, eax
 mov marioTransition, 2
 mov transitionFrame, 0
 mov transitionTimer, 4
 ; Brief invincibility after shrinking so we don't get hit again immediately
 mov isInvincible, 1
 mov invincibleTimer, 90
 ret
mario_dies:
 dec lives
 cmp lives, 0
 jle game_over_damage
 call StartMarioDeath
 ret
game_over_damage:
 call PlayGameOverSound
 mov gameState, STATE_GAME_OVER
 mov gameOverTimer, 180
mario_damage_done:
 ret

MarioDamage endp

ClearPlatforms proc uses ecx
 mov ecx, 0
clear_plat_loop:
 cmp ecx, MAX_PLATFORMS
 jge clear_plat_done
 mov dword ptr [platActive + ecx * 4], 0
 inc ecx
 jmp clear_plat_loop
clear_plat_done:
 ret
ClearPlatforms endp

SpawnPlatform proc uses eax ebx ecx, ptype:DWORD, px:DWORD, py:DWORD
 mov ecx, 0
find_plat_slot:
 cmp ecx, MAX_PLATFORMS
 jge spawn_plat_done
 mov eax, [platActive + ecx * 4]
 test eax, eax
 jz found_plat_slot
 inc ecx
 jmp find_plat_slot

found_plat_slot:
 mov eax, px
 mov [platX + ecx * 4], eax
 mov [platStartX + ecx * 4], eax
 mov eax, py
 mov [platY + ecx * 4], eax
 mov [platStartY + ecx * 4], eax
 mov eax, ptype
 mov [platType + ecx * 4], eax
 mov dword ptr [platDir + ecx * 4], 1
 mov dword ptr [platActive + ecx * 4], 1
 mov dword ptr [platWidth + ecx * 4], 3
 mov dword ptr [platWrapMode + ecx * 4], 0
 mov dword ptr [platRange + ecx * 4], 6
 mov dword ptr [platSpeed + ecx * 4], 1

 cmp eax, 0
 jne set_vert_bounds
 mov eax, px
 sub eax, 96
 mov [platMinPos + ecx * 4], eax
 mov eax, px
 add eax, 96
 mov [platMaxPos + ecx * 4], eax
 jmp spawn_plat_done
set_vert_bounds:
 mov eax, py
 sub eax, 64
 mov [platMinPos + ecx * 4], eax
 mov eax, py
 add eax, 64
 mov [platMaxPos + ecx * 4], eax

spawn_plat_done:
 ret
SpawnPlatform endp

UpdatePlatforms proc uses eax ebx ecx edx esi
 local screenTop:DWORD
 local screenBottom:DWORD
 local platWidthPx:DWORD

 mov eax, cameraY
 mov screenTop, eax
 add eax, WINDOW_HEIGHT
 mov screenBottom, eax

 mov ecx, 0
update_plat_loop:
 cmp ecx, MAX_PLATFORMS
 jge update_plat_done

 mov eax, [platActive + ecx * 4]
 test eax, eax
 jz next_plat_update

 mov eax, [platType + ecx * 4]
 cmp eax, PLAT_MOVE_STATIC
 je next_plat_update

 cmp eax, PLAT_MOVE_HORIZONTAL
 je update_horiz_plat
 cmp eax, PLAT_MOVE_VERTICAL
 je update_vert_plat
 jmp next_plat_update

update_horiz_plat:
 mov eax, [platX + ecx * 4]
 mov ebx, [platDir + ecx * 4]
 imul ebx, [platSpeed + ecx * 4]
 add eax, ebx
 mov [platX + ecx * 4], eax

 cmp eax, [platMinPos + ecx * 4]
 jl reverse_h_plat
 cmp eax, [platMaxPos + ecx * 4]
 jg reverse_h_plat
 jmp next_plat_update
reverse_h_plat:
 neg dword ptr [platDir + ecx * 4]
 jmp next_plat_update

update_vert_plat:
 mov eax, [platWrapMode + ecx * 4]
 cmp eax, PLAT_WRAP_UP
 je update_wrap_up
 cmp eax, PLAT_WRAP_DOWN
 je update_wrap_down
 jmp update_vert_normal

update_wrap_up:
 mov eax, [platY + ecx * 4]
 mov ebx, [platSpeed + ecx * 4]
 sub eax, ebx
 mov [platY + ecx * 4], eax

 mov ebx, [platWidth + ecx * 4]
 imul ebx, 16
 mov platWidthPx, ebx

 mov ebx, screenTop
 add ebx, 80
 sub ebx, 32
 cmp eax, ebx
 jg next_plat_update

 mov eax, screenBottom
 add eax, 16
 mov [platY + ecx * 4], eax
 jmp next_plat_update

update_wrap_down:
 mov eax, [platY + ecx * 4]
 mov ebx, [platSpeed + ecx * 4]
 add eax, ebx
 mov [platY + ecx * 4], eax

 mov ebx, eax
 sub ebx, cameraY
 cmp ebx, WINDOW_HEIGHT
 jl wrap_down_visible

 mov eax, cameraY
 add eax, 80
 sub eax, 16
 mov [platY + ecx * 4], eax
 jmp next_plat_update

wrap_down_visible:
 jmp next_plat_update

update_vert_normal:
 mov eax, [platY + ecx * 4]
 mov ebx, [platDir + ecx * 4]
 imul ebx, [platSpeed + ecx * 4]
 add eax, ebx
 mov [platY + ecx * 4], eax

 cmp eax, [platMinPos + ecx * 4]
 jl reverse_v_plat
 cmp eax, [platMaxPos + ecx * 4]
 jg reverse_v_plat
 jmp next_plat_update
reverse_v_plat:
 neg dword ptr [platDir + ecx * 4]

next_plat_update:
 inc ecx
 jmp update_plat_loop

update_plat_done:
 ret
UpdatePlatforms endp

DrawPlatforms proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local tileCount:DWORD
 local tileIdx:DWORD
 local platWidthPx:DWORD

 mov ecx, 0
draw_plat_loop:
 cmp ecx, MAX_PLATFORMS
 jge draw_plat_done

 mov eax, [platActive + ecx * 4]
 test eax, eax
 jz next_plat_draw

 mov eax, [platWidth + ecx * 4]
 mov tileCount, eax
 imul eax, 16
 mov platWidthPx, eax

 mov eax, [platX + ecx * 4]
 mov ebx, platWidthPx
 shr ebx, 1
 sub eax, ebx
 sub eax, cameraX
 mov screenX, eax

 mov ebx, platWidthPx
 neg ebx
 cmp eax, ebx
 jl next_plat_draw

 cmp eax, WINDOW_WIDTH
 jg next_plat_draw

 mov eax, [platY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 push ecx
 mov tileIdx, 0
draw_tile_loop:
 mov eax, tileIdx
 cmp eax, tileCount
 jge draw_tiles_done

 mov eax, screenX
 mov ebx, tileIdx
 imul ebx, 16
 add eax, ebx

 invoke TransparentBlt, hdcMem, eax, screenY, 16, 16, \
  hdcTiles, 0, TILE_ROW_PLATFORM, 16, 16, 00FF00FFh

 inc tileIdx
 jmp draw_tile_loop

draw_tiles_done:
 pop ecx

next_plat_draw:
 inc ecx
 jmp draw_plat_loop

draw_plat_done:
 ret

DrawPlatforms endp

CheckPlatformCollision proc uses eax ebx ecx edx esi
 local platLeft:DWORD
 local platRight:DWORD
 local platWidthPx:DWORD

 mov ecx, 0
check_plat_col_loop:
 cmp ecx, MAX_PLATFORMS
 jge check_plat_col_done

 mov eax, [platActive + ecx * 4]
 test eax, eax
 jz next_plat_col

 cmp marioVelY, 0
 jl next_plat_col

 mov eax, [platWidth + ecx * 4]
 imul eax, 16
 mov platWidthPx, eax

 mov eax, [platX + ecx * 4]
 mov ebx, platWidthPx
 shr ebx, 1
 sub eax, ebx
 mov platLeft, eax
 mov eax, [platX + ecx * 4]
 add eax, ebx
 mov platRight, eax

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, platLeft
 jl next_plat_col

 mov eax, marioX
 cmp eax, platRight
 jg next_plat_col

 mov eax, marioY
 add eax, marioHitboxHeight
 mov ebx, [platY + ecx * 4]
 cmp eax, ebx
 jl next_plat_col
 add ebx, 12
 cmp eax, ebx
 jg next_plat_col

 mov eax, [platY + ecx * 4]
 sub eax, marioHitboxHeight
 mov marioY, eax
 mov marioVelY, 0
 mov marioOnGround, 1

 mov eax, [platType + ecx * 4]
 cmp eax, PLAT_MOVE_HORIZONTAL
 jne check_vert_carry

 mov eax, [platDir + ecx * 4]
 imul eax, [platSpeed + ecx * 4]
 add marioX, eax
 jmp next_plat_col

check_vert_carry:
 cmp eax, PLAT_MOVE_VERTICAL
 jne next_plat_col

 mov eax, [platWrapMode + ecx * 4]
 cmp eax, PLAT_WRAP_UP
 je carry_up
 cmp eax, PLAT_WRAP_DOWN
 je carry_down
 jmp next_plat_col

carry_up:
 mov eax, [platSpeed + ecx * 4]
 sub marioY, eax
 jmp next_plat_col

carry_down:
 mov eax, [platSpeed + ecx * 4]
 add marioY, eax

next_plat_col:
 inc ecx
 jmp check_plat_col_loop

check_plat_col_done:
 ret

CheckPlatformCollision endp

GetSin proc uses ebx ecx edx
 mov ecx, 360
 xor edx, edx
 div ecx
 mov eax, edx

 cmp eax, 90
 jle sin_q1
 cmp eax, 180
 jle sin_q2
 cmp eax, 270
 jle sin_q3
 jmp sin_q4

sin_q1:
 lea ebx, sinTable
 mov eax, [ebx + eax * 4]
 ret

sin_q2:
 mov ecx, 180
 sub ecx, eax
 lea ebx, sinTable
 mov eax, [ebx + ecx * 4]
 ret

sin_q3:
 sub eax, 180
 lea ebx, sinTable
 mov eax, [ebx + eax * 4]
 neg eax
 ret

sin_q4:
 mov ecx, 360
 sub ecx, eax
 lea ebx, sinTable
 mov eax, [ebx + ecx * 4]
 neg eax
 ret
GetSin endp

GetCos proc uses ebx
 add eax, 90
 cmp eax, 360
 jl cos_no_wrap
 sub eax, 360
cos_no_wrap:
 call GetSin
 ret
GetCos endp

UpdateFirebars proc uses eax ebx ecx edx esi
 mov ecx, 0
update_firebar_loop:
 cmp ecx, MAX_FIREBARS
 jge update_firebar_done

 mov eax, [firebarActive + ecx * 4]
 test eax, eax
 jz next_firebar_update

 mov eax, [firebarAngle + ecx * 4]
 mov ebx, [firebarSpeed + ecx * 4]
 imul ebx, [firebarDir + ecx * 4]
 add eax, ebx

 cmp eax, 0
 jge angle_not_negative
 add eax, 360
angle_not_negative:
 cmp eax, 360
 jl angle_not_over
 sub eax, 360
angle_not_over:
 mov [firebarAngle + ecx * 4], eax

 mov eax, [firebarFrameTimer + ecx * 4]
 inc eax
 cmp eax, FIREBAR_ANIM_SPEED
 jl no_frame_advance
 mov eax, 0
 mov ebx, [firebarFrame + ecx * 4]
 inc ebx
 cmp ebx, 4
 jl frame_ok
 mov ebx, 0
frame_ok:
 mov [firebarFrame + ecx * 4], ebx
no_frame_advance:
 mov [firebarFrameTimer + ecx * 4], eax

next_firebar_update:
 inc ecx
 jmp update_firebar_loop

update_firebar_done:
 ret
UpdateFirebars endp

DrawFirebars proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD
 local centerX:DWORD
 local centerY:DWORD
 local ballX:DWORD
 local ballY:DWORD
 local fireballIdx:DWORD
 local curAngle:DWORD
 local sinVal:DWORD
 local cosVal:DWORD
 local barIdx:DWORD

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_firebar_done

 mov eax, hTileSheet
 test eax, eax
 jz draw_firebar_done

 mov barIdx, 0
draw_firebar_loop:
 mov eax, barIdx
 cmp eax, MAX_FIREBARS
 jge draw_firebar_done

 mov ecx, barIdx
 mov eax, [firebarActive + ecx * 4]
 test eax, eax
 jz next_firebar_draw

 mov eax, [firebarX + ecx * 4]
 sub eax, cameraX
 mov centerX, eax

 mov eax, [firebarY + ecx * 4]
 sub eax, cameraY
 mov centerY, eax

 mov eax, centerX
 cmp eax, -200
 jl next_firebar_draw
 cmp eax, WINDOW_WIDTH + 200
 jg next_firebar_draw

 mov eax, centerX
 sub eax, 8
 mov screenX, eax
 mov eax, centerY
 sub eax, 8
 mov screenY, eax

 push ecx
 invoke DrawLuckyBlockTile, screenX, screenY, 1
 pop ecx

 mov eax, [firebarAngle + ecx * 4]
 mov curAngle, eax

 mov fireballIdx, 0
draw_fireball_loop:
 mov eax, fireballIdx
 mov ecx, barIdx
 cmp eax, [firebarLength + ecx * 4]
 jge firebar_balls_done

 mov eax, fireballIdx
 inc eax
 imul eax, fireballSpacing
 mov esi, eax

 push ecx
 mov eax, curAngle
 call GetCos
 mov cosVal, eax
 mov eax, curAngle
 call GetSin
 mov sinVal, eax
 pop ecx

 mov eax, esi
 imul eax, cosVal
 sar eax, 8
 add eax, centerX
 sub eax, 8
 mov ballX, eax

 mov eax, esi
 imul eax, sinVal
 sar eax, 8
 add eax, centerY
 sub eax, 8
 mov ballY, eax

 push ecx
 mov ecx, barIdx
 mov eax, [firebarFrame + ecx * 4]
 and eax, 3
 imul eax, 20

 invoke TransparentBlt, hdcMem, ballX, ballY, 16, 16, \
  hdcObjects, eax, OBJ_PARTICLE_Y, 16, 16, 00FF00FFh
 pop ecx

 inc fireballIdx
 jmp draw_fireball_loop

firebar_balls_done:

next_firebar_draw:
 inc barIdx
 jmp draw_firebar_loop

draw_firebar_done:
 ret
DrawFirebars endp

CheckFirebarCollision proc uses eax ebx ecx edx esi edi
 local centerX:DWORD
 local centerY:DWORD
 local ballX:DWORD
 local ballY:DWORD
 local fireballIdx:DWORD
 local curAngle:DWORD
 local sinVal:DWORD
 local cosVal:DWORD
 local barIdx:DWORD
 local marioLeft:DWORD
 local marioRight:DWORD
 local marioTop:DWORD
 local marioBottom:DWORD

 mov eax, isInvincible
 test eax, eax
 jnz firebar_col_done
 mov eax, starPowerActive
 test eax, eax
 jnz firebar_col_done

 mov eax, marioX
 mov marioLeft, eax
 add eax, HITBOX_WIDTH
 mov marioRight, eax
 mov eax, marioY
 mov marioTop, eax
 add eax, marioHitboxHeight
 mov marioBottom, eax

 mov barIdx, 0
check_firebar_loop:
 mov eax, barIdx
 cmp eax, MAX_FIREBARS
 jge firebar_col_done

 mov ecx, barIdx
 mov eax, [firebarActive + ecx * 4]
 test eax, eax
 jz next_firebar_col

 mov eax, [firebarX + ecx * 4]
 mov centerX, eax
 mov eax, [firebarY + ecx * 4]
 mov centerY, eax

 mov eax, [firebarAngle + ecx * 4]
 mov curAngle, eax

 mov fireballIdx, 0
check_fireball_col_loop:
 mov eax, fireballIdx
 mov ecx, barIdx
 cmp eax, [firebarLength + ecx * 4]
 jge next_firebar_col

 mov eax, fireballIdx
 inc eax
 imul eax, fireballSpacing
 mov esi, eax

 push ecx
 mov eax, curAngle
 call GetCos
 mov cosVal, eax
 mov eax, curAngle
 call GetSin
 mov sinVal, eax
 pop ecx

 mov eax, esi
 imul eax, cosVal
 sar eax, 8
 add eax, centerX
 mov ballX, eax

 mov eax, esi
 imul eax, sinVal
 sar eax, 8
 add eax, centerY
 mov ballY, eax

 mov eax, ballX
 add eax, FIREBALL_RADIUS
 cmp eax, marioLeft
 jl no_fireball_hit

 mov eax, ballX
 sub eax, FIREBALL_RADIUS
 cmp eax, marioRight
 jg no_fireball_hit

 mov eax, ballY
 add eax, FIREBALL_RADIUS
 cmp eax, marioTop
 jl no_fireball_hit

 mov eax, ballY
 sub eax, FIREBALL_RADIUS
 cmp eax, marioBottom
 jg no_fireball_hit

 call MarioDamage
 jmp firebar_col_done

no_fireball_hit:
 inc fireballIdx
 jmp check_fireball_col_loop

next_firebar_col:
 inc barIdx
 jmp check_firebar_loop

firebar_col_done:
 ret
CheckFirebarCollision endp

CheckSimplePipeWarp proc uses eax ebx ecx edx esi edi

 mov eax, pipeTransition
 test eax, eax
 jnz simple_warp_done

 mov eax, marioOnGround
 test eax, eax
 jz simple_warp_done

 mov eax, keyDown
 test eax, eax
 jz check_horizontal_pipe

 mov ecx, 0

check_vertical_pipe_loop:
 cmp ecx, pipeCount
 jge check_horizontal_pipe

 mov eax, marioX
 add eax, HITBOX_WIDTH / 2
 sub eax, [pipeInX + ecx * 4]
 cmp eax, -48
 jl next_vertical_pipe
 cmp eax, 48
 jg next_vertical_pipe

 mov eax, marioY
 add eax, marioHitboxHeight
 mov ebx, [pipeInY + ecx * 4]
 add ebx, TILE_SIZE
 sub eax, ebx
 cmp eax, - 16
 jl next_vertical_pipe
 cmp eax, 16
 jg next_vertical_pipe

 mov pipeTransition, 1
 mov pipeTransFrame, 0
 mov pipeTransTimer, 100  ; 51 (teleport) + 15 (fade) + 30 (rise) + 4 buffer = 100
 mov isInvincible, 1
 mov invincibleTimer, 60
 push ecx
 call PlayPipeTravelSound
 pop ecx

 mov eax, [pipeOutX + ecx * 4]
 mov pipeDestX, eax
 mov eax, [pipeOutY + ecx * 4]
 mov pipeDestY, eax
 
 ; Check if pipe out has a cap above it and find pipe bottom
 ; Pipe structure: cap row (TILE_PIPE_VERT_TL/TR), body row (TILE_PIPE_VERT_BL/BR), exit row (TILE_PIPE_OUT)
 push ecx
 push eax
 push ebx
 push edx
 push esi
 push edi
 mov eax, [pipeOutX + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov esi, eax  ; col = pipeOutX / TILE_SIZE (using esi to preserve ecx)
 mov eax, [pipeOutY + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 ; Check cap row (2 rows above exit)
 ; Pipe has 2 columns: left (col) and right (col+1)
 push edi  ; Save edi since we'll use it for level1 pointer
 mov edx, eax
 sub edx, 2  ; capRow = (pipeOutY / TILE_SIZE) - 2
 cmp edx, 0
 jl no_cap_above_pop
 mov ebx, TILE_ROWS
 cmp edx, ebx
 jge no_cap_above_pop
 mov ebx, TILE_COLS
 dec ebx
 cmp esi, ebx  ; Check if right column would be out of bounds
 jge no_cap_above_pop
 ; Check left column (cap left tile)
 mov ebx, edx  ; capRow
 imul ebx, TILE_COLS
 add ebx, esi  ; left column index
 cmp ebx, 20000
 jge no_cap_above_pop
 lea edi, level1
 movzx eax, byte ptr [edi + ebx]
 cmp al, TILE_PIPE_VERT_TL
 je check_body_row
 ; Check right column (cap right tile)
 mov ebx, edx  ; capRow
 imul ebx, TILE_COLS
 add ebx, esi
 inc ebx  ; right column index
 cmp ebx, 20000
 jge no_cap_above_pop
 movzx eax, byte ptr [edi + ebx]
 cmp al, TILE_PIPE_VERT_TR
 je check_body_row
no_cap_above_pop:
 pop edi
 jmp no_cap_above
check_body_row:
 ; Found cap, now find body row and calculate bottom
 ; Restore row number for body row
 mov eax, [pipeOutY + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 dec eax  ; bodyRow = (pipeOutY / TILE_SIZE) - 1
 ; Check body row - check both left and right columns
 ; edi already points to level1 from cap check
 mov ebx, eax  ; bodyRow
 imul ebx, TILE_COLS
 add ebx, esi  ; left column index
 cmp ebx, 20000
 jge no_cap_above
 movzx edx, byte ptr [edi + ebx]
 cmp dl, TILE_PIPE_VERT_BL
 je has_cap_and_body
 ; Check right column
 mov ebx, eax  ; bodyRow
 imul ebx, TILE_COLS
 add ebx, esi
 inc ebx  ; right column index
 cmp ebx, 20000
 jge no_cap_above
 movzx edx, byte ptr [edi + ebx]
 cmp dl, TILE_PIPE_VERT_BR
 je has_cap_and_body
 jmp no_cap_above
has_cap_and_body:
 ; Calculate pipe bottom Y: body row * TILE_SIZE + TILE_SIZE (bottom of body tile)
 mov eax, [pipeOutY + ecx * 4]
 sub eax, TILE_SIZE  ; body row Y
 add eax, TILE_SIZE  ; bottom of body tile = body row Y + TILE_SIZE
 mov pipeExitBottomY, eax
 mov pipeExitHasCap, 1
 jmp cap_check_done
no_cap_above:
 mov pipeExitHasCap, 0
 mov eax, [pipeOutY + ecx * 4]
 mov pipeExitBottomY, eax  ; Default to exit Y if no cap
cap_check_done:
 pop edi
 pop esi
 pop edx
 pop ebx
 pop eax
 pop ecx
 
 ; Calculate final exit position (top of pipe out tile)
 mov eax, pipeDestY
 sub eax, marioHitboxHeight
 mov pipeDestY, eax

 mov eax, pipeDestX
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge warp_cam_x_ok
 mov eax, 0
warp_cam_x_ok:
 mov pipeDestCamX, eax

 mov eax, pipeDestY
 sub eax, WINDOW_HEIGHT / 2
 cmp eax, 0
 jge warp_cam_y_ok
 mov eax, 0
warp_cam_y_ok:
 mov pipeDestCamY, eax

 mov pipeDestUnder, 1

 ; Disable down and right keys during pipe transition
 mov keyDown, 0
 mov keyRight, 0
 jmp simple_warp_done

next_vertical_pipe:
 inc ecx
 jmp check_vertical_pipe_loop

check_horizontal_pipe:

 mov eax, keyRight
 or eax, keyLeft
 test eax, eax
 jz simple_warp_done

 mov ecx, 0
check_horizontal_pipe_loop:
 cmp ecx, pipeHorizCount
 jge simple_warp_done

 mov eax, marioX
 add eax, HITBOX_WIDTH / 2
 mov ebx, [pipeHorizInX + ecx * 4]
 sub eax, ebx
 cmp eax, - 4
 jl next_horizontal_pipe
 cmp eax, TILE_SIZE + 4
 jg next_horizontal_pipe

 mov eax, marioY
 mov edx, marioHitboxHeight
 shr edx, 1
 add eax, edx
 mov ebx, [pipeHorizInY + ecx * 4]
 mov edx, TILE_SIZE
 shr edx, 1
 add ebx, edx
 sub eax, ebx
 cmp eax, - 16
 jl next_horizontal_pipe
 cmp eax, 16
 jg next_horizontal_pipe

 mov pipeTransition, 3
 mov pipeTransFrame, 0
 mov pipeTransTimer, 100  ; 51 (teleport) + 15 (fade) + 30 (rise) + 4 buffer = 100
 mov isInvincible, 1
 mov invincibleTimer, 60
 push ecx
 call PlayPipeTravelSound
 pop ecx

 mov eax, [pipeHorizOutX + ecx * 4]
 mov pipeDestX, eax
 mov eax, [pipeHorizOutY + ecx * 4]
 mov pipeDestY, eax
 
 ; Check if pipe out has a cap above it and find pipe bottom (same logic as vertical)
 push ecx
 push eax
 push ebx
 push edx
 push esi
 push edi
 mov eax, [pipeHorizOutX + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov esi, eax  ; col = pipeHorizOutX / TILE_SIZE (using esi to preserve ecx)
 mov eax, [pipeHorizOutY + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 ; Check cap row (2 rows above exit) - check both columns
 mov edx, eax
 sub edx, 2  ; capRow = (pipeHorizOutY / TILE_SIZE) - 2
 cmp edx, 0
 jl horiz_no_cap_above_pop
 mov ebx, TILE_ROWS
 cmp edx, ebx
 jge horiz_no_cap_above_pop
 mov ebx, TILE_COLS
 dec ebx
 cmp esi, ebx
 jge horiz_no_cap_above_pop
 ; Check left column (cap left tile)
 mov ebx, edx  ; capRow
 imul ebx, TILE_COLS
 add ebx, esi  ; left column index
 cmp ebx, 20000
 jge horiz_no_cap_above_pop
 lea edi, level1
 movzx eax, byte ptr [edi + ebx]
 cmp al, TILE_PIPE_VERT_TL
 je horiz_check_body_row
 ; Check right column (cap right tile)
 mov ebx, edx  ; capRow
 imul ebx, TILE_COLS
 add ebx, esi
 inc ebx  ; right column index
 cmp ebx, 20000
 jge horiz_no_cap_above_pop
 movzx eax, byte ptr [edi + ebx]
 cmp al, TILE_PIPE_VERT_TR
 je horiz_check_body_row
horiz_no_cap_above_pop:
 jmp horiz_no_cap_above
horiz_check_body_row:
 ; Found cap, check body row
 mov eax, [pipeHorizOutY + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 dec eax  ; bodyRow = (pipeHorizOutY / TILE_SIZE) - 1
 ; Check body row - check both left and right columns
 mov ebx, eax  ; bodyRow
 imul ebx, TILE_COLS
 add ebx, esi  ; left column index
 cmp ebx, 20000
 jge horiz_no_cap_above
 movzx edx, byte ptr [edi + ebx]
 cmp dl, TILE_PIPE_VERT_BL
 je horiz_has_cap_and_body
 ; Check right column
 mov ebx, eax  ; bodyRow
 imul ebx, TILE_COLS
 add ebx, esi
 inc ebx  ; right column index
 cmp ebx, 20000
 jge horiz_no_cap_above
 movzx edx, byte ptr [edi + ebx]
 cmp dl, TILE_PIPE_VERT_BR
 je horiz_has_cap_and_body
horiz_no_cap_above:
 pop edi
 mov pipeExitHasCap, 0
 mov eax, [pipeHorizOutY + ecx * 4]
 mov pipeExitBottomY, eax  ; Default to exit Y if no cap
 jmp horiz_cap_check_done
horiz_has_cap_and_body:
 ; Calculate pipe bottom Y: body row * TILE_SIZE + TILE_SIZE (bottom of body tile)
 mov eax, [pipeHorizOutY + ecx * 4]
 sub eax, TILE_SIZE  ; body row Y
 add eax, TILE_SIZE  ; bottom of body tile = body row Y + TILE_SIZE
 mov pipeExitBottomY, eax
 mov pipeExitHasCap, 1
 pop edi
horiz_cap_check_done:
 pop esi
 pop edx
 pop ebx
 pop eax
 pop ecx
 
 ; Calculate final exit position (top of pipe out tile)
 mov eax, pipeDestY
 sub eax, marioHitboxHeight
 mov pipeDestY, eax

 mov eax, pipeDestX
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge warp_horiz_cam_x_ok
 mov eax, 0
warp_horiz_cam_x_ok:
 mov pipeDestCamX, eax

 mov eax, pipeDestY
 sub eax, WINDOW_HEIGHT / 2
 cmp eax, 0
 jge warp_horiz_cam_y_ok
 mov eax, 0
warp_horiz_cam_y_ok:
 mov pipeDestCamY, eax

 mov eax, pipeDestY
 cmp eax, cameraSnapYOverworld
 jl horiz_pipe_overworld
 mov pipeDestUnder, 1
 jmp horiz_pipe_under_done
horiz_pipe_overworld:
 mov pipeDestUnder, 0
horiz_pipe_under_done:

 mov keyRight, 0
 mov keyLeft, 0
 jmp simple_warp_done

next_horizontal_pipe:
 inc ecx
 jmp check_horizontal_pipe_loop

next_pipe_check:

 mov eax, marioX
 add eax, HITBOX_WIDTH / 2
 sub eax, [pipeOutX + ecx * 4]
 cmp eax, - 16
 jl next_pipe
 cmp eax, 16
 jg next_pipe

 mov eax, marioY
 add eax, marioHitboxHeight
 mov ebx, [pipeOutY + ecx * 4]
 add ebx, TILE_SIZE
 sub eax, ebx
 cmp eax, - 16
 jl next_pipe
 cmp eax, 16
 jg next_pipe

 mov pipeTransition, 1
 mov pipeTransFrame, 0
 mov pipeTransTimer, 100  ; 51 (teleport) + 15 (fade) + 30 (rise) + 4 buffer = 100
 mov isInvincible, 1
 mov invincibleTimer, 60
 push ecx
 call PlayPipeTravelSound
 pop ecx

 mov eax, [pipeInX + ecx * 4]
 mov pipeDestX, eax
 ; Place Mario above the pipe mouth when warping back from an out pipe.
 mov eax, [pipeInY + ecx * 4]
 sub eax, marioHitboxHeight
 sub eax, TILE_SIZE
 mov pipeDestY, eax

 mov eax, pipeDestX
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge warp_cam_x_ok2
 mov eax, 0
warp_cam_x_ok2:
 mov pipeDestCamX, eax

 mov eax, pipeDestY
 sub eax, WINDOW_HEIGHT / 2
 cmp eax, 0
 jge warp_cam_y_ok2
 mov eax, 0
warp_cam_y_ok2:
 mov pipeDestCamY, eax

 mov pipeDestUnder, 0

 mov keyDown, 0
 jmp simple_warp_done

next_pipe:
 inc ecx
 jmp check_vertical_pipe_loop

simple_warp_done:
 ret

CheckSimplePipeWarp endp

UpdateMario proc uses ebx ecx edx esi edi
 local onGround:DWORD
 local prevY:DWORD
 local prevX:DWORD
 local tileX0:DWORD
 local tileX1:DWORD
 local tileY0:DWORD
 local tileY1:DWORD
 local row:DWORD
 local col:DWORD
 local tileWorldX:DWORD
 local tileWorldY:DWORD
 local curHitboxH:DWORD

 mov eax, marioHitboxHeight
 mov curHitboxH, eax

 mov eax, marioState

 cmp eax, MARIO_SMALL
 je skip_crouch_hitbox

 mov eax, marioCrouching
 mov edx, marioPrevCrouching
 cmp eax, edx
 je crouch_state_done

 cmp edx, 0
 jne crouch_ended

 mov marioHitboxHeight, TILE_SIZE
 add marioY, TILE_SIZE
 mov curHitboxH, TILE_SIZE
 jmp crouch_state_update

 crouch_ended:
 mov marioHitboxHeight, TILE_SIZE * 2
 mov curHitboxH, TILE_SIZE * 2

 sub marioY, TILE_SIZE

 crouch_state_update:

 mov eax, marioCrouching
 mov marioPrevCrouching, eax
 jmp crouch_state_done

 skip_crouch_hitbox:

 mov dword ptr [marioPrevCrouching], 0

 crouch_state_done:

 mov eax, marioX
 mov prevX, eax

 mov eax, marioWalking
 mov marioWasWalking, eax

 mov marioWalking, 0

check_movement_input:

 mov eax, keyLeft
 test eax, eax
 jnz move_left
 mov eax, keyRight
 test eax, eax
 jnz move_right

 mov marioVelX, 0
 mov marioHoldTimer, 0
 jmp apply_velocity

move_left:
 mov marioFacing, - 1
 mov marioWalking, 1

 mov eax, marioVelX
 test eax, eax
 jz no_dir_switch_left
 jns switch_to_left
no_dir_switch_left:

 inc marioHoldTimer
 jmp calc_speed_left
switch_to_left:

 mov marioHoldTimer, 1
calc_speed_left:

 mov eax, marioHoldTimer
 mov ebx, SPEED_INCREASE_RATE
 imul eax, ebx
 cdq
 mov ebx, SPEED_DIVISOR
 idiv ebx

 cmp eax, MAX_SPEED
 jle speed_left_ok
 mov eax, MAX_SPEED
speed_left_ok:

 neg eax
 mov marioVelX, eax
 jmp apply_velocity

move_right:
 mov marioFacing, 1
 mov marioWalking, 1

 mov eax, marioVelX
 test eax, eax
 jz no_dir_switch_right
 js switch_to_right
no_dir_switch_right:

 inc marioHoldTimer
 jmp calc_speed_right
switch_to_right:

 mov marioHoldTimer, 1
calc_speed_right:

 mov eax, marioHoldTimer
 mov ebx, SPEED_INCREASE_RATE
 imul eax, ebx
 cdq
 mov ebx, SPEED_DIVISOR
 idiv ebx

 cmp eax, MAX_SPEED
 jle speed_right_ok
 mov eax, MAX_SPEED
speed_right_ok:
 mov marioVelX, eax
 jmp apply_velocity

apply_velocity:

 mov eax, marioVelX
 add marioX, eax

update_walk_anim:

 mov eax, marioWalking
 test eax, eax
 jz check_crouch

 mov eax, marioVelX
 test eax, eax
 jz check_crouch
 jns speed_positive
 neg eax
speed_positive:

 cmp eax, SPEED_THRESHOLD_SLOW
 jl anim_slow
 cmp eax, SPEED_THRESHOLD_MED
 jl anim_med
 cmp eax, SPEED_THRESHOLD_FAST
 jl anim_fast

 mov ebx, ANIM_SPEED_MAX
 jmp anim_update
anim_slow:
 mov ebx, ANIM_SPEED_SLOW
 jmp anim_update
anim_med:
 mov ebx, ANIM_SPEED_MED
 jmp anim_update
anim_fast:
 mov ebx, ANIM_SPEED_FAST
 jmp anim_update

anim_update:

 mov eax, animFrame
 cdq
 idiv ebx
 test edx, edx
 jnz check_crouch
 inc marioAnimFrame
 and marioAnimFrame, 3

check_crouch:

 mov marioCrouching, 0
 mov eax, marioState
 cmp eax, MARIO_SMALL
 je check_jump
 mov eax, marioOnGround
 test eax, eax
 jz check_jump
 mov eax, keyDown
 test eax, eax
 jz check_jump
 mov marioCrouching, 1

check_jump:

 mov eax, keySpace
 test eax, eax
 jz apply_gravity

 mov eax, marioOnGround
 test eax, eax
 jz apply_gravity

 mov eax, marioVelX
 test eax, eax
 jns speed_positive_for_jump
 neg eax
speed_positive_for_jump:
 imul eax, 5
 mov ebx, 8
 cdq
 idiv ebx
 cmp eax, 5
 jle jump_bonus_ok
 mov eax, 5
jump_bonus_ok:
 mov ebx, JUMP_STRENGTH
 sub ebx, eax
 mov marioVelY, ebx

 mov marioOnGround, 0
 mov marioJumping, 0
 call PlayJumpSound

apply_gravity:

 mov eax, marioY
 mov prevY, eax
 mov eax, marioVelY
 add eax, GRAVITY
 cmp eax, 12
 jle grav_ok
 mov eax, 12
grav_ok:
 mov marioVelY, eax
 add marioY, eax

 mov onGround, 0

 mov eax, marioX
 cmp eax, prevX
 jle tx0_use_mario
 mov eax, prevX
tx0_use_mario:
 cdq
 mov ebx, TILE_SIZE
 idiv ebx
 cmp eax, 0
 jge tx0_ok
 xor eax, eax
tx0_ok:
 mov tileX0, eax

 mov eax, marioX
 cmp eax, prevX
 jge tx1_use_mario
 mov eax, prevX
tx1_use_mario:
 add eax, HITBOX_WIDTH - 1
 cdq
 mov ebx, TILE_SIZE
 idiv ebx
 mov ecx, TILE_COLS
 dec ecx
 cmp eax, ecx
 jle tx1_ok
 mov eax, ecx
tx1_ok:
 mov tileX1, eax

 mov eax, marioY
 cmp eax, prevY
 jle ty0_use_mario
 mov eax, prevY
ty0_use_mario:
 cdq
 mov ebx, TILE_SIZE
 idiv ebx
 cmp eax, 0
 jge ty0_ok
 xor eax, eax
ty0_ok:
 mov tileY0, eax

 mov eax, marioY
 cmp eax, prevY
 jge ty1_use_mario
 mov eax, prevY
 ty1_use_mario:
 mov edx, curHitboxH
 dec edx
 add eax, edx
 cdq
 mov ebx, TILE_SIZE
 idiv ebx
 mov ecx, TILE_ROWS
 dec ecx
 cmp eax, ecx
 jle ty1_ok
 mov eax, ecx
ty1_ok:
 mov tileY1, eax

 mov eax, tileY0
 mov row, eax
row_loop:
 mov eax, row
 cmp eax, tileY1
 jg row_done

 mov eax, tileX0
 mov col, eax
col_loop:
 mov eax, col
 cmp eax, tileX1
 jg col_done

 mov eax, row
 imul eax, TILE_COLS
 add eax, col

 cmp eax, 20000
 jge next_col
 lea esi, level1
 add esi, eax
 movzx edx, byte ptr [esi]

 cmp dl, TILE_AIR
 je next_col
 cmp dl, TILE_MARIO_SPAWN
 je next_col
 cmp dl, TILE_FLAGPOLE_FLAG
 je next_col
 cmp dl, TILE_CASTLE_FLAG
 je next_col
 cmp dl, TILE_BG_CLOUD_S
 je next_col
 cmp dl, TILE_BG_CLOUD_L
 je next_col
 cmp dl, TILE_BG_BUSH_S
 je next_col
 cmp dl, TILE_BG_BUSH_L
 je next_col
 cmp dl, TILE_BG_HILL_S
 je next_col
 cmp dl, TILE_BG_HILL_L
 je next_col
 cmp dl, TILE_BG_CASTLE
 je next_col
 cmp dl, TILE_INVISIBLE_WALL
 je next_col
 cmp dl, TILE_INVISIBLE_WALL_2
 je do_invisible_wall_2_solid
 cmp dl, TILE_DEATH
 je do_death_tile
 cmp dl, TILE_LAVA_TOP
 je do_death_tile
 cmp dl, TILE_LAVA_BOTTOM
 je do_death_tile
 cmp dl, TILE_PIPE_IN
 je next_col
 cmp dl, TILE_PIPE_OUT
 je next_col
 cmp dl, TILE_PIPE_HORIZ_IN
 je next_col
 cmp dl, TILE_PLATFORM_SPAWN
 je next_col
 cmp dl, TILE_GOOMBA_SPAWN
 je next_col

 cmp dl, TILE_PIRANHA_SPAWN
 je next_col
 cmp dl, TILE_BOWSER_SPAWN
 je next_col
 cmp dl, TILE_FLY_TURTLE_SPAWN
 je next_col
 cmp dl, TILE_TURTLE_SPAWN
 je next_col

 mov eax, col

 imul eax, TILE_SIZE
 mov tileWorldX, eax
 mov eax, row
 imul eax, TILE_SIZE
 mov tileWorldY, eax

 cmp dl, TILE_COIN
 je do_coin
 cmp dl, TILE_BRICK
 je do_brick_block
 cmp dl, TILE_BRICK2
 je do_brick_block
 cmp dl, TILE_LUCKY_COIN
 je do_lucky_coin
 cmp dl, TILE_LUCKY_MULTICOIN
 je do_hidden_lucky
 cmp dl, TILE_LUCKY_MULTICOIN2
 je do_hidden_lucky
 cmp dl, TILE_LUCKY_MUSHROOM
 je do_lucky_mushroom
 cmp dl, TILE_LUCKY_FLOWER
 je do_lucky_flower
 cmp dl, TILE_LUCKY_STAR
 je do_star_block
 cmp dl, TILE_LUCKY_GOLDMUSH
 je do_golden_block
 cmp dl, TILE_LUCKY_1UP
 je do_lucky_1up
 cmp dl, TILE_LUCKY_INVISIBLE
 je do_lucky_invisible
 cmp dl, TILE_LUCKY_USED
 je do_solid
 cmp dl, TILE_HIDDEN_LUCKY_MUSHROOM
 je do_hidden_lucky_mushroom
 cmp dl, TILE_HIDDEN_LUCKY_FLOWER
 je do_hidden_lucky_flower
 cmp dl, TILE_HIDDEN_LUCKY_STAR
 je do_hidden_lucky_star
 cmp dl, TILE_HIDDEN_LUCKY_GOLDMUSH
 je do_hidden_lucky_goldmush
 cmp dl, TILE_HIDDEN_LUCKY_1UP
 je do_hidden_lucky_1up

 cmp dl, 3
 je do_qblock
 cmp dl, TILE_PIPE_VERT_TL
 je do_pipe_top
 cmp dl, TILE_PIPE_VERT_BL
 je do_solid
 cmp dl, TILE_PIPE_VERT_TR
 je do_pipe_top
 cmp dl, TILE_PIPE_VERT_BR
 je do_solid
 cmp dl, TILE_PIPE_HORIZ_TL
 je do_solid
 cmp dl, TILE_PIPE_HORIZ_BL
 je do_solid
 cmp dl, TILE_PIPE_HORIZ_TR
 je do_solid
 cmp dl, TILE_PIPE_HORIZ_BR
 je do_solid
 cmp dl, TILE_PIPE_DECOR1
 je do_solid
 cmp dl, TILE_PIPE_DECOR2
 je do_solid
 cmp dl, TILE_PIPE_DECOR3
 je do_solid
 cmp dl, TILE_STAIR
 je do_solid
 cmp dl, TILE_FLAGPOLE_BASE
 je do_solid
 cmp dl, TILE_FLAGPOLE_POLE
 je do_flagpole_trigger
 cmp dl, TILE_FLAGPOLE_TOP
 je do_flagpole_trigger
 cmp dl, TILE_FLAGPOLE_FLAG
 je next_col
 cmp dl, TILE_CASTLE_FLAG
 je next_col
 cmp dl, TILE_END_BLOCK
 je do_end_block
 cmp dl, TILE_BG_HILL_S
 je next_col
 cmp dl, TILE_BG_HILL_L
 je next_col
 cmp dl, TILE_LEAF_LEFT
 je do_tree_leaf
 cmp dl, TILE_LEAF_MIDDLE
 je do_tree_leaf
 cmp dl, TILE_LEAF_RIGHT
 je do_tree_leaf
 cmp dl, TILE_BARK
 je next_col

 jmp do_solid

do_invisible_wall_2_solid:
 mov eax, col
 imul eax, TILE_SIZE
 mov tileWorldX, eax
 mov eax, row
 imul eax, TILE_SIZE
 mov tileWorldY, eax
 jmp do_solid

do_coin:
 push ecx
 xor ecx, ecx
do_coin_delay_loop:
 cmp ecx, 8
 jge do_coin_delay_done
 mov eax, [midasCoinDelayTimer + ecx * 4]
 cmp eax, 0
 jle do_coin_delay_next
 mov eax, [midasCoinDelayCol + ecx * 4]
 cmp eax, col
 jne do_coin_delay_next
 mov eax, [midasCoinDelayRow + ecx * 4]
 cmp eax, row
 jne do_coin_delay_next
 pop ecx
 jmp next_col
do_coin_delay_next:
 inc ecx
 jmp do_coin_delay_loop
do_coin_delay_done:
 pop ecx

 mov byte ptr [esi], 0
 mov eax, 1
 call CollectCoins
 call SaveLevelState
 jmp next_col

do_gold_coin:

 mov byte ptr [esi], 0
 mov eax, 10
 call CollectCoins
 jmp next_col

do_death_tile:

 mov eax, col
 imul eax, TILE_SIZE
 mov tileWorldX, eax
 mov eax, row
 imul eax, TILE_SIZE
 mov tileWorldY, eax

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle next_col
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col
 mov eax, marioY
 add eax, curHitboxH
 cmp eax, tileWorldY
 jle next_col
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col

 dec lives
 cmp lives, 0
 jle death_tile_game_over

 call StartMarioDeath
 jmp row_done

death_tile_game_over:

 call PlayGameOverSound
 mov gameState, STATE_GAME_OVER
 mov gameOverTimer, 180
 mov gameState, STATE_MENU
 jmp row_done

do_brick_block:

 cmp marioVelY, 0
 jge do_brick_solid

 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 mov eax, prevY
 cmp eax, ebx
 jl do_brick_solid
 mov eax, marioY
 cmp eax, ebx
 jg do_brick_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_brick_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_brick_solid

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je brick_bob_only

 push esi
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, level1
 add edi, eax
 mov byte ptr [edi], 0
 call SaveLevelState

 mov ecx, 0
 xor esi, esi
spawn_debris_loop:
 cmp ecx, 4
 jge spawn_debris_done
find_debris_slot:
 cmp esi, MAX_BRICK_DEBRIS
 jge spawn_debris_done
 cmp dword ptr [debrisFrame + esi * 4], - 1
 je found_debris_slot
 inc esi
 jmp find_debris_slot
found_debris_slot:

 mov eax, tileWorldX
 add eax, 8

 test ecx, 2
 jz debris_left_x
 add eax, 8
 jmp debris_set_x
debris_left_x:
 sub eax, 8
debris_set_x:
 mov [debrisX + esi * 4], eax

 mov eax, tileWorldY
 add eax, 8

 test ecx, 1
 jz debris_top_y
 add eax, 8
 jmp debris_set_y
debris_top_y:
 sub eax, 8
debris_set_y:
 mov [debrisY + esi * 4], eax

 test ecx, 2
 jz debris_vel_left
 mov dword ptr [debrisVelX + esi * 4], 4
 jmp debris_vel_x_done
debris_vel_left:
 mov dword ptr [debrisVelX + esi * 4], - 4
debris_vel_x_done:

 test ecx, 1
 jz debris_vel_top
 mov dword ptr [debrisVelY + esi * 4], - 8
 jmp debris_vel_y_done
debris_vel_top:
 mov dword ptr [debrisVelY + esi * 4], - 12
debris_vel_y_done:

 mov dword ptr [debrisFrame + esi * 4], 60
 inc esi
 inc ecx
 jmp spawn_debris_loop
spawn_debris_done:
 pop esi
 call PlayBlockBreakSound

 add score, 50

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0
 jmp next_col

brick_bob_only:

 call PlayBumpSound

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_free_bounce_slot:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_free_bounce_slot
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_bounce_slot
 inc esi
 jmp find_free_bounce_slot
found_bounce_slot:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_free_bounce_slot:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0
 jmp next_col

do_brick_solid:

 jmp do_solid

do_hidden_lucky:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid

 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 push ecx
 push esi
 xor esi, esi
check_multicoin_registered:
 cmp esi, MAX_MULTICOIN
 jge multicoin_not_registered
 mov eax, row
 cmp [multiCoinRow + esi * 4], eax
 jne next_multicoin_check
 mov eax, col
 cmp [multiCoinCol + esi * 4], eax
 je multicoin_already_active
next_multicoin_check:
 inc esi
 jmp check_multicoin_registered

multicoin_not_registered:

 xor esi, esi
find_multicoin_slot:
 cmp esi, MAX_MULTICOIN
 jge multicoin_no_slot
 cmp dword ptr [multiCoinRow + esi * 4], - 1
 je found_multicoin_slot
 inc esi
 jmp find_multicoin_slot
found_multicoin_slot:
 mov eax, row
 mov [multiCoinRow + esi * 4], eax
 mov eax, col
 mov [multiCoinCol + esi * 4], eax
 mov dword ptr [multiCoinTimer + esi * 4], 240
multicoin_no_slot:
 jmp multicoin_give_reward

multicoin_already_active:

 cmp dword ptr [multiCoinTimer + esi * 4], 0
 jle multicoin_expired
 jmp multicoin_give_reward

multicoin_expired:

 mov byte ptr [edi], 1
 call SaveLevelState
 mov dword ptr [multiCoinRow + esi * 4], - 1
 mov dword ptr [multiCoinCol + esi * 4], - 1
 pop esi
 pop ecx

 jmp multicoin_final_reward

multicoin_give_reward:
 pop esi
 pop ecx

multicoin_final_reward:

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_bounce_slot:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_bounce_slot
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_bounce_slot
 inc esi
 jmp find_hidden_bounce_slot
found_hidden_bounce_slot:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_bounce_slot:

 xor esi, esi
find_hidden_popup_slot:
 cmp esi, MAX_COIN_POPUPS
 jge no_hidden_popup_slot
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je found_hidden_popup_slot
 inc esi
 jmp find_hidden_popup_slot
found_hidden_popup_slot:
 mov eax, tileWorldX
 add eax, 8
 mov [coinPopupX + esi * 4], eax
 mov eax, tileWorldY
 sub eax, 16
 mov [coinPopupY + esi * 4], eax
 mov dword ptr [coinPopupVelY + esi * 4], - 12
 mov dword ptr [coinPopupFrame + esi * 4], 30
no_hidden_popup_slot:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 push eax
 mov eax, 1
 call CollectCoins
 pop eax
 jmp next_col

do_platform:

 cmp marioVelY, 0
 jl next_col

 mov eax, prevY
 mov edx, curHitboxH
 add eax, edx
 cmp eax, tileWorldY
 jg next_col

 mov eax, marioY
 mov edx, curHitboxH
 add eax, edx
 cmp eax, tileWorldY
 jl next_col

 sub eax, tileWorldY
 sub marioY, eax
 mov marioVelY, 0
 mov onGround, 1
 jmp next_col

do_qblock:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid

 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_qblock_bounce_slot:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_qblock_bounce_slot
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_qblock_bounce_slot
 inc esi
 jmp find_qblock_bounce_slot
found_qblock_bounce_slot:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_qblock_bounce_slot:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

qblock_give_coin:

 push eax
 mov eax, 1
 call CollectCoins
 pop eax

 push ecx
 push esi
 xor esi, esi
find_coin_popup_slot:
 cmp esi, MAX_COIN_POPUPS
 jge no_coin_popup_slot
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je found_coin_popup_slot
 inc esi
 jmp find_coin_popup_slot
found_coin_popup_slot:
 mov eax, tileWorldX
 add eax, 8
 mov [coinPopupX + esi * 4], eax
 mov eax, tileWorldY
 sub eax, 16
 mov [coinPopupY + esi * 4], eax
 mov dword ptr [coinPopupVelY + esi * 4], - 12
 mov dword ptr [coinPopupFrame + esi * 4], 30
no_coin_popup_slot:
 pop esi
 pop ecx
 jmp next_col

do_powerup_block:

 jmp do_lucky_mushroom
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid

 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_powerup_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_powerup_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_powerup_bounce
 inc esi
 jmp find_powerup_bounce
found_powerup_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_powerup_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, mushroomActive
 or eax, flowerActive
 test eax, eax
 jnz next_col

 mov eax, marioState
 cmp eax, MARIO_SMALL
 jne spawn_flower_powerup

 mov mushroomActive, 1
 mov mushroomRising, 1
 mov eax, tileWorldX
 mov mushroomX, eax
 call PlayPowerupAppearSound
 mov eax, tileWorldY
 mov mushroomRiseY, eax
 add eax, 16
 mov mushroomY, eax
 mov mushroomVelX, 2
 mov mushroomVelY, 0
 jmp next_col

spawn_flower_powerup:

 mov flowerActive, 1
 mov eax, tileWorldX
 mov flowerX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov flowerY, eax
 mov flowerFrame, 0
 call PlayPowerupAppearSound
 jmp next_col

do_star_block:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_star_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_star_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_star_bounce
 inc esi
 jmp find_star_bounce
found_star_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_star_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, starActive
 test eax, eax
 jnz next_col

 mov starActive, 1
 mov eax, tileWorldX
 mov starX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov starY, eax
 mov starVelX, 3
 mov starVelY, - 8
 mov starFrame, 0
 jmp next_col

do_lucky_coin:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_coin_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_coin_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_coin_bounce
 inc esi
 jmp find_coin_bounce
found_coin_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_coin_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 push eax
 mov eax, 1
 call CollectCoins
 pop eax

 push ecx
 push esi
 xor esi, esi
find_coin_popup2:
 cmp esi, MAX_COIN_POPUPS
 jge no_coin_popup2
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je found_coin_popup2
 inc esi
 jmp find_coin_popup2
found_coin_popup2:
 mov eax, tileWorldX
 add eax, 8
 mov [coinPopupX + esi * 4], eax
 mov eax, tileWorldY
 sub eax, 16
 mov [coinPopupY + esi * 4], eax
 mov dword ptr [coinPopupVelY + esi * 4], - 12
 mov dword ptr [coinPopupFrame + esi * 4], 30
no_coin_popup2:
 pop esi
 pop ecx
 jmp next_col

do_lucky_mushroom:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_mush_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_mush_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_mush_bounce
 inc esi
 jmp find_mush_bounce
found_mush_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_mush_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, mushroomActive
 or eax, flowerActive
 test eax, eax
 jnz next_col

 mov mushroomActive, 1
 mov mushroomRising, 1
 mov eax, tileWorldX
 mov mushroomX, eax
 mov eax, tileWorldY
 mov mushroomRiseY, eax
 add eax, 16
 mov mushroomY, eax
 mov mushroomVelX, 2
 mov mushroomVelY, 0
 jmp next_col

do_lucky_flower:

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je do_lucky_mushroom

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_flower_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_flower_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_flower_bounce
 inc esi
 jmp find_flower_bounce
found_flower_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_flower_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, flowerActive
 test eax, eax
 jnz next_col

 mov flowerActive, 1
 mov eax, tileWorldX
 mov flowerX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov flowerY, eax
 mov flowerFrame, 0
 jmp next_col

do_lucky_1up:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_1up_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_1up_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_1up_bounce
 inc esi
 jmp find_1up_bounce
found_1up_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_1up_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, oneUpActive
 test eax, eax
 jnz next_col

 mov oneUpActive, 1
 mov oneUpRising, 1
 mov eax, tileWorldX
 mov oneUpX, eax
 mov eax, tileWorldY
 mov oneUpRiseY, eax
 add eax, 16
 mov oneUpY, eax
 mov oneUpVelX, 2
 mov oneUpVelY, 0
 jmp next_col

do_lucky_invisible:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_invis_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_invis_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_invis_bounce
 inc esi
 jmp find_invis_bounce
found_invis_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_invis_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, animFrame
 xor edx, edx
 mov ebx, 5
 div ebx
 cmp edx, 0
 je invis_coin
 cmp edx, 1
 je invis_mushroom
 cmp edx, 2
 je invis_star
 cmp edx, 3
 je invis_golden

 jmp invis_1up

invis_coin:

 push eax
 mov eax, 1
 call CollectCoins
 pop eax
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea esi, level1
 add esi, eax
 mov byte ptr [esi], TILE_LUCKY_USED
 call SaveLevelState
 jmp next_col

invis_mushroom:

 mov eax, mushroomActive
 or eax, flowerActive
 test eax, eax
 jnz next_col
 mov mushroomActive, 1
 mov mushroomRising, 1
 mov eax, tileWorldX
 mov mushroomX, eax
 mov eax, tileWorldY
 mov mushroomRiseY, eax
 add eax, 16
 mov mushroomY, eax
 mov mushroomVelX, 2
 mov mushroomVelY, 0
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea esi, level1
 add esi, eax
 mov byte ptr [esi], TILE_LUCKY_USED
 call SaveLevelState
 jmp next_col

invis_star:

 mov eax, starActive
 test eax, eax
 jnz next_col
 mov starActive, 1
 mov eax, tileWorldX
 mov starX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov starY, eax
 mov starVelX, 3
 mov starVelY, - 8
 mov starFrame, 0
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea esi, level1
 add esi, eax
 mov byte ptr [esi], TILE_LUCKY_USED
 call SaveLevelState
 jmp next_col

invis_golden:

 mov eax, goldenMushroomActive
 test eax, eax
 jnz next_col
 mov goldenMushroomActive, 1
 mov goldenMushroomRising, 1
 mov eax, tileWorldX
 mov goldenMushroomX, eax
 mov eax, tileWorldY
 mov goldenMushroomRiseY, eax
 add eax, 16
 mov goldenMushroomY, eax
 mov goldenMushroomVelX, 2
 mov goldenMushroomVelY, 0
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea esi, level1
 add esi, eax
 mov byte ptr [esi], TILE_LUCKY_USED
 call SaveLevelState
 jmp next_col

invis_1up:

 mov eax, oneUpActive
 test eax, eax
 jnz next_col
 mov oneUpActive, 1
 mov oneUpRising, 1
 mov eax, tileWorldX
 mov oneUpX, eax
 mov eax, tileWorldY
 mov oneUpRiseY, eax
 add eax, 16
 mov oneUpY, eax
 mov oneUpVelX, 2
 mov oneUpVelY, 0
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea esi, level1
 add esi, eax
 mov byte ptr [esi], TILE_LUCKY_USED
 call SaveLevelState
 jmp next_col

do_golden_block:

 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_golden_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_golden_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_golden_bounce
 inc esi
 jmp find_golden_bounce
found_golden_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_golden_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, goldenMushroomActive
 test eax, eax
 jnz next_col

 mov goldenMushroomActive, 1
 mov goldenMushroomRising, 1
 mov eax, tileWorldX
 mov goldenMushroomX, eax
 mov eax, tileWorldY
 mov goldenMushroomRiseY, eax
 add eax, 16
 mov goldenMushroomY, eax
 mov goldenMushroomVelX, 2
 mov goldenMushroomVelY, 0
 jmp next_col

do_hidden_lucky_mushroom:
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_mushroom_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_mushroom_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_mushroom_bounce
 inc esi
 jmp find_hidden_mushroom_bounce
found_hidden_mushroom_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_mushroom_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, mushroomActive
 or eax, flowerActive
 test eax, eax
 jnz next_col

 mov eax, marioState
 cmp eax, MARIO_SMALL
 jne spawn_hidden_flower_powerup

 mov mushroomActive, 1
 mov mushroomRising, 1
 mov eax, tileWorldX
 mov mushroomX, eax
 call PlayPowerupAppearSound
 mov eax, tileWorldY
 mov mushroomRiseY, eax
 add eax, 16
 mov mushroomY, eax
 mov mushroomVelX, 2
 mov mushroomVelY, 0
 jmp next_col

spawn_hidden_flower_powerup:
 mov flowerActive, 1
 mov eax, tileWorldX
 mov flowerX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov flowerY, eax
 mov flowerFrame, 0
 call PlayPowerupAppearSound
 jmp next_col

do_hidden_lucky_flower:
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_flower_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_flower_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_flower_bounce
 inc esi
 jmp find_hidden_flower_bounce
found_hidden_flower_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_flower_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, flowerActive
 test eax, eax
 jnz next_col

 mov flowerActive, 1
 mov eax, tileWorldX
 mov flowerX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov flowerY, eax
 mov flowerFrame, 0
 call PlayPowerupAppearSound
 jmp next_col

do_hidden_lucky_star:
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_star_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_star_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_star_bounce
 inc esi
 jmp find_hidden_star_bounce
found_hidden_star_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_star_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, starActive
 test eax, eax
 jnz next_col
 mov starActive, 1
 mov eax, tileWorldX
 mov starX, eax
 mov eax, tileWorldY
 sub eax, 32
 mov starY, eax
 mov starVelX, 3
 mov starVelY, - 8
 mov starFrame, 0
 jmp next_col

do_hidden_lucky_goldmush:
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_goldmush_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_goldmush_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_goldmush_bounce
 inc esi
 jmp find_hidden_goldmush_bounce
found_hidden_goldmush_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_goldmush_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, goldenMushroomActive
 test eax, eax
 jnz next_col

 mov goldenMushroomActive, 1
 mov goldenMushroomRising, 1
 mov eax, tileWorldX
 mov goldenMushroomX, eax
 mov eax, tileWorldY
 mov goldenMushroomRiseY, eax
 add eax, 16
 mov goldenMushroomY, eax
 mov goldenMushroomVelX, 2
 mov goldenMushroomVelY, 0
 jmp next_col

do_hidden_lucky_1up:
 mov eax, row
 imul eax, TILE_COLS
 add eax, col
 lea edi, qUsedMap
 add edi, eax
 cmp byte ptr [edi], 0
 jne do_solid

 cmp marioVelY, 0
 jge do_solid
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 sub ebx, 8
 cmp eax, ebx
 jl do_solid
 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle do_solid
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge do_solid

 mov byte ptr [edi], 1
 call SaveLevelState

 push row
 push col
 invoke KillEnemyOnBlock, row, col
 pop col
 pop row

 push row
 push col
 invoke CheckCoinOnBlock, row, col
 pop col
 pop row

 push ecx
 push esi
 xor esi, esi
find_hidden_1up_bounce:
 cmp esi, MAX_BRICK_BOUNCES
 jge no_hidden_1up_bounce
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je found_hidden_1up_bounce
 inc esi
 jmp find_hidden_1up_bounce
found_hidden_1up_bounce:
 mov eax, row
 mov [brickBounceRow + esi * 4], eax
 mov eax, col
 mov [brickBounceCol + esi * 4], eax
 mov dword ptr [brickBounceFrame + esi * 4], 0
no_hidden_1up_bounce:
 pop esi
 pop ecx

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0

 mov eax, oneUpActive
 test eax, eax
 jnz next_col
 mov oneUpActive, 1
 mov oneUpRising, 1
 mov eax, tileWorldX
 mov oneUpX, eax
 mov eax, tileWorldY
 mov oneUpRiseY, eax
 add eax, 16
 mov oneUpY, eax
 mov oneUpVelX, 2
 mov oneUpVelY, 0
 jmp next_col

do_warp_pipe_solid:

do_pipe_top:

 jmp do_solid

do_flagpole_trigger:

 mov eax, flagpoleState
 test eax, eax
 jnz next_col
 mov eax, flagpoleComplete
 test eax, eax
 jnz next_col

 mov eax, gameState
 cmp eax, STATE_FLAGPOLE
 je next_col

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle next_col
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col

 mov eax, marioY
 add eax, curHitboxH
 cmp eax, tileWorldY
 jle next_col
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col

 mov eax, marioY
 mov flagpoleGrabY, eax

 mov eax, flagpoleGrabY
 mov flagY, eax

 mov eax, tileWorldX
 mov flagpoleX, eax

 mov eax, flagpoleGrabY
 mov ebx, flagpoleTopTileY
 mov ecx, flagpoleBaseTileY

 test ebx, ebx
 jz flag_grab_score_done
 test ecx, ecx
 jz flag_grab_score_done

 mov edx, eax
 sub edx, ebx

 cmp edx, 0
 jl flag_grab_section_1

 mov eax, edx
 mov edx, 0
 mov ecx, TILE_SIZE
 div ecx

 cmp eax, 5
 jge flag_grab_section_6

 cmp eax, 0
 je flag_grab_section_1
 cmp eax, 1
 je flag_grab_section_2
 cmp eax, 2
 je flag_grab_section_3
 cmp eax, 3
 je flag_grab_section_4
 cmp eax, 4
 je flag_grab_section_5
 jmp flag_grab_section_6

flag_grab_section_1:
 mov ebx, FLAGPOLE_SECTION_1
 jmp flag_grab_score_set
flag_grab_section_2:
 mov ebx, FLAGPOLE_SECTION_2
 jmp flag_grab_score_set
flag_grab_section_3:
 mov ebx, FLAGPOLE_SECTION_3
 jmp flag_grab_score_set
flag_grab_section_4:
 mov ebx, FLAGPOLE_SECTION_4
 jmp flag_grab_score_set
flag_grab_section_5:
 mov ebx, FLAGPOLE_SECTION_5
 jmp flag_grab_score_set
flag_grab_section_6:
 mov ebx, FLAGPOLE_SECTION_6

flag_grab_score_set:
 add score, ebx
 mov eax, flagpoleX
 mov ecx, flagpoleGrabY
 invoke SpawnFloatingScore, ebx, eax, ecx

flag_grab_score_done:
 mov flagScore, 0

 mov flagpoleState, 1
 mov flagpoleTimer, 0
 mov marioAnimFrame, MARIO_FLAG_GRAB
 call PlayFlagpoleSound

 mov marioVelX, 0
 mov marioVelY, 0

 mov eax, flagpoleX
 sub eax, 8
 mov marioX, eax
 mov eax, flagpoleGrabY
 mov marioY, eax
 mov marioOnGround, 0
 mov marioWalking, 0
 mov marioCrouching, 0

 mov gameState, STATE_FLAGPOLE

 call SavePlayerProgress

 jmp next_col

do_end_block:
 mov eax, endSequenceDone
 test eax, eax
 jnz next_col

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle next_col
 mov eax, marioX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col
 mov eax, marioY
 add eax, curHitboxH
 cmp eax, tileWorldY
 jle next_col
 mov eax, marioY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge next_col

 mov endBlockHit, 1
 mov castleFlagShow, 1
 mov endSequenceDone, 1
 call PlayVictoryMusic

 mov recordedBonusTime, 0
 ; Always enable fireworks bonus so 500 score + floating text show in normal play
 mov fireworksBonusActive, 1
 mov eax, timer
 mov recordedBonusTime, eax
 jmp init_end_sequence

init_end_sequence:
 mov fireworkBonusPhase, 0
 mov fireworkBonusIndex, 0
 mov fireworksAllDone, 0
 mov fireworkCount, 0

 call SpawnFireworks

 mov timerCountdownActive, 1

 jmp next_col

do_tree_leaf:

 cmp marioVelY, 0
 jl leaf_check_below
 mov eax, prevY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, tileWorldY
 jg leaf_check_below

 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, tileWorldY
 jl leaf_check_below

 sub eax, tileWorldY
 sub marioY, eax
 mov marioVelY, 0
 mov onGround, 1
 mov marioJumping, 0
 jmp next_col

leaf_check_below:

 mov eax, prevY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 cmp eax, ebx
 jl leaf_check_sides

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0
 jmp next_col

leaf_check_sides:

 mov eax, prevX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle leaf_push_right
 mov eax, prevX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge leaf_push_left
 jmp next_col

leaf_push_right:
 mov eax, tileWorldX
 sub eax, HITBOX_WIDTH
 mov marioX, eax
 mov marioVelX, 0
 jmp next_col

leaf_push_left:
 mov eax, tileWorldX
 add eax, TILE_SIZE
 mov marioX, eax
 mov marioVelX, 0
 jmp next_col

do_solid:

 cmp marioVelY, 0
 jl solid_check_below
 mov eax, prevY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, tileWorldY
 jg solid_check_below

 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, tileWorldY
 jl solid_check_below

 sub eax, tileWorldY
 sub marioY, eax
 mov marioVelY, 0
 mov onGround, 1
 jmp next_col

solid_check_below:

 mov eax, prevY
 mov ebx, tileWorldY
 add ebx, TILE_SIZE
 cmp eax, ebx
 jl solid_check_sides

 mov eax, tileWorldY
 add eax, TILE_SIZE
 mov marioY, eax
 mov marioVelY, 0
 jmp next_col

solid_check_sides:

 mov eax, prevX
 add eax, HITBOX_WIDTH
 cmp eax, tileWorldX
 jle solid_push_right
 mov eax, prevX
 mov ebx, tileWorldX
 add ebx, TILE_SIZE
 cmp eax, ebx
 jge solid_push_left
 jmp next_col

solid_push_right:
 mov eax, tileWorldX
 sub eax, HITBOX_WIDTH
 mov marioX, eax
 mov marioVelX, 0
 jmp next_col

solid_push_left:
 mov eax, tileWorldX
 add eax, TILE_SIZE
 mov marioX, eax
 mov marioVelX, 0
 jmp next_col

next_col:
 inc col
 jmp col_loop
col_done:
 inc row
 jmp row_loop
row_done:

 mov eax, onGround
 mov marioOnGround, eax

 cmp marioX, 0
 jge x_min_ok
 mov marioX, 0
x_min_ok:
 mov eax, TILE_COLS
 imul eax, TILE_SIZE
 sub eax, HITBOX_WIDTH
 cmp marioX, eax
 jle x_max_ok
 mov marioX, eax
x_max_ok:

mov eax, marioX
add eax, HITBOX_WIDTH / 4
sub eax, WINDOW_WIDTH / 4
 sub eax, 300
 cmp eax, 0
 jge cam_x_ok
 xor eax, eax
cam_x_ok:

 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, WINDOW_WIDTH
 cmp eax, ebx
 jle cam_x_max_ok
 mov eax, ebx
cam_x_max_ok:
 mov cameraX, eax

 mov eax, isUnderground
 test eax, eax
 jnz cam_y_fixed_underground

 mov eax, cameraSnapYOverworld
 sub eax, WINDOW_HEIGHT
 jmp cam_y_fixed_done

cam_y_fixed_underground:
 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT

cam_y_fixed_done:
 mov cameraY, eax

cam_y_follow_done:

cam_y_done:

 mov eax, keyK
 test eax, eax
 jz mario_no_kick
 call KickShell
 mov keyK, 0
mario_no_kick:

 ret

UpdateMario endp

StartMarioDeath proc
 mov marioDeathActive, 1
 mov marioDeathTimer, 0
 mov marioVelY, - 6
 mov marioVelX, 0
 mov marioOnGround, 0
 mov marioJumping, 0
 mov fadeAlpha, 0
 call PlayDeathSound
 ret
StartMarioDeath endp

UpdateMarioDeath proc uses eax ebx ecx edx

 mov eax, marioVelY

 add eax, GRAVITY
 mov marioVelY, eax
 add marioY, eax

 inc marioDeathTimer

 mov eax, fadeAlpha
 add eax, 15
 cmp eax, 255
 jle death_fade_ok
 mov eax, 255
death_fade_ok:
 mov fadeAlpha, eax

 mov eax, marioDeathTimer
 cmp eax, 30
 jl mario_death_done

 mov isUnderground, 0
 mov cameraX, 0
 call InitLevel
 call LoadPlatforms
 call ResetEnemiesToSpawn
 mov marioVelY, 0
 mov marioVelX, 0
 mov marioOnGround, 1
 mov marioDeathActive, 0
 mov marioDeathTimer, 0
 mov fadeAlpha, 255
 mov respawnPauseTimer, 30
mario_death_done:
 ret

UpdateMarioDeath endp

KickShell proc uses eax ebx ecx edx esi edi
 local shellIdx:DWORD
 local shellX:DWORD
 local shellY:DWORD
 local marioCenterX:DWORD
 local shellCenterX:DWORD
 local kickDirection:DWORD
 local enemyW:DWORD
 local enemyH:DWORD

 mov eax, kickCooldownTimer
 cmp eax, 0
 jg kick_shell_done

 mov shellIdx, - 1
 mov ecx, 0
find_shell_loop:
 cmp ecx, MAX_ENEMIES
 jge kick_shell_done

 mov eax, [enemyType + ecx * 4]

 cmp eax, ENEMY_TURTLE
 jne check_bowser_kick
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_SHELL_IDLE
 jne next_shell_check

 mov eax, [enemyTimer + ecx * 4]
 cmp eax, 1
 je next_shell_check
 mov enemyW, TURTLE_W
 mov enemyH, TURTLE_H
 jmp found_kickable

check_bowser_kick:

 ; Bowser is no longer kickable
 cmp eax, ENEMY_BOWSER
 je next_shell_check

next_shell_check:
 inc ecx
 jmp find_shell_loop

found_kickable:

 mov eax, [enemyX + ecx * 4]
 mov shellX, eax
 mov eax, [enemyY + ecx * 4]
 mov shellY, eax

 mov eax, marioX

 add eax, HITBOX_WIDTH / 2
 mov marioCenterX, eax

 mov eax, enemyW
 shr eax, 1
 add eax, shellX
 mov shellCenterX, eax

 mov eax, marioCenterX
 sub eax, shellCenterX
 jns shell_dist_abs
 neg eax
shell_dist_abs:
 mov ebx, [enemyType + ecx * 4]

 cmp ebx, ENEMY_BOWSER
 je bowser_kick_dist
 cmp eax, 48
 jg next_shell_check
 jmp check_vertical
bowser_kick_dist:
 cmp eax, 128
 jg next_shell_check

check_vertical:

 mov eax, marioY
 add eax, marioHitboxHeight
 mov ebx, shellY
 add ebx, enemyH
 sub eax, ebx
 jns shell_y_dist_abs
 neg eax
shell_y_dist_abs:
 mov ebx, [enemyType + ecx * 4]
 cmp ebx, ENEMY_BOWSER
 je bowser_kick_y_dist
 cmp eax, 32
 jg next_shell_check
 jmp determine_kick_direction
bowser_kick_y_dist:
 cmp eax, 80
 jg next_shell_check

determine_kick_direction:

 mov eax, marioFacing
 cmp eax, 1

 je mario_facing_right_kick
 mov kickDirection, - 1
 jmp do_kick
mario_facing_right_kick:

 mov kickDirection, 1

do_kick:

 mov eax, [enemyType + ecx * 4]

 cmp eax, ENEMY_BOWSER
 je kick_bowser

 mov kickCooldownTimer, 180

 mov eax, kickDirection
 imul eax, 8
 mov [enemyVelX + ecx * 4], eax
 mov dword ptr [enemyState + ecx * 4], ESTATE_SHELL_SLIDE

 mov dword ptr [enemyTimer + ecx * 4], 1

 mov shellComboCount, 0
 call PlayShellKickSound
 jmp kick_shell_done

kick_bowser:

 mov ebx, [enemyKickCount + ecx * 4]
 inc ebx
 mov [enemyKickCount + ecx * 4], ebx

 mov kickCooldownTimer, 180

 mov edx, ebx
 imul edx, 2

 mov eax, kickDirection
 imul eax, edx
 mov [enemyVelX + ecx * 4], eax

 jmp kick_shell_done

kick_shell_done:

 cmp kickCooldownTimer, 0
 jne kick_shell_ret
 mov kickCooldownTimer, 180
kick_shell_ret:
 ret

KickShell endp

CheckFireballEnemyCollision proc uses eax ebx ecx edx edi
 local fireballLeft:DWORD
 local fireballRight:DWORD
 local fireballTop:DWORD
 local fireballBottom:DWORD
 local enemyIdx:DWORD

 mov eax, [fireballX + esi * 4]
 mov fireballLeft, eax
 add eax, 8
 mov fireballRight, eax
 mov eax, [fireballY + esi * 4]
 mov fireballTop, eax
 add eax, 8
 mov fireballBottom, eax

 mov enemyIdx, 0

check_fireball_enemy_loop:
 mov eax, enemyIdx
 cmp eax, MAX_ENEMIES
 jge fireball_enemy_collision_done

 mov edx, [enemyType + eax * 4]
 cmp edx, ENEMY_NONE
 je next_fireball_enemy_check

 mov edx, [enemyState + eax * 4]
 cmp edx, ESTATE_DEAD
 je next_fireball_enemy_check
 cmp edx, ESTATE_DYING
 je next_fireball_enemy_check
 cmp edx, ESTATE_INACTIVE
 je next_fireball_enemy_check

 mov edx, [enemyType + eax * 4]
 cmp edx, ENEMY_GOOMBA
 je fireball_check_goomba
 cmp edx, ENEMY_PIRANHA
 je fireball_check_piranha
 cmp edx, ENEMY_FLYING_TURTLE
 je fireball_check_flyturtle
 cmp edx, ENEMY_TURTLE
 je fireball_check_turtle
 cmp edx, ENEMY_BOWSER
 je fireball_check_bowser

 jmp next_fireball_enemy_check

fireball_check_bowser:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, BOWSER_W
 add ebx, BOWSER_H
 jmp fireball_check_enemy_collision

fireball_check_goomba:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, GOOMBA_W
 add ebx, GOOMBA_H
 jmp fireball_check_enemy_collision

fireball_check_piranha:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, PIRANHA_W
 add ebx, PIRANHA_H
 jmp fireball_check_enemy_collision

fireball_check_flyturtle:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, FLY_TURTLE_W
 add ebx, FLY_TURTLE_H
 jmp fireball_check_enemy_collision

fireball_check_turtle:
 mov edx, [enemyX + eax * 4]
 mov ebx, [enemyY + eax * 4]
 add edx, TURTLE_W
 add ebx, TURTLE_H
 jmp fireball_check_enemy_collision

fireball_check_enemy_collision:

 mov ecx, [enemyX + eax * 4]
 mov edi, [enemyY + eax * 4]

 cmp ecx, fireballRight
 jge next_fireball_enemy_check
 cmp edx, fireballLeft
 jle next_fireball_enemy_check

 cmp edi, fireballBottom
 jge next_fireball_enemy_check
 cmp ebx, fireballTop
 jle next_fireball_enemy_check

 mov edx, [enemyType + eax * 4]
 cmp edx, ENEMY_BOWSER
 je fireball_hit_bowser

 mov dword ptr [enemyState + eax * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + eax * 4], 30

 cmp edx, ENEMY_GOOMBA
 je fireball_score_goomba
 cmp edx, ENEMY_PIRANHA
 je fireball_score_piranha

 mov edx, SCORE_FIREBALL_KILL
 jmp fireball_add_score

fireball_hit_bowser:

 mov edx, [enemyHitCount + eax * 4]
 inc edx
 mov [enemyHitCount + eax * 4], edx
 cmp edx, 6
 jge bowser_die_from_fireball
 jmp fireball_enemy_collision_done

bowser_die_from_fireball:

 mov dword ptr [enemyType + eax * 4], ENEMY_TURTLE
 mov dword ptr [enemyState + eax * 4], ESTATE_DYING
 mov dword ptr [enemyTimer + eax * 4], 1
 mov dword ptr [enemyVelY + eax * 4], 4
 mov dword ptr [enemyVelX + eax * 4], 0
 mov dword ptr [enemyFrame + eax * 4], TURTLE_DEATH
 jmp fireball_enemy_collision_done
fireball_score_goomba:
 mov edx, SCORE_GOOMBA
 jmp fireball_add_score
fireball_score_piranha:
 mov edx, SCORE_FIREBALL_KILL
fireball_add_score:
 add score, edx
 push eax
 push edx
 mov ebx, [enemyX + eax * 4]
 mov ecx, [enemyY + eax * 4]
 invoke SpawnFloatingScore, edx, ebx, ecx
 pop edx
 pop eax

 push esi
 push eax
 push ecx
 push ebx
 xor ecx, ecx
find_explosion_slot_enemy:
 cmp ecx, MAX_EXPLOSIONS
 jge explosion_slot_found_enemy
 cmp dword ptr [explosionFrame + ecx * 4], - 1
 je explosion_slot_found_enemy
 inc ecx
 jmp find_explosion_slot_enemy
explosion_slot_found_enemy:

 mov eax, [fireballX + esi * 4]
 mov [explosionX + ecx * 4], eax
 mov eax, [fireballY + esi * 4]
 mov [explosionY + ecx * 4], eax
 mov dword ptr [explosionFrame + ecx * 4], 0
 mov dword ptr [explosionTimer + ecx * 4], 0
 pop ebx
 pop ecx
 pop eax
 pop esi

 mov dword ptr [fireballActive + esi * 4], 0
 mov dword ptr [fireballX + esi * 4], - 100
 jmp fireball_enemy_collision_done

next_fireball_enemy_check:
 inc enemyIdx
 jmp check_fireball_enemy_loop

fireball_enemy_collision_done:
 ret

CheckFireballEnemyCollision endp

CheckCoinCollisions proc uses ebx ecx edx esi edi
 local i:DWORD
 local coinPtr:DWORD

 mov i, 0
 lea eax, coinData
 mov coinPtr, eax

coin_check_loop:
 mov eax, i
 cmp eax, numCoins
 jge coin_check_done

 mov esi, coinPtr
 mov edx, [esi + 8]
 test edx, edx
 jnz skip_coin_check

 mov eax, marioX

 add eax, HITBOX_WIDTH
 cmp eax, [esi]
 jl skip_coin_check

 mov eax, marioX
 mov ebx, [esi]
 add ebx, COIN_SIZE
 cmp eax, ebx
 jg skip_coin_check

 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, [esi + 4]
 jl skip_coin_check

 mov eax, marioY
 mov ebx, [esi + 4]
 add ebx, COIN_SIZE
 cmp eax, ebx
 jg skip_coin_check

 mov dword ptr [esi + 8], 1
 push eax
 mov eax, 1
 call CollectCoins
 pop eax

skip_coin_check:
 add coinPtr, 12
 inc i
 jmp coin_check_loop

coin_check_done:
 ret

CheckCoinCollisions endp

UpdateGame proc uses ebx ecx edx esi edi
 local pipeCol:DWORD
 local pipeRow:DWORD

 mov eax, gameState
 cmp eax, STATE_PAUSE
 je update_game_done_label

 mov eax, pipeTransition
 test eax, eax

 jz no_pipe_trans_update

 ; Disable down and right keys during entire pipe transition
 mov keyDown, 0
 mov keyRight, 0

 dec pipeTransTimer
 inc pipeTransFrame

 mov eax, pipeTransFrame
 cmp eax, 30
 jg pipe_trans_fade_phase

 mov eax, pipeTransition
 cmp eax, 1
 jne pipe_trans_check_right
 add marioY, 2
 jmp no_pipe_trans_update

pipe_trans_check_right:
 cmp eax, 3
 jne no_pipe_trans_update
 add marioX, 2
 jmp no_pipe_trans_update

pipe_trans_fade_phase:

 mov eax, pipeTransFrame
 cmp eax, 50
 jg pipe_trans_teleport_phase

 ; Calculate fade amount based on frames since fade start (30)
 ; Fade from 0 to 255 over 20 frames (frames 30-49)
 mov ebx, eax
 sub ebx, 30  ; Frames into fade (0-19)
 cmp ebx, 0
 jl pipe_fade_not_started
 cmp ebx, 20
 jge pipe_fade_max
 ; fadeAlpha = (ebx * 255) / 20
 mov eax, ebx
 mov ecx, 255
 imul ecx
 mov ecx, 20
 xor edx, edx
 div ecx
 jmp pipe_fade_set
pipe_fade_not_started:
 mov eax, 0
 jmp pipe_fade_set
pipe_fade_max:
 mov eax, 255
pipe_fade_set:
 mov fadeAlpha, eax
 jmp no_pipe_trans_update

pipe_trans_teleport_phase:

 mov eax, pipeTransFrame
 cmp eax, 51
 jne pipe_trans_fadein_phase

 ; At teleport, set Mario's initial position inside the pipe
 ; For vertical pipes, start inside (below exit) - will emerge upward during fade-in
 mov eax, pipeTransition
 cmp eax, 1
 je set_vertical_exit_start
 cmp eax, 3
 je set_horizontal_exit_start
 jmp set_normal_teleport

set_vertical_exit_start:
 ; All exits are vertical - start from bottom of pipe structure if cap exists
 mov eax, pipeDestX
 mov marioX, eax
 mov eax, pipeExitHasCap
 test eax, eax
 jz vertical_no_cap_start
 ; Has cap - start from pipe bottom
 mov eax, pipeExitBottomY
 mov marioY, eax
 jmp teleport_pos_done
vertical_no_cap_start:
 ; No cap - start inside pipe (below exit)
 mov eax, pipeDestY
 add eax, TILE_SIZE
 mov marioY, eax
 jmp teleport_pos_done

set_horizontal_exit_start:
 ; Horizontal entry always exits to vertical pipe - start from bottom if cap exists
 mov eax, pipeDestX
 mov marioX, eax
 mov eax, pipeExitHasCap
 test eax, eax
 jz horiz_no_cap_start
 ; Has cap - start from pipe bottom
 mov eax, pipeExitBottomY
 mov marioY, eax
 jmp teleport_pos_done
horiz_no_cap_start:
 ; No cap - start inside pipe (below exit)
 mov eax, pipeDestY
 add eax, TILE_SIZE
 mov marioY, eax
 jmp teleport_pos_done

set_normal_teleport:
 ; All exits are vertical - start from bottom if cap exists
 mov eax, pipeDestX
 mov marioX, eax
 mov eax, pipeExitHasCap
 test eax, eax
 jz normal_no_cap_start
 ; Has cap - start from pipe bottom
 mov eax, pipeExitBottomY
 mov marioY, eax
 jmp teleport_pos_done
normal_no_cap_start:
 ; No cap - start inside pipe (below exit)
 mov eax, pipeDestY
 add eax, TILE_SIZE
 mov marioY, eax

teleport_pos_done:
 mov eax, pipeDestCamX
 mov cameraX, eax

 mov eax, pipeDestUnder
 mov isUnderground, eax
 test eax, eax
 jnz pipe_cam_y_underground
 mov eax, cameraSnapYOverworld
 sub eax, WINDOW_HEIGHT
 jmp pipe_cam_y_done
pipe_cam_y_underground:
 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT
pipe_cam_y_done:
 mov cameraY, eax
 call PlayLevelMusic
 mov fadeAlpha, 255
 jmp no_pipe_trans_update

pipe_trans_fadein_phase:

 ; Check if pipe exit has cap - if yes, do rising animation, otherwise just fade in
 mov eax, pipeExitHasCap
 test eax, eax
 jz pipe_fadein_fade_only  ; No cap, just fade in and teleport

 ; Has cap - sequence: fade in (15 frames), then rise from bottom to top (30 frames), then allow movement
 mov eax, pipeTransFrame
 sub eax, 51  ; Frame offset from teleport (0+)
 
 ; Phase 1: Fade in (frames 0-14, total 15 frames)
 cmp eax, 15
 jge pipe_rise_phase
 ; During fade-in, Mario stays at pipe bottom
 mov eax, pipeDestX
 mov marioX, eax
 mov eax, pipeExitBottomY  ; Stay at pipe bottom during fade-in
 mov marioY, eax
 jmp pipe_fadein_fade

pipe_rise_phase:
 ; Phase 2: Rise from bottom to top (frames 15-44, total 30 frames)
 push edx
 mov eax, pipeTransFrame
 sub eax, 51
 sub eax, 15  ; Frame offset for rising (0-29)
 cmp eax, 30
 jge pipe_rise_complete_pop
 ; Calculate distance from bottom to top
 mov ebx, pipeExitBottomY  ; Start position (pipe bottom)
 mov ecx, pipeDestY        ; End position (top of exit tile)
 sub ebx, ecx              ; Total distance to travel (ebx = distance)
 ; Animate Mario rising: start at pipeExitBottomY, end at pipeDestY
 ; Use linear interpolation over 30 frames
 ; progress = (distance * current_frame) / 30
 ; currentY = pipeExitBottomY - progress
 ; Multiply distance by current frame
 mov edx, eax              ; Current frame (0-29) in edx
 push eax                  ; Save frame number
 mov eax, ebx              ; distance in eax
 imul edx                  ; edx:eax = distance * frame
 mov esi, 30               ; Total frames
 push edx                  ; Save high part
 xor edx, edx              ; Clear edx for division
 div esi                   ; eax = (distance * frame) / 30 = progress
 mov ebx, eax              ; progress in ebx
 pop edx                   ; Restore high part (not needed)
 pop eax                   ; Restore frame number
 ; Calculate current Y: pipeExitBottomY - progress
 mov ecx, pipeExitBottomY
 sub ecx, ebx              ; Current Y position
 mov marioY, ecx
 mov eax, pipeDestX
 mov marioX, eax
 pop edx
 ; Disable movement during rising
 mov keyDown, 0
 mov keyRight, 0
 jmp no_pipe_trans_update
pipe_rise_complete_pop:
 pop edx

pipe_rise_complete:
 ; Phase 3: Animation complete, allow movement
 ; Mario is at final position (pipeDestY)
 mov eax, pipeDestX
 mov marioX, eax
 mov eax, pipeDestY
 mov marioY, eax
 ; Check if we've completed the full sequence (fade in + rise = 45 frames after teleport)
 mov eax, pipeTransFrame
 cmp eax, 96  ; 51 (teleport) + 15 (fade) + 30 (rise) = 96
 jl pipe_fadein_fade
 ; Transition complete - allow movement
 jmp pipe_trans_complete

pipe_fadein_fade:
 mov eax, fadeAlpha
 sub eax, 17
 jns pipe_fadein_ok
 xor eax, eax
pipe_fadein_ok:
 mov fadeAlpha, eax
 jmp no_pipe_trans_update

pipe_fadein_fade_only:
 ; No cap - just fade in and complete
 mov eax, pipeTransFrame
 cmp eax, 66  ; 51 (teleport) + 15 (fade) = 66
 jge pipe_trans_complete
 mov eax, fadeAlpha
 sub eax, 17
 jns pipe_fadein_ok2
 xor eax, eax
pipe_fadein_ok2:
 mov fadeAlpha, eax
 jmp no_pipe_trans_update

pipe_trans_complete:

 mov pipeTransition, 0
 mov pipeTransFrame, 0
 mov fadeAlpha, 0
 mov isInvincible, 0
 mov invincibleTimer, 0

no_pipe_trans_update:

 mov eax, kickCooldownTimer
 cmp eax, 0
 jle no_cooldown_update
 dec kickCooldownTimer
no_cooldown_update:

 mov eax, pipeTransition
 test eax, eax
 jnz no_fade_update

 cmp marioDeathActive, 1
 je no_fade_update

 mov eax, respawnPauseTimer
 cmp eax, 0
 jg no_fade_update
 mov eax, fadeAlpha
 test eax, eax
 jz no_fade_update
 sub eax, 15
 jns fade_not_negative
 xor eax, eax
fade_not_negative:
 mov fadeAlpha, eax
no_fade_update:

 inc animFrame

 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne update_done

 mov eax, respawnPauseTimer
 cmp eax, 0
 jg freeze_gameplay

 cmp marioDeathActive, 1
 jne update_gameplay_continue
 call UpdateMarioDeath
 jmp update_done

freeze_gameplay:
 dec respawnPauseTimer
 jmp update_done

update_gameplay_continue:

 mov eax, keyM
 test eax, eax
 jz midas_no_press

 mov keyM, 0
 inc midasKeyCount
 mov eax, animFrame
 mov midasLastPress, eax

 mov eax, midasKeyCount
 cmp eax, 5
 jl midas_check_timeout

 mov eax, midasUsesLeft
 test eax, eax
 jz midas_no_uses_left

 dec midasUsesLeft
 mov midasActive, 1
 mov midasBar, 100
 mov midasKeyCount, 0
 ; Invincible while Midas golden bar is active
 mov isInvincible, 1
 mov invincibleTimer, 100
 jmp midas_update_bar

midas_no_uses_left:
 mov midasKeyCount, 0
 jmp midas_update_bar

midas_no_press:

midas_check_timeout:
 mov eax, midasKeyCount
 test eax, eax
 jz midas_update_bar
 mov eax, animFrame
 sub eax, midasLastPress
 cmp eax, 30
 jl midas_update_bar

 mov midasKeyCount, 0

midas_update_bar:

 mov eax, midasActive
 test eax, eax
 jz midas_done
 dec midasBar
 mov eax, midasBar
 cmp eax, 0
 jg midas_done

 mov midasActive, 0
 mov midasBar, 0
 ; One-time use: consume all remaining uses once a Midas activation finishes
 mov midasUsesLeft, 0
 ; Clear Midas-granted invincibility when bar runs out (invincibleTimer may still be > 0; leave it to count down)
midas_done:

 mov eax, isInvincible
 test eax, eax
 jz invincible_done
invincible_check_timer:
 dec invincibleTimer
 mov eax, invincibleTimer
 cmp eax, 0
 jg invincible_done

 mov isInvincible, 0
 mov invincibleTimer, 0
 invincible_done:

 call CheckScoreMilestone

 mov eax, marioTransition
 test eax, eax
 jz transition_done

 dec transitionTimer
 mov eax, transitionTimer
 cmp eax, 0
 jg transition_done

 mov transitionTimer, 8
 inc transitionFrame
 mov eax, transitionFrame
 cmp eax, 3
 jl transition_done

 mov eax, marioTransition
 cmp eax, 1
 jne transition_shrink_complete

 mov marioState, MARIO_SUPER
 mov marioHitboxHeight, TILE_SIZE * 2

 sub marioY, TILE_SIZE
 mov marioTransition, 0
 mov transitionFrame, 0
 jmp transition_done

 transition_shrink_complete:

 ; When shrinking from big (64px) to small (32px), adjust Y to keep feet aligned
 ; If Mario is on ground: ground collision sets marioY + hitboxHeight = tileWorldY
 ; Big Mario: marioY = tileWorldY - 64, Small Mario: marioY = tileWorldY - 32
 ; Difference: +32 to marioY when shrinking
 ; But if this causes underground clipping, try a more conservative adjustment
 
 ; Check if Mario is on ground - if so, adjust more carefully
 mov eax, marioOnGround
 test eax, eax
 jz shrink_in_air
 
 ; Mario is on ground - calculate feet position and set small Mario's Y relative to ground
 ; Assume ground is at: old marioY + 64 (old feet position)
 mov eax, marioY
 add eax, TILE_SIZE * 2  ; Calculate ground Y = old feet position
 
 ; Set new state and hitbox
 mov marioState, MARIO_SMALL
 mov marioHitboxHeight, TILE_SIZE
 
 ; Position small Mario so feet are at same Y as big Mario's feet were
 ; new marioY = ground Y - 32 (small hitbox height)
 sub eax, TILE_SIZE
 mov marioY, eax
 jmp shrink_done
 
 shrink_in_air:
 ; Mario is in air - keep top position same to avoid ground clipping
 mov marioState, MARIO_SMALL
 mov marioHitboxHeight, TILE_SIZE
 ; No Y adjustment - ground collision will handle when he lands
 
 shrink_done:
 mov marioTransition, 0
 mov transitionFrame, 0
 ; Give 0.5 seconds of invincibility after shrinking
 mov isInvincible, 1
 mov invincibleTimer, 30
 
 transition_done:

 mov eax, starPowerActive
 test eax, eax
 jz star_power_done
 dec starPowerTimer

 inc starColorFrame
 mov eax, starPowerTimer
 cmp eax, 0
 jg star_power_done

 mov starPowerActive, 0
 mov starPowerTimer, 0
star_power_done:

 push esi
 xor esi, esi
update_brick_bounce_loop:
 cmp esi, MAX_BRICK_BOUNCES
 jge brick_bounce_update_done
 cmp dword ptr [brickBounceRow + esi * 4], - 1
 je next_brick_bounce_update

 inc dword ptr [brickBounceFrame + esi * 4]
 cmp dword ptr [brickBounceFrame + esi * 4], BOUNCE_KEYFRAMES
 jle next_brick_bounce_update

 mov dword ptr [brickBounceRow + esi * 4], - 1
 mov dword ptr [brickBounceCol + esi * 4], - 1
 mov dword ptr [brickBounceFrame + esi * 4], - 1
next_brick_bounce_update:
 inc esi
 jmp update_brick_bounce_loop
brick_bounce_update_done:
 pop esi

 push esi
 xor esi, esi
update_coin_popup_loop:
 cmp esi, MAX_COIN_POPUPS
 jge coin_popup_update_done
 cmp dword ptr [coinPopupFrame + esi * 4], - 1
 je next_coin_popup_update

 mov eax, [coinPopupVelY + esi * 4]
 add [coinPopupY + esi * 4], eax

 add dword ptr [coinPopupVelY + esi * 4], 1

 dec dword ptr [coinPopupFrame + esi * 4]
 cmp dword ptr [coinPopupFrame + esi * 4], 0
 jg next_coin_popup_update

 mov dword ptr [coinPopupFrame + esi * 4], - 1
next_coin_popup_update:
 inc esi
 jmp update_coin_popup_loop
coin_popup_update_done:
 pop esi

 push esi
 xor esi, esi
update_multicoin_loop:
 cmp esi, MAX_MULTICOIN
 jge multicoin_update_done
 cmp dword ptr [multiCoinRow + esi * 4], - 1
 je next_multicoin_update

 dec dword ptr [multiCoinTimer + esi * 4]

next_multicoin_update:
 inc esi
 jmp update_multicoin_loop
multicoin_update_done:
 pop esi

 push esi
 xor esi, esi
update_debris_loop:
 cmp esi, MAX_BRICK_DEBRIS
 jge debris_update_done
 cmp dword ptr [debrisFrame + esi * 4], - 1
 je next_debris_update

 mov eax, [debrisVelX + esi * 4]
 add [debrisX + esi * 4], eax
 mov eax, [debrisVelY + esi * 4]
 add [debrisY + esi * 4], eax

 add dword ptr [debrisVelY + esi * 4], 1

 dec dword ptr [debrisFrame + esi * 4]
 cmp dword ptr [debrisFrame + esi * 4], 0
 jg next_debris_update

 mov dword ptr [debrisFrame + esi * 4], - 1
next_debris_update:
 inc esi
 jmp update_debris_loop
debris_update_done:
 pop esi

 ; Don't consume keyFire or spawn fireball during pipe transition (so Z works after exiting pipe)
 mov eax, pipeTransition
 test eax, eax
 jnz fireball_update_movement

 mov eax, marioState
 cmp eax, MARIO_FIRE
 jne fireball_update_movement
 mov eax, keyFire
 test eax, eax
 jz fireball_update_movement
 mov keyFire, 0

 push esi
 xor esi, esi
find_fireball_slot:
 cmp esi, MAX_FIREBALLS
 jge no_fireball_slot
 cmp dword ptr [fireballActive + esi * 4], 0
 je spawn_fireball
 inc esi
 jmp find_fireball_slot
spawn_fireball:

 mov eax, marioX
 add eax, 16

 mov ebx, marioFacing
 imul ebx, 8
 add eax, ebx
 mov [fireballX + esi * 4], eax
 mov eax, marioY
 add eax, 8
 mov [fireballY + esi * 4], eax

 mov eax, marioFacing
 imul eax, 6
 mov [fireballVelX + esi * 4], eax
 mov dword ptr [fireballVelY + esi * 4], 0
 mov dword ptr [fireballFrame + esi * 4], 0
 mov dword ptr [fireballActive + esi * 4], 1
 mov marioShooting, 10
 call PlayFireballSound
no_fireball_slot:
 pop esi

fireball_update_movement:

 push esi
 xor esi, esi
update_fireball_loop:
 cmp esi, MAX_FIREBALLS
 jge fireball_update_done
 cmp dword ptr [fireballActive + esi * 4], 0
 je next_fireball_update

 mov eax, [fireballVelX + esi * 4]
 add [fireballX + esi * 4], eax

 add dword ptr [fireballVelY + esi * 4], 1
 mov eax, [fireballVelY + esi * 4]
 add [fireballY + esi * 4], eax

 call CheckFireballEnemyCollision

 cmp dword ptr [fireballActive + esi * 4], 0
 je next_fireball_update

 ; Grace frame: skip tile collision on first frame so fireball is visible when spawning (fixes underground)
 mov eax, [fireballFrame + esi * 4]
 test eax, eax
 jz fireball_animate

 mov eax, [fireballY + esi * 4]
 add eax, 8
 cmp eax, 0
 jl fireball_animate
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ebx, eax

 mov eax, TILE_ROWS
 dec eax
 cmp ebx, eax
 jle fireball_row_ok
 mov ebx, eax
fireball_row_ok:

 mov eax, [fireballX + esi * 4]
 add eax, 4
 cmp eax, 0
 jl fireball_animate
 xor edx, edx
 mov ecx, TILE_SIZE
 div ecx
 mov ecx, eax

 mov eax, TILE_COLS
 dec eax
 cmp ecx, eax
 jle fireball_col_ok
 mov ecx, eax
fireball_col_ok:

 mov eax, ebx
 imul eax, TILE_COLS
 add eax, ecx
 lea edi, level1
 movzx eax, byte ptr [edi + eax]

 cmp al, 1
 jb fireball_animate
 cmp al, 31
 jg fireball_check_special
 cmp al, 7
 je fireball_animate
 cmp al, 22
 je fireball_animate
 cmp al, TILE_MARIO_SPAWN
 je fireball_animate
 cmp al, TILE_FLAGPOLE_FLAG
 je fireball_animate
 cmp al, TILE_CASTLE_FLAG
 je fireball_animate
 jmp fireball_bounce

fireball_check_special:
 jmp fireball_animate

fireball_bounce:

 cmp al, TILE_GROUND
 je fireball_bounce_ground

 jmp fireball_hit_breakable

fireball_bounce_ground:

 mov eax, ebx
 imul eax, TILE_SIZE
 sub eax, 8
 mov [fireballY + esi * 4], eax
 mov dword ptr [fireballVelY + esi * 4], - 6
 jmp fireball_animate

fireball_hit_breakable:

 push esi
 push ecx
 push ebx
 xor ecx, ecx
find_explosion_slot:
 cmp ecx, MAX_EXPLOSIONS
 jge explosion_slot_found
 cmp dword ptr [explosionFrame + ecx * 4], - 1
 je explosion_slot_found
 inc ecx
 jmp find_explosion_slot
explosion_slot_found:

 mov eax, [fireballX + esi * 4]
 mov [explosionX + ecx * 4], eax
 mov eax, [fireballY + esi * 4]
 mov [explosionY + ecx * 4], eax
 mov dword ptr [explosionFrame + ecx * 4], 0
 mov dword ptr [explosionTimer + ecx * 4], 0
 pop ebx
 pop ecx
 pop esi

 mov dword ptr [fireballActive + esi * 4], 0
 mov dword ptr [fireballX + esi * 4], - 100
 jmp next_fireball_update

fireball_animate:

 inc dword ptr [fireballFrame + esi * 4]
 and dword ptr [fireballFrame + esi * 4], 3

 mov eax, [fireballX + esi * 4]
 sub eax, cameraX
 cmp eax, - 32
 jl deactivate_fireball
 cmp eax, WINDOW_WIDTH + 32
 jg deactivate_fireball
 mov eax, [fireballY + esi * 4]
 cmp eax, WINDOW_HEIGHT + 100
 jg deactivate_fireball
 jmp next_fireball_update

deactivate_fireball:
 mov dword ptr [fireballActive + esi * 4], 0
 mov dword ptr [fireballX + esi * 4], - 100

next_fireball_update:
 inc esi
 jmp update_fireball_loop
fireball_update_done:
 pop esi

 mov eax, marioShooting
 test eax, eax
 jz shoot_anim_done
 dec marioShooting
shoot_anim_done:

 mov eax, mushroomActive
 test eax, eax
 jz mushroom_update_done

 mov eax, mushroomRising
 test eax, eax
 jz mushroom_moving

 sub mushroomY, 2
 mov eax, mushroomY
 cmp eax, mushroomRiseY
 jg mushroom_update_done

 mov mushroomRising, 0
 mov eax, mushroomRiseY
 sub eax, 32
 mov mushroomY, eax
 jmp mushroom_update_done

mushroom_moving:

 mov eax, mushroomVelX
 add mushroomX, eax

 mov eax, mushroomX
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 cmp ecx, 0
 jl mushroom_check_right
 cmp ecx, TILE_COLS
 jge mushroom_check_right

 mov eax, mushroomY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge mushroom_check_y_ok
 mov eax, 0
mushroom_check_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 cmp edx, 0
 jl mushroom_check_right
 cmp edx, TILE_ROWS
 jge mushroom_check_right

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb mushroom_check_right
 cmp al, 31
 jg mushroom_check_right
 cmp al, 7
 je mushroom_check_right
 cmp al, 22
 je mushroom_check_right
 cmp al, 32
 je mushroom_check_right

 mov eax, mushroomVelX
 neg eax
 mov mushroomVelX, eax

 mov eax, ecx
 inc eax
 imul eax, TILE_SIZE
 mov mushroomX, eax
 jmp mushroom_apply_gravity

mushroom_check_right:

 mov eax, mushroomX
 add eax, 32
 dec eax
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 cmp ecx, 0
 jl mushroom_apply_gravity
 cmp ecx, TILE_COLS
 jge mushroom_apply_gravity

 mov eax, mushroomY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge mushroom_check_right_y_ok
 mov eax, 0
mushroom_check_right_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 cmp edx, 0
 jl mushroom_apply_gravity
 cmp edx, TILE_ROWS
 jge mushroom_apply_gravity

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb mushroom_apply_gravity
 cmp al, 31
 jg mushroom_apply_gravity
 cmp al, 7
 je mushroom_apply_gravity
 cmp al, 22
 je mushroom_apply_gravity
 cmp al, 32
 je mushroom_apply_gravity

 mov eax, mushroomVelX
 neg eax
 mov mushroomVelX, eax

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, 32
 mov mushroomX, eax

mushroom_apply_gravity:

 invoke ApplyGravityToAABB, addr mushroomX, addr mushroomY, addr mushroomVelY, 32, 32

 mov eax, mushroomX
 cmp eax, 0
 jge mushroom_x_min_ok
 mov mushroomX, 0
 mov eax, mushroomVelX
 neg eax
 mov mushroomVelX, eax
mushroom_x_min_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, 32
 mov eax, mushroomX
 cmp eax, ebx
 jle mushroom_x_max_ok
 mov mushroomX, ebx
 mov eax, mushroomVelX
 neg eax
 mov mushroomVelX, eax
mushroom_x_max_ok:

mushroom_check_offscreen:

 mov eax, mushroomX
 cmp eax, - 50
 jl deactivate_mushroom
 sub eax, cameraX
 cmp eax, WINDOW_WIDTH + 50
 jl mushroom_update_done
deactivate_mushroom:
 mov mushroomActive, 0
 mov mushroomX, - 100

mushroom_update_done:

 mov eax, flowerActive
 test eax, eax
 jz flower_update_done

 mov eax, animFrame
 shr eax, 3
 and eax, 3
 mov flowerFrame, eax

flower_update_done:

 mov eax, starActive
 test eax, eax
 jz star_update_done

 mov eax, starVelX
 add starX, eax
 invoke ApplyGravityToAABB, addr starX, addr starY, addr starVelY, 32, 32
 cmp eax, 0
 je star_check_offscreen

 mov starVelY, - 10

 mov eax, starX
 cmp eax, 0
 jge star_x_min_ok
 mov starX, 0
star_x_min_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, 32
 cmp eax, ebx
 jle star_x_max_ok
 mov starX, ebx
star_x_max_ok:

star_check_offscreen:

 mov eax, starX
 sub eax, cameraX
 cmp eax, - 50
 jl deactivate_star
 cmp eax, WINDOW_WIDTH + 50
 jl star_animate
deactivate_star:
 mov starActive, 0
 mov starX, - 100
 jmp star_update_done

star_animate:

 mov eax, animFrame
 shr eax, 2
 and eax, 3
 mov starFrame, eax

star_update_done:

 mov eax, goldenMushroomActive
 test eax, eax
 jz gm_update_done

 mov eax, goldenMushroomRising
 test eax, eax
 jz gm_moving

 sub goldenMushroomY, 2
 mov eax, goldenMushroomY
 cmp eax, goldenMushroomRiseY
 jg gm_update_done
 mov goldenMushroomRising, 0
 mov eax, goldenMushroomRiseY
 sub eax, 32
 mov goldenMushroomY, eax
 jmp gm_update_done

gm_moving:

 mov eax, goldenMushroomVelX
 add goldenMushroomX, eax

 mov eax, goldenMushroomX
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 mov eax, goldenMushroomY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge gm_check_y_ok
 mov eax, 0
gm_check_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb gm_check_right
 cmp al, 31
 jg gm_check_right
 cmp al, 7
 je gm_check_right
 cmp al, 22
 je gm_check_right
 cmp al, 32
 je gm_check_right

 mov eax, goldenMushroomVelX
 neg eax
 mov goldenMushroomVelX, eax

 mov eax, ecx
 inc eax
 imul eax, TILE_SIZE
 mov goldenMushroomX, eax
 jmp gm_apply_gravity

gm_check_right:

 mov eax, goldenMushroomX
 add eax, 32
 dec eax
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 mov eax, goldenMushroomY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge gm_check_right_y_ok
 mov eax, 0
gm_check_right_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb gm_apply_gravity
 cmp al, 31
 jg gm_apply_gravity
 cmp al, 7
 je gm_apply_gravity
 cmp al, 22
 je gm_apply_gravity
 cmp al, 32
 je gm_apply_gravity

 mov eax, goldenMushroomVelX
 neg eax
 mov goldenMushroomVelX, eax

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, 32
 mov goldenMushroomX, eax

gm_apply_gravity:

 invoke ApplyGravityToAABB, addr goldenMushroomX, addr goldenMushroomY, addr goldenMushroomVelY, 32, 32

 mov eax, goldenMushroomX
 cmp eax, 0
 jge gm_x_min_ok
 mov goldenMushroomX, 0
gm_x_min_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, 32
 cmp eax, ebx
 jle gm_x_max_ok
 mov goldenMushroomX, ebx
gm_x_max_ok:

gm_check_offscreen:

 mov eax, goldenMushroomX
 cmp eax, - 50
 jl gm_deactivate
 sub eax, cameraX
 cmp eax, WINDOW_WIDTH + 50
 jl gm_check_collect
gm_deactivate:
 mov goldenMushroomActive, 0
 jmp gm_update_done

gm_check_collect:
 mov eax, goldenMushroomRising
 test eax, eax
 jnz gm_update_done

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, goldenMushroomX
 jl gm_update_done
 mov eax, goldenMushroomX
 add eax, 32
 cmp eax, marioX
 jl gm_update_done
 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, goldenMushroomY
 jl gm_update_done
 mov eax, goldenMushroomY
 add eax, 32
 cmp eax, marioY
 jl gm_update_done

 mov goldenMushroomActive, 0
 add score, SCORE_MUSHROOM
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, SCORE_MUSHROOM, eax, ebx
 mov isInvincible, 1
 mov invincibleTimer, 300

gm_update_done:

 mov eax, oneUpActive
 test eax, eax
 jz oneup_update_done

 mov eax, oneUpRising
 test eax, eax
 jz oneup_moving

 sub oneUpY, 2
 mov eax, oneUpY
 cmp eax, oneUpRiseY
 jg oneup_update_done
 mov oneUpRising, 0
 mov eax, oneUpRiseY
 sub eax, 32
 mov oneUpY, eax
 jmp oneup_update_done

oneup_moving:

 mov eax, oneUpVelX
 add oneUpX, eax

 mov eax, oneUpX
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 cmp ecx, 0
 jl oneup_check_right
 cmp ecx, TILE_COLS
 jge oneup_check_right

 mov eax, oneUpY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge oneup_check_y_ok
 mov eax, 0
oneup_check_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 cmp edx, 0
 jl oneup_check_right
 cmp edx, TILE_ROWS
 jge oneup_check_right

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb oneup_check_right
 cmp al, 31
 jg oneup_check_right
 cmp al, 7
 je oneup_check_right
 cmp al, 22
 je oneup_check_right
 cmp al, 32
 je oneup_check_right

 mov eax, oneUpVelX
 neg eax
 mov oneUpVelX, eax

 mov eax, ecx
 inc eax
 imul eax, TILE_SIZE
 mov oneUpX, eax
 jmp oneup_apply_gravity

oneup_check_right:

 mov eax, oneUpX
 add eax, 32
 dec eax
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov ecx, eax

 cmp ecx, 0
 jl oneup_apply_gravity
 cmp ecx, TILE_COLS
 jge oneup_apply_gravity

 mov eax, oneUpY
 mov edx, 32
 add eax, edx
 dec eax
 cmp eax, 0
 jge oneup_check_right_y_ok
 mov eax, 0
oneup_check_right_y_ok:
 xor edx, edx
 mov ebx, TILE_SIZE
 div ebx
 mov edx, eax

 cmp edx, 0
 jl oneup_apply_gravity
 cmp edx, TILE_ROWS
 jge oneup_apply_gravity

 mov eax, edx
 imul eax, TILE_COLS
 add eax, ecx
 lea esi, level1
 movzx eax, byte ptr [esi + eax]

 cmp al, 1
 jb oneup_apply_gravity
 cmp al, 31
 jg oneup_apply_gravity
 cmp al, 7
 je oneup_apply_gravity
 cmp al, 22
 je oneup_apply_gravity
 cmp al, 32
 je oneup_apply_gravity

 mov eax, oneUpVelX
 neg eax
 mov oneUpVelX, eax

 mov eax, ecx
 imul eax, TILE_SIZE
 sub eax, 32
 mov oneUpX, eax

oneup_apply_gravity:

 invoke ApplyGravityToAABB, addr oneUpX, addr oneUpY, addr oneUpVelY, 32, 32

 mov eax, oneUpX
 cmp eax, 0
 jge oneup_x_min_ok
 mov oneUpX, 0
 mov eax, oneUpVelX
 neg eax
 mov oneUpVelX, eax
oneup_x_min_ok:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, 32
 mov eax, oneUpX
 cmp eax, ebx
 jle oneup_x_max_ok
 mov oneUpX, ebx
 mov eax, oneUpVelX
 neg eax
 mov oneUpVelX, eax
oneup_x_max_ok:

oneup_check_offscreen:

 mov eax, oneUpX
 cmp eax, - 50
 jl oneup_deactivate
 sub eax, cameraX
 cmp eax, WINDOW_WIDTH + 50
 jl oneup_check_collect
oneup_deactivate:
 mov oneUpActive, 0
 jmp oneup_update_done

oneup_check_collect:
 mov eax, oneUpRising
 test eax, eax
 jnz oneup_update_done

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, oneUpX
 jl oneup_update_done
 mov eax, oneUpX
 add eax, 32
 cmp eax, marioX
 jl oneup_update_done
 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, oneUpY
 jl oneup_update_done
 mov eax, oneUpY
 add eax, 32
 cmp eax, marioY
 jl oneup_update_done

 mov oneUpActive, 0
 inc lives
 add score, SCORE_1UP
 call PlayOneUpSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, 9999, eax, ebx

oneup_update_done:

 mov eax, mushroomActive
 test eax, eax
 jz check_flower_collect

 mov eax, mushroomRising
 test eax, eax
 jnz check_flower_collect

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, mushroomX
 jl check_flower_collect
 mov eax, mushroomX
 add eax, 32
 cmp eax, marioX
 jl check_flower_collect
 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, mushroomY
 jl check_flower_collect
 mov eax, mushroomY
 add eax, 32
 cmp eax, marioY
 jl check_flower_collect

 mov mushroomActive, 0
 mov mushroomX, - 100
 add score, SCORE_MUSHROOM
 call PlayPowerupCollectSound

 mov eax, marioState
 cmp eax, MARIO_SMALL
 je mushroom_make_big

 inc lives
 add score, SCORE_1UP
 call PlayOneUpSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, 9999, eax, ebx
 jmp check_flower_collect

mushroom_make_big:
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, SCORE_MUSHROOM, eax, ebx
 mov marioTransition, 1
 mov transitionFrame, 0
 mov transitionTimer, 8

check_flower_collect:

 mov eax, flowerActive
 test eax, eax
 jz check_star_collect

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, flowerX
 jl check_star_collect
 mov eax, flowerX
 add eax, 32
 cmp eax, marioX
 jl check_star_collect
 mov eax, marioY
 mov edx, marioHitboxHeight
 add eax, edx
 cmp eax, flowerY
 jl check_star_collect
 mov eax, flowerY
 add eax, 32
 cmp eax, marioY
 jl check_star_collect

 mov flowerActive, 0
 mov flowerX, - 100
 add score, SCORE_FLOWER
 call PlayPowerupCollectSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, SCORE_FLOWER, eax, ebx

 mov eax, marioState
 cmp eax, MARIO_SUPER
 jne check_star_collect
 mov marioState, MARIO_FIRE
 mov marioHitboxHeight, TILE_SIZE * 2

check_star_collect:

 mov eax, starActive
 test eax, eax
 jz powerup_collect_done

 mov eax, marioX
 add eax, HITBOX_WIDTH
 cmp eax, starX
 jl powerup_collect_done
 mov eax, starX
 add eax, 32
 cmp eax, marioX
 jl powerup_collect_done
 mov eax, marioY
 add eax, marioHitboxHeight
 cmp eax, starY
 jl powerup_collect_done
 mov eax, starY
 add eax, 32
 cmp eax, marioY
 jl powerup_collect_done

 mov starActive, 0
 mov starX, - 100
 add score, SCORE_STAR
 call PlayPowerupCollectSound
 mov eax, marioX
 mov ebx, marioY
 invoke SpawnFloatingScore, SCORE_STAR, eax, ebx
 mov starPowerActive, 1
 mov starPowerTimer, 600
 mov starColorFrame, 0

powerup_collect_done:

 mov eax, endBlockHit
 test eax, eax
 jnz timer_rapid_countdown_check

 mov eax, timerCountdownActive
 test eax, eax
 jnz timer_rapid_countdown

 mov eax, animFrame
 and eax, 63
 jnz timer_skip
 mov eax, timer
 test eax, eax
 jz timer_death
 dec timer
 jmp timer_skip

timer_rapid_countdown_check:
 mov eax, timerCountdownActive
 test eax, eax
 jnz timer_rapid_countdown
 jmp timer_skip

timer_rapid_countdown:
 mov eax, fireworkBonusPhase
 test eax, eax
 jnz timer_skip

 mov eax, timer
 test eax, eax
 jz timer_countdown_done
 cmp eax, 4
 jl timer_final_countdown
 sub timer, 4
 mov eax, SCORE_TIME_BONUS
 imul eax, 4
 add score, eax
 jmp timer_skip

timer_final_countdown:
 dec timer
 add score, SCORE_TIME_BONUS
 jmp timer_skip

timer_countdown_done:
 mov timerCountdownActive, 0
 mov fireworkBonusPhase, 1
 jmp timer_skip

timer_death:

 dec lives
 cmp lives, 0
 jle timer_game_over

 mov timer, 400
 call StartMarioDeath
 jmp update_done
timer_game_over:
 call PlayGameOverSound
 mov gameState, STATE_GAME_OVER
 mov gameOverTimer, 180
 jmp update_done
timer_skip:

 xor ecx, ecx
midas_delay_dec_loop:
 cmp ecx, 8
 jge midas_delay_dec_done
 mov eax, [midasCoinDelayTimer + ecx * 4]
 cmp eax, 0
 jle midas_delay_dec_next
 dec dword ptr [midasCoinDelayTimer + ecx * 4]
midas_delay_dec_next:
 inc ecx
 jmp midas_delay_dec_loop
midas_delay_dec_done:

 call UpdateMario
 call CheckCoinCollisions
 call CheckMidasCollisions
 call CheckSimplePipeWarp
 call UpdateGoombas
 call CheckGoombaCollisions
 call UpdateEnemies
 call CheckEnemyCollisions

 mov ecx, 0
check_bowser_dead_loop:
 cmp ecx, MAX_ENEMIES
 jge check_bowser_dead_done
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_BOWSER
 jne next_bowser_check
 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_DEAD
 je bowser_is_dead
next_bowser_check:
 inc ecx
 jmp check_bowser_dead_loop
bowser_is_dead:
 mov gameState, STATE_GAME_COMPLETE
 mov gameCompleteTimer, 300
 jmp update_done
check_bowser_dead_done:

 call UpdateFloatingScores
 call UpdatePlatforms
 call CheckPlatformCollision
 call UpdateFirebars
 call CheckFirebarCollision
 call UpdateCastleFlag
 call UpdateExplosions
 call UpdateFireworks

 mov eax, endBlockHit
 test eax, eax
 jz update_done

 mov eax, fireworkBonusPhase
 cmp eax, 2
 jne check_no_fireworks

 mov eax, endBlockTimer
 test eax, eax
 jz end_transition_now
 dec endBlockTimer
 jmp update_done

check_no_fireworks:
 mov eax, fireworkBonusPhase
 cmp eax, 1
 jne update_done

 mov eax, fireworkCount
 test eax, eax
 jnz update_done

 mov fireworkBonusPhase, 2
 mov endBlockTimer, 30
 jmp update_done

end_transition_now:
 mov endBlockHit, 0
 mov castleFlagShow, 0
 mov timerCountdownActive, 0
 mov endBlockTimer, 0
 mov fireworksTriggered, 0
 mov fireworksBonusActive, 0
 mov fireworksAllDone, 0
 mov fireworkBonusPhase, 0
 mov fireworkBonusIndex, 0
 mov fireworkCount, 0
 mov recordedBonusTime, 0
 mov timer, 400

 inc currentStage
 cmp currentStage, 4
 jle end_next_stage

 mov gameState, STATE_GAME_COMPLETE
 mov gameCompleteTimer, 300
 jmp update_done
end_next_stage:

 mov eax, currentStage
 mov currentLevel, eax

 call UpdateWorldNumber

 mov gameState, STATE_LEVEL_TITLE
 mov levelTitleTimer, 180
 call LoadLevelFromFile
 call UpdateWorldNumber
 call InitLevel

update_done:
 ret

update_game_done_label:
 ret

UpdateGame endp

UpdateCastleFlag proc uses eax ebx

 mov eax, castleFlagShow
 test eax, eax
 jz update_castle_flag_done

 mov eax, castleFlagY
 mov ebx, castleFlagTargetY
 cmp eax, ebx
 jle update_castle_flag_done

 sub eax, castleFlagRaiseSpeed
 cmp eax, ebx
 jge flag_not_at_target
 mov eax, ebx
flag_not_at_target:
 mov castleFlagY, eax

update_castle_flag_done:
 ret
UpdateCastleFlag endp

DrawCastleFlag proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD

 mov eax, castleFlagShow
 test eax, eax
 jz draw_castle_flag_done

 mov eax, flagpoleX
 add eax, 200
 sub eax, cameraX
 mov screenX, eax

 mov eax, GROUND_Y
 sub eax, 160
 sub eax, cameraY
 mov screenY, eax

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_castle_flag_done

 mov eax, OBJ_CASTLE_FLAG
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcObjects, eax, OBJ_ENDLEVEL_Y, 32, 32, 00FF00FFh

draw_castle_flag_done:
 ret

DrawCastleFlag endp

UpdateExplosions proc uses eax ebx ecx edx esi edi
 mov ecx, 0
explosion_update_loop:
 cmp ecx, MAX_EXPLOSIONS
 jge explosion_update_done

 mov eax, [explosionFrame + ecx * 4]
 cmp eax, - 1
 je next_explosion

 inc dword ptr [explosionTimer + ecx * 4]
 mov eax, [explosionTimer + ecx * 4]

 cmp eax, 5
 jl next_explosion
 cmp eax, 10
 jl explosion_frame_1
 cmp eax, 15
 jl explosion_frame_2

 mov dword ptr [explosionFrame + ecx * 4], - 1
 jmp next_explosion

explosion_frame_1:
 mov dword ptr [explosionFrame + ecx * 4], 0
 jmp next_explosion

explosion_frame_2:
 mov dword ptr [explosionFrame + ecx * 4], 1
 jmp next_explosion

next_explosion:
 inc ecx
 jmp explosion_update_loop

explosion_update_done:
 ret
UpdateExplosions endp

DrawExplosions proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD

 mov ecx, 0
 mov eax, 0
check_explosions_active:
 cmp ecx, MAX_EXPLOSIONS
 jge explosions_check_done
 cmp dword ptr [explosionFrame + ecx * 4], - 1
 je next_explosion_check
 inc eax
next_explosion_check:
 inc ecx
 jmp check_explosions_active
explosions_check_done:
 test eax, eax
 jz draw_explosions_done

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_explosions_done

 mov ecx, 0
draw_explosion_loop:
 cmp ecx, MAX_EXPLOSIONS
 jge draw_explosions_done

 mov eax, [explosionFrame + ecx * 4]
 cmp eax, - 1
 je next_explosion_draw

 mov eax, [explosionX + ecx * 4]
 sub eax, cameraX
 mov screenX, eax
 mov eax, [explosionY + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 mov eax, [explosionFrame + ecx * 4]
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
 hdcObjects, eax, OBJ_EXPLOSION_Y, 32, 32, 00FF00FFh

next_explosion_draw:
 inc ecx
 jmp draw_explosion_loop

draw_explosions_done:
 ret
DrawExplosions endp

SpawnFireworks proc uses eax ebx ecx edx esi edi
 local fireworkIdx:DWORD
 local tileRow:DWORD
 local tileCol:DWORD
 local idx:DWORD

 mov eax, fireworksTriggered
 test eax, eax
 jnz spawn_fireworks_done
 mov fireworksTriggered, 1

 xor ecx, ecx
clear_loop:
 cmp ecx, MAX_FIREWORKS
 jge clear_done
 lea esi, fireworkFrame
 mov dword ptr [esi + ecx * 4], -1
 lea esi, fireworkX
 mov dword ptr [esi + ecx * 4], 0
 lea esi, fireworkY
 mov dword ptr [esi + ecx * 4], 0
 lea esi, fireworkTimer
 mov dword ptr [esi + ecx * 4], 0
 lea esi, fireworkDelay
 mov dword ptr [esi + ecx * 4], 0
 inc ecx
 jmp clear_loop
clear_done:

 mov fireworkIdx, 0
 mov tileRow, 0

row_loop:
 mov eax, TILE_ROWS
 cmp tileRow, eax
 jge spawn_fireworks_store_count
 mov tileCol, 0

col_loop:
 mov eax, TILE_COLS
 cmp tileCol, eax
 jge row_next

 mov eax, tileRow
 imul eax, TILE_COLS
 add eax, tileCol
 lea esi, level1
 movzx edx, byte ptr [esi + eax]

 cmp dl, TILE_FIREBLOCK
 jne col_next

 mov eax, fireworkIdx
 cmp eax, MAX_FIREWORKS
 jge col_next

 mov idx, eax

 lea esi, fireworkX
 mov ebx, tileCol
 imul ebx, TILE_SIZE
 mov eax, idx
 mov [esi + eax * 4], ebx

 lea esi, fireworkY
 mov ebx, tileRow
 imul ebx, TILE_SIZE
 mov eax, idx
 mov [esi + eax * 4], ebx

 lea esi, fireworkFrame
 mov eax, idx
 mov dword ptr [esi + eax * 4], -2

 mov ebx, idx
 imul ebx, 30
 lea esi, fireworkDelay
 mov eax, idx
 mov [esi + eax * 4], ebx

 lea esi, fireworkTimer
 mov eax, idx
 mov dword ptr [esi + eax * 4], 0

 inc fireworkIdx

col_next:
 inc tileCol
 jmp col_loop

row_next:
 inc tileRow
 jmp row_loop

spawn_fireworks_store_count:
 mov eax, fireworkIdx
 mov fireworkCount, eax

spawn_fireworks_done:
 ret
SpawnFireworks endp

UpdateFireworks proc uses eax ebx ecx edx esi edi
 local allDone:DWORD
 local activeCount:DWORD

 mov eax, fireworksTriggered
 test eax, eax
 jz update_fireworks_done

 mov eax, fireworkBonusPhase
 cmp eax, 1
 jne update_fireworks_done

 mov allDone, 1
 mov activeCount, 0

 xor ecx, ecx
firework_update_loop:
 cmp ecx, MAX_FIREWORKS
 jge check_all_fireworks_done
 cmp ecx, 0
 jl check_all_fireworks_done

 lea esi, fireworkFrame
 mov eax, [esi + ecx * 4]
 cmp eax, -1
 je next_firework_update

 mov allDone, 0
 inc activeCount

 cmp eax, -2
 jne firework_animating

 lea esi, fireworkDelay
 mov eax, [esi + ecx * 4]
 test eax, eax
 jz start_firework
 dec dword ptr [esi + ecx * 4]
 jmp next_firework_update

start_firework:
 lea esi, fireworkFrame
 mov dword ptr [esi + ecx * 4], 0
 lea esi, fireworkTimer
 mov dword ptr [esi + ecx * 4], 0

 push ecx
 call PlayFireworksSound
 pop ecx

 mov eax, fireworksBonusActive
 test eax, eax
 jz next_firework_update

 add score, 500
 push ecx
 lea esi, fireworkX
 mov ebx, [esi + ecx * 4]
 lea esi, fireworkY
 mov edx, [esi + ecx * 4]
 sub edx, 40
 invoke SpawnFloatingScore, 500, ebx, edx
 pop ecx
 jmp next_firework_update

firework_animating:
 lea esi, fireworkTimer
 inc dword ptr [esi + ecx * 4]
 mov eax, [esi + ecx * 4]

 cmp eax, 10
 jl next_firework_update
 cmp eax, 20
 jl firework_frame_1
 cmp eax, 30
 jl firework_frame_2

 lea esi, fireworkFrame
 mov dword ptr [esi + ecx * 4], -1
 jmp next_firework_update

firework_frame_1:
 lea esi, fireworkFrame
 mov dword ptr [esi + ecx * 4], 1
 jmp next_firework_update

firework_frame_2:
 lea esi, fireworkFrame
 mov dword ptr [esi + ecx * 4], 2
 jmp next_firework_update

next_firework_update:
 inc ecx
 jmp firework_update_loop

check_all_fireworks_done:
 mov eax, allDone
 test eax, eax
 jz update_fireworks_done

 mov fireworksAllDone, 1
 mov fireworkBonusPhase, 2
 mov endBlockTimer, 30

update_fireworks_done:
 ret
UpdateFireworks endp

DrawFireworks proc uses eax ebx ecx edx esi edi
 local screenX:DWORD
 local screenY:DWORD

 mov eax, fireworksTriggered
 test eax, eax
 jz draw_fireworks_done

 mov eax, fireworkBonusPhase
 cmp eax, 1
 jne draw_fireworks_done

 mov eax, hObjectsSheet
 test eax, eax
 jz draw_fireworks_done

 xor ecx, ecx
draw_firework_loop:
 cmp ecx, MAX_FIREWORKS
 jge draw_fireworks_done

 lea esi, fireworkFrame
 mov eax, [esi + ecx * 4]
 cmp eax, -1
 je next_firework_draw
 cmp eax, -2
 je next_firework_draw
 cmp eax, 0
 jl next_firework_draw

 lea esi, fireworkX
 mov eax, [esi + ecx * 4]
 sub eax, cameraX
 mov screenX, eax
 lea esi, fireworkY
 mov eax, [esi + ecx * 4]
 sub eax, cameraY
 mov screenY, eax

 cmp screenX, -50
 jl next_firework_draw
 cmp screenX, WINDOW_WIDTH + 50
 jg next_firework_draw
 cmp screenY, -50
 jl next_firework_draw
 cmp screenY, WINDOW_HEIGHT + 50
 jg next_firework_draw

 lea esi, fireworkFrame
 mov eax, [esi + ecx * 4]
 mov ebx, 36
 imul eax, ebx

 invoke TransparentBlt, hdcMem, screenX, screenY, 32, 32, \
  hdcObjects, eax, OBJ_EXPLOSION_Y, 32, 32, 00FF00FFh

next_firework_draw:
 inc ecx
 jmp draw_firework_loop

draw_fireworks_done:
 ret
DrawFireworks endp

CheckMidasCollisions proc uses ebx ecx edx esi edi
 local tileX:DWORD
 local tileY:DWORD
 local marioLeft:DWORD
 local marioRight:DWORD
 local marioTop:DWORD
 local marioBottom:DWORD

 mov eax, midasActive
 test eax, eax
 jz midas_col_done

 mov eax, marioX
 mov marioLeft, eax
 add eax, HITBOX_WIDTH
 mov marioRight, eax

 mov eax, marioY
 mov marioTop, eax
 add eax, marioHitboxHeight
 mov marioBottom, eax

 mov eax, marioX
 add eax, HITBOX_WIDTH / 2
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov tileX, eax

 mov eax, marioY
 mov edx, marioHitboxHeight
 shr edx, 1
 add eax, edx
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov tileY, eax

 mov eax, tileX
 dec eax
 js skip_left_midas
 mov ebx, tileY
 imul ebx, TILE_COLS
 add ebx, eax
 lea esi, level1
 add esi, ebx
 movzx eax, byte ptr [esi]

 cmp al, TILE_BRICK
 je convert_left_midas
 cmp al, TILE_STAIR
 jne skip_left_midas
convert_left_midas:
 mov byte ptr [esi], TILE_COIN
 add score, 100
 push eax
 push ebx
 mov eax, tileX
 dec eax
 imul eax, TILE_SIZE
 mov ebx, tileY
 imul ebx, TILE_SIZE
 invoke SpawnFloatingScore, 100, eax, ebx
 pop ebx
 pop eax
skip_left_midas:

 mov eax, tileX
 inc eax
 cmp eax, TILE_COLS
 jge skip_right_midas
 mov ebx, tileY
 imul ebx, TILE_COLS
 add ebx, eax
 lea esi, level1
 add esi, ebx
 movzx eax, byte ptr [esi]
 cmp al, TILE_BRICK
 je convert_right_midas
 cmp al, TILE_STAIR
 jne skip_right_midas
convert_right_midas:
 mov byte ptr [esi], TILE_COIN
 add score, 100
 push eax
 push ebx
 mov eax, tileX
 inc eax
 imul eax, TILE_SIZE
 mov ebx, tileY
 imul ebx, TILE_SIZE
 invoke SpawnFloatingScore, 100, eax, ebx
 pop ebx
 pop eax
skip_right_midas:

 mov eax, tileY
 dec eax
 js skip_up_midas
 imul eax, TILE_COLS
 add eax, tileX
 lea esi, level1
 add esi, eax
 movzx eax, byte ptr [esi]
 cmp al, TILE_BRICK
 je convert_up_midas
 cmp al, TILE_STAIR
 jne skip_up_midas
convert_up_midas:
 mov byte ptr [esi], TILE_COIN
 add score, 100
 push eax
 push ebx
 mov eax, tileX
 imul eax, TILE_SIZE
 mov ebx, tileY
 dec ebx
 imul ebx, TILE_SIZE
 invoke SpawnFloatingScore, 100, eax, ebx
 pop ebx
 pop eax
skip_up_midas:

 mov eax, tileY
 inc eax
 cmp eax, TILE_ROWS
 jge midas_check_enemies
 imul eax, TILE_COLS
 add eax, tileX
 lea esi, level1
 add esi, eax
 movzx ecx, byte ptr [esi]
 cmp cl, TILE_BRICK
 je convert_down_midas
 cmp cl, TILE_STAIR
 jne midas_check_enemies
convert_down_midas:
 mov byte ptr [esi], TILE_COIN
 add score, 100
 push eax
 push ebx
 mov eax, tileX
 imul eax, TILE_SIZE
 mov ebx, tileY
 inc ebx
 imul ebx, TILE_SIZE
 invoke SpawnFloatingScore, 100, eax, ebx
 pop ebx
 pop eax

midas_check_enemies:
 xor ecx, ecx
midas_enemy_loop:
 cmp ecx, MAX_ENEMIES
 jge midas_col_done

 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_NONE
 je midas_next_enemy

 mov eax, [enemyState + ecx * 4]
 cmp eax, ESTATE_ACTIVE
 jne midas_next_enemy

 mov eax, [enemyX + ecx * 4]
 add eax, 32
 cmp eax, marioLeft
 jl midas_next_enemy

 mov eax, [enemyX + ecx * 4]
 cmp eax, marioRight
 jg midas_next_enemy

 mov eax, [enemyY + ecx * 4]
 add eax, 32
 cmp eax, marioTop
 jl midas_next_enemy

 mov eax, [enemyY + ecx * 4]
 cmp eax, marioBottom
 jg midas_next_enemy

 ; Special-case Bowser so normal boss-death logic can see him as DEAD
 mov eax, [enemyType + ecx * 4]
 cmp eax, ENEMY_BOWSER
 je midas_kill_bowser

 ; Normal enemies: fully remove them and convert their tile
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 mov dword ptr [enemyType + ecx * 4], ENEMY_NONE
 jmp midas_kill_common

midas_kill_bowser:
 mov dword ptr [enemyState + ecx * 4], ESTATE_DEAD
 ; Leave enemyType as ENEMY_BOWSER so UpdateGame's bowser check triggers game complete

midas_kill_common:

 mov eax, [enemyX + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 mov esi, eax

 mov eax, [enemyY + ecx * 4]
 mov ebx, TILE_SIZE
 xor edx, edx
 div ebx
 push eax

 imul eax, TILE_COLS
 add eax, esi
 lea edi, level1
 add edi, eax
 mov byte ptr [edi], TILE_COIN

 add score, 200
 pop ebx
 push ecx
 xor edx, edx
midas_delay_slot_loop:
 cmp edx, 8
 jge midas_delay_slot_done
 mov eax, [midasCoinDelayTimer + edx * 4]
 cmp eax, 0
 jle midas_delay_found_slot
 inc edx
 jmp midas_delay_slot_loop
midas_delay_found_slot:
 mov [midasCoinDelayCol + edx * 4], esi
 mov [midasCoinDelayRow + edx * 4], ebx
 mov eax, MIDAS_COIN_DELAY_FRAMES
 mov [midasCoinDelayTimer + edx * 4], eax
midas_delay_slot_done:
 pop ecx

midas_next_enemy:
 inc ecx
 jmp midas_enemy_loop

midas_col_done:
 ret

CheckMidasCollisions endp

RenderFrame proc uses ebx ecx edx esi edi

 mov eax, isUnderground
 test eax, eax

 jnz render_underground_bg
 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorSky
 jmp render_bg_done
render_underground_bg:
 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, colorUnderSky
render_bg_done:

 mov eax, gameState

 cmp eax, STATE_TITLE
 jne check_menu
 call DrawTitleScreen
 jmp render_done

check_menu:
 cmp eax, STATE_MENU
 jne check_level_select
 call DrawMenuScreen
 jmp render_done
check_level_select:
 cmp eax, STATE_LEVEL_SELECT
 jne check_instructions
 call DrawLevelSelectScreen
 jmp render_done
check_instructions:
 cmp eax, STATE_INSTRUCTIONS
 jne check_gameplay
 call DrawInstructionsScreen
 jmp render_done

check_gameplay:
 cmp eax, STATE_GAMEPLAY
 jne check_pause
 call DrawLevel
 jmp render_done

check_pause:
 cmp eax, STATE_PAUSE
 jne check_name_entry

 call DrawLevel

 call DrawPauseScreen
 jmp render_done

check_name_entry:
 cmp eax, STATE_NAME_ENTRY
 jne check_game_over
 call DrawNameEntryScreen
 jmp render_done

check_game_over:
 cmp eax, STATE_GAME_OVER
 jne check_level_title
 call DrawGameOverScreen
 jmp render_done

check_level_title:
 cmp eax, STATE_LEVEL_TITLE
 jne check_game_complete
 call DrawLevelTitleScreen
 jmp render_done

check_game_complete:
 cmp eax, STATE_GAME_COMPLETE
 jne check_high_scores_screen
 call DrawGameCompleteScreen
 jmp render_done

check_high_scores_screen:
 cmp eax, STATE_HIGH_SCORES
 jne check_flagpole
 call DrawHighScoresScreen
 jmp render_done

check_flagpole:
 cmp eax, STATE_FLAGPOLE
 jne render_done

 call DrawLevel
 call UpdateFlagpoleSequence
 jmp render_done

render_done:

 mov eax, fadeAlpha
 test eax, eax
 jz no_fade_draw

 mov eax, fadeAlpha
 mov ecx, WINDOW_HEIGHT
 imul eax, ecx
 shr eax, 9
 mov ecx, eax

 invoke DrawRectangle, 0, 0, WINDOW_WIDTH, ecx, colorBlack

 mov eax, WINDOW_HEIGHT
 sub eax, ecx
 invoke DrawRectangle, 0, eax, WINDOW_WIDTH, ecx, colorBlack

 mov eax, fadeAlpha
 mov ecx, WINDOW_WIDTH
 imul eax, ecx
 shr eax, 9
 mov ecx, eax
 invoke DrawRectangle, 0, 0, ecx, WINDOW_HEIGHT, colorBlack

 mov eax, WINDOW_WIDTH
 sub eax, ecx
 invoke DrawRectangle, eax, 0, ecx, WINDOW_HEIGHT, colorBlack

no_fade_draw:

 invoke GetDC, hWnd
 mov hdc, eax

 invoke BitBlt, hdc, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, hdcMem, 0, 0, SRCCOPY
 invoke ReleaseDC, hWnd, hdc

 ret

RenderFrame endp

InitGame proc
 mov gameState, STATE_TITLE
 mov score, 0
 mov coins, 0
 mov timer, 400
 mov lives, 5
 mov playerHasSave, 0
 mov currentSaveSlot, - 1
 mov resumeFromSave, 0
 mov menuSelection, 0

 call PlayMenuMusic

 call LoadLevelFromFile

 call InitLevel

 mov marioVelY, 0
 mov marioOnGround, 1
 mov cameraX, 0
 mov isUnderground, 0

 mov numCoins, 0
 mov ecx, numCoins
 lea esi, coinData
reset_coins:
 test ecx, ecx
 jz reset_done
 mov dword ptr [esi + 8], 0
 add esi, 12
 dec ecx
 jmp reset_coins

reset_done:
 ret
InitGame endp

WndProc proc hWin:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD

 cmp uMsg, WM_CREATE
 jne check_keydown

 invoke GetDC, hWin
 mov hdc, eax
 invoke CreateCompatibleDC, hdc
 mov hdcMem, eax

 invoke CreateCompatibleBitmap, hdc, WINDOW_WIDTH, WINDOW_HEIGHT
 mov hBitmap, eax
 invoke SelectObject, hdcMem, hBitmap
 mov hOldBitmap, eax

 invoke CreateCompatibleDC, hdc
 mov hdcTiles, eax

 invoke LoadImageA, NULL, addr tileSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hTileSheet, eax
 test eax, eax
 jz skip_tiles_select
 invoke SelectObject, hdcTiles, hTileSheet
skip_tiles_select:

 invoke CreateCompatibleDC, hdc
 mov hdcMario, eax
 invoke LoadImageA, NULL, addr marioSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hMarioSheet, eax
 test eax, eax

 jz skip_mario_select
 invoke SelectObject, hdcMario, hMarioSheet
skip_mario_select:

 invoke CreateCompatibleDC, hdc
 mov hdcMask, eax

 invoke LoadImageA, NULL, addr maskSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hMaskSheet, eax
 test eax, eax
 jz skip_mask_select
 invoke SelectObject, hdcMask, hMaskSheet
skip_mask_select:

 invoke CreateCompatibleDC, hdc
 mov hdcObjects, eax
 invoke LoadImageA, NULL, addr objectsSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hObjectsSheet, eax
 test eax, eax
 jnz select_objects

 invoke LoadImageA, NULL, addr objectsSheetPathAlt, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hObjectsSheet, eax
 test eax, eax
 jz skip_objects_select
select_objects:
 invoke SelectObject, hdcObjects, hObjectsSheet
skip_objects_select:

 invoke CreateCompatibleDC, hdc
 mov hdcFont, eax
 invoke LoadImageA, NULL, addr fontSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hFontSheet, eax
 test eax, eax
 jz skip_font_select
 invoke SelectObject, hdcFont, hFontSheet
skip_font_select:

 invoke CreateCompatibleDC, hdc
 mov hdcEnemies, eax
 invoke LoadImageA, NULL, addr enemiesSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hEnemiesSheet, eax
 test eax, eax
 jz skip_enemies_select
 invoke SelectObject, hdcEnemies, hEnemiesSheet
skip_enemies_select:

 invoke CreateCompatibleDC, hdc
 mov hdcUI, eax
 invoke LoadImageA, NULL, addr uiSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hUISheet, eax
 test eax, eax
 jz skip_ui_select
 invoke SelectObject, hdcUI, hUISheet
skip_ui_select:

 invoke CreateCompatibleDC, hdc
 mov hdcBackground, eax
 invoke LoadImageA, NULL, addr backgroundSheetPath, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE
 mov hBackgroundSheet, eax
 test eax, eax
 jz skip_structures_select
 invoke SelectObject, hdcBackground, hBackgroundSheet
skip_structures_select:

 invoke CreateCompatibleDC, hdc
 mov hdcLevelBackground, eax
 mov hLevelBackgroundBitmap, 0
skip_level_bg_select:

 invoke ReleaseDC, hWin, hdc

 invoke SetTimer, hWin, 1, 16, NULL

 call LoadSaveDataFromFile
 call UpdateHighScores

 call PreloadSounds

 call InitGame

 xor eax, eax
 ret

check_keydown:
 cmp uMsg, WM_KEYDOWN
 jne check_keyup

 mov eax, wParam

 cmp eax, VK_LEFT
 jne check_vk_a
 mov keyLeft, 1
 jmp key_handled

check_vk_a:
 cmp eax, 41h
 jne check_vk_right
 mov keyLeft, 1
 jmp key_handled

check_vk_right:
 cmp eax, VK_RIGHT
 jne check_vk_d
 mov keyRight, 1
 jmp key_handled

check_vk_d:
 cmp eax, 44h
 jne check_vk_space
 mov keyRight, 1
 jmp key_handled

check_vk_space:
 cmp eax, VK_SPACE
 jne check_vk_down
 mov keySpace, 1
 jmp key_handled

check_vk_down:
 cmp eax, VK_DOWN
 jne check_vk_s

 push eax
 mov eax, gameState
 cmp eax, STATE_MENU
 je handle_down_menu_here
 cmp eax, STATE_LEVEL_SELECT
 je handle_down_level_select
 cmp eax, STATE_PAUSE
 je handle_down_pause_here
 pop eax

 mov keyDown, 1
 jmp key_handled

check_vk_s:
 cmp eax, 53h
 jne check_vk_p

 push eax
 mov eax, gameState
 cmp eax, STATE_MENU
 je handle_down_menu_here
 cmp eax, STATE_LEVEL_SELECT
 je handle_down_level_select
 cmp eax, STATE_PAUSE
 je handle_down_pause_here
 pop eax

 mov keyDown, 1
 jmp key_handled

handle_down_menu_here:
 pop eax

 mov eax, menuSelection
 cmp playerHasSave, 0
 jne menu_down_existing

 cmp eax, 2
 jge menu_down_wrap_top
 inc menuSelection
 jmp key_handled
menu_down_existing:

 cmp eax, 2
 jge menu_down_wrap_top
 inc menuSelection
 jmp key_handled
menu_down_wrap_top:
 mov menuSelection, 0
 jmp key_handled

handle_down_level_select:
 pop eax
 mov eax, levelSelectSelection
 cmp eax, 3
 jge level_select_wrap_top_handle
 inc levelSelectSelection
 jmp key_handled
level_select_wrap_top_handle:
 mov levelSelectSelection, 0
 jmp key_handled

handle_down_pause_here:
 pop eax

 mov eax, pauseSelection
 cmp eax, 1
 jge down_pause_wrap
 inc pauseSelection
 jmp key_handled
down_pause_wrap:
 mov pauseSelection, 0
 jmp key_handled

check_vk_p:
 cmp eax, 50h
 jne check_vk_m
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne check_pause_to_game

 mov pauseSelection, 0
 mov gameState, STATE_PAUSE
 call PlayPauseSound
 jmp key_handled
check_pause_to_game:
 cmp eax, STATE_PAUSE
 jne key_handled

 mov gameState, STATE_GAMEPLAY
 jmp key_handled

check_vk_m:
 cmp eax, 4Dh
 jne check_vk_z
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne key_handled

 mov keyM, 1
 jmp key_handled

check_vk_shift:
 cmp eax, VK_SHIFT
 jne check_vk_z
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne key_handled

 mov keyRun, 1
 jmp key_handled

check_vk_z:
 cmp eax, 5Ah
 jne check_vk_k
 mov keyFire, 1
 jmp key_handled

check_vk_k:
 cmp eax, 4Bh
 jne check_vk_t
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne key_handled

 mov keyK, 1
 jmp key_handled

check_vk_t:
 cmp eax, 54h
 jne check_vk_esc
 mov eax, gameState
 cmp eax, STATE_MENU
 je check_test_name_t
 cmp eax, STATE_GAMEPLAY
 jne key_handled
check_test_name_t:
 lea esi, playerName
 cmp byte ptr [esi], 'T'
 jne key_handled
 cmp byte ptr [esi + 1], 'E'
 jne key_handled
 cmp byte ptr [esi + 2], 'S'
 jne key_handled
 cmp byte ptr [esi + 3], 'T'
 jne key_handled
 cmp byte ptr [esi + 4], 0
 jne key_handled
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne level_select_from_menu
 mov levelSelectFromGameplay, 1
 jmp level_select_open
level_select_from_menu:
 mov levelSelectFromGameplay, 0
level_select_open:
 mov gameState, STATE_LEVEL_SELECT
 mov levelSelectSelection, 0
 jmp key_handled

check_vk_esc:
 cmp eax, VK_ESCAPE
 jne check_vk_up
 mov eax, gameState
 cmp eax, STATE_GAMEPLAY
 jne check_esc_pause

 cmp marioDeathActive, 1
 je key_handled

 mov pauseSelection, 0
 mov gameState, STATE_PAUSE
 jmp key_handled
check_esc_pause:
 cmp eax, STATE_PAUSE
 je esc_close_pause
 cmp eax, STATE_HIGH_SCORES
 je esc_highscores_back
 cmp eax, STATE_LEVEL_SELECT
 je esc_level_select_back

 jmp check_vk_up

esc_highscores_back:
 mov gameState, STATE_MENU
 call PlayMenuMusic
 call CheckUserDataExists
 mov playerHasSave, eax
 jmp key_handled

esc_level_select_back:
 mov eax, levelSelectFromGameplay
 test eax, eax
 jz esc_level_select_to_menu
 mov gameState, STATE_GAMEPLAY
 jmp key_handled
esc_level_select_to_menu:
 mov gameState, STATE_MENU
 call PlayMenuMusic
 jmp key_handled

esc_close_pause:

 mov gameState, STATE_GAMEPLAY
 jmp key_handled

check_vk_up:
 cmp eax, VK_UP
 jne check_vk_w
 mov eax, gameState
 cmp eax, STATE_MENU
 jne check_up_level_select
 mov eax, menuSelection
 test eax, eax
 jz wrap_to_bottom
 dec menuSelection
 jmp key_handled
wrap_to_bottom:
 mov menuSelection, 2
 jmp key_handled
check_up_level_select:
 cmp eax, STATE_LEVEL_SELECT
 jne check_up_pause
 mov eax, levelSelectSelection
 test eax, eax
 jz level_select_wrap_bottom
 dec levelSelectSelection
 jmp key_handled
level_select_wrap_bottom:
 mov levelSelectSelection, 3
 jmp key_handled
check_up_pause:
 cmp eax, STATE_PAUSE
 jne key_handled
 mov eax, pauseSelection
 test eax, eax
 jz pause_wrap_bottom
 dec pauseSelection
 jmp key_handled
pause_wrap_bottom:
 mov pauseSelection, 1
 jmp key_handled

check_vk_w:
 cmp eax, 57h
 jne check_vk_down_menu
 mov eax, gameState
 cmp eax, STATE_MENU
 jne check_up_level_select_w
 mov eax, menuSelection
 test eax, eax
 jz wrap_to_bottom_w
 dec menuSelection
 jmp key_handled
wrap_to_bottom_w:
 mov menuSelection, 2
 jmp key_handled
check_up_level_select_w:
 cmp eax, STATE_LEVEL_SELECT
 jne check_up_pause_w
 mov eax, levelSelectSelection
 test eax, eax
 jz level_select_wrap_bottom_w
 dec levelSelectSelection
 jmp key_handled
level_select_wrap_bottom_w:
 mov levelSelectSelection, 3
 jmp key_handled
check_up_pause_w:
 cmp eax, STATE_PAUSE
 jne key_handled
 mov eax, pauseSelection
 test eax, eax
 jz pause_wrap_bottom_w
 dec pauseSelection
 jmp key_handled
pause_wrap_bottom_w:
 mov pauseSelection, 1
 jmp key_handled

check_vk_down_menu:
 cmp eax, VK_DOWN
 jne check_vk_return
 mov eax, gameState
 cmp eax, STATE_MENU
 jne check_down_level_select
 mov eax, menuSelection
 cmp playerHasSave, 0
 jne menu_wrap_existing
 cmp eax, 2
 jge wrap_to_top
 inc menuSelection
 jmp key_handled
menu_wrap_existing:
 cmp eax, 2
 jge wrap_to_top
 inc menuSelection
 jmp key_handled
wrap_to_top:
 mov menuSelection, 0
 jmp key_handled
check_down_level_select:
 cmp eax, STATE_LEVEL_SELECT
 jne check_down_pause
 mov eax, levelSelectSelection
 cmp eax, 3
 jge level_select_wrap_top
 inc levelSelectSelection
 jmp key_handled
level_select_wrap_top:
 mov levelSelectSelection, 0
 jmp key_handled
check_down_pause:
 cmp eax, STATE_PAUSE
 jne key_handled

 mov eax, pauseSelection
 cmp eax, 1
 jge pause_wrap_top
 inc pauseSelection
 jmp key_handled
pause_wrap_top:
 mov pauseSelection, 0
 jmp key_handled

check_vk_return:
 cmp eax, VK_RETURN
 jne check_vk_1
 mov eax, gameState
 cmp eax, STATE_LEVEL_SELECT
 je check_return_level_select
 cmp eax, STATE_TITLE
 jne check_return_menu

 mov gameState, STATE_NAME_ENTRY
 mov fadeAlpha, 0
 mov playerNameLen, 0
 mov byte ptr [playerName], 0
 mov playerHasSave, 0
 mov currentSaveSlot, - 1
 mov resumeFromSave, 0
 jmp key_handled
check_return_level_select:
 mov eax, levelSelectSelection
 inc eax
 mov currentLevel, eax
 mov currentStage, eax
 mov currentWorld, 1
 call UpdateWorldNumber
 mov score, 0
 mov coins, 0
 mov lives, 3
 mov timer, 400
 mov marioState, 0
 mov starPowerActive, 0
 mov isInvincible, 0
 mov midasUsesLeft, MAX_MIDAS_USES
 mov resumeFromSave, 0
 mov gameState, STATE_LEVEL_TITLE
 jmp key_handled

check_return_menu:
 cmp eax, STATE_MENU
 jne check_return_pause
menu_process_selection:

 mov eax, menuSelection
 cmp eax, 0
 je menu_slot0
 cmp eax, 1
 je check_menu_highscore
 cmp eax, 2
 je check_menu_exit
 jmp key_handled

menu_slot0:

 cmp playerHasSave, 0
 je menu_start_new_game
 jmp menu_start_continue

menu_start_new_game:

 mov currentSaveSlot, - 1
 mov currentWorld, 1
 mov currentStage, 1
 mov currentLevel, 1
 mov score, 0
 mov coins, 0
 mov lives, 3
 mov timer, 400
 mov marioState, 0
 mov starPowerActive, 0
 mov isInvincible, 0
 mov midasUsesLeft, MAX_MIDAS_USES
 mov resumeFromSave, 0
 mov resumeSavedX, 0
 mov resumeSavedY, 0
 mov resumeSavedX, 0
 mov resumeSavedY, 0

 call LoadLevelFromFile
 call UpdateWorldNumber
 call InitLevel
 mov eax, marioX
 mov resumeSavedX, eax
 mov eax, marioY
 mov resumeSavedY, eax

 call SaveUserData
 mov playerHasSave, 1
 call UpdateHighScores
 call StopMusic
 mov levelTitleTimer, 360
 mov gameState, STATE_LEVEL_TITLE
 jmp key_handled

menu_start_continue:

 call LoadUserData
 call UpdateWorldNumber
 mov playerHasSave, 1
 call UpdateHighScores
 call StopMusic
 mov levelTitleTimer, 360
 mov gameState, STATE_LEVEL_TITLE
 jmp key_handled

check_menu_highscore:

 call UpdateHighScores
 mov gameState, STATE_HIGH_SCORES
 jmp key_handled
check_return_pause:
 cmp eax, STATE_PAUSE
 jne check_return_instructions

 mov eax, pauseSelection
 cmp eax, 0
 jne check_pause_exit

 mov gameState, STATE_GAMEPLAY
 jmp key_handled
check_pause_exit:

 mov eax, marioX
 mov resumeSavedX, eax
 mov eax, marioY
 mov resumeSavedY, eax
 mov resumeFromSave, 1

 call SaveUserData
 call SaveLevelState
 mov gameState, STATE_MENU
 call PlayMenuMusic

 mov playerHasSave, 1
 mov menuSelection, 0
 jmp key_handled
check_menu_exit:

 cmp eax, 2
 jne key_handled
 mov eax, playerNameLen
 cmp eax, 0
 jle menu_no_save_exit
 call SaveUserData
 call SaveLevelState
menu_no_save_exit:
 call PlayGameOverSound
 invoke PostQuitMessage, 0
 jmp key_handled
check_return_instructions:
 cmp eax, STATE_INSTRUCTIONS
 jne check_return_game_over
 call InitGame
 mov gameState, STATE_GAMEPLAY
 jmp key_handled

check_return_game_over:
 cmp eax, STATE_GAME_OVER
 jne check_return_level_title

 mov gameState, STATE_MENU
 call PlayMenuMusic
 jmp key_handled

check_return_high_scores:
 cmp eax, STATE_HIGH_SCORES
 jne check_return_level_title
 mov gameState, STATE_MENU
 call PlayMenuMusic
 call CheckUserDataExists
 mov playerHasSave, eax
 mov menuSelection, 0
 jmp key_handled

check_return_level_title:
 cmp eax, STATE_LEVEL_TITLE
 jne check_return_game_complete

 mov eax, resumeFromSave
 test eax, eax
 jz lvl_title_no_timer_preserve
 mov eax, timer
 push eax
lvl_title_no_timer_preserve:

 call LoadLevelFromFile
 call UpdateWorldNumber
 call InitLevel
 call LoadLevelState

 mov eax, resumeFromSave
 test eax, eax
 jz lvl_title_no_timer_restore
 pop eax
 mov timer, eax
lvl_title_no_timer_restore:

 cmp resumeFromSave, 1
 jne lvl_title_skip_resume_return
 mov eax, resumeSavedX
 mov marioX, eax
 mov eax, resumeSavedY
 mov marioY, eax

 mov eax, marioX

 add eax, HITBOX_WIDTH / 2
 sub eax, WINDOW_WIDTH / 2
 cmp eax, 0
 jge lvl_camx_ok_return
 mov eax, 0
lvl_camx_ok_return:
 mov ebx, TILE_COLS
 imul ebx, TILE_SIZE
 sub ebx, WINDOW_WIDTH
 cmp eax, ebx
 jle lvl_camx_store_return
 mov eax, ebx
lvl_camx_store_return:
 mov cameraX, eax

 mov eax, isUnderground
 test eax, eax
 jnz lvl_camy_underground_return
 mov eax, cameraSnapYOverworld
 sub eax, WINDOW_HEIGHT
 jmp lvl_camy_store_return
lvl_camy_underground_return:
 mov eax, cameraSnapYUnderground
 sub eax, WINDOW_HEIGHT
lvl_camy_store_return:
 mov cameraY, eax
 mov resumeFromSave, 0
lvl_title_skip_resume_return:
 mov gameState, STATE_GAMEPLAY
 jmp key_handled

check_return_game_complete:
 cmp eax, STATE_GAME_COMPLETE
 jne key_handled

 mov gameState, STATE_NAME_ENTRY
 mov fadeAlpha, 0
 mov nameEntryMode, 0
 mov playerNameLen, 0
 mov byte ptr [playerName], 0
 jmp key_handled

check_vk_1:
 cmp eax, 31h
 jne check_vk_2
 mov eax, gameState
 cmp eax, STATE_MENU
 jne key_handled
 mov menuSelection, 0
 jmp menu_process_selection

check_vk_2:
 cmp eax, 32h
 jne check_vk_3
 mov eax, gameState
 cmp eax, STATE_MENU
 jne key_handled
 mov menuSelection, 1
 jmp menu_process_selection

check_vk_3:
 cmp eax, 33h
 jne key_handled
 mov eax, gameState
 cmp eax, STATE_MENU
 jne key_handled
 mov eax, playerNameLen
 cmp eax, 0
 jle menu_exit_no_save
 call SaveUserData
 call SaveLevelState
menu_exit_no_save:
 invoke PostQuitMessage, 0

key_handled:
 xor eax, eax
 ret

check_keyup:
 cmp uMsg, WM_KEYUP
 jne check_char

 mov eax, wParam

 cmp eax, VK_LEFT
 jne check_up_a
 mov keyLeft, 0
 jmp keyup_handled

check_up_a:
 cmp eax, 41h
 jne check_up_right
 mov keyLeft, 0
 jmp keyup_handled

check_up_right:
 cmp eax, VK_RIGHT
 jne check_up_d
 mov keyRight, 0
 jmp keyup_handled

check_up_d:
 cmp eax, 44h
 jne check_up_space
 mov keyRight, 0
 jmp keyup_handled

check_up_space:
 cmp eax, VK_SPACE
 jne check_up_down
 mov keySpace, 0
 jmp keyup_handled

check_up_down:
 cmp eax, VK_DOWN
 jne check_up_s
 mov keyDown, 0
 jmp keyup_handled

check_up_s:
 cmp eax, 53h
 jne check_up_shift
 mov keyDown, 0
 jmp keyup_handled

check_up_shift:
 cmp eax, VK_SHIFT
 jne check_up_z
 mov keyRun, 0
 jmp keyup_handled

check_up_z:
 cmp eax, 5Ah
 jne keyup_handled
 mov keyFire, 0

keyup_handled:
 xor eax, eax
 ret

check_char:
 cmp uMsg, WM_CHAR
 jne check_lbutton

 mov eax, gameState
 cmp eax, STATE_NAME_ENTRY
 jne char_handled

 mov eax, wParam

 cmp eax, VK_BACK
 jne check_char_alpha

 mov eax, playerNameLen
 test eax, eax
 jz char_handled
 dec playerNameLen
 mov ebx, playerNameLen
 mov byte ptr [playerName + ebx], 0
 jmp char_handled

check_char_alpha:

 cmp eax, VK_RETURN
 jne check_char_letter

 mov ebx, playerNameLen
 cmp ebx, 0
 jle char_handled

 call CheckUserDataExists
 cmp eax, 0
 jne name_has_save
 mov playerHasSave, 0
 mov menuSelection, 0
 jmp name_entry_done
name_has_save:
 mov playerHasSave, 1
 mov menuSelection, 0
name_entry_done:
 call UpdateHighScores
 mov gameState, STATE_MENU
 jmp char_handled

check_char_letter:

 cmp eax, 'a'
 jl check_upper
 cmp eax, 'z'
 jg char_handled
 sub eax, 32
 jmp add_char
check_upper:
 cmp eax, 'A'
 jl char_handled
 cmp eax, 'Z'
 jg char_handled
add_char:

 mov ebx, playerNameLen
 cmp ebx, 10
 jge char_handled
 mov byte ptr [playerName + ebx], al
 inc playerNameLen
 mov ebx, playerNameLen
 mov byte ptr [playerName + ebx], 0

char_handled:
 xor eax, eax
 ret

check_lbutton:
 cmp uMsg, WM_LBUTTONDOWN
 jne check_timer

 mov eax, gameState
 cmp eax, STATE_MENU
 jne mouse_done

 mov eax, lParam
 and eax, 0FFFFh
 mov ebx, lParam
 shr ebx, 16

 cmp eax, 340
 jl mouse_done
 cmp eax, 640
 jg mouse_done
 cmp ebx, 260
 jl mouse_done
 cmp ebx, 420
 jg mouse_done

 sub ebx, 260
 mov eax, ebx
 mov ecx, 40
 xor edx, edx
 div ecx
 cmp eax, 2
 jle mouse_sel_ok
 mov eax, 2
mouse_sel_ok:
 mov menuSelection, eax
 jmp menu_process_selection

mouse_done:
 xor eax, eax
 ret

check_timer:
 cmp uMsg, WM_TIMER
 jne check_destroy

 call UpdateGame
 call RenderFrame

 xor eax, eax
 ret

check_destroy:
 cmp uMsg, WM_DESTROY
 jne default_proc

 mov eax, playerNameLen
 cmp eax, 0
 jle skip_destroy_save
 call SavePlayerProgress
skip_destroy_save:

 invoke KillTimer, hWin, 1
 invoke SelectObject, hdcMem, hOldBitmap
 invoke DeleteObject, hBitmap
 invoke DeleteDC, hdcMem

 invoke PostQuitMessage, 0
 xor eax, eax
 ret

default_proc:
 invoke DefWindowProcA, hWin, uMsg, wParam, lParam
 ret

WndProc endp

WinMain proc hInst:DWORD, hPrevInst:DWORD, CmdLine:DWORD, CmdShow:DWORD
 local wc:WNDCLASSEX
 local msg:MSG

 mov wc.cbSize, sizeof WNDCLASSEX

 mov wc.style, CS_HREDRAW or CS_VREDRAW
 mov wc.lpfnWndProc, offset WndProc
 mov wc.cbClsExtra, 0
 mov wc.cbWndExtra, 0
 push hInst
 pop wc.hInstance
 invoke LoadIconA, NULL, IDI_APPLICATION
 mov wc.hIcon, eax
 invoke LoadCursorA, NULL, IDC_ARROW
 mov wc.hCursor, eax
 mov wc.hbrBackground, COLOR_WINDOW + 1
 mov wc.lpszMenuName, NULL
 mov wc.lpszClassName, offset className
 mov wc.hIconSm, 0

 invoke RegisterClassExA, addr wc
 test eax, eax
 jz end_program

 invoke CreateWindowExA, 0, addr className, addr windowName,
 WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_MINIMIZEBOX or WS_VISIBLE,
 CW_USEDEFAULT, CW_USEDEFAULT, WINDOW_WIDTH, WINDOW_HEIGHT,
 NULL, NULL, hInst, NULL

 mov hWnd, eax
 test eax, eax
 jz end_program

 invoke ShowWindow, hWnd, SW_SHOW
 invoke UpdateWindow, hWnd

message_loop:
 invoke GetMessageA, addr msg, NULL, 0, 0
 test eax, eax
 jz end_program

 invoke TranslateMessage, addr msg
 invoke DispatchMessageA, addr msg
 jmp message_loop

end_program:
 mov eax, msg.wParam
 ret

WinMain endp

start:

 invoke GetModuleHandleA, NULL
 mov hInstance, eax
 invoke WinMain, hInstance, NULL, NULL, SW_SHOWDEFAULT
 invoke ExitProcess, eax

end start
