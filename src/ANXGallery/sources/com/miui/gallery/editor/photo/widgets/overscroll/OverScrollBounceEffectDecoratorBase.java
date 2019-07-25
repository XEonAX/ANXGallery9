package com.miui.gallery.editor.photo.widgets.overscroll;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.util.Property;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.miui.gallery.editor.photo.widgets.overscroll.IOverScrollInterface.IOverScrollDecoratorAdapter;

public abstract class OverScrollBounceEffectDecoratorBase implements OnTouchListener {
    protected final BounceBackState mBounceBackState;
    protected IDecoratorState mCurrentState;
    protected final IdleState mIdleState;
    protected final OverScrollingState mOverScrollingState;
    protected final OverScrollStartAttributes mStartAttr = new OverScrollStartAttributes();
    protected float mVelocity;
    protected final IOverScrollDecoratorAdapter mViewAdapter;

    protected static abstract class AnimationAttributes {
        public float mAbsOffset;
        public float mMaxOffset;
        public Property<View, Float> mProperty;

        protected AnimationAttributes() {
        }

        /* access modifiers changed from: protected */
        public abstract void init(View view);
    }

    protected class BounceBackState implements AnimatorListener, AnimatorUpdateListener, IDecoratorState {
        protected final AnimationAttributes mAnimAttributes;
        protected final Interpolator mBounceBackInterpolator = new DecelerateInterpolator();
        protected final float mDecelerateFactor;
        protected final float mDoubleDecelerateFactor;

        public BounceBackState(float f) {
            this.mDecelerateFactor = f;
            this.mDoubleDecelerateFactor = f * 2.0f;
            this.mAnimAttributes = OverScrollBounceEffectDecoratorBase.this.createAnimationAttributes();
        }

        /* access modifiers changed from: protected */
        public Animator createAnimator() {
            View view = OverScrollBounceEffectDecoratorBase.this.mViewAdapter.getView();
            this.mAnimAttributes.init(view);
            if (OverScrollBounceEffectDecoratorBase.this.mVelocity == 0.0f || ((OverScrollBounceEffectDecoratorBase.this.mVelocity < 0.0f && OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir) || (OverScrollBounceEffectDecoratorBase.this.mVelocity > 0.0f && !OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir))) {
                return createBounceBackAnimator(this.mAnimAttributes.mAbsOffset);
            }
            float f = (-OverScrollBounceEffectDecoratorBase.this.mVelocity) / this.mDecelerateFactor;
            if (f < 0.0f) {
                f = 0.0f;
            }
            float f2 = this.mAnimAttributes.mAbsOffset + (((-OverScrollBounceEffectDecoratorBase.this.mVelocity) * OverScrollBounceEffectDecoratorBase.this.mVelocity) / this.mDoubleDecelerateFactor);
            ObjectAnimator createSlowdownAnimator = createSlowdownAnimator(view, (int) f, f2);
            ObjectAnimator createBounceBackAnimator = createBounceBackAnimator(f2);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playSequentially(new Animator[]{createSlowdownAnimator, createBounceBackAnimator});
            return animatorSet;
        }

        /* access modifiers changed from: protected */
        public ObjectAnimator createBounceBackAnimator(float f) {
            float abs = (Math.abs(f) / this.mAnimAttributes.mMaxOffset) * 800.0f;
            ObjectAnimator ofFloat = ObjectAnimator.ofFloat(OverScrollBounceEffectDecoratorBase.this.mViewAdapter.getView(), this.mAnimAttributes.mProperty, new float[]{OverScrollBounceEffectDecoratorBase.this.mStartAttr.mAbsOffset});
            ofFloat.setDuration((long) Math.max((int) abs, 200));
            ofFloat.setInterpolator(this.mBounceBackInterpolator);
            ofFloat.addUpdateListener(this);
            return ofFloat;
        }

