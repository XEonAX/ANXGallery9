package com.miui.gallery.search.transitions;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.graphics.drawable.Drawable;
import android.transition.Transition;
import android.transition.TransitionValues;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

public class ChangeImage extends Transition {
    private void captureValues(TransitionValues transitionValues, boolean z) {
        if (transitionValues.view instanceof ImageView) {
            transitionValues.values.put("customtransition:change_image:drawable", ((ImageView) transitionValues.view).getDrawable());
        } else {
            transitionValues.values.put("customtransition:change_image:drawable", transitionValues.view.getBackground());
        }
        transitionValues.values.put("customtransition:change_image:start", Boolean.valueOf(z));
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
        final Drawable drawable = (Drawable) transitionValues.values.get("customtransition:change_image:drawable");
        final Drawable drawable2 = (Drawable) transitionValues2.values.get("customtransition:change_image:drawable");
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Object animatedValue = valueAnimator.getAnimatedValue();
                if (animatedValue == null) {
                    return;
                }
                if (view instanceof ImageView) {
                    if (((double) ((Float) animatedValue).floatValue()) > 0.5d) {
                        ((ImageView) view).setImageDrawable(drawable2);
                    } else {
                        ((ImageView) view).setImageDrawable(drawable);
                    }
                } else if (((double) ((Float) animatedValue).floatValue()) > 0.5d) {
                    view.setBackground(drawable2);
                } else {
                    view.setBackground(drawable);
                }
            }
        });
        return ofFloat;
    }
}
