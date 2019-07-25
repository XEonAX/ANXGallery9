package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;

public class PercentCircleView extends View {
    private RectF mArcRectF;
    private int mBackgroundColor;
    private Paint mBackgroundPaint;
    private float mBgRadius;
    private int mCircleX;
    private int mCircleY;
    private float mCurrentAngle = 90.0f;
    private float mInnerRadius;
    private int mProgressColor;
    private Paint mProgressPaint;
    private int mRingColor;
    private Paint mRingPaint;
    private float mStartSweepValue;
    private float mStoke;

    public PercentCircleView(Context context) {
        super(context);
        init();
    }

    public PercentCircleView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public PercentCircleView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mBackgroundColor = -15031809;
        this.mRingColor = -2130706433;
        this.mProgressColor = -1;
        this.mBgRadius = getResources().getDimension(R.dimen.editor_progress_circle_bg_size) / 2.0f;
        this.mInnerRadius = getResources().getDimension(R.dimen.editor_progress_circle_inner_size) / 2.0f;
        this.mStoke = getResources().getDimension(R.dimen.editor_progress_circle_stoke_size);
        this.mStartSweepValue = -90.0f;
        this.mBackgroundPaint = new Paint();
        this.mBackgroundPaint.setAntiAlias(true);
        this.mBackgroundPaint.setColor(this.mBackgroundColor);
        this.mBackgroundPaint.setStyle(Style.FILL);
        this.mRingPaint = new Paint();
        this.mRingPaint.setAntiAlias(true);
        this.mRingPaint.setColor(this.mRingColor);
        this.mRingPaint.setStyle(Style.STROKE);
        this.mRingPaint.setStrokeWidth(this.mStoke);
        this.mProgressPaint = new Paint();
        this.mProgressPaint.setAntiAlias(true);
        this.mProgressPaint.setColor(this.mProgressColor);
        this.mProgressPaint.setStyle(Style.STROKE);
        this.mProgressPaint.setStrokeWidth(this.mStoke);
        this.mProgressPaint.setStrokeJoin(Join.ROUND);
        this.mProgressPaint.setStrokeCap(Cap.ROUND);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawCircle((float) this.mCircleX, (float) this.mCircleY, this.mBgRadius, this.mBackgroundPaint);
        canvas.drawCircle((float) this.mCircleX, (float) this.mCircleY, this.mInnerRadius, this.mRingPaint);
        canvas.drawArc(this.mArcRectF, this.mStartSweepValue, this.mCurrentAngle, false, this.mProgressPaint);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        this.mCircleX = getMeasuredWidth() / 2;
        this.mCircleY = getMeasuredHeight() / 2;
        this.mArcRectF = new RectF(((float) this.mCircleX) - this.mInnerRadius, ((float) this.mCircleY) - this.mInnerRadius, ((float) this.mCircleX) + this.mInnerRadius, ((float) this.mCircleY) + this.mInnerRadius);
    }

    public void setPercent(float f) {
        this.mCurrentAngle = f * 360.0f;
        invalidate();
    }
}
