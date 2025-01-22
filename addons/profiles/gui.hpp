#include "\z\trp\addons\main\data\hpp\RscCommon.hpp"

// https://github.com/acemod/ACE3/blob/master/addons/arsenal/ui/RscAttributes.hpp#L1009
// https://community.bistudio.com/wiki/CT_LISTNBOX
class GVAR(display) {
    idd = IDD_RADIO_PROFILES;
    enableSimulation = 1;

    onLoad = QUOTE(call FUNC(onDisplayOpen));
    onUnload = QUOTE(call FUNC(onDisplayClose));

    class Controls {
        class centerBox: ctrlControlsGroupNoScrollbars {
            idc = -1;
            x = QUOTE(0.5 - GRID_W * (DISPLAY_WIDTH / 2));
            y = QUOTE(1 - GRID_H * (DISPLAY_HEIGHT / 2));
            w = QUOTE(GRID_W * DISPLAY_WIDTH);
            h = QUOTE(GRID_H * DISPLAY_HEIGHT);
            class controls {
                class centerBackground: ctrlStaticBackground {
                    idc = -1;
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(safeZoneH - (45 * GRID_H));
                    colorBackground[] = {0.13, 0.13, 0.13, 0.9};
                };
                class centerTitle: ctrlStaticTitle {
                    idc = -1;
                    style = ST_CENTER;
                    text = "";
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                };
                class textTitle: RscText {
                    idc = -1;
                    text = CSTRING(radioProfiles);
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                    colorBackground[] = {0, 0, 0, 0};
                };
                class contentPanel: RscListBox {
                    idc = IDC_CONTENT_PANEL;
                    columns[] = {0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90};
                    drawSideArrows = 0;
                    disableOverflow = 1;
                    x = QUOTE(0);
                    y = QUOTE(5 * GRID_H);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safeZoneH - (57 * GRID_H));
                    sizeEx = QUOTE(3 * GRID_H);
                };
                class profileNameEditBox: ctrlEdit {
                    idc = IDC_PROFILE_NAME_EDIT_BOX;
                    x = QUOTE(0);
                    y = QUOTE(safeZoneH - (48 * GRID_H));
                    w = QUOTE(58 * GRID_W);
                    h = QUOTE(3 * GRID_H);
                    sizeEx = QUOTE(3 * GRID_H);
                };
                class buttonClose: ctrlButton {
                    idc = -1;
                    x = QUOTE(75 * GRID_W);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(5 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    text = "X";
                    sizeEx = QUOTE(5 * GRID_H);
                    onButtonClick = QUOTE(closeDialog 0);
                    colorText[] = {1, 1, 1, 1};
                    colorBackground[] = {0, 0, 0, 0.2};
                    colorBackgroundActive[] = {0.5, 0, 0, 1};
                };

                #define BUTTON_WIDTH 13
                #define BUTTON_SPACING(number) (((BUTTON_WIDTH + 2) * number) * GRID_W)

                class buttonSave: ctrlButton {
                    idc = IDC_BUTTON_SAVE;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(safeZoneH - (44 * GRID_H));
                    w = QUOTE(BUTTON_WIDTH * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    text = CSTRING(buttonSaveText);
                    // tooltip = CSTRING(buttonSaveTooltip);
                    sizeEx = QUOTE(3 * GRID_H);
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0),_this select 0)] call FUNC(buttonSaveProfile));
                    colorBackground[] = {0, 0, 0, 0.8};
                };
                class buttonLoad: buttonSave {
                    idc = IDC_BUTTON_LOAD;
                    x = QUOTE(BUTTON_SPACING(1));
                    text = CSTRING(buttonLoadText);
                    // tooltip = CSTRING(buttonLoadTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0),_this select 0)] call FUNC(buttonLoadProfile));
                };
                class buttonRename: buttonSave {
                    idc = IDC_BUTTON_RENAME;
                    x = QUOTE(BUTTON_SPACING(2));
                    text = CSTRING(buttonRenameText);
                    // tooltip = CSTRING(buttonRenameTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0),_this select 0)] call FUNC(buttonRenameProfile));
                };
                class buttonDelete: buttonSave {
                    idc = IDC_BUTTON_DELETE;
                    x = QUOTE(BUTTON_SPACING(3));
                    text = CSTRING(buttonDeleteText);
                    // tooltip = CSTRING(buttonDeleteTooltip);
                    colorBackgroundActive[] = {0.5, 0, 0, 1};
                    onButtonClick = QUOTE([ARR_2(ctrlParent (_this select 0),_this select 0)] call FUNC(buttonDeleteProfile));
                };
            };
        };
    };
    class ControlsBackground {};
};