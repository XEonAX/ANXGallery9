package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.util.AttributeSet;
import com.miui.gallery.R;
import com.miui.gallery.threadpool.ThreadManager;
import miui.view.animation.CubicEaseInOutInterpolator;

public class CleanerRotateProgressBar extends SpaceRotateProgressBar {
    /* access modifiers changed from: private */
    public boolean mHasShowEmptyAnim;

    public CleanerRotateProgressBar(Context context) {
        this(context, null);
    }

    public CleanerRotateProgressBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CleanerRotateProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mHasShowEmptyAnim = false;
        setDescription(getContext().getString(R.string.cleaner_space_description));
    }

    public void hideRingCircle(boolean z) {
        if (z) {
            disappearRingCircleAnim();
        } else {
            this.mRotateRing.setAlpha(0.0f);
        }
        setDetailDescription(getContext().getString(R.string.cleaner_space_detail_description));
    }

    public void setNumber(long j) {
        setNumber(j, false);
    }

    public void setNumber(long j, boolean z) {
        if (z) {
            setNumber(j, false, null);
            return;
        }
        cancelAllAnim();
        changeNumberWithNoAnim((int) (j / 1000));
    }

    public void setNumber(long j, boolean z, final Runnable runnable) {
        startRotateRingAnim(true);
        final int i = (int) (j / 1000);
        final AnonymousClass1 r4 = runnable != null ? new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                runnable.run();
            }
        } : null;
        if (z) {
            changeNumberWithAnim(getSpaceNumber() + (((i - getSpaceNumber()) * 7) / 10), new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    CleanerRotateProgressBar.this.changeNumberEndStageAnim(i, r4);
                }
            });
        } else {
            changeNumberWithAnim(i, r4);
        }
    }

    public void showEmptyAnim() {
        showEmptyAnim(0);
    }

    public void showEmptyAnim(long j) {
        if (this.mHasShowEmptyAnim) {
            if (this.mEmptyValueView != null) {
                this.mEmptyValueView.setImageDrawable(getContext().getResources().getDrawable(R.drawable.tree_frame_20));
                showRingCircle(false);
            }
            return;
        }
        ThreadManager.getMainHandler().postDelayed(new Runnable() {
            public void run() {
                CleanerRotateProgressBar.this.mHasShowEmptyAnim = true;
                CleanerRotateProgressBar.this.cancelAllAnim();
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(CleanerRotateProgressBar.this.mSpaceNumberView, "alpha", new float[]{1.0f, 0.0f});
                ofFloat.setDuration(250);
                ofFloat.setInterpolator(new CubicEaseInOutInterpolator());
                ofFloat.addListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        CleanerRotateProgressBar.this.mSpaceNumberView.setVisibility(4);
                        CleanerRotateProgressBar.this.mEmptyValueView.setVisibility(0);
                        ((AnimationDrawable) CleanerRotateProgressBar.this.mEmptyValueView.getDrawable()).start();
                    }

                    public void onAnimationStart(Animator animator) {
                        CleanerRotateProgressBar.this.showRingCircle(true);
                        CleanerRotateProgressBar.this.setDescription(CleanerRotateProgressBar.this.getContext().getString(R.string.cleaner_empty_value_description));
                    }
                });
                ofFloat.start();
            }
        }, j);
    }

    public void showRingCircle(boolean z) {
        if (z) {
            appearRingCircleAnim();
        } else {
            this.mRotateRing.setAlpha(1.0f);
        }
        setDetailDescription(null);
    }
}
