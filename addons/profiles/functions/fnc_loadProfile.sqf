#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Loads a profile by its name.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Set as latest selected profile (optional, default: false) <BOOL>
 *    - If true, the given profile will be set when loading a loadout / respawning
 *
 * Return Value:
 * Success <ARRAY>
 *   - 0: Loaded short range settings <BOOL>
 *   - 1: Loaded long range settings <BOOL>
 *
 * Example:
 * "Profile Name" call trp_profiles_fnc_loadProfile
 *
 * Public: Yes
 */

if (!isMultiplayer) exitWith {
    WARNING("loadProfile called during singleplayer");
    [false, false]
};

params [
    ["_name", "", [""]],
    ["_setLatest", false, [false]]
];
TRACE_2("fnc_loadProfile",_name,_setLatest);

if (_name == "" ) exitWith {
    ERROR("Cannot load radio profile with empty name");
};

private _profiles = profileNamespace getVariable [QGVAR(radioProfiles), createHashMap];
(_profiles getOrDefault [_name, [[], []]]) params ["_savedSRSettings", "_savedLRSettings"];
_savedSRSettings = +_savedSRSettings; // Get a copy so we don't modify their settings
_savedLRSettings = +_savedLRSettings;

private _srRadio = [] call TFAR_fnc_activeSwRadio;
private _loadedSR = false;
if (!isNil "_srRadio") then {
    // We need to keep their encryption code, while using all of the other settings
    private _currentSettings = _srRadio call TFAR_fnc_getSwSettings;
    _savedSRSettings set [4, _currentSettings select 4];

    [_srRadio, _savedSRSettings] call TFAR_fnc_setSwSettings;
    _loadedSR = true;
};

private _lrRadio = [] call TFAR_fnc_activeLrRadio;
private _loadedLR = false;
if (!isNil "_lrRadio") then {
    private _currentSettings = _lrRadio call TFAR_fnc_getLrSettings;
    _savedLRSettings set [4, _currentSettings select 4];
    [_lrRadio, _savedLRSettings] call TFAR_fnc_setLrSettings;
    _loadedLR = true;
};

if (_setLatest) then {
    ([] call CBA_fnc_currentUnit) setVariable [QGVAR(latestProfile), _name];
};

INFO_3("Loaded profile '%1' | Loaded SR: %2 | Loaded LR: %3",_name,_loadedSR,_loadedLR);
TRACE_2("Profile settings",_savedSRSettings,_savedLRSettings);

[_loadedSR, _loadedLR];