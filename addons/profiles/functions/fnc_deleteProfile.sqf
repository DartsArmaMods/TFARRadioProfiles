#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Deletes a given profile.
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * True if deleted, otherwise false <BOOL>
 *
 * Example:
 * "Profile Name" call trp_profiles_fnc_deleteProfile
 *
 * Public: Yes
 */

params [
    ["_name", "", [""]]
];
TRACE_1("fnc_deleteProfile",_name);

if (_name == "") exitWith {
    ERROR_1("Cannot delete profile with empty name (%1)",_name);
    false;
};

private _profiles = profileNamespace getVariable [QGVAR(radioProfiles), createHashMap];
private _deleted = _profiles deleteAt _name;

// If profile display is open, then add the new value
private _display = uiNamespace getVariable [QGVAR(display), displayNull];
if (!isNull _display) then {
    _display call FUNC(populateProfiles);
};

!isNil "_deleted";
