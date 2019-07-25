package com.miui.gallery.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.widget.EndTopCornerTextView;
import com.miui.gallery.widget.RotateRingView;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nexstreaming.nexeditorsdk.nexProject;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.SineEaseOutInterpolator;

public class SpaceRotateProgressBar extends FrameLayout {
    protected TextView mDescriptionText;
    protected TextView mDetailDescriptionText;
    protected ImageView mEmptyValueView;
    protected ObjectAnimator mNumberAnimator;
    protected ObjectAnimator mRingAlphaAnimator;
    protected ObjectAnimator mRingHeadAnimator;
    protected ObjectAnimator mRingRotateAnimator;
    protected RotateRingView mRotateRing;
    private int mSpaceNumber;
    protected EndTopCornerTextView mSpaceNumberView;

    public SpaceRotateProgressBar(Context context) {
        this(context, null);
    }

    public SpaceRotateProgressBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SpaceRotateProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        View inflate = LayoutInflater.from(context).inflate(R.layout.space_rotate_progress_bar, this);
        this.mDescriptionText = (TextView) inflate.findViewById(R.id.value_description);
        this.mDetailDescriptionText = (TextView) inflate.findViewById(R.id.value_detail_description);
        this.mSpaceNumberView = (EndTopCornerTextView) inflate.findViewById(R.id.used_value);
        this.mRotateRing = (RotateRingView) inflate.findViewById(R.id.rotate_ring);
        this.mEmptyValueView = (ImageView) inflate.findViewById(R.id.value_empty_view);
    }

    /* access modifiers changed from: protected */
    public final void appearRingCircleAnim() {
        cancelAnimIfRunning(this.mRingAlphaAnimator);
        this.mRotateRing.setHeadMaxAlpha(this.mRotateRing.getHeadMinAlpha());
        this.mRingAlphaAnimator = ObjectAnimator.ofFloat(this.mRotateRing, "alpha", new float[]{0.0f, 1.0f});
        this.mRingAlphaAnimator.setDuration(500);
        this.mRingAlphaAnimator.setInterpolator(new CubicEaseInOutInterpolator());
        this.mRingAlphaAnimator.start();
    }

    public void cancelAllAnim() {
        cancelAnimIfRunning(this.mNumberAnimator);
        cancelAnimIfRunning(this.mRingRotateAnimator);
        cancelAnimIfRunning(this.mRingHeadAnimator);
        cancelAnimIfRunning(this.mRingAlphaAnimator);
    }

    /* access modifiers changed from: protected */
    public void cancelAnimIfRunning(Animator animator) {
        if (animator != null) {
            animator.removeAllListeners();
            if (animator.isRunning()) {
                animator.cancel();
            }
        }
    }

    /* access modifiers changed from: protected */
    public final void changeNumberEndStageAnim(int i, AnimatorListenerAdapter animatorListenerAdapter) {
        int i2;
        if (this.mRingRotateAnimator == null || !this.mRingRotateAnimator.isRunning()) {
            i2 = 0;
        } else {
            this.mRingRotateAnimator.cancel();
            i2 = nexClip.kClip_Rotate_180;
        }
        this.mRingRotateAnimator = ObjectAnimator.ofInt(this.mRotateRing, "progress", new int[]{this.mRotateRing.getProgress(), this.mRotateRing.getProgress() + i2});
        cancelAnimIfRunning(this.mNumberAnimator);
        this.mNumberAnimator = ObjectAnimator.ofInt(this, "spaceNumber", new int[]{getSpaceNumber(), i});
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.play(this.mNumberAnimator).with(this.mRingRotateAnimator);
        animatorSet.setDuration(1000);
        animatorSet.setInterpolator(new DecelerateInterpolator());
        if (animatorListenerAdapter != null) {
            animatorSet.addListener(animatorListenerAdapter);
        }
        animatorSet.start();
        disappearRingHeadAnim(1000);
    }

    /* access modifiers changed from: protected */
    public final void changeNumberWithAnim(int i, AnimatorListenerAdapter animatorListenerAdapter) {
        cancelAnimIfRunning(this.mNumberAnimator);
        this.mNumberAnimator = ObjectAnimator.ofInt(this, "spaceNumber", new int[]{getSpaceNumber(), i});
        this.mNumberAnimator.setDuration((long) getChangeDuration(i));
        this.mNumberAnimator.setInterpolator(new LinearInterpolator());
        if (animatorListenerAdapter != null) {
            this.mNumberAnimator.addListener(animatorListenerAdapter);
        }
        this.mNumberAnimator.start();
    }

    /* access modifiers changed from: protected */
    public final void changeNumberWithNoAnim(int i) {
        setSpaceNumber(i);
    }

    /* access modifiers changed from: protected */
    public final void disappearRingCircleAnim() {
        cancelAnimIfRunning(this.mRingAlphaAnimator);
        this.mRingAlphaAnimator = ObjectAnimator.ofFloat(this.mRotateRing, "alpha", new float[]{1.0f, 0.0f});
        this.mRingAlphaAnimator.setDuration(500);
        this.mRingAlphaAnimator.setInterpolator(new CubicEaseInOutInterpolator());
        this.mRingAlphaAnimator.start();
    }

    /* access modifiers changed from: protected */
    public final void disappearRingHeadAnim(long j) {
        int headMaxAlpha = this.mRotateRing.getHeadMaxAlpha();
        int headMinAlpha = this.mRotateRing.getHeadMinAlpha();
        if (headMaxAlpha > headMinAlpha) {
            cancelAnimIfRunning(this.mRingHeadAnimator);
            this.mRingHeadAnimator = ObjectAnimator.ofInt(this.mRotateRing, "headMaxAlpha", new int[]{headMaxAlpha, headMinAlpha});
            this.mRingHeadAnimator.setDuration(j);
            this.mRingHeadAnimator.setInterpolator(new SineEaseOutInterpolator());
            this.mRingHeadAnimator.start();
        }
    }

    /* access modifiers changed from: protected */
    public int getChangeDuration(int i) {
        if (Math.abs(i - getSpaceNumber()) < 500000) {
            return nexProject.kAutoThemeTransitionDuration;
        }
        return 3000;
    }

    public int getSpaceNumber() {
        return this.mSpaceNumber;
    }

    public boolean isRotating() {
        return this.mRingRotateAnimator != null && this.mRingRotateAnimator.isRunning();
    }

    public void setDescription(String str) {
        this.mDescriptionText.setText(str);
    }

    public void setDetailDescription(String str) {
        if (TextUtils.isEmpty(str)) {
            this.mDetailDescriptionText.setVisibility(8);
            return;
        }
        this.mDetailDescriptionText.setVisibility(0);
        this.mDetailDescriptionText.setText(str);
    }

    public void setSpaceNumber(int i) {
        String str;
        Object[] objArr;
        this.mSpaceNumber = i;
        if (i != 0 && i < 100) {
            i = 100;
        }
        if (i > 0) {
            str = "%.1f";
            objArr = new Object[]{Float.valueOf(((float) (i - (i % 100))) / 1000.0f)};
        } else {
            str = "%d";
            objArr = new Object[]{Integer.valueOf(i)};
        }
        String format = String.format(str, objArr);
        if (i > 900) {
            i /= 1000;
            if (i > 0) {
                format = String.format("%d", new Object[]{Integer.valueOf(i)});
            }
        }
        int i2 = R.string.megabyteShort;
        if (i > 900) {
            format = String.format("%.1f", new Object[]{Float.valueOf(((float) i) / 1000.0f)});
            i2 = R.string.gigabyteShort;
        }
        this.mSpaceNumberView.setText(format);
        this.mSpaceNumberView.setCornerText(getResources().getString(i2));
    }

    /* access modifiers changed from: protected */
    public final void startRotateRingAnim(boolean z) {
        if (this.mRingRotateAnimator != null && this.mRingRotateAnimator.isRunning()) {
            if (!z) {
                this.mRingRotateAnimator.cancel();
            } else {
                return;
            }
        }
        this.mRotateRing.setStartRotateStable();
        this.mRingRotateAnimator = ObjectAnimator.ofInt(this.mRotateRing, "progress", new int[]{this.mRotateRing.getProgress(), this.mRotateRing.getProgress() + 359});
        this.mRingRotateAnimator.setDuration(Math.round(1333.3333333333333d));
        this.mRingRotateAnimator.setRepeatCount(-1);
        this.mRingRotateAnimator.setRepeatMode(-1);
        this.mRingRotateAnimator.setInterpolator(new LinearInterpolator());
        this.mRingRotateAnimator.start();
    }
}
