package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;
import android.graphics.Rect;
import android.graphics.RectF;

public class CoverScaleStrategy extends BaseStrategy {
    public CoverScaleStrategy(int i) {
        super(i);
    }

    public static boolean isFaceFullInDisplayRect(Rect rect, int i, int i2) {
        return Math.max(rect.right - rect.left, rect.bottom - rect.top) <= Math.min(Math.min(rect.centerX(), rect.centerY()), Math.min(i - rect.centerX(), i2 - rect.centerY())) * 2;
    }

    public boolean isValid(Cursor cursor) {
        if (cursor == null) {
            return false;
        }
        int i = cursor.getInt(12);
        int i2 = cursor.getInt(13);
        RectF facePositionRect = getFacePositionRect(cursor);
        float f = (float) i;
        float f2 = (float) i2;
        return isFaceFullInDisplayRect(new Rect((int) (facePositionRect.left * f), (int) (facePositionRect.top * f2), (int) (facePositionRect.right * f), (int) (facePositionRect.bottom * f2)), i, i2);
    }
}
