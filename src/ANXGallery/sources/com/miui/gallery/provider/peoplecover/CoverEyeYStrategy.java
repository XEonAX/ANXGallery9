package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;

public class CoverEyeYStrategy extends BaseStrategy {
    public CoverEyeYStrategy(int i) {
        super(i);
    }

    public boolean isValid(Cursor cursor) {
        float f;
        float f2;
        if (cursor == null) {
            return false;
        }
        if (isXYReversed(cursor.getInt(11))) {
            f2 = cursor.getFloat(6) - cursor.getFloat(4);
            f = cursor.getFloat(2);
        } else {
            f2 = cursor.getFloat(7) - cursor.getFloat(5);
            f = cursor.getFloat(3);
        }
        return Math.abs(f2) < f * 0.1f;
    }
}
