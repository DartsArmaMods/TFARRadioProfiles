#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Gets the player's current radio settings and saves them.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Button (unused) <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, _button] call trp_profiles_fnc_buttonSaveProfile
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_buttonSaveProfile",_display);

// For whatever reason, having an onButtonClick breaks the button click sound
playSoundUI BUTTON_CLICK_SOUND;
private _editBox = _display displayCtrl IDC_PROFILE_NAME_EDIT_BOX;
private _name = ctrlText _editBox;

if (_name == "") exitWith {
    LLSTRING(emptyNameError) call FUNC(message);
    true;
};

private _srSettings = ([] call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
if (isNil "_srSettings") then {
    _srSettings = [];
};

private _lrSettings = ([] call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
if (isNil "_lrSettings") then {
    _lrSettings = [];
};

[_name, _srSettings, _lrSettings] call FUNC(saveProfile);
true; // Keep display open
