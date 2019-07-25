package com.miui.gallery.search.transitions;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.graphics.Color;
import android.text.TextUtils;
import android.transition.Transition;
import android.transition.TransitionValues;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.TextView;

public class ChangeTextView extends Transition {

    private static class TextAnimationUpdater implements AnimatorUpdateListener {
        private final ValueHolder mEnd;
        private Interpolator mInterpolator;
        private boolean mIsEndEmpty;
        private boolean mIsStartEmpty;
        private final ValueHolder mStart;
        private final TextView mTextView;

        public TextAnimationUpdater(TextView textView, ValueHolder valueHolder, ValueHolder valueHolder2) {
            this.mTextView = textView;
            this.mStart = valueHolder;
            this.mEnd = valueHolder2;
            if (TextUtils.isEmpty(this.mStart.hint) && TextUtils.isEmpty(this.mStart.text)) {
                this.mIsStartEmpty = true;
            }
            if (TextUtils.isEmpty(this.mEnd.hint) && TextUtils.isEmpty(this.mEnd.text)) {
                this.mIsEndEmpty = true;
            }
        }

        public Interpolator getInterpolator() {
            if (this.mInterpolator == null) {
                if ((this.mIsStartEmpty && this.mIsEndEmpty) || (!this.mIsStartEmpty && !this.mIsEndEmpty)) {
                    this.mInterpolator = new LinearInterpolator();
                } else if (this.mIsStartEmpty) {
                    this.mInterpolator = new DecelerateInterpolator();
                } else {
                    this.mInterpolator = new AccelerateInterpolator();
                }
            }
            return this.mInterpolator;
        }

        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            int i;
            int i2;
            String str;
            String str2;
            Object animatedValue = valueAnimator.getAnimatedValue();
            if (animatedValue != null) {
                float f = 0.5f;
                if (!this.mIsStartEmpty || !this.mIsEndEmpty) {
                    if (this.mIsStartEmpty) {
                        f = 0.01f;
                    } else if (this.mIsEndEmpty) {
                        f = 0.99f;
                    }
                    Float f2 = (Float) animatedValue;
                    boolean z = f2.floatValue() <= f;
                    float abs = Math.abs(f2.floatValue() - f);
                    if (!z) {
                        f = 1.0f - f;
                    }
                    float f3 = abs / f;
                    if (z) {
                        str2 = this.mStart.text;
                        str = this.mStart.hint;
                        i2 = ChangeTextView.colorWithAlpha(f3, this.mStart.hintColor);
                        i = ChangeTextView.colorWithAlpha(f3, this.mStart.textColor);
                    } else {
                        str2 = this.mEnd.text;
                        str = this.mEnd.hint;
                        i2 = ChangeTextView.colorWithAlpha(f3, this.mEnd.hintColor);
                        i = ChangeTextView.colorWithAlpha(f3, this.mEnd.textColor);
                    }
                    this.mTextView.setText(str2);
                    this.mTextView.setHint(str);
                    this.mTextView.setHintTextColor(i2);
                    this.mTextView.setTextColor(i);
                }
            }
        }
    }

    private static class ValueHolder {
        String hint;
        int hintColor;
        String text;
        int textColor;

        public ValueHolder(TransitionValues transitionValues) {
            this.textColor = ((Integer) transitionValues.values.get("customtransition:change_text_view:text_color")).intValue();
            this.text = (String) transitionValues.values.get("customtransition:change_text_view:text");
            this.hint = (String) transitionValues.values.get("customtransition:change_text_view:hint");
            this.hintColor = ((Integer) transitionValues.values.get("customtransition:change_text_view:hint_color")).intValue();
        }
    }

    private void captureValues(TransitionValues transitionValues) {
        if (transitionValues.view instanceof TextView) {
            TextView textView = (TextView) transitionValues.view;
            transitionValues.values.put("customtransition:change_text_view:text", nullToEmpty(textView.getText()));
            transitionValues.values.put("customtransition:change_text_view:text_color", Integer.valueOf(textView.getCurrentTextColor()));
            transitionValues.values.put("customtransition:change_text_view:hint", nullToEmpty(textView.getHint()));
            transitionValues.values.put("customtransition:change_text_view:hint_color", Integer.valueOf(textView.getCurrentHintTextColor()));
        }
    }

    /* access modifiers changed from: private */
    public static int colorWithAlpha(float f, int i) {
        return Color.argb((int) (f * ((float) Color.alpha(i))), Color.red(i), Color.green(i), Color.blue(i));
    }

    private String nullToEmpty(CharSequence charSequence) {
        return charSequence == null ? "" : charSequence.toString();
    }

    public void captureEndValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    public void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    public Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        if (transitionValues == null || transitionValues2 == null || !(transitionValues2.view instanceof TextView)) {
            return null;
        }
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        TextAnimationUpdater textAnimationUpdater = new TextAnimationUpdater((TextView) transitionValues2.view, new ValueHolder(transitionValues), new ValueHolder(transitionValues2));
        ofFloat.addUpdateListener(textAnimationUpdater);
        ofFloat.setInterpolator(textAnimationUpdater.getInterpolator());
        return ofFloat;
    }
}
