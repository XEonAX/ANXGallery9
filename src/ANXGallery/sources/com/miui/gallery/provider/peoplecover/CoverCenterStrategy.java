package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;

public class CoverCenterStrategy extends BaseStrategy {
    public CoverCenterStrategy(int i) {
        super(i);
    }

    public boolean isValid(Cursor cursor) {
        float f;
        float f2;
        if (cursor == null) {
            return false;
        }
        if (isXYReversed(cursor.getInt(11))) {
            f2 = cursor.getFloat(1);
            f = cursor.getFloat(3) + f2;
        } else {
            f2 = cursor.getFloat(0);
            f = cursor.getFloat(2) + f2;
        }
        return f >= 0.25f && f2 <= 0.75f;
    }
}
