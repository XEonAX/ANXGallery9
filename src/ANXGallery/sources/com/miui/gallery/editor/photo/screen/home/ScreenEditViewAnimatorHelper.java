package com.miui.gallery.editor.photo.screen.home;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Rect;
import android.graphics.RectF;
import com.miui.gallery.R;
import com.miui.gallery.util.BitmapUtils;
import miui.view.animation.QuarticEaseInOutInterpolator;

public class ScreenEditViewAnimatorHelper {
    /* access modifiers changed from: private */
    public AnimatorState mAnimatorState;
    private Context mContext;
    private RectF mDstRect = new RectF();
    private Matrix mMatrix = new Matrix();
    private Bitmap mPreBitmap;
    private float mRoundRadius;
    private Rect mSrcRect = new Rect();
    private int mStartBottom;
    private int mStartLeft;
    private int mStartRight;
    private int mStartTop;
    private int[] mThumbnailRect = {0, 0, 0, 0};

    interface Callback {
        Bitmap getOriginBitmap();

        RectF getShowRect();

        void onAnimationStart();

        void onAnimationUpdate(float f);

        void onInvalidate();
    }

    private void animatorPreStart(Callback callback) {
        this.mAnimatorState = AnimatorState.ANIMATOR_PRE_START;
        this.mSrcRect.set(0, 0, callback.getOriginBitmap().getWidth(), callback.getOriginBitmap().getHeight());
        this.mStartLeft = this.mThumbnailRect[0];
        this.mStartTop = this.mThumbnailRect[1];
        this.mStartRight = this.mStartLeft + this.mThumbnailRect[2];
        this.mStartBottom = this.mStartTop + this.mThumbnailRect[3];
        this.mRoundRadius = (float) this.mContext.getResources().getDimensionPixelSize(R.dimen.screen_editor_thumbnail_btn_radius);
        this.mDstRect.set((float) this.mStartLeft, (float) this.mStartTop, (float) this.mStartRight, (float) this.mStartBottom);
        callback.onInvalidate();
        animatorStart(callback);
    }

    private void animatorStart(final Callback callback) {
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(450);
        ofFloat.setInterpolator(new QuarticEaseInOutInterpolator());
        ofFloat.addUpdateListener(new AnimatorUpdateListener(callback) {
            private final /* synthetic */ Callback f$1;

            {
                this.f$1 = r2;
            }

            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                ScreenEditViewAnimatorHelper.lambda$animatorStart$45(ScreenEditViewAnimatorHelper.this, this.f$1, valueAnimator);
            }
        });
        ofFloat.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                ScreenEditViewAnimatorHelper.this.mAnimatorState = AnimatorState.ANIMATOR_END;
                callback.onInvalidate();
            }

            public void onAnimationStart(Animator animator) {
                ScreenEditViewAnimatorHelper.this.mAnimatorState = AnimatorState.ANIMATOR_START;
                callback.onAnimationStart();
            }
        });
        ofFloat.start();
    }

    private void changeRect(Callback callback, float f) {
        this.mDstRect.left = (float) Math.round(((callback.getShowRect().left - ((float) this.mStartLeft)) * f) + ((float) this.mStartLeft));
        this.mDstRect.top = (float) Math.round(((callback.getShowRect().top - ((float) this.mStartTop)) * f) + ((float) this.mStartTop));
        this.mDstRect.right = (float) Math.round(((callback.getShowRect().right - ((float) this.mStartRight)) * f) + ((float) this.mStartRight));
        this.mDstRect.bottom = (float) Math.round(((callback.getShowRect().bottom - ((float) this.mStartBottom)) * f) + ((float) this.mStartBottom));
    }

    public static /* synthetic */ void lambda$animatorStart$45(ScreenEditViewAnimatorHelper screenEditViewAnimatorHelper, Callback callback, ValueAnimator valueAnimator) {
        float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        screenEditViewAnimatorHelper.mAnimatorState = AnimatorState.ANIMATOR_UPDATE;
        screenEditViewAnimatorHelper.mRoundRadius = ((float) screenEditViewAnimatorHelper.mContext.getResources().getDimensionPixelSize(R.dimen.screen_editor_thumbnail_btn_radius)) * (1.0f - floatValue);
        screenEditViewAnimatorHelper.changeRect(callback, floatValue);
        callback.onAnimationUpdate(floatValue);
        callback.onInvalidate();
    }

    public void draw(Canvas canvas) {
        this.mMatrix.reset();
        if (this.mAnimatorState == AnimatorState.ANIMATOR_PRE_START || this.mAnimatorState == AnimatorState.ANIMATOR_UPDATE) {
            Bitmap roundedCornerBitmap = BitmapUtils.getRoundedCornerBitmap(this.mPreBitmap, this.mRoundRadius, this.mThumbnailRect[2], this.mThumbnailRect[3]);
            if (roundedCornerBitmap != null) {
                this.mMatrix.setRectToRect(new RectF(0.0f, 0.0f, (float) roundedCornerBitmap.getWidth(), (float) roundedCornerBitmap.getHeight()), this.mDstRect, ScaleToFit.CENTER);
                canvas.drawBitmap(roundedCornerBitmap, this.mMatrix, null);
                return;
            }
            return;
        }
        this.mMatrix.setRectToRect(new RectF(this.mSrcRect), this.mDstRect, ScaleToFit.CENTER);
        canvas.drawBitmap(this.mPreBitmap, this.mMatrix, null);
    }

    public boolean isAnimatorEnd() {
        return this.mAnimatorState == AnimatorState.ANIMATOR_END;
    }

    public void startEnterAnimation(Context context, Callback callback, int[] iArr) {
        this.mContext = context;
        int i = 0;
        while (iArr != null && i < iArr.length) {
            this.mThumbnailRect[i] = iArr[i];
            i++;
        }
        this.mPreBitmap = callback.getOriginBitmap();
        animatorPreStart(callback);
    }
}
