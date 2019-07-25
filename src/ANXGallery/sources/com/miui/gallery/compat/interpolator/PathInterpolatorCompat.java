package com.miui.gallery.compat.interpolator;

import android.os.Build.VERSION;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.PathInterpolator;

public class PathInterpolatorCompat {
    public static Interpolator getPathInterpolator(float f, float f2, float f3, float f4) {
        return VERSION.SDK_INT >= 21 ? new PathInterpolator(f, f2, f3, f4) : new LinearInterpolator();
    }
}
