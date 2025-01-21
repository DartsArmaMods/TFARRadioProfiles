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