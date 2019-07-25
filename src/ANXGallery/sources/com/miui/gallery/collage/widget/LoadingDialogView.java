package com.miui.gallery.collage.widget;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import com.miui.gallery.R;
import miui.util.Log;

public class LoadingDialogView extends View {
    private AnimatorUpdateListener mAnimatorUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            LoadingDialogView.this.mDegree = ((Integer) valueAnimator.getAnimatedValue()).intValue();
            LoadingDialogView.this.invalidate();
        }
    };
    private RectF mBitmapRect = new RectF();
    private Paint mColorPaint = new Paint(1);
    /* access modifiers changed from: private */
    public int mDegree = 0;
    private int mLoadingPadding;
    private Bitmap mLoadingProgress;
    private Matrix mMatrix = new Matrix();
    private Paint mPaint = new Paint(3);
    private RectF mProgressRect = new RectF();
    private ValueAnimator mValueAnimator;
    private RectF mViewRect = new RectF();

    public LoadingDialogView(Context context) {
        super(context);
        init();
    }

    public LoadingDialogView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public LoadingDialogView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    public void init() {
        this.mColorPaint.setColor(-1);
        this.mColorPaint.setStyle(Style.FILL);
        this.mLoadingProgress = BitmapFactory.decodeResource(getResources(), R.drawable.collage_loading_progress);
        this.mBitmapRect.set(0.0f, 0.0f, (float) this.mLoadingProgress.getWidth(), (float) this.mLoadingProgress.getHeight());
        this.mValueAnimator = ValueAnimator.ofInt(new int[]{0, 359});
        this.mValueAnimator.setDuration(800);
        this.mValueAnimator.setRepeatCount(-1);
        this.mValueAnimator.addUpdateListener(this.mAnimatorUpdateListener);
        this.mValueAnimator.setInterpolator(new LinearInterpolator());
        this.mLoadingPadding = getResources().getDimensionPixelSize(R.dimen.collage_loading_progress_size_padding);
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mValueAnimator.start();
        Log.d("LoadingDialogView", "onAttachedToWindow");
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mValueAnimator.cancel();
        Log.d("LoadingDialogView", "onDetachedFromWindow");
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        canvas.drawOval(this.mViewRect, this.mColorPaint);
        canvas.save();
        canvas.rotate((float) this.mDegree, this.mViewRect.centerX(), this.mViewRect.centerY());
        canvas.drawBitmap(this.mLoadingProgress, this.mMatrix, this.mPaint);
        canvas.restore();
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mViewRect.set(0.0f, 0.0f, (float) i, (float) i2);
        this.mProgressRect.set(this.mViewRect);
        this.mProgressRect.inset((float) this.mLoadingPadding, (float) this.mLoadingPadding);
        this.mMatrix.reset();
        this.mMatrix.setRectToRect(this.mBitmapRect, this.mViewRect, ScaleToFit.CENTER);
    }
}
