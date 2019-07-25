package com.miui.gallery.video.editor.widget.rangeseekbar.drawable;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public class VideoThumbnailBackgroundDrawable extends Drawable {
    private float mAspectRatio;
    private BitmapProvider mBitmapProvider = null;
    private Rect mBounds = new Rect();
    private int mDrawingLeft = Integer.MIN_VALUE;
    private Rect mDrawingRect = new Rect();
    private int mDrawingRight = Integer.MAX_VALUE;
    private int mLayoutDirection = 0;
    private Rect mPadding = new Rect();

    public interface BitmapProvider {
        Bitmap getBitmap(int i, int i2);
    }

    public void draw(Canvas canvas) {
        if (this.mBitmapProvider != null) {
            canvas.save();
            canvas.clipRect(this.mDrawingLeft, this.mBounds.top, this.mDrawingRight, this.mBounds.bottom);
            int width = (this.mBounds.width() - this.mPadding.left) - this.mPadding.right;
            int height = (int) (((float) ((this.mBounds.height() - this.mPadding.top) - this.mPadding.bottom)) * this.mAspectRatio);
            int i = 0;
            if (this.mLayoutDirection == 0) {
                int i2 = this.mBounds.left + this.mPadding.left;
                while (true) {
                    this.mDrawingRect.left = (height * i) + i2;
                    if (this.mDrawingRect.left > this.mDrawingRight) {
                        break;
                    }
                    i++;
                    this.mDrawingRect.right = (height * i) + i2;
                    if (this.mDrawingRect.right >= this.mDrawingLeft) {
                        this.mDrawingRect.top = this.mBounds.top + this.mPadding.top;
                        this.mDrawingRect.bottom = this.mBounds.bottom - this.mPadding.bottom;
                        Bitmap bitmap = this.mBitmapProvider.getBitmap(this.mDrawingRect.left - i2, width);
                        if (bitmap != null) {
                            canvas.drawBitmap(bitmap, null, this.mDrawingRect, null);
                        }
                    }
                }
            } else {
                int i3 = this.mBounds.right - this.mPadding.right;
                while (true) {
                    this.mDrawingRect.right = i3 - (height * i);
                    if (this.mDrawingRect.right < this.mDrawingLeft) {
                        break;
                    }
                    i++;
                    this.mDrawingRect.left = i3 - (height * i);
                    if (this.mDrawingRect.left <= this.mDrawingRight) {
                        this.mDrawingRect.top = this.mBounds.top + this.mPadding.top;
                        this.mDrawingRect.bottom = this.mBounds.bottom - this.mPadding.bottom;
                        Bitmap bitmap2 = this.mBitmapProvider.getBitmap(i3 - this.mDrawingRect.right, width);
                        if (bitmap2 != null) {
                            canvas.drawBitmap(bitmap2, null, this.mDrawingRect, null);
                        }
                    }
                }
            }
            canvas.restore();
        }
    }

    public int getOpacity() {
        return 0;
    }

    public int getPaddingBottom() {
        return this.mPadding.bottom;
    }

    public int getPaddingTop() {
        return this.mPadding.top;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.mBounds.set(rect);
    }

    public void setAlpha(int i) {
    }

    public void setAspectRatio(float f) {
        this.mAspectRatio = f;
    }

    public void setCLayoutDirection(int i) {
        this.mLayoutDirection = i;
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public void setDrawingArea(int i, int i2) {
        this.mDrawingLeft = i;
        this.mDrawingRight = i2;
    }

    public void setPadding(int i, int i2, int i3, int i4) {
        this.mPadding.set(i, i2, i3, i4);
    }

    public void setmBitmapProvider(BitmapProvider bitmapProvider) {
        this.mBitmapProvider = bitmapProvider;
    }
}
