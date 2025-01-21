#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Saves given short / long range radio settings to the player's profile.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Short range settings (optional, default: []) <ARRAY>
 *    - If array is empty, no value will be saved
 * 2: Long range settings (optional, default: []) <ARRAY>
 *    - If array is empty, no value will be saved
 *
 * Return Value:
 * Success <ARRAY>
 *   - 0: Saved short range settings <BOOL>
 *   - 1: Saved long range settings <BOOL>
 *
 * Example:
 * ["Profile Name", _srSettings, _lrSettings] call trp_profiles_fnc_saveProfile
 *
 * Public: Yes
 */

if (!isMultiplayer) exitWith {
    WARNING("saveProfile called during singleplayer");
    [false, false]
};

params [
    ["_name", "", [""]],
    ["_srSettings", [], [[]]],
    ["_lrSettings", [], [[]]]
];
TRACE_3("fnc_saveProfile",_name,_srSettings,_lrSettings);

if (_name == "" || {_srSettings isEqualTo [] && _lrSettings isEqualTo []}) exitWith {
    ERROR_3("Invalid params passed to saveProfile. Name (%1) is empty or settings are empty, SR = %2; LR = %3",_name,_srSettings,_lrSettings);
};

private _profiles = profileNamespace getVariable [QGVAR(radioProfiles), createHashMap];
(_profiles getOrDefault [_name, [[], []]]) params ["_savedSRSettings", "_savedLRSettings"];

private _savedSR = false;
if (_srSettings isNotEqualTo []) then {
    _savedSRSettings = _srSettings;
    _savedSR = true;
};

private _savedLR = false;
if (_lrSettings isNotEqualTo []) then {
    _savedSRSettings = _lrSettings;
    _savedLR = true;
};

_profiles set [_name, [_savedSRSettings, _savedLRSettings]];
profileNamespace setVariable [QGVAR(radioProfiles), _profiles];

// If profile display is open, then add the new value
private _display = uiNamespace getVariable [QGVAR(display), displayNull];
if (!isNull _display) then {
    _display call FUNC(populateProfiles);
};

[_savedSR, _savedLR];