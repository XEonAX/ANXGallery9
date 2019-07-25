package com.miui.gallery.video.editor.widget.rangeseekbar.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public class ThumbDrawable extends Drawable {
    private String TAG = "ThumbDrawable";
    private Rect mBounds = new Rect();
    private Drawable mDrawable;
    private int mDrawingLeft = Integer.MIN_VALUE;
    private int mDrawingRight = Integer.MAX_VALUE;
    private Point mLocation = new Point();
    private Rect mPadding = new Rect();
    private Paint mPaint = new Paint();

    public ThumbDrawable(Drawable drawable) {
        this.mDrawable = drawable;
        this.mPaint.setColor(-65536);
        this.mPaint.setTextSize(50.0f);
    }

    private int getDrawableExcludedPaddingCenterX() {
        Rect rect = new Rect();
        this.mDrawable.getPadding(rect);
        return this.mPadding.left + rect.left + (((this.mDrawable.getBounds().width() - rect.left) - rect.right) / 2);
    }

    public void draw(Canvas canvas) {
        this.mDrawable.draw(canvas);
    }

    public int getAlpha() {
        return this.mDrawable.getAlpha();
    }

    public int getIntrinsicHeight() {
        return this.mDrawable.getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return this.mDrawable.getIntrinsicWidth();
    }

    public int getLocationX() {
        return this.mLocation.x;
    }

    public int getOpacity() {
        return this.mDrawable.getOpacity();
    }

    public int getPaddingLeft() {
        return getDrawableExcludedPaddingCenterX();
    }

    public int getPaddingRight() {
        return this.mBounds.width() - getDrawableExcludedPaddingCenterX();
    }

    public void moveLeftThumb(int i, int i2) {
        int drawableExcludedPaddingCenterX = getDrawableExcludedPaddingCenterX();
        this.mBounds.offsetTo((i - drawableExcludedPaddingCenterX) - drawableExcludedPaddingCenterX, i2 - (this.mBounds.height() / 2));
        setBounds(this.mBounds);
    }

    public void moveProgressThumb(int i, int i2) {
        int drawableExcludedPaddingCenterX = getDrawableExcludedPaddingCenterX();
        this.mBounds.offsetTo((i - drawableExcludedPaddingCenterX) - drawableExcludedPaddingCenterX, i2 - (this.mBounds.height() / 2));
        setBounds(this.mBounds);
    }

    public void moveRightThumb(int i, int i2) {
        this.mBounds.offsetTo(i, i2 - (this.mBounds.height() / 2));
        setBounds(this.mBounds);
    }

    public void moveTo(int i, int i2) {
        this.mBounds.offsetTo(i - getDrawableExcludedPaddingCenterX(), i2 - (this.mBounds.height() / 2));
        setBounds(this.mBounds);
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        this.mLocation.x = rect.left + getDrawableExcludedPaddingCenterX();
        this.mLocation.y = rect.centerY();
        this.mDrawable.setBounds(rect.left + this.mPadding.left, rect.top + this.mPadding.top, rect.right - this.mPadding.right, rect.bottom - this.mPadding.bottom);
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

    public void setPadding(int i, int i2, int i3, int i4) {
        this.mPadding.set(i, i2, i3, i4);
        onBoundsChange(this.mBounds);
    }

    public void setSize(int i, int i2) {
        int i3 = i / 2;
        this.mBounds.left = this.mLocation.x - i3;
        int i4 = i2 / 2;
        this.mBounds.top = this.mLocation.y - i4;
        this.mBounds.right = this.mLocation.x + i3;
        this.mBounds.bottom = this.mLocation.y + i4;
        setBounds(this.mBounds);
    }
}
