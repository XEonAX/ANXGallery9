package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;

public class CoverEyeXStrategy extends BaseStrategy {
    public CoverEyeXStrategy(int i) {
        super(i);
    }

    public boolean isValid(Cursor cursor) {
        float f;
        float f2;
        float f3;
        boolean z = false;
        if (cursor == null) {
            return false;
        }
        if (isXYReversed(cursor.getInt(11))) {
            float f4 = cursor.getFloat(1);
            float f5 = cursor.getFloat(3) + f4;
            f2 = Math.abs(f4 - f5);
            f3 = Math.abs(cursor.getFloat(5) - f4);
            f = Math.abs(cursor.getFloat(7) - f5);
        } else {
            float f6 = cursor.getFloat(0);
            float f7 = cursor.getFloat(2) + f6;
            f2 = Math.abs(f6 - f7);
            f3 = Math.abs(cursor.getFloat(4) - f6);
            f = Math.abs(cursor.getFloat(6) - f7);
        }
        if (Math.abs(f3 - f) < f2 * 0.05f) {
            z = true;
        }
        return z;
    }
}
