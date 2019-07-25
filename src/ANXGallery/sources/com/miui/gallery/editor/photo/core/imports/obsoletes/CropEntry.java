package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import com.miui.gallery.editor.photo.core.common.model.IPositionChangeData;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableMatrix;

public class CropEntry implements IPositionChangeData {
    protected RectF mCropArea = new RectF();
    protected ParcelableMatrix mMatrix = new ParcelableMatrix();
    protected RectF mSampleSize = new RectF();

    public CropEntry() {
    }

    public CropEntry(RectF rectF, RectF rectF2, Matrix matrix, float f) {
        this.mSampleSize.set(rectF);
        this.mCropArea.set(rectF2);
        this.mMatrix.set(matrix);
        normalize(this.mSampleSize, this.mCropArea, this.mMatrix, f);
    }

    private static void normalize(RectF rectF, RectF rectF2, Matrix matrix, float f) {
        Matrix matrix2 = new Matrix();
        RectF rectF3 = new RectF();
        RectF rectF4 = new RectF();
        matrix2.setRotate(f);
        matrix2.mapRect(rectF4, rectF);
        matrix.mapRect(rectF3, rectF);
        matrix2.setScale(rectF4.width() / rectF3.width(), rectF4.height() / rectF3.height());
        matrix2.mapRect(rectF2);
        matrix.postConcat(matrix2);
    }

    public Bitmap apply(Bitmap bitmap) {
        Matrix matrix = new Matrix();
        float width = this.mSampleSize.width() / ((float) bitmap.getWidth());
        float height = this.mSampleSize.height() / ((float) bitmap.getHeight());
        matrix.set(this.mMatrix);
        matrix.postTranslate(-this.mCropArea.left, -this.mCropArea.top);
        matrix.preScale(width, height);
        matrix.postScale(1.0f / width, 1.0f / height);
        int round = Math.round(this.mCropArea.width() / width);
        int round2 = Math.round(this.mCropArea.height() / height);
        if (round <= 0 || round2 <= 0) {
            return null;
        }
        Bitmap createBitmap = Bitmap.createBitmap(round, round2, Config.ARGB_8888);
        new Canvas(createBitmap).drawBitmap(bitmap, matrix, new Paint(3));
        return createBitmap;
    }

    public void refreshTargetAreaPosition(RectF rectF, RectF rectF2) {
        Matrix matrix = new Matrix();
        float width = this.mSampleSize.width() / rectF.width();
        float height = this.mSampleSize.height() / rectF.height();
        matrix.set(this.mMatrix);
        matrix.postTranslate(-this.mCropArea.left, -this.mCropArea.top);
        matrix.preScale(width, height);
        matrix.postScale(1.0f / width, 1.0f / height);
        matrix.mapRect(rectF2);
        rectF.set(new RectF(0.0f, 0.0f, (float) Math.round(this.mCropArea.width() / width), (float) Math.round(this.mCropArea.height() / height)));
    }
}
