package com.miui.gallery.editor.photo.core.imports.longcrop;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import com.miui.gallery.editor.photo.screen.home.AnimatorState;
import miui.view.animation.QuarticEaseInOutInterpolator;

public class LongCropViewAnimatorHelper {
    /* access modifiers changed from: private */
    public AnimatorState mAnimatorState = AnimatorState.ANIMATOR_END;
    private Rect mDstRect = new Rect();
    private Bitmap mPreBitmap;
    private int[] mScreenRect = {0, 0, 0, 0};
    private Rect mSrcRect = new Rect();
    private int mStartBottom;
    private int mStartLeft;
    private int mStartRight;
    private int mStartTop;

    interface Callback {
        Bitmap getPreBitmap();

        Rect getShowRect();

        void onInvalidate();
    }

    private void animatorPreStart(Callback callback) {
        this.mAnimatorState = AnimatorState.ANIMATOR_PRE_START;
        this.mStartBottom = this.mScreenRect[3];
        this.mStartTop = this.mStartBottom - Math.round((((float) this.mScreenRect[2]) / ((float) callback.getPreBitmap().getWidth())) * ((float) callback.getPreBitmap().getHeight()));
        this.mStartLeft = this.mScreenRect[0];
        this.mStartRight = this.mStartLeft + this.mScreenRect[2];
        this.mSrcRect.set(0, 0, this.mPreBitmap.getWidth(), this.mPreBitmap.getHeight());
        this.mDstRect.set(this.mStartLeft, this.mStartTop, this.mStartRight, this.mStartBottom);
        callback.onInvalidate();
        animatorStart(callback);
    }

    private void animatorStart(final Callback callback) {
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(600);
        ofFloat.setInterpolator(new QuarticEaseInOutInterpolator());
        ofFloat.addUpdateListener(new AnimatorUpdateListener(callback) {
            private final /* synthetic */ Callback f$1;

            {
                this.f$1 = r2;
            }

            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                LongCropViewAnimatorHelper.lambda$animatorStart$50(LongCropViewAnimatorHelper.this, this.f$1, valueAnimator);
            }
        });
        ofFloat.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                LongCropViewAnimatorHelper.this.mAnimatorState = AnimatorState.ANIMATOR_END;
                callback.onInvalidate();
            }

            public void onAnimationStart(Animator animator) {
                LongCropViewAnimatorHelper.this.mAnimatorState = AnimatorState.ANIMATOR_START;
            }
        });
        ofFloat.start();
    }

    private void changeRect(Callback callback, float f) {
        this.mDstRect.left = Math.round((((float) (callback.getShowRect().left - this.mStartLeft)) * f) + ((float) this.mStartLeft));
        this.mDstRect.top = Math.round((((float) (callback.getShowRect().top - this.mStartTop)) * f) + ((float) this.mStartTop));
        this.mDstRect.right = Math.round((((float) (callback.getShowRect().right - this.mStartRight)) * f) + ((float) this.mStartRight));
        this.mDstRect.bottom = Math.round((((float) (callback.getShowRect().bottom - this.mStartBottom)) * f) + ((float) this.mStartBottom));
    }

    public static /* synthetic */ void lambda$animatorStart$50(LongCropViewAnimatorHelper longCropViewAnimatorHelper, Callback callback, ValueAnimator valueAnimator) {
        longCropViewAnimatorHelper.changeRect(callback, valueAnimator.getAnimatedFraction());
        longCropViewAnimatorHelper.mAnimatorState = AnimatorState.ANIMATOR_UPDATE;
        callback.onInvalidate();
    }

    public void draw(Canvas canvas) {
        if (this.mPreBitmap != null) {
            canvas.drawBitmap(this.mPreBitmap, this.mSrcRect, this.mDstRect, null);
        }
    }

    public boolean isAnimatorEnd() {
        return this.mAnimatorState == AnimatorState.ANIMATOR_END;
    }

    public void startEnterAnimation(Callback callback, int[] iArr) {
        int i = 0;
        while (iArr != null && i < iArr.length) {
            this.mScreenRect[i] = iArr[i];
            i++;
        }
        this.mPreBitmap = callback.getPreBitmap();
        animatorPreStart(callback);
    }
}
