#include "\z\trp\addons\main\data\hpp\RscCommon.hpp"

// https://github.com/acemod/ACE3/blob/master/addons/arsenal/ui/RscAttributes.hpp#L1009
// https://community.bistudio.com/wiki/CT_LISTNBOX
class GVAR(display) {
    idd = IDD_RADIO_PROFILES;
    enableSimulation = 1;

    onLoad = QUOTE(call FUNC(onDisplayOpen));
    onUnload = QUOTE(call FUNC(onDisplayClose));

    movingEnable = 1;

    class controls {
        class textTitle: RscText {
            idc = -1;
            moving = 1;
            text = CSTRING(radioProfiles);
            x = QUOTE(CENTER_X);
            y = QUOTE(safeZoneY + (5 * GRID_H));
            w = QUOTE(WIDTH_TOTAL);
            h = QUOTE((TEXT_SIZE + 2) * GRID_H);
            sizeEx = QUOTE((TEXT_SIZE + 2) * GRID_H);
            colorBackground[] = {GUI_BCG_RGB, 1};
        };

        class centerBox: ctrlControlsGroupNoScrollbars {
            idc = -1;
            x = QUOTE(CENTER_X);
            y = QUOTE(safeZoneY + (5 * GRID_H));
            w = QUOTE(WIDTH_TOTAL);
            h = QUOTE(HEIGHT_TOTAL + (100 * GRID_H));

            class controls {
                class contentPanel: RscListBox {
                    idc = IDC_CONTENT_PANEL;
                    drawSideArrows = 0;
                    disableOverflow = 1;
                    x = 0;
                    y = QUOTE((TEXT_SIZE + 2) * GRID_H); // Needs to appear under the title box
                    w = QUOTE(WIDTH_TOTAL);
                    h = QUOTE(HEIGHT_TOTAL);
                    colorBackground[] = {0.13, 0.13, 0.13, 0.9};
                    sizeEx = QUOTE(TEXT_SIZE * GRID_H);
                };
                class buttonClose: ctrlButton {
                    idc = -1;
                    x = QUOTE(WIDTH_TOTAL - ((TEXT_SIZE + 2) * GRID_W));
                    y = 0;
                    w = QUOTE((TEXT_SIZE + 2) * GRID_W);
                    h = QUOTE((TEXT_SIZE + 2) * GRID_H);
                    sizeEx = QUOTE((TEXT_SIZE + 2) * GRID_H);
                    text = "X";

                    onButtonClick = QUOTE(closeDialog 0);
                    colorText[] = {1, 1, 1, 1};
                    colorBackground[] = {0, 0, 0, 0.2};
                    colorBackgroundActive[] = {0.5, 0, 0, 1};
                };

                #define BUTTON_WIDTH 40
                #define BUTTON_SPACING(number) (((BUTTON_WIDTH + 10) * number) * GRID_W)

                class profileNameEditBox: ctrlEdit {
                    idc = IDC_PROFILE_NAME_EDIT_BOX;
                    x = 0;
                    y = QUOTE(HEIGHT_TOTAL + ((TEXT_SIZE + 3) * GRID_H));
                    w = QUOTE(BUTTON_SPACING(3) + (BUTTON_WIDTH * GRID_W));
                    h = QUOTE(TEXT_SIZE * GRID_H);
                    sizeEx = QUOTE(TEXT_SIZE * GRID_H);
                };

                class buttonSave: ctrlButton {
                    idc = IDC_BUTTON_SAVE;
                    x = 0;
                    y = QUOTE(HEIGHT_TOTAL + (((TEXT_SIZE * 2) + 5) * GRID_H));
                    w = QUOTE(BUTTON_WIDTH * GRID_W);
                    h = QUOTE((TEXT_SIZE + 2) * GRID_H);

                    text = CSTRING(buttonSaveText);
                    // tooltip = CSTRING(buttonSaveTooltip);
                    sizeEx = QUOTE(TEXT_SIZE * GRID_H);
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

        class message: RscText {
            idc = IDC_MESSAGE;
            fade = 1;
            style = 2;
            shadow = 0;
            colorBackground[] = {0, 0, 0, 0.7};
            text = "";
            x = QUOTE(CENTER_X);
            y = QUOTE(safeZoneH + safeZoneY - 25 * GRID_H);
            w = QUOTE(WIDTH_TOTAL);
            h = QUOTE(10 * GRID_H);
            sizeEx = QUOTE(TEXT_SIZE * GRID_H);
        };
    };
    class controlsBackground {};
};