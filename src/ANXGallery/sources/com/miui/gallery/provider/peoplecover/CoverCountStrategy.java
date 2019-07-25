package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import java.util.ArrayList;

public class CoverCountStrategy extends BaseStrategy {
    public CoverCountStrategy(int i) {
        super(i);
    }

    public boolean isValid(Cursor cursor) {
        if (cursor == null) {
            return false;
        }
        ArrayList brothers = NormalPeopleFaceMediaSet.getBrothers(cursor.getString(9));
        return (brothers == null ? 0 : brothers.size()) <= 3;
    }
}
