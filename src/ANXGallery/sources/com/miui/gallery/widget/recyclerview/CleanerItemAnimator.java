package com.miui.gallery.widget.recyclerview;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.SimpleItemAnimator;
import android.view.View;
import android.view.animation.Interpolator;
import com.miui.gallery.threadpool.ThreadManager;
import java.util.ArrayList;
import java.util.Iterator;
import miui.view.animation.CubicEaseInOutInterpolator;

public class CleanerItemAnimator extends SimpleItemAnimator {
    /* access modifiers changed from: private */
    public Interpolator mInterpolator = new CubicEaseInOutInterpolator();
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mMoveAnimations = new ArrayList<>();
    private ArrayList<ViewHolder> mPendingMoveHolders = new ArrayList<>();
    private ArrayList<ViewHolder> mPendingRemoveHolders = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mRemoveAnimations = new ArrayList<>();

    private void animateMoveImpl(final ViewHolder viewHolder) {
        this.mMoveAnimations.add(viewHolder);
        ThreadManager.getMainHandler().postDelayed(new Runnable() {
            public void run() {
                View view = viewHolder.itemView;
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, "translationY", new float[]{view.getTranslationY(), 0.0f});
                ofFloat.setDuration(500);
                ofFloat.setInterpolator(CleanerItemAnimator.this.mInterpolator);
                ofFloat.addListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        CleanerItemAnimator.this.dispatchMoveFinished(viewHolder);
                        CleanerItemAnimator.this.mMoveAnimations.remove(viewHolder);
                        if (!CleanerItemAnimator.this.isRunning()) {
                            CleanerItemAnimator.this.dispatchAnimationsFinished();
                        }
                    }

                    public void onAnimationStart(Animator animator) {
                        CleanerItemAnimator.this.dispatchMoveStarting(viewHolder);
                    }
                });
                ofFloat.start();
            }
        }, 300);
    }

    private void animateRemoveImpl(final ViewHolder viewHolder) {
        this.mRemoveAnimations.add(viewHolder);
        ThreadManager.getMainHandler().postDelayed(new Runnable() {
            public void run() {
                final View view = viewHolder.itemView;
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, "alpha", new float[]{1.0f, 0.0f});
                ofFloat.setDuration(350);
                ofFloat.setInterpolator(CleanerItemAnimator.this.mInterpolator);
                ofFloat.addListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        CleanerItemAnimator.this.mRemoveAnimations.remove(viewHolder);
                        view.setVisibility(8);
                        CleanerItemAnimator.this.dispatchRemoveFinished(viewHolder);
                        if (!CleanerItemAnimator.this.isRunning()) {
                            CleanerItemAnimator.this.dispatchAnimationsFinished();
                        }
                    }

                    public void onAnimationStart(Animator animator) {
                        CleanerItemAnimator.this.dispatchRemoveStarting(viewHolder);
                    }
                });
                ofFloat.start();
            }
        }, 300);
    }

    public boolean animateAdd(ViewHolder viewHolder) {
        return false;
    }

    public boolean animateChange(ViewHolder viewHolder, ViewHolder viewHolder2, int i, int i2, int i3, int i4) {
        if (viewHolder == viewHolder2) {
            return animateMove(viewHolder, i, i2, i3, i4);
        }
        return false;
    }

    public boolean animateMove(ViewHolder viewHolder, int i, int i2, int i3, int i4) {
        View view = viewHolder.itemView;
        view.setTranslationY((float) (-(i4 - ((int) (((float) i2) + view.getTranslationY())))));
        this.mPendingMoveHolders.add(viewHolder);
        return true;
    }

    public boolean animateRemove(ViewHolder viewHolder) {
        this.mPendingRemoveHolders.add(viewHolder);
        return true;
    }

    public void endAnimation(ViewHolder viewHolder) {
    }

    public void endAnimations() {
    }

    public boolean isRunning() {
        return !this.mPendingMoveHolders.isEmpty() || !this.mPendingRemoveHolders.isEmpty() || !this.mRemoveAnimations.isEmpty() || !this.mMoveAnimations.isEmpty();
    }

    public void runPendingAnimations() {
        boolean z = !this.mPendingMoveHolders.isEmpty();
        if (!this.mPendingRemoveHolders.isEmpty()) {
            Iterator it = this.mPendingRemoveHolders.iterator();
            while (it.hasNext()) {
                animateRemoveImpl((ViewHolder) it.next());
            }
            this.mPendingRemoveHolders.clear();
        }
        if (z) {
            Iterator it2 = this.mPendingMoveHolders.iterator();
            while (it2.hasNext()) {
                animateMoveImpl((ViewHolder) it2.next());
            }
            this.mPendingMoveHolders.clear();
        }
    }
}
