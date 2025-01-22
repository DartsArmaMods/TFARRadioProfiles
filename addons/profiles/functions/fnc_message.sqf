#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Displays a message in the main display.
 *
 * Arguments:
 * 0: Message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * _message call trp_profiles_fnc_message

 * Public: No
 */

#define FADE_DELAY 0.15

params ["_message"];
TRACE_1("fnc_message",_message);

uiNamespace getVariable [QGVAR(display), displayNull];
if (isNull _display) exitWith {};

private _control = _display displayCtrl IDC_MESSAGE;

// ctrlSetFade has some issues, see https://community.bistudio.com/wiki/ctrlSetFade
_control ctrlSetText _message;
_control ctrlSetFade 1;
_control ctrlCommit 0;

_control ctrlSetFade 0;
_control ctrlCommit FADE_DELAY;

private _timer = CBA_missionTime + 5;

[{
    params ["", "_timer"];
    _timer <= CBA_missionTime
}, {
    params ["_control", ""];
    if (isNull _control) exitWith {};

    _control ctrlSetFade 1;
    _control ctrlCommit FADE_DELAY;
}, [_control, _timer], 10, {}] call CBA_fnc_waitUntilAndExecute;