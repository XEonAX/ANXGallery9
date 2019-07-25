package com.edmodo.cropper.util;

import android.graphics.RectF;

public class AspectRatioUtil {
    public static float calculateAspectRatio(float f, float f2, float f3, float f4) {
        return (f3 - f) / (f4 - f2);
    }

    public static float calculateAspectRatio(RectF rectF) {
        return rectF.width() / rectF.height();
    }

    public static float calculateBottom(float f, float f2, float f3, float f4) {
        return ((f3 - f) / f4) + f2;
    }

    public static float calculateHeight(float f, float f2) {
        return f / f2;
    }

    public static float calculateLeft(float f, float f2, float f3, float f4) {
        return f2 - (f4 * (f3 - f));
    }

    public static float calculateRight(float f, float f2, float f3, float f4) {
        return (f4 * (f3 - f2)) + f;
    }

    public static float calculateTop(float f, float f2, float f3, float f4) {
        return f3 - ((f2 - f) / f4);
    }

    public static float calculateWidth(float f, float f2) {
        return f2 * f;
    }
}
