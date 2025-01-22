#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Renames the selected profile.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Button (unused) <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, _button] call trp_profiles_fnc_buttonRenameProfile
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_buttonRenameProfile",_display);

playSoundUI BUTTON_CLICK_SOUND;

private _editBox = _display displayCtrl IDC_PROFILE_NAME_EDIT_BOX;
private _newName = ctrlText _editBox;

if (_newName == "") exitWith {
    LLSTRING(emptyNameError) call FUNC(message);
    true;
};

private _contentPanel = _display displayCtrl IDC_CONTENT_PANEL;
private _oldName = _contentPanel lbText (lbCurSel _contentPanel);

private _profiles = profileNamespace getVariable [QGVAR(radioProfiles), createHashMap];
private _profileData = _profiles deleteAt _oldName;
_profiles set [_newName, _profileData];
profileNamespace setVariable [QGVAR(radioProfiles), _profiles];

[_display] call FUNC(populateProfiles);
private _contentPanel = _display displayCtrl IDC_CONTENT_PANEL;

// Select the new profile
private _profileNames = keys _profiles;
_profileNames sort true;
_contentPanel lbSetCurSel (_profileNames find _newName);

true;