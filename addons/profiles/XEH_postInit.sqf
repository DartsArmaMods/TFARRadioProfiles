#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_arsenal_onLoadoutLoad", {
    private _unit = [] call CBA_fnc_currentUnit;
    if (isNull _unit) exitWith {};
    TRACE_2("Player set loadout",_unit,GVAR(restoreOnLoadout));

    // Make sure not to overwrite flag if already set
    private _restoreProfile = _unit getVariable [QGVAR(restoreProfile), false];
    _unit setVariable [QGVAR(restoreProfile), _restoreProfile || GVAR(restoreOnLoadout)];
}] call CBA_fnc_addEventHandler;

["CAManBase", "respawn", {
    params ["_unit"];
    if (_unit isNotEqualTo ([] call CBA_fnc_currentUnit)) exitWith {};
    TRACE_2("Player respawned",_unit,GVAR(restoreOnRespawn));

    private _restoreProfile = _unit getVariable [QGVAR(restoreProfile), false];
    _unit setVariable [QGVAR(restoreProfile), _restoreProfile || GVAR(restoreOnRespawn)];
}] call CBA_fnc_addClassEventHandler;

// This is the event for when the server gives a client their radio
["TFAR_RadioRequestResponseEvent", {
    // Needs a small delay for TFAR to initialize stuff
    [{
        private _unit = [] call CBA_fnc_currentUnit;
        private _restoreProfile = _unit getVariable [QGVAR(restoreProfile), false];
        TRACE_1("Recieved radio from server",_restoreProfile);
        if (!_restoreProfile) exitWith {};

        private _latestProfile = _unit getVariable [QGVAR(latestProfile), ""];
        TRACE_1("Latest profile",_latestProfile);

        _latestProfile call FUNC(loadProfile);
        _unit setVariable [QGVAR(restoreProfile), nil];
    }, nil, 0.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;