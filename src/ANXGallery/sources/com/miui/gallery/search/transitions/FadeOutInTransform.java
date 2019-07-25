package com.miui.gallery.search.transitions;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.transition.Transition;
import android.transition.TransitionValues;
import android.view.View;
import android.view.ViewGroup;

public class FadeOutInTransform extends Transition {
    private void captureValues(TransitionValues transitionValues, boolean z) {
        transitionValues.values.put("customtransition:fade_transform:alpha", Float.valueOf(transitionValues.view.getAlpha()));
        transitionValues.values.put("customtransition:fade_transform:start", Boolean.valueOf(z));
    }

    public void captureEndValues(TransitionValues transitionValues) {
        captureValues(transitionValues, false);
    }

    public void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues, true);
    }

    public Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        if (transitionValues == null || transitionValues2 == null) {
            return null;
        }
        final View view = transitionValues2.view;
        final float floatValue = ((Float) transitionValues.values.get("customtransition:fade_transform:alpha")).floatValue();
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, ((Float) transitionValues2.values.get("customtransition:fade_transform:alpha")).floatValue() + floatValue});
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Object animatedValue = valueAnimator.getAnimatedValue();
                if (animatedValue != null) {
                    view.setAlpha(Math.abs(((Float) animatedValue).floatValue() - floatValue));
                }
            }
        });
        return ofFloat;
    }
}
