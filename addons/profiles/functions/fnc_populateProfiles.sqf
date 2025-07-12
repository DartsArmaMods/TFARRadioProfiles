#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Populates the list of profiles
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _display call trp_profiles_fnc_populateProfiles
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_populateProfiles",_display);

private _profileList = _display displayCtrl IDC_CONTENT_PANEL;
lbClear _profileList;
private _profileNames = keys (profileNamespace getVariable [QGVAR(radioProfiles), createHashMap]);
_profileNames sort true;
{ _profileList lbAdd _x } forEach _profileNames;
