package com.miui.gallery.util.photoview;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.Log;

public class TileBit {
    private static final Rect sTileRect = new Rect();
    private Bitmap mBitmap;
    private int mValidateHeight;
    private int mValidateWidth;

    public TileBit(Bitmap bitmap, int i, int i2) {
        this.mBitmap = bitmap;
        this.mValidateWidth = i;
        this.mValidateHeight = i2;
    }

    public void draw(Canvas canvas, RectF rectF, Paint paint) {
        sTileRect.set(0, 0, getValidateWidth(), getValidateHeight());
        canvas.drawBitmap(this.mBitmap, sTileRect, rectF, paint);
    }

    public int getValidateHeight() {
        return this.mValidateHeight;
    }

    public int getValidateWidth() {
        return this.mValidateWidth;
    }

    public boolean isContentValidate() {
        return BitmapUtils.isValidate(this.mBitmap);
    }

    public void recycle(BitmapRecycleCallback bitmapRecycleCallback) {
        if (isContentValidate()) {
            if (bitmapRecycleCallback != null) {
                bitmapRecycleCallback.recycle(this.mBitmap);
            } else {
                Log.i("TileBit", "recycle bitmap: %s", (Object) this.mBitmap);
                this.mBitmap.recycle();
            }
        }
        this.mBitmap = null;
    }
}
