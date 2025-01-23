// Bigger number = smaller
#define DISPLAY_WIDTH 145
#define DISPLAY_HEIGHT 70

#define TEXT_SIZE 8

// Pixel grid
#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

#define WIDTH_TOTAL (safeZoneW - 2 * (DISPLAY_WIDTH * GRID_W))
#define HEIGHT_TOTAL (safeZoneH - (DISPLAY_HEIGHT * GRID_H))

#define CENTER_X (0.5 - WIDTH_TOTAL / 2)

#define BUTTON_CLICK_SOUND ["\A3\ui_f\data\sound\RscButton\soundClick.wss", 0.09, 1]

#define IDD_RADIO_PROFILES 2018160
#define IDC_CONTENT_PANEL 0
#define IDC_PROFILE_NAME_EDIT_BOX 1
#define IDC_BUTTON_SAVE 2
#define IDC_BUTTON_LOAD 3
#define IDC_BUTTON_DELETE 4
#define IDC_BUTTON_RENAME 5
#define IDC_MESSAGE 6