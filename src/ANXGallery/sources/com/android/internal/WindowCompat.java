package com.android.internal;

import android.app.Activity;
import android.os.Build.VERSION;
import android.view.DisplayCutout;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager.LayoutParams;

public class WindowCompat {
    private static int DEFAULT_NOTCH_HEIGHT = 80;
    private static Boolean sIsNotch;
    private static Integer sTopNotchHeight;

    public static int getTopNotchHeight(Activity activity) {
        if (sTopNotchHeight != null) {
            return sTopNotchHeight.intValue();
        }
        if (isNotch(activity)) {
            if (VERSION.SDK_INT >= 28) {
                View decorView = activity.getWindow().getDecorView();
                if (decorView != null) {
                    WindowInsets rootWindowInsets = decorView.getRootWindowInsets();
                    if (rootWindowInsets != null) {
                        DisplayCutout displayCutout = rootWindowInsets.getDisplayCutout();
                        if (displayCutout == null) {
                            sTopNotchHeight = Integer.valueOf(0);
                        } else {
                            sTopNotchHeight = Integer.valueOf(displayCutout.getSafeInsetTop());
                        }
                        return sTopNotchHeight.intValue();
                    }
                }
            } else {
                int identifier = activity.getResources().getIdentifier("notch_height", "dimen", "android");
                if (identifier > 0) {
                    sTopNotchHeight = Integer.valueOf(activity.getResources().getDimensionPixelSize(identifier));
                } else {
                    sTopNotchHeight = Integer.valueOf(DEFAULT_NOTCH_HEIGHT);
                }
                return sTopNotchHeight.intValue();
            }
        }
        return 0;
    }

    public static boolean isNotch(Activity activity) {
        if (sIsNotch != null) {
            return sIsNotch.booleanValue();
        }
        boolean z = true;
        if (VERSION.SDK_INT < 28) {
            if (SystemPropertiesCompat.getInt("ro.miui.notch", 0) != 1) {
                z = false;
            }
            sIsNotch = Boolean.valueOf(z);
            return sIsNotch.booleanValue();
        } else if (activity == null || activity.isDestroyed()) {
            return false;
        } else {
            View decorView = activity.getWindow().getDecorView();
            if (decorView != null) {
                WindowInsets rootWindowInsets = decorView.getRootWindowInsets();
                if (rootWindowInsets != null) {
                    if (rootWindowInsets.getDisplayCutout() == null) {
                        z = false;
                    }
                    sIsNotch = Boolean.valueOf(z);
                    return sIsNotch.booleanValue();
                }
            }
            return false;
        }
    }

    public static void setCutoutModeShortEdges(Window window) {
        if (VERSION.SDK_INT >= 28) {
            LayoutParams attributes = window.getAttributes();
            attributes.layoutInDisplayCutoutMode = 1;
            window.setAttributes(attributes);
        }
    }
}
