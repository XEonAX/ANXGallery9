package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;

public class StrokeBoardView extends View {
    private RectF mBitmapBounds = new RectF();
    private Matrix mBitmapToCanvas = new Matrix();
    private RectF mCanvasBounds = new RectF();
    boolean mIsSetBitmap;
    private StrokeImageHelper mStrokeImageHelper;

    public StrokeBoardView(Context context) {
        super(context);
        init();
    }

    public StrokeBoardView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public StrokeBoardView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mStrokeImageHelper = new StrokeImageHelper(getContext());
    }

    private void resetMatrix() {
        this.mBitmapToCanvas.setRectToRect(this.mBitmapBounds, this.mCanvasBounds, ScaleToFit.CENTER);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mIsSetBitmap) {
            this.mStrokeImageHelper.draw(canvas, this.mBitmapBounds, this.mBitmapToCanvas);
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (this.mCanvasBounds.isEmpty()) {
            this.mCanvasBounds.left = (float) getPaddingLeft();
            this.mCanvasBounds.top = (float) getPaddingTop();
            this.mCanvasBounds.right = (float) (i - getPaddingRight());
            this.mCanvasBounds.bottom = (float) (i2 - getPaddingBottom());
            resetMatrix();
        }
    }

    public void setBitmap(Bitmap bitmap) {
        this.mIsSetBitmap = true;
        if (bitmap == null) {
            this.mBitmapBounds.right = 0.0f;
            this.mBitmapBounds.bottom = 0.0f;
        } else {
            this.mBitmapBounds.right = (float) bitmap.getWidth();
            this.mBitmapBounds.bottom = (float) bitmap.getHeight();
        }
        resetMatrix();
        invalidate();
    }
}
