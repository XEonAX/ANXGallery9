package com.miui.gallery.compat.view;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.util.Log;
import android.view.View;
import android.view.WindowInsets;

public class ViewCompat {
    private static Object getRootWindowInsets(View view) {
        if (view != null && VERSION.SDK_INT >= 23) {
            WindowInsets rootWindowInsets = view.getRootWindowInsets();
            if (rootWindowInsets != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("root window insets: ");
                sb.append(rootWindowInsets);
                Log.d("ViewCompat", sb.toString());
                return rootWindowInsets;
            }
        }
        return null;
    }

    public static int getSystemWindowInsetBottom(View view) {
        Object rootWindowInsets = getRootWindowInsets(view);
        if (rootWindowInsets != null) {
            return WindowInsetsCompat.getSystemWindowInsetBottom(rootWindowInsets);
        }
        return 0;
    }

    public static int getSystemWindowInsetLeft(View view) {
        Object rootWindowInsets = getRootWindowInsets(view);
        if (rootWindowInsets != null) {
            return WindowInsetsCompat.getSystemWindowInsetLeft(rootWindowInsets);
        }
        return 0;
    }

    public static int getSystemWindowInsetRight(View view) {
        Object rootWindowInsets = getRootWindowInsets(view);
        if (rootWindowInsets != null) {
            return WindowInsetsCompat.getSystemWindowInsetRight(rootWindowInsets);
        }
        return 0;
    }

    public static Rect getSystemWindowInsets(View view) {
        Rect rect = new Rect(0, 0, 0, 0);
        Object rootWindowInsets = getRootWindowInsets(view);
        if (rootWindowInsets != null) {
            rect.set(WindowInsetsCompat.getSystemWindowInsetLeft(rootWindowInsets), WindowInsetsCompat.getSystemWindowInsetTop(rootWindowInsets), WindowInsetsCompat.getSystemWindowInsetRight(rootWindowInsets), WindowInsetsCompat.getSystemWindowInsetBottom(rootWindowInsets));
        }
        return rect;
    }

    public static void setTransitionName(View view, int i) {
        if (VERSION.SDK_INT >= 21) {
            view.setTransitionName(view.getResources().getString(i));
        }
    }
}
