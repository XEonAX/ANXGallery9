package com.miui.gallery.editor.photo.screen.home;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.ScreenUtils;
import miui.view.animation.QuarticEaseInOutInterpolator;

public class ScreenShareView extends View {
    /* access modifiers changed from: private */
    public AnimatorState mAnimatorState;
    private RectF mDstRect;
    private int mEnterFrom = 0;
    private Paint mPaint;
    private Matrix mResultMatrix = new Matrix();
    private RectF mResultRect;
    /* access modifiers changed from: private */
    public float mRoundRadius;
    private Bitmap mShareBitmap;
    private Rect mSrcRect;
    private int mThumbnailDstRectStartLeft;
    private int mThumbnailDstRectStartTop;
    /* access modifiers changed from: private */
    public int[] mThumbnailRect = new int[4];
    /* access modifiers changed from: private */
    public ValueAnimator mValueAnimator;

    public ScreenShareView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    /* access modifiers changed from: private */
    public void changeTransformRect(float f, int[] iArr) {
        this.mDstRect.left = (float) ((int) (((this.mResultRect.left - ((float) this.mThumbnailDstRectStartLeft)) * f) + ((float) this.mThumbnailDstRectStartLeft)));
        this.mDstRect.top = (float) ((int) (((this.mResultRect.top - ((float) this.mThumbnailDstRectStartTop)) * f) + ((float) this.mThumbnailDstRectStartTop)));
        this.mDstRect.right = (float) ((int) (((this.mResultRect.right - ((float) (this.mThumbnailDstRectStartLeft + iArr[2]))) * f) + ((float) (this.mThumbnailDstRectStartLeft + iArr[2]))));
        this.mDstRect.bottom = (float) ((int) (((this.mResultRect.bottom - ((float) (this.mThumbnailDstRectStartTop + iArr[3]))) * f) + ((float) (this.mThumbnailDstRectStartTop + iArr[3]))));
    }

    private void init(Context context) {
        this.mPaint = new Paint(1);
        this.mSrcRect = new Rect();
        this.mDstRect = new RectF(0.0f, 0.0f, (float) ScreenUtils.getScreenWidth(), (float) ScreenUtils.getExactScreenHeight((Activity) context));
        this.mResultRect = new RectF();
    }

    private void refreshResultRectF() {
        this.mResultMatrix.reset();
        this.mResultMatrix.setRectToRect(new RectF(this.mSrcRect), this.mDstRect, ScaleToFit.CENTER);
        this.mResultRect.set(this.mSrcRect);
        this.mResultMatrix.mapRect(this.mResultRect);
    }

    private void startAnimator(final ThumbnailAnimatorCallback thumbnailAnimatorCallback) {
        this.mValueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mValueAnimator.setDuration(450);
        this.mValueAnimator.setInterpolator(new QuarticEaseInOutInterpolator());
        this.mValueAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                if (thumbnailAnimatorCallback != null) {
                    ScreenShareView.this.mAnimatorState = AnimatorState.ANIMATOR_UPDATE;
                    ScreenShareView.this.mRoundRadius = ((float) ScreenShareView.this.getResources().getDimensionPixelSize(R.dimen.screen_editor_thumbnail_btn_radius)) * (1.0f - floatValue);
                    ScreenShareView.this.changeTransformRect(floatValue, ScreenShareView.this.mThumbnailRect);
                    thumbnailAnimatorCallback.onAnimationUpdate(floatValue);
                    ScreenShareView.this.invalidate();
                }
            }
        });
        this.mValueAnimator.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                if (thumbnailAnimatorCallback != null) {
                    ScreenShareView.this.mAnimatorState = AnimatorState.ANIMATOR_END;
                    ScreenShareView.this.invalidate();
                }
            }

            public void onAnimationStart(Animator animator) {
                super.onAnimationStart(animator);
                if (thumbnailAnimatorCallback != null) {
                    ScreenShareView.this.mAnimatorState = AnimatorState.ANIMATOR_START;
                    thumbnailAnimatorCallback.onAnimationStart();
                }
            }
        });
        postDelayed(new Runnable() {
            public void run() {
                ScreenShareView.this.mValueAnimator.start();
            }
        }, 30);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mShareBitmap != null && !this.mShareBitmap.isRecycled()) {
            if (this.mEnterFrom == 0) {
                canvas.drawBitmap(this.mShareBitmap, this.mSrcRect, this.mResultRect, this.mPaint);
                return;
            }
            if (this.mAnimatorState == AnimatorState.ANIMATOR_END) {
                canvas.drawBitmap(this.mShareBitmap, this.mSrcRect, this.mDstRect, this.mPaint);
            } else if (this.mAnimatorState == AnimatorState.ANIMATOR_PRE_START || this.mAnimatorState == AnimatorState.ANIMATOR_UPDATE) {
                Bitmap roundedCornerBitmap = BitmapUtils.getRoundedCornerBitmap(this.mShareBitmap, this.mRoundRadius, this.mThumbnailRect[2], this.mThumbnailRect[3]);
                canvas.drawBitmap(roundedCornerBitmap, new Rect(0, 0, roundedCornerBitmap.getWidth(), roundedCornerBitmap.getHeight()), this.mDstRect, this.mPaint);
            } else if (this.mAnimatorState == AnimatorState.ANIMATOR_START) {
                canvas.drawBitmap(this.mShareBitmap, this.mSrcRect, this.mDstRect, this.mPaint);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (this.mEnterFrom == 0) {
            this.mDstRect.set(0.0f, 0.0f, (float) i, (float) i2);
            refreshResultRectF();
        }
    }

    public void setShareBitmap(Bitmap bitmap, boolean z) {
        this.mShareBitmap = bitmap;
        this.mSrcRect.set(0, 0, bitmap.getWidth(), bitmap.getHeight());
        refreshResultRectF();
        if (z) {
            invalidate();
        }
    }

    public void startShareViewAnimator(ThumbnailAnimatorCallback thumbnailAnimatorCallback) {
        this.mThumbnailDstRectStartLeft = thumbnailAnimatorCallback.getThumbnailStartLeft();
        this.mThumbnailDstRectStartTop = thumbnailAnimatorCallback.getThumbnailStartTop();
        this.mRoundRadius = (float) getResources().getDimensionPixelSize(R.dimen.screen_editor_thumbnail_btn_radius);
        this.mAnimatorState = AnimatorState.ANIMATOR_PRE_START;
        this.mThumbnailRect = thumbnailAnimatorCallback.getThumbnailRect();
        changeTransformRect(0.0f, this.mThumbnailRect);
        thumbnailAnimatorCallback.onPrepareAnimatorStart();
        this.mEnterFrom = 1;
        invalidate();
        startAnimator(thumbnailAnimatorCallback);
    }
}
