package com.miui.gallery.video.editor.manager;

import android.os.Build;

public class SmartVideoJudgeManager {
    private static boolean sLoaded;
    private static final String[] sWhiteList = {"dipper", "ursa", "equuleus", "perseus", "sirius", "lavender", "cepheus", "violet", "onc", "grus", "pyxis", "raphael", "davinci", "davinciin", "raphaelin", "vela", "crux"};

    static {
        sLoaded = false;
        for (String equals : sWhiteList) {
            if (Build.DEVICE.equals(equals)) {
                sLoaded = true;
            }
        }
    }

    public static boolean isAvailable() {
        return sLoaded;
    }
}
