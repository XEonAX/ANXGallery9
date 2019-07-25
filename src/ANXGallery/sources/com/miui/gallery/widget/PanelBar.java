package com.miui.gallery.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

public class PanelBar extends FrameLayout {
    public PanelBar(Context context) {
        this(context, null);
    }

    public PanelBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PanelBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private Animator loadAnimator(boolean z) {
        ObjectAnimator ofFloat = z ? ObjectAnimator.ofFloat(null, "alpha", new float[]{0.0f, 1.0f}) : ObjectAnimator.ofFloat(null, "alpha", new float[]{1.0f, 0.0f});
        ofFloat.setDuration(500);
        return ofFloat;
    }

    private void refreshVisibility() {
        if (getChildCount() > 0) {
            setVisibility(0);
        } else {
            setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        refreshVisibility();
    }

    public void removeItem(boolean z) {
        final View childAt = getChildAt(getChildCount() - 1);
        if (childAt != null) {
            Animator loadAnimator = loadAnimator(false);
            startViewTransition(childAt);
            loadAnimator.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    PanelBar.this.endViewTransition(childAt);
                }
            });
            loadAnimator.setTarget(childAt);
            loadAnimator.start();
            if (!z) {
                loadAnimator.end();
                endViewTransition(childAt);
            }
            removeView(childAt);
        }
        removeAllViews();
        refreshVisibility();
    }

    public void replaceItem(PanelItem panelItem, boolean z) {
        final View childAt = getChildAt(getChildCount() - 1);
        if (childAt != null) {
            Animator loadAnimator = loadAnimator(false);
            startViewTransition(childAt);
            loadAnimator.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    PanelBar.this.endViewTransition(childAt);
                }
            });
            loadAnimator.setTarget(childAt);
            loadAnimator.start();
            if (!z) {
                loadAnimator.end();
                endViewTransition(childAt);
            }
            removeView(childAt);
        }
        removeAllViews();
        if (!(panelItem == null || panelItem.getView() == null)) {
            Animator loadAnimator2 = loadAnimator(true);
            loadAnimator2.setTarget(panelItem.getView());
            loadAnimator2.start();
            if (!z) {
                loadAnimator2.end();
            }
            ViewParent parent = panelItem.getView().getParent();
            if (parent != null) {
                if (parent instanceof ViewGroup) {
                    ViewGroup viewGroup = (ViewGroup) parent;
                    viewGroup.removeView(panelItem.getView());
                    if (panelItem.getView().getParent() != null) {
                        viewGroup.endViewTransition(panelItem.getView());
                    }
                } else {
                    return;
                }
            }
            addView(panelItem.getView());
        }
        refreshVisibility();
    }
}
