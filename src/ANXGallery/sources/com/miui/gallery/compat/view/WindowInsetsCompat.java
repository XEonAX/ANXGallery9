package com.miui.gallery.compat.view;

import android.view.WindowInsets;

class WindowInsetsCompat {
    static int getSystemWindowInsetBottom(Object obj) {
        return ((WindowInsets) obj).getSystemWindowInsetBottom();
    }

    static int getSystemWindowInsetLeft(Object obj) {
        return ((WindowInsets) obj).getSystemWindowInsetLeft();
    }

    static int getSystemWindowInsetRight(Object obj) {
        return ((WindowInsets) obj).getSystemWindowInsetRight();
    }

    static int getSystemWindowInsetTop(Object obj) {
        return ((WindowInsets) obj).getSystemWindowInsetTop();
    }
}
