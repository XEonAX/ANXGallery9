package com.miui.gallery.editor.photo.core.common.model;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;

public abstract class BaseDrawNode {
    private RectF mBitmapRect;
    private Matrix mTempMatrix;

    public abstract void draw(Canvas canvas);

    public void draw(Canvas canvas, RectF rectF) {
        if (this.mBitmapRect == null || rectF == null) {
            draw(canvas);
            return;
        }
        canvas.save();
        this.mTempMatrix.setRectToRect(this.mBitmapRect, rectF, ScaleToFit.FILL);
        canvas.concat(this.mTempMatrix);
        draw(canvas);
        canvas.restore();
    }

    public void setBitmapRect(RectF rectF) {
        if (rectF != null) {
            this.mBitmapRect = rectF;
            this.mTempMatrix = new Matrix();
        }
    }
}
