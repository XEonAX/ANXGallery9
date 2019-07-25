package com.miui.gallery.hybrid.pulltorefresh;

import android.annotation.TargetApi;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.view.View;

public class ViewCompat {

    @TargetApi(16)
    static class SDK16 {
        public static void postOnAnimation(View view, Runnable runnable) {
            view.postOnAnimation(runnable);
        }

        public static void setBackground(View view, Drawable drawable) {
            view.setBackground(drawable);
        }
    }

    public static void postOnAnimation(View view, Runnable runnable) {
        if (VERSION.SDK_INT >= 16) {
            SDK16.postOnAnimation(view, runnable);
        } else {
            view.postDelayed(runnable, 16);
        }
    }

    public static void setBackground(View view, Drawable drawable) {
        if (VERSION.SDK_INT >= 16) {
            SDK16.setBackground(view, drawable);
        } else {
            view.setBackgroundDrawable(drawable);
        }
    }
}
