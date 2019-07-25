package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;

public class CircleStrokeProgressBar extends CircleProgressBar {
    private int[] mMiddleStrokeColors;
    private Paint mMiddleStrokePaint;
    private float mMiddleStrokeWidth;

    public CircleStrokeProgressBar(Context context) {
        this(context, null);
    }

    public CircleStrokeProgressBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CircleStrokeProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        setIndeterminate(false);
        this.mMiddleStrokePaint = new Paint(1);
        this.mMiddleStrokePaint.setStyle(Style.STROKE);
    }

    /* access modifiers changed from: protected */
    public synchronized void onDraw(Canvas canvas) {
        if (this.mMiddleStrokeColors != null && this.mMiddleStrokeWidth > 0.0f) {
            Drawable middleDrawable = getMiddleDrawable(getCurrentLevel());
            if (middleDrawable != null) {
                this.mMiddleStrokePaint.setColor(this.mMiddleStrokeColors[getCurrentLevel()]);
                this.mMiddleStrokePaint.setStrokeWidth(this.mMiddleStrokeWidth);
                canvas.drawArc(new RectF(middleDrawable.getBounds()), -90.0f, getRate() * 360.0f, true, this.mMiddleStrokePaint);
            }
        }
        super.onDraw(canvas);
    }

    public void setMiddleStrokeColors(int[] iArr, float f) {
        this.mMiddleStrokeColors = iArr;
        this.mMiddleStrokeWidth = f;
    }
}
