package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.SweepGradient;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;

public class RotateRingView extends View {
    private static final float[] HEAD_POSITIONS = {0.75f, 1.0f};
    private int[] mChangeColors;
    private int mCircleX;
    private int mCircleY;
    private int mHeadMaxAlpha;
    private Paint mPaint;
    private int mProgress;
    private int mRadius;
    private RectF mRectF;
    private Matrix mRotateMatrix;
    private int mStrokeWidth;

    public RotateRingView(Context context) {
        this(context, null);
    }

    public RotateRingView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public RotateRingView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mRotateMatrix = new Matrix();
        this.mRectF = new RectF();
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mStrokeWidth = context.getResources().getDimensionPixelSize(R.dimen.rotate_ring_stroke_width);
        this.mPaint.setStrokeWidth((float) this.mStrokeWidth);
        this.mPaint.setStyle(Style.STROKE);
        this.mRadius = context.getResources().getDimensionPixelSize(R.dimen.rotate_ring_radius);
        this.mChangeColors = new int[]{Color.argb(96, 255, 255, 255), Color.argb(96, 255, 255, 255)};
    }

    public void drawRing(Canvas canvas) {
        this.mRotateMatrix.setRotate((float) this.mProgress, (float) this.mCircleX, (float) this.mCircleY);
        SweepGradient sweepGradient = new SweepGradient((float) this.mCircleX, (float) this.mCircleY, this.mChangeColors, HEAD_POSITIONS);
        sweepGradient.setLocalMatrix(this.mRotateMatrix);
        this.mPaint.setShader(sweepGradient);
        canvas.drawOval(this.mRectF, this.mPaint);
    }

    public int getCircleHeight() {
        return (this.mRadius * 2) + (this.mStrokeWidth * 2);
    }

    public int getHeadMaxAlpha() {
        return this.mHeadMaxAlpha;
    }

    public int getHeadMinAlpha() {
        return 96;
    }

    public int getProgress() {
        return this.mProgress;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.save();
        drawRing(canvas);
        canvas.restore();
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        this.mCircleX = i / 2;
        this.mCircleY = i2 / 2;
        this.mRectF.set((float) (this.mCircleX - this.mRadius), (float) (this.mCircleY - this.mRadius), (float) (this.mCircleX + this.mRadius), (float) (this.mCircleY + this.mRadius));
    }

    public void setHeadMaxAlpha(int i) {
        this.mHeadMaxAlpha = i;
        this.mChangeColors[1] = Color.argb(this.mHeadMaxAlpha, 255, 255, 255);
        invalidate();
    }

    public void setProgress(int i) {
        this.mProgress = i;
        invalidate();
    }

    public void setStartRotateStable() {
        setAlpha(1.0f);
        this.mHeadMaxAlpha = 255;
        this.mChangeColors[1] = Color.argb(this.mHeadMaxAlpha, 255, 255, 255);
    }
}
