package com.miui.gallery.util;

import android.app.Activity;
import android.content.Context;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.android.internal.WindowCompat;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.compat.view.ViewCompat;

public class ScreenUtils {
    private static boolean sOptimizeForLowMemory = false;
    static float sPixelDensity = -1.0f;

    public static float dpToPixel(float f) {
        if (sPixelDensity < 0.0f) {
            initialize(GalleryApp.sGetAndroidContext());
        }
        return sPixelDensity * f;
    }

    public static int getExactScreenHeight(Activity activity) {
        if (activity == null) {
            return 0;
        }
        if (ViewCompat.getSystemWindowInsetBottom(activity.getWindow().getDecorView()) <= 0) {
            return getFullScreenHeight(activity);
        }
        int screenHeight = getScreenHeight();
        if (VERSION.SDK_INT >= 28) {
            screenHeight += WindowCompat.getTopNotchHeight(activity);
        }
        return screenHeight;
    }

    public static int getFullScreenHeight(Activity activity) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        activity.getWindowManager().getDefaultDisplay().getRealMetrics(displayMetrics);
        return Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels);
    }

    public static int getScreenHeight() {
        DisplayMetrics displayMetrics = GalleryApp.sGetAndroidContext().getResources().getDisplayMetrics();
        return Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels);
    }

    public static int getScreenWidth() {
        DisplayMetrics displayMetrics = GalleryApp.sGetAndroidContext().getResources().getDisplayMetrics();
        return Math.min(displayMetrics.widthPixels, displayMetrics.heightPixels);
    }

    private static void initialize(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        sPixelDensity = displayMetrics.density;
        sOptimizeForLowMemory = (Runtime.getRuntime().maxMemory() >> 20) <= 64 && displayMetrics.widthPixels * displayMetrics.heightPixels >= 921600;
    }

    public static boolean needOptimizeForLowMemory() {
        return sOptimizeForLowMemory;
    }
}
