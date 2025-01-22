class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(openDisplay) {
                displayName = CSTRING(radioProfiles);
                icon = QPATHTOF(data\ui\icon_ca.paa);
                exceptions[] = {"isNotInside", "isNotSitting"};
                condition = "isMultiplayer";
                statement = QUOTE(createDialog QQGVAR(display));
            };
        };
    };
};