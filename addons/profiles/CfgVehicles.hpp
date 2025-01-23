class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(openDisplay) {
                displayName = CSTRING(radioProfiles);
                icon = QPATHTOF(data\ui\icon_ca.paa);
                exceptions[] = {"isNotInside", "isNotSitting"};
                #ifdef DEBUG_MODE_FULL
                condition = "true";
                #else
                condition = "isMultiplayer";
                #endif
                statement = QUOTE(createDialog QQGVAR(display));
            };
        };
    };
};