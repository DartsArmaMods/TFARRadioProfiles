#include "\z\trp\addons\main\data\hpp\defineDIKCodes.hpp"

[
    _category, QGVAR(key_openRadioProfiles),
    [LSTRING(openRadioProfiles_name), LSTRING(openRadioProfiles_tooltip)], {
        createDialog QGVAR(display);
    }
] call CBA_fnc_addKeybind;