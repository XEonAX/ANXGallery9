package com.miui.gallery.provider.peoplecover;

import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.RectF;
import android.support.media.ExifInterface;
import android.text.TextUtils;
import com.miui.gallery.util.DecodeRegionImageUtils;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.face.FaceRegionRectF;

public class CoverColorStrategy extends BaseStrategy {
    private PeopleCoverReusedBitCache mBitCache = new PeopleCoverReusedBitCache();

    public CoverColorStrategy(int i) {
        super(i);
    }

    private Bitmap getCoverBitmap(String str, RectF rectF) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            Bitmap decodeFaceRegion = DecodeRegionImageUtils.decodeFaceRegion(rectF, str, 1.0f, 50, ((ExifInterface) ExifUtil.sSupportExifCreator.create(str)).getAttributeInt("Orientation", 1), this.mBitCache);
            this.mBitCache.put(decodeFaceRegion);
            return decodeFaceRegion;
        } catch (Throwable unused) {
            return null;
        } finally {
            MiscUtil.closeSilently(null);
        }
    }

    private String getCoverFilePath(Cursor cursor) {
        String string = cursor.getString(15);
        if (TextUtils.isEmpty(string)) {
            string = cursor.getString(16);
        }
        return TextUtils.isEmpty(string) ? cursor.getString(14) : string;
    }

    public FaceRegionRectF getFaceRegionRectF(Cursor cursor) {
        FaceRegionRectF faceRegionRectF = new FaceRegionRectF(cursor.getFloat(0), cursor.getFloat(1), cursor.getFloat(2) + cursor.getFloat(0), cursor.getFloat(1) + cursor.getFloat(3), cursor.getInt(11));
        return faceRegionRectF;
    }

    public boolean isValid(Cursor cursor) {
        Bitmap coverBitmap = getCoverBitmap(getCoverFilePath(cursor), getFaceRegionRectF(cursor));
        if (coverBitmap == null) {
            return false;
        }
        int height = coverBitmap.getHeight();
        int width = coverBitmap.getWidth();
        for (int i = 0; i < width; i++) {
            for (int i2 = 0; i2 < height; i2++) {
                int pixel = coverBitmap.getPixel(i, i2);
                int red = Color.red(pixel);
                int blue = Color.blue(pixel);
                int green = Color.green(pixel);
                int max = Math.max(red, Math.max(green, blue));
                int min = Math.min(red, Math.min(green, blue));
                float f = max == 0 ? 0.0f : ((float) (max - min)) / ((float) max);
                float f2 = (((float) (max + min)) / 255.0f) / 2.0f;
                if (f > 0.25f && f2 > 0.25f && f2 < 0.75f) {
                    return true;
                }
            }
        }
        return false;
    }

    public void onFinish() {
        this.mBitCache.clear();
    }
}
