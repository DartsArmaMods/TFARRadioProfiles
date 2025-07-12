#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the onLoad of the radio profile display.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _display call trp_profiles_fnc_onDisplayOpen
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_onDisplayOpen",_display);

uiNamespace setVariable [QGVAR(display), _display];
[QGVAR(displayOpened), [_display]] call CBA_fnc_localEvent;

_display call FUNC(populateProfiles);

private _contentPanel = _display displayCtrl IDC_CONTENT_PANEL;
_contentPanel ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_lbCurSel"];
    TRACE_2("Changed selected profile",_control,_lbCurSel);
    private _profileName = _control lbText _lbCurSel;
    private _display = ctrlParent _control;
    private _editBox = _display displayCtrl IDC_PROFILE_NAME_EDIT_BOX;
    _editBox ctrlSetText _profileName;
}];