        /* access modifiers changed from: protected */
        public ObjectAnimator createSlowdownAnimator(View view, int i, float f) {
            ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, this.mAnimAttributes.mProperty, new float[]{f});
            ofFloat.setDuration((long) i);
            ofFloat.setInterpolator(this.mBounceBackInterpolator);
            ofFloat.addUpdateListener(this);
            return ofFloat;
        }

        public void handleEntryTransition(IDecoratorState iDecoratorState) {
            Animator createAnimator = createAnimator();
            createAnimator.addListener(this);
            createAnimator.start();
        }

        public boolean handleMoveTouchEvent(MotionEvent motionEvent) {
            return true;
        }

        public boolean handleUpOrCancelTouchEvent(MotionEvent motionEvent) {
            return true;
        }

        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationEnd(Animator animator) {
            OverScrollBounceEffectDecoratorBase.this.issueStateTransition(OverScrollBounceEffectDecoratorBase.this.mIdleState);
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
        }

        public void onAnimationUpdate(ValueAnimator valueAnimator) {
        }
    }

    protected interface IDecoratorState {
        void handleEntryTransition(IDecoratorState iDecoratorState);

        boolean handleMoveTouchEvent(MotionEvent motionEvent);

        boolean handleUpOrCancelTouchEvent(MotionEvent motionEvent);
    }

    protected class IdleState implements IDecoratorState {
        final MotionAttributes mMoveAttr;

        public IdleState() {
            this.mMoveAttr = OverScrollBounceEffectDecoratorBase.this.createMotionAttributes();
        }

        public void handleEntryTransition(IDecoratorState iDecoratorState) {
        }

        public boolean handleMoveTouchEvent(MotionEvent motionEvent) {
            if (!this.mMoveAttr.init(OverScrollBounceEffectDecoratorBase.this.mViewAdapter.getView(), motionEvent)) {
                return false;
            }
            if ((!OverScrollBounceEffectDecoratorBase.this.mViewAdapter.isInAbsoluteStart() || !this.mMoveAttr.mDir) && (!OverScrollBounceEffectDecoratorBase.this.mViewAdapter.isInAbsoluteEnd() || this.mMoveAttr.mDir)) {
                return false;
            }
            OverScrollBounceEffectDecoratorBase.this.mStartAttr.mPointerId = motionEvent.getPointerId(0);
            OverScrollBounceEffectDecoratorBase.this.mStartAttr.mAbsOffset = this.mMoveAttr.mAbsOffset;
            OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir = this.mMoveAttr.mDir;
            OverScrollBounceEffectDecoratorBase.this.issueStateTransition(OverScrollBounceEffectDecoratorBase.this.mOverScrollingState);
            return OverScrollBounceEffectDecoratorBase.this.mOverScrollingState.handleMoveTouchEvent(motionEvent);
        }

        public boolean handleUpOrCancelTouchEvent(MotionEvent motionEvent) {
            return false;
        }
    }

    protected static abstract class MotionAttributes {
        public float mAbsOffset;
        public float mDeltaOffset;
        public boolean mDir;

        protected MotionAttributes() {
        }

        /* access modifiers changed from: protected */
        public abstract boolean init(View view, MotionEvent motionEvent);
    }

    protected static class OverScrollStartAttributes {
        protected float mAbsOffset;
        protected boolean mDir;
        protected int mPointerId;

        protected OverScrollStartAttributes() {
        }
    }

    protected class OverScrollingState implements IDecoratorState {
        int mCurrDragState;
        final MotionAttributes mMoveAttr;
        protected final float mTouchDragRatioBck;
        protected final float mTouchDragRatioFwd;

        public OverScrollingState(float f, float f2) {
            this.mMoveAttr = OverScrollBounceEffectDecoratorBase.this.createMotionAttributes();
            this.mTouchDragRatioFwd = f;
            this.mTouchDragRatioBck = f2;
        }

        public void handleEntryTransition(IDecoratorState iDecoratorState) {
            this.mCurrDragState = OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir ? 1 : 2;
        }

        public boolean handleMoveTouchEvent(MotionEvent motionEvent) {
            if (OverScrollBounceEffectDecoratorBase.this.mStartAttr.mPointerId != motionEvent.getPointerId(0)) {
                OverScrollBounceEffectDecoratorBase.this.issueStateTransition(OverScrollBounceEffectDecoratorBase.this.mBounceBackState);
                return true;
            }
            View view = OverScrollBounceEffectDecoratorBase.this.mViewAdapter.getView();
            if (!this.mMoveAttr.init(view, motionEvent)) {
                return true;
            }
            float f = this.mMoveAttr.mDeltaOffset / (this.mMoveAttr.mDir == OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir ? this.mTouchDragRatioFwd : this.mTouchDragRatioBck);
            float f2 = this.mMoveAttr.mAbsOffset + f;
            if ((!OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir || this.mMoveAttr.mDir || f2 > OverScrollBounceEffectDecoratorBase.this.mStartAttr.mAbsOffset) && (OverScrollBounceEffectDecoratorBase.this.mStartAttr.mDir || !this.mMoveAttr.mDir || f2 < OverScrollBounceEffectDecoratorBase.this.mStartAttr.mAbsOffset)) {
                if (view.getParent() != null) {
                    view.getParent().requestDisallowInterceptTouchEvent(true);
                }
                long eventTime = motionEvent.getEventTime() - motionEvent.getHistoricalEventTime(0);
                if (eventTime > 0) {
                    OverScrollBounceEffectDecoratorBase.this.mVelocity = f / ((float) eventTime);
                }
                OverScrollBounceEffectDecoratorBase.this.translateView(view, f2);
                return true;
            }
            OverScrollBounceEffectDecoratorBase.this.translateViewAndEvent(view, OverScrollBounceEffectDecoratorBase.this.mStartAttr.mAbsOffset, motionEvent);
            OverScrollBounceEffectDecoratorBase.this.issueStateTransition(OverScrollBounceEffectDecoratorBase.this.mIdleState);
            return true;
        }

        public boolean handleUpOrCancelTouchEvent(MotionEvent motionEvent) {
            OverScrollBounceEffectDecoratorBase.this.issueStateTransition(OverScrollBounceEffectDecoratorBase.this.mBounceBackState);
            return false;
        }
    }

    public OverScrollBounceEffectDecoratorBase(IOverScrollDecoratorAdapter iOverScrollDecoratorAdapter, float f, float f2, float f3) {
        this.mViewAdapter = iOverScrollDecoratorAdapter;
        this.mBounceBackState = new BounceBackState(f);
        this.mOverScrollingState = new OverScrollingState(f2, f3);
        this.mIdleState = new IdleState();
        this.mCurrentState = this.mIdleState;
        attach();
    }

    /* access modifiers changed from: protected */
    public void attach() {
        getView().setOnTouchListener(this);
        getView().setOverScrollMode(2);
    }

    /* access modifiers changed from: protected */
    public abstract AnimationAttributes createAnimationAttributes();

    /* access modifiers changed from: protected */
    public abstract MotionAttributes createMotionAttributes();

    public View getView() {
        return this.mViewAdapter.getView();
    }

    /* access modifiers changed from: protected */
    public void issueStateTransition(IDecoratorState iDecoratorState) {
        IDecoratorState iDecoratorState2 = this.mCurrentState;
        this.mCurrentState = iDecoratorState;
        this.mCurrentState.handleEntryTransition(iDecoratorState2);
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 1:
            case 3:
                return this.mCurrentState.handleUpOrCancelTouchEvent(motionEvent);
            case 2:
                return this.mCurrentState.handleMoveTouchEvent(motionEvent);
            default:
                return false;
        }
    }

    /* access modifiers changed from: protected */
    public abstract void translateView(View view, float f);

    /* access modifiers changed from: protected */
    public abstract void translateViewAndEvent(View view, float f, MotionEvent motionEvent);
}
