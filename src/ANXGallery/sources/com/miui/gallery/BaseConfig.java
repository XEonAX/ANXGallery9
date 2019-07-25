package com.miui.gallery;

import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.miui.gallery.util.StaticContext;

public class BaseConfig {

    public static class ScreenConfig {
        private static int sHeightPixels;
        private static int sRealHeightPixels;
        private static int sRealWidthPixels;
        private static int sWidthPixels;

        public static int getRealScreenHeight() {
            if (sRealHeightPixels == 0) {
                init();
            }
            return sRealHeightPixels;
        }

        public static int getRealScreenWidth() {
            if (sRealWidthPixels == 0) {
                init();
            }
            return sRealWidthPixels;
        }

        public static int getScreenHeight() {
            if (sHeightPixels == 0) {
                init();
            }
            return sHeightPixels;
        }

        public static int getScreenWidth() {
            if (sWidthPixels == 0) {
                init();
            }
            return sWidthPixels;
        }

        private static void init() {
            WindowManager windowManager = (WindowManager) StaticContext.sGetAndroidContext().getSystemService("window");
            DisplayMetrics displayMetrics = new DisplayMetrics();
            windowManager.getDefaultDisplay().getMetrics(displayMetrics);
            sWidthPixels = displayMetrics.widthPixels;
            sHeightPixels = displayMetrics.heightPixels;
            windowManager.getDefaultDisplay().getRealMetrics(displayMetrics);
            sRealWidthPixels = displayMetrics.widthPixels;
            sRealHeightPixels = displayMetrics.heightPixels;
        }
    }
}
