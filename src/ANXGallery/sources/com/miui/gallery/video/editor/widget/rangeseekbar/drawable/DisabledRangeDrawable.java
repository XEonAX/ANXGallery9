package com.miui.gallery.video.editor.widget.rangeseekbar.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public class DisabledRangeDrawable extends Drawable {
    private Rect mBounds = new Rect();
    private Drawable mDrawable;
    private int mDrawingLeft = Integer.MIN_VALUE;
    private int mDrawingRight = Integer.MAX_VALUE;
    private float mEndRangeScale;
    private int mPaddingBottom;
    private int mPaddingLeft;
    private int mPaddingRight;
    private int mPaddingTop;
    private float mStartRangeScale;

    public DisabledRangeDrawable(Drawable drawable) {
        this.mDrawable = drawable;
    }

    public void draw(Canvas canvas) {
        canvas.save();
        canvas.clipRect(this.mDrawingLeft, this.mBounds.top, this.mDrawingRight, this.mBounds.bottom);
        float width = (float) ((this.mBounds.width() - this.mPaddingLeft) - this.mPaddingRight);
        this.mDrawable.setBounds(this.mBounds.left + this.mPaddingLeft, this.mBounds.top + this.mPaddingTop, this.mBounds.left + this.mPaddingLeft + ((int) (this.mStartRangeScale * width)), this.mBounds.bottom - this.mPaddingBottom);
        this.mDrawable.draw(canvas);
        this.mDrawable.setBounds(this.mBounds.left + this.mPaddingLeft + ((int) (width * this.mEndRangeScale)), this.mBounds.top + this.mPaddingTop, this.mBounds.right - this.mPaddingRight, this.mBounds.bottom - this.mPaddingBottom);
        this.mDrawable.draw(canvas);
        canvas.restore();
    }

    public int getOpacity() {
        return this.mDrawable.getOpacity();
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.mBounds.set(rect);
    }

    public void setAlpha(int i) {
        this.mDrawable.setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.mDrawable.setColorFilter(colorFilter);
    }

    public void setDrawingArea(int i, int i2) {
        this.mDrawingLeft = i;
        this.mDrawingRight = i2;
    }

    public void setEndRangeScale(float f) {
        this.mEndRangeScale = f;
    }

    public void setPadding(int i, int i2, int i3, int i4) {
        this.mPaddingLeft = i;
        this.mPaddingTop = i2;
        this.mPaddingRight = i3;
        this.mPaddingBottom = i4;
    }

    public void setStartRangeScale(float f) {
        this.mStartRangeScale = f;
    }
}
