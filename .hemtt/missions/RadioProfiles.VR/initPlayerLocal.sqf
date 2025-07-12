if (isClass (configFile >> "CfgPatches" >> "ace_arsenal")) then {
    private _action = ["trp_openArsenal", "Open Arsenal", "", {
        [_player, _player, true] call ace_arsenal_fnc_openBox;
    }, {true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};
