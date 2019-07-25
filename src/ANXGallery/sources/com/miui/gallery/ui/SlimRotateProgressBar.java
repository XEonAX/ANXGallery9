package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import com.nexstreaming.nexeditorsdk.nexProject;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class SlimRotateProgressBar extends SpaceRotateProgressBar {
    public SlimRotateProgressBar(Context context) {
        this(context, null);
    }

    public SlimRotateProgressBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SlimRotateProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public int getChangeDuration(int i) {
        int abs = Math.abs(i - getSpaceNumber());
        if (abs < 15000) {
            return 500;
        }
        if (abs < 500000) {
            return nexProject.kAutoThemeTransitionDuration;
        }
        return 3000;
    }

    public void pause() {
        int i;
        if (this.mRingRotateAnimator == null || !this.mRingRotateAnimator.isRunning()) {
            i = 0;
        } else {
            this.mRingRotateAnimator.cancel();
            i = 50;
        }
        cancelAnimIfRunning(this.mNumberAnimator);
        this.mRingRotateAnimator = ObjectAnimator.ofInt(this.mRotateRing, "progress", new int[]{this.mRotateRing.getProgress(), this.mRotateRing.getProgress() + i});
        this.mRingRotateAnimator.setDuration(250);
        this.mRingRotateAnimator.setInterpolator(new CubicEaseOutInterpolator());
        this.mRingRotateAnimator.start();
    }

    public void resume() {
        if (this.mRingRotateAnimator != null && this.mRingRotateAnimator.isRunning()) {
            this.mRingRotateAnimator.cancel();
        }
        this.mRotateRing.setStartRotateStable();
        this.mRingRotateAnimator = ObjectAnimator.ofInt(this.mRotateRing, "progress", new int[]{this.mRotateRing.getProgress(), this.mRotateRing.getProgress() + 50});
        this.mRingRotateAnimator.setDuration(200);
        this.mRingRotateAnimator.setInterpolator(new CubicEaseInInterpolator());
        this.mRingRotateAnimator.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                SlimRotateProgressBar.this.startRotateRingAnim(false);
            }
        });
        this.mRingRotateAnimator.start();
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
        int i = (int) (j / 1000);
        this.mRotateRing.setHeadMaxAlpha(this.mRotateRing.getHeadMinAlpha());
        changeNumberWithNoAnim(i);
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
                    SlimRotateProgressBar.this.changeNumberEndStageAnim(i, r4);
                }
            });
        } else {
            changeNumberWithAnim(i, r4);
        }
    }
}
