package com.miui.gallery.collage.core.poster;

import android.graphics.RectF;

public class ElementPositionModel {
    public float height;
    public int locationType;
    public float width;
    public float x;
    public float y;

    public static void getRectByLocation(RectF rectF, ElementPositionModel elementPositionModel, float f, float f2, int i, int i2, boolean z) {
        float f3 = (float) i;
        float f4 = elementPositionModel.x * f3;
        float f5 = elementPositionModel.y * ((float) i2);
        switch (elementPositionModel.locationType) {
            case 0:
                rectF.left = f4;
                rectF.top = f5;
                break;
            case 1:
                rectF.left = f4;
                rectF.top = f5 - (f2 / 2.0f);
                break;
            case 2:
                rectF.left = f4;
                rectF.top = f5 - f2;
                break;
            case 3:
                rectF.left = f4 - (f / 2.0f);
                rectF.top = f5;
                break;
            case 4:
                rectF.left = f4 - (f / 2.0f);
                rectF.top = f5 - (f2 / 2.0f);
                break;
            case 5:
                rectF.left = f4 - (f / 2.0f);
                rectF.top = f5 - f2;
                break;
            case 6:
                rectF.left = f4 - f;
                rectF.top = f5;
                break;
            case 7:
                rectF.left = f4 - f;
                rectF.top = f5 - (f2 / 2.0f);
                break;
            case 8:
                rectF.left = f4 - f;
                rectF.top = f5 - f2;
                break;
        }
        if (z) {
            rectF.left = (f3 - rectF.left) - f;
        }
        rectF.right = rectF.left + f;
        rectF.bottom = rectF.top + f2;
    }
}
