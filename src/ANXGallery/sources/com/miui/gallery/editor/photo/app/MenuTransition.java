package com.miui.gallery.editor.photo.app;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.res.Resources;
import android.transition.Transition;
import android.transition.TransitionValues;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;

class MenuTransition extends Transition {
    private boolean mEnter;
    private int mExitAlphaDuration;
    private int mExitTranslateDuration;
    private float mTranslate;

    public MenuTransition(float f, boolean z, Resources resources) {
        this.mTranslate = f;
        this.mEnter = z;
        this.mExitTranslateDuration = resources.getInteger(R.integer.photo_editor_exit_transition_duration);
        this.mExitAlphaDuration = resources.getInteger(R.integer.photo_editor_exit_transition_menu_alpha_duration);
    }

    private Animator createEnterAnimator(TransitionValues transitionValues) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{this.mTranslate, 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
        objectAnimator.setTarget(transitionValues.view);
        return objectAnimator;
    }

    private Animator createExitAnimator(TransitionValues transitionValues) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, this.mTranslate})});
        objectAnimator.setDuration((long) this.mExitTranslateDuration);
        objectAnimator.setTarget(transitionValues.view);
        ObjectAnimator objectAnimator2 = new ObjectAnimator();
        objectAnimator2.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
        objectAnimator2.setDuration((long) this.mExitAlphaDuration);
        objectAnimator2.setTarget(transitionValues.view);
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(new Animator[]{objectAnimator, objectAnimator2});
        return animatorSet;
    }

    public void captureEndValues(TransitionValues transitionValues) {
    }

    public void captureStartValues(TransitionValues transitionValues) {
    }

    public Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        if (transitionValues == null || transitionValues2 == null) {
            return null;
        }
        return this.mEnter ? createEnterAnimator(transitionValues2) : createExitAnimator(transitionValues);
    }

    public boolean isTransitionRequired(TransitionValues transitionValues, TransitionValues transitionValues2) {
        return true;
    }
}
