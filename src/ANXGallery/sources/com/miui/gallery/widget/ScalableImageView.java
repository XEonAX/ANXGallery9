package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ImageView.ScaleType;

public class ScalableImageView extends ForegroundImageView {
    private float mMatrixScale;
    private Matrix mTempMatrix;
    private final float[] sMatrixValues;

    public ScalableImageView(Context context) {
        super(context);
        this.mMatrixScale = 0.0f;
        this.mTempMatrix = new Matrix();
        this.sMatrixValues = new float[9];
    }

    public ScalableImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ScalableImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mMatrixScale = 0.0f;
        this.mTempMatrix = new Matrix();
        this.sMatrixValues = new float[9];
    }

    private float getValue(Matrix matrix, int i) {
        matrix.getValues(this.sMatrixValues);
        return this.sMatrixValues[i];
    }

    private void postImageMatrixScale(float f) {
        Drawable drawable = getDrawable();
        if (drawable != null && f > 0.0f) {
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            if (intrinsicWidth > 0 && intrinsicHeight > 0) {
                float width = (float) getWidth();
                float f2 = (float) intrinsicWidth;
                float height = (float) getHeight();
                float f3 = (float) intrinsicHeight;
                float max = Math.max((width * 1.0f) / f2, (1.0f * height) / f3);
                float f4 = f2 * max;
                float f5 = f3 * max;
                float matrixScale = (max * f) / getMatrixScale();
                if (matrixScale > 0.0f) {
                    this.mTempMatrix.set(getImageMatrix());
                    this.mTempMatrix.postScale(matrixScale, matrixScale);
                    this.mTempMatrix.postTranslate((float) Math.round(((-((f4 * f) - width)) * 0.5f) - getValue(this.mTempMatrix, 2)), (float) Math.round(((-((f * f5) - height)) * 0.5f) - getValue(this.mTempMatrix, 5)));
                    setImageMatrix(this.mTempMatrix);
                }
            }
        }
    }

    public float getMatrixScale() {
        Matrix imageMatrix = getImageMatrix();
        return (float) Math.sqrt((double) (((float) Math.pow((double) getValue(imageMatrix, 0), 2.0d)) + ((float) Math.pow((double) getValue(imageMatrix, 3), 2.0d))));
    }

    /* access modifiers changed from: protected */
    public boolean setFrame(int i, int i2, int i3, int i4) {
        boolean frame = super.setFrame(i, i2, i3, i4);
        if (frame && getScaleType() == ScaleType.MATRIX) {
            postImageMatrixScale(this.mMatrixScale);
        }
        return frame;
    }

    public void setImageDrawable(Drawable drawable) {
        Drawable drawable2 = getDrawable();
        super.setImageDrawable(drawable);
        if (drawable2 != drawable && getScaleType() == ScaleType.MATRIX) {
            postImageMatrixScale(this.mMatrixScale);
        }
    }

    public void setMatrixScale(float f) {
        setScaleType(ScaleType.MATRIX);
        this.mMatrixScale = f;
        postImageMatrixScale(f);
    }

    public void setScaleType(ScaleType scaleType) {
        super.setScaleType(scaleType);
        if (scaleType != ScaleType.MATRIX) {
            this.mMatrixScale = 0.0f;
            setImageMatrix(null);
        }
    }
}
