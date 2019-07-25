package com.miui.gallery.editor.photo.screen.crop;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.RectF;

public class ScreenCropEntry {
    private RectF mBitmapArea;
    protected RectF mCropArea = new RectF();

    public ScreenCropEntry(RectF rectF, RectF rectF2) {
        this.mCropArea.set(rectF);
        this.mBitmapArea = rectF2;
    }

    public Bitmap apply(Bitmap bitmap) {
        Matrix matrix = new Matrix();
        matrix.setRectToRect(this.mBitmapArea, new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight()), ScaleToFit.FILL);
        matrix.mapRect(this.mCropArea);
        Bitmap createBitmap = Bitmap.createBitmap((int) (this.mCropArea.width() + 0.5f), (int) (this.mCropArea.height() + 0.5f), Config.ARGB_8888);
        new Canvas(createBitmap).drawBitmap(bitmap, (float) (-((int) (this.mCropArea.left + 0.5f))), (float) (-((int) (this.mCropArea.top + 0.5f))), new Paint(3));
        return createBitmap;
    }
}
