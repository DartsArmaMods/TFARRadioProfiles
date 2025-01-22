#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Loads a profile by its name.
 *
 * Arguments:
 * 0: Name <STRING>
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
    ["_name", "", [""]]
];
TRACE_1("fnc_loadProfile",_name);

if (_name == "" ) exitWith {
    ERROR("Cannot load radio profile with empty name");
};

private _profiles = profileNamespace getVariable [QGVAR(radioProfiles), createHashMap];
(_profiles getOrDefault [_name, [[], []]]) params ["_savedSRSettings", "_savedLRSettings"];

private _srRadio = [] call TFAR_fnc_activeSwRadio;
private _loadedSR = false;
if (!isNil "_srRadio") then {
    [_srRadio, _savedSRSettings] call TFAR_fnc_setSwSettings;
    private _loadedSR = true;
};

private _lrRadio = [] call TFAR_fnc_activeLrRadio;
private _loadedLR = false;
if (!isNil "_lrRadio") then {
    [_lrRadio, _savedLRSettings] call TFAR_fnc_setLrSettings;
    private _loadedLR = true;
};

[_loadedSR, _loadedLR];