class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                main_addon = QUOTE(ADDON);

                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, QUOTE(true)};
                    TFAR[] = {"tfar_core", REQUIRED_TFAR_VERSION, QUOTE(true)};
                };
            };
        };
    };
};