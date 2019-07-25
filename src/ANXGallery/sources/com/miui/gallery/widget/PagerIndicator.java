package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import com.miui.gallery.R;

public class PagerIndicator extends View {
    private static int DEFAULT_CIRCLE_RADIUS_VALUE = 10;
    private static int DEFAULT_CIRCLE_SPACING_VALUE = 15;
    private static int DEFAULT_SELECTED_COLOR_VALUE;
    private static int DEFAULT_UNSELECTED_COLOR_VALUE;
    private int mCount;
    private int mIndex;
    private Paint mPaint;
    private int mRadius;
    private int mSelectedColor;
    private int mSpacing;
    private int mUnselectedColor;

    public PagerIndicator(Context context) {
        this(context, null);
    }

    public PagerIndicator(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PagerIndicator(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.PagerIndicator);
        this.mSpacing = obtainStyledAttributes.getDimensionPixelSize(1, DEFAULT_CIRCLE_SPACING_VALUE);
        this.mRadius = obtainStyledAttributes.getDimensionPixelSize(0, DEFAULT_CIRCLE_RADIUS_VALUE);
        this.mSelectedColor = obtainStyledAttributes.getColor(2, DEFAULT_SELECTED_COLOR_VALUE);
        this.mUnselectedColor = obtainStyledAttributes.getColor(3, DEFAULT_UNSELECTED_COLOR_VALUE);
        obtainStyledAttributes.recycle();
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
    }

    private int measureHeight(int i) {
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        if (mode == 1073741824) {
            return size;
        }
        int paddingTop = (this.mRadius * 2) + getPaddingTop() + getPaddingBottom();
        return mode == Integer.MIN_VALUE ? Math.min(paddingTop, size) : paddingTop;
    }

    private int measureWidth(int i) {
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        if (mode == 1073741824) {
            return size;
        }
        int paddingLeft = (this.mRadius * 2 * this.mCount) + (this.mSpacing * (this.mCount - 1)) + getPaddingLeft() + getPaddingRight();
        return mode == Integer.MIN_VALUE ? Math.min(paddingLeft, size) : paddingLeft;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.save();
        canvas.translate((float) getPaddingLeft(), (float) getPaddingTop());
        int i = this.mRadius;
        int i2 = this.mRadius;
        for (int i3 = 0; i3 < this.mCount; i3++) {
            if (i3 == this.mIndex) {
                this.mPaint.setColor(this.mSelectedColor);
            } else {
                this.mPaint.setColor(this.mUnselectedColor);
            }
            canvas.drawCircle((float) i, (float) i2, (float) this.mRadius, this.mPaint);
            i = i + (this.mRadius * 2) + this.mSpacing;
        }
        canvas.restore();
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        setMeasuredDimension(measureWidth(i), measureHeight(i2));
    }

    public void showIndex(int i, int i2) {
        if (i + 1 <= i2) {
            this.mIndex = i;
            if (this.mCount != i2) {
                this.mCount = i2;
                requestLayout();
            } else {
                invalidate();
            }
        }
    }
}
