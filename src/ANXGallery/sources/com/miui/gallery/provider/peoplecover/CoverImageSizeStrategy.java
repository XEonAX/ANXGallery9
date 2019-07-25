package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;
import android.graphics.Rect;
import android.graphics.RectF;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.util.DecodeRegionImageUtils;

public class CoverImageSizeStrategy extends BaseStrategy {
    public CoverImageSizeStrategy(int i) {
        super(i);
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
        return DecodeRegionImageUtils.roundToSquareAndScale(new Rect((int) (facePositionRect.left * f), (int) (facePositionRect.top * f2), (int) (facePositionRect.right * f), (int) (facePositionRect.bottom * f2)), i, i2, 1.5f).width() >= GalleryApp.sGetAndroidContext().getResources().getDimensionPixelSize(R.dimen.people_face_size_large);
    }
}
