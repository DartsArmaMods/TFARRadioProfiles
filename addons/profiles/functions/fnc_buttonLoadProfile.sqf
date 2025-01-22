#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Loads the selected profile.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Button (unused) <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, _button] call trp_profiles_fnc_buttonLoadsProfile
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_buttonLoadProfile",_display);

playSoundUI BUTTON_CLICK_SOUND;
private _contentPanel = _display displayCtrl IDC_CONTENT_PANEL;
private _profileName = _contentPanel lbText (lbCurSel _contentPanel);

[_profileName, true] call FUNC(loadProfile);

true; // Keep display open