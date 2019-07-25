package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.util.MiscUtil;

public class ColorRingProgress extends View {
    private int mBackColor;
    private int mColorInterval;
    private float mColorIntervalPercent;
    private int mForeColor;
    private Paint mPaint;
    private float mProgress;
    private RectF mRectF;
    private int mThickness;

    public ColorRingProgress(Context context) {
        super(context);
        init(context, null, 0, 0);
    }

    public ColorRingProgress(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context, attributeSet, 0, 0);
    }

    public ColorRingProgress(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context, attributeSet, i, 0);
    }

    private void init(Context context, AttributeSet attributeSet, int i, int i2) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ColorRingProgress, i, i2);
        this.mForeColor = obtainStyledAttributes.getColor(2, -1);
        this.mBackColor = obtainStyledAttributes.getColor(0, -6899465);
        this.mThickness = obtainStyledAttributes.getDimensionPixelSize(3, 14);
        this.mColorInterval = obtainStyledAttributes.getDimensionPixelSize(1, 0);
        obtainStyledAttributes.recycle();
        this.mRectF = new RectF();
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth((float) this.mThickness);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (getWidth() * getHeight() > 0) {
            float f = (this.mColorIntervalPercent * 360.0f) / 2.0f;
            if (1.0f - this.mProgress < this.mColorIntervalPercent * 2.0f || MiscUtil.floatEquals(this.mProgress, 0.0f)) {
                f = 0.0f;
            }
            float f2 = -90.0f - f;
            this.mPaint.setColor(0);
            float f3 = 2.0f * f;
            if (f3 > 0.0f) {
                canvas.drawArc(this.mRectF, f2, f3, false, this.mPaint);
            }
            this.mPaint.setColor(this.mForeColor);
            float f4 = f2 + f3;
            float f5 = (this.mProgress * 360.0f) - f;
            float f6 = f4 + f5 > 270.0f ? 270.0f - f4 : f5;
            if (f6 > 0.0f) {
                canvas.drawArc(this.mRectF, f4, f6, false, this.mPaint);
            }
            this.mPaint.setColor(0);
            float f7 = f4 + f6;
            if (f3 > 0.0f) {
                canvas.drawArc(this.mRectF, f7, f3, false, this.mPaint);
            }
            this.mPaint.setColor(this.mBackColor);
            float f8 = f7 + f3;
            float f9 = (270.0f - f8) - f;
            if (f9 > 0.0f) {
                canvas.drawArc(this.mRectF, f8, f9, false, this.mPaint);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.mRectF.set((float) this.mThickness, (float) this.mThickness, (float) (getWidth() - this.mThickness), (float) (getHeight() - this.mThickness));
        double d = (double) this.mColorInterval;
        double width = (double) getWidth();
        Double.isNaN(width);
        double d2 = width * 3.141592653589793d;
        Double.isNaN(d);
        this.mColorIntervalPercent = (float) (d / d2);
    }

    public void setBackgroundColor(int i) {
        this.mBackColor = i;
        invalidate();
    }

    public void setForegroundColor(int i) {
        this.mForeColor = i;
        invalidate();
    }

    public void setProgress(float f) {
        this.mProgress = Math.min(Math.max(f, 0.0f), 1.0f);
        invalidate();
    }
}
