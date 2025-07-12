#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the onClose of the radio profile display.
 *
 * Arguments:
 * 0: Display (unused) <DISPLAY>
 * 1: Exit code (unused) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call trp_profiles_fnc_onDisplayClose
 *
 * Public: No
 */

TRACE_1("fnc_onDisplayClose",_this);

uiNamespace setVariable [QGVAR(display), nil];
[QGVAR(displayClosed), []] call CBA_fnc_localEvent;
