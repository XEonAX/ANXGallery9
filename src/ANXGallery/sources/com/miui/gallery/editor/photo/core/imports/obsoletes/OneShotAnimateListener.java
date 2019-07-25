package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;

public abstract class OneShotAnimateListener implements AnimatorListener {
    public void onAnimationCancel(Animator animator) {
        animator.removeListener(this);
    }

    public void onAnimationEnd(Animator animator) {
        animator.removeListener(this);
    }

    public void onAnimationRepeat(Animator animator) {
    }

    public void onAnimationStart(Animator animator) {
    }
}
