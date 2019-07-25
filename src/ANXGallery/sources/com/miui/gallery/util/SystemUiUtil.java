package com.miui.gallery.util;

import android.os.Build.VERSION;
import android.view.View;
import android.view.Window;

public class SystemUiUtil {
    public static void extendToStatusBar(View view) {
        view.setSystemUiVisibility(1280);
    }

    public static void hideSystemBars(View view) {
        hideSystemBars(view, !MiscUtil.isNightMode(view.getContext()));
    }

    public static void hideSystemBars(View view, boolean z) {
        if (VERSION.SDK_INT < 23 || !z) {
            view.setSystemUiVisibility(5894);
        } else {
            view.setSystemUiVisibility(14086);
        }
    }

    public static void setDrawSystemBarBackground(Window window) {
        if (VERSION.SDK_INT >= 23 && window != null) {
            window.addFlags(Integer.MIN_VALUE);
        }
    }

    public static void setLayoutFullScreen(View view, boolean z) {
        int i = !z ? 5894 : 1792;
        if (VERSION.SDK_INT > 22 && !MiscUtil.isNightMode(view.getContext())) {
            i |= 8192;
        }
        view.setSystemUiVisibility(i);
    }

    public static void setSystemBarsVisibility(boolean z, View view) {
        boolean z2 = !MiscUtil.isNightMode(view.getContext());
        if (z) {
            showSystemBars(view, z2);
        } else {
            hideSystemBars(view, z2);
        }
    }

    public static void showSystemBars(View view) {
        showSystemBars(view, !MiscUtil.isNightMode(view.getContext()));
    }

    public static void showSystemBars(View view, boolean z) {
        if (VERSION.SDK_INT < 23 || !z) {
            view.setSystemUiVisibility(1792);
        } else {
            view.setSystemUiVisibility(9984);
        }
    }
}
