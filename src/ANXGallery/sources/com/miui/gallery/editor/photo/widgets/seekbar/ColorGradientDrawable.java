package com.miui.gallery.editor.photo.widgets.seekbar;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Drawable;

public class ColorGradientDrawable extends Drawable {
    private int[] mColors;
    private int mHeight;
    private LinearGradient mLinearGradient;
    private Paint mPaint;
    private Rect mRect;
    private int mWidth;

    public ColorGradientDrawable(int[] iArr) {
        this(iArr, -1, -1);
    }

    public ColorGradientDrawable(int[] iArr, int i, int i2) {
        this.mRect = new Rect();
        this.mPaint = new Paint();
        this.mColors = iArr;
        this.mWidth = i;
        this.mHeight = i2;
    }

    public void draw(Canvas canvas) {
        canvas.drawRect(getBounds(), this.mPaint);
    }

    public int[] getColors() {
        return this.mColors;
    }

    public int getIntrinsicHeight() {
        return this.mHeight;
    }

    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    public int getOpacity() {
        return -1;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, (float) rect.width(), 0.0f, this.mColors, null, TileMode.CLAMP);
        this.mLinearGradient = linearGradient;
        this.mPaint.setShader(this.mLinearGradient);
        this.mRect.set(rect);
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
