[
    QGVAR(restoreOnRespawn), "CHECKBOX",
    [LSTRING(restoreOnRespawn_name), LSTRING(restoreOnRespawn_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(restoreOnLoadout), "CHECKBOX",
    [LSTRING(restoreOnLoadout_name), LSTRING(restoreOnLoadout_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;
