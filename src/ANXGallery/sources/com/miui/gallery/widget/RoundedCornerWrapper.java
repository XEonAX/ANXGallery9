package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.RectF;
import android.graphics.Region.Op;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import com.miui.gallery.R;

public class RoundedCornerWrapper extends LinearLayout {
    private Paint mPaint;
    private int mRadius;

    public RoundedCornerWrapper(Context context) {
        this(context, null);
    }

    public RoundedCornerWrapper(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public RoundedCornerWrapper(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.RoundedCornerWrapper, i, 0);
        this.mRadius = obtainStyledAttributes.getDimensionPixelSize(0, 0);
        obtainStyledAttributes.recycle();
        ensurePaint();
    }

    private void ensurePaint() {
        if (this.mPaint == null) {
            this.mPaint = new Paint();
            this.mPaint.setAntiAlias(true);
            this.mPaint.setDither(true);
            this.mPaint.setColor(getResources().getColor(R.color.image_stroke_color_non_transparent));
            this.mPaint.setStrokeWidth(1.0f);
            this.mPaint.setStyle(Style.STROKE);
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        int saveLayer = canvas.saveLayer(0.0f, 0.0f, (float) getWidth(), (float) getHeight(), null, 31);
        Path path = new Path();
        RectF rectF = new RectF((float) getPaddingLeft(), (float) getPaddingTop(), (float) (getWidth() - getPaddingRight()), (float) (getHeight() - getPaddingBottom()));
        path.addRoundRect(rectF, (float) this.mRadius, (float) this.mRadius, Direction.CW);
        canvas.clipPath(path, Op.INTERSECT);
        super.dispatchDraw(canvas);
        canvas.drawRoundRect(rectF, (float) this.mRadius, (float) this.mRadius, this.mPaint);
        canvas.restoreToCount(saveLayer);
    }
}
