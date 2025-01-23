class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                main_addon = QUOTE(ADDON);
                level = -2; // Only show version mismatch if server has the mod installed.

                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, QUOTE(true)};
                    TFAR[] = {"tfar_core", REQUIRED_TFAR_VERSION, QUOTE(true)};
                };
            };
        };
    };
};