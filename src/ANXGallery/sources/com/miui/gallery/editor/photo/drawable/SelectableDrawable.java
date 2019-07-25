package com.miui.gallery.editor.photo.drawable;

import android.animation.TimeInterpolator;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.SystemClock;
import android.util.StateSet;

public class SelectableDrawable extends Drawable {
    private static final int[] STATE_ACTIVATED = {16843518};
    private static final int[] STATE_SELECTED = {16842913};
    private State mAnimateState;
    private Callback mChildrenCallback;
    private long mDuration;
    private int mFromAlpha;
    private TimeInterpolator mInterpolator;
    private boolean mMutated;
    private boolean mSelected;
    private long mStart;
    /* access modifiers changed from: private */
    public ChildrenState mState;
    private int mToAlpha;

    private static class ChildrenState extends ConstantState {
        /* access modifiers changed from: private */
        public int mChangingConfigurations;
        /* access modifiers changed from: private */
        public Drawable mNormal;
        /* access modifiers changed from: private */
        public Drawable mSelect;

        ChildrenState(Drawable drawable, Drawable drawable2) {
            this.mNormal = drawable;
            this.mSelect = drawable2;
        }

        private ChildrenState(ChildrenState childrenState) {
            this.mNormal = childrenState.mNormal;
            this.mSelect = childrenState.mSelect;
            this.mChangingConfigurations = childrenState.mChangingConfigurations;
        }

        public int getChangingConfigurations() {
            return this.mChangingConfigurations | this.mNormal.getChangingConfigurations() | this.mSelect.getChangingConfigurations();
        }

        /* access modifiers changed from: 0000 */
        public ChildrenState mutate() {
            ChildrenState childrenState = new ChildrenState(this);
            childrenState.mNormal.mutate();
            childrenState.mSelect.mutate();
            return childrenState;
        }

        public Drawable newDrawable() {
            return new SelectableDrawable(this);
        }
    }

    private enum State {
        IDLE,
        PREPARE,
        RUNNING
    }

    public SelectableDrawable(Drawable drawable, Drawable drawable2) {
        this(new ChildrenState(drawable, drawable2));
    }

    private SelectableDrawable(ChildrenState childrenState) {
        this.mDuration = 200;
        this.mChildrenCallback = new Callback() {
            public void invalidateDrawable(Drawable drawable) {
                if (SelectableDrawable.this.getCallback() == null) {
                    return;
                }
                if (drawable == SelectableDrawable.this.mState.mNormal || drawable == SelectableDrawable.this.mState.mSelect) {
                    SelectableDrawable.this.getCallback().invalidateDrawable(SelectableDrawable.this);
                }
            }

            public void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
                if (SelectableDrawable.this.getCallback() == null) {
                    return;
                }
                if (drawable == SelectableDrawable.this.mState.mNormal || drawable == SelectableDrawable.this.mState.mSelect) {
                    SelectableDrawable.this.getCallback().scheduleDrawable(SelectableDrawable.this, runnable, j);
                }
            }

            public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
                if (SelectableDrawable.this.getCallback() == null) {
                    return;
                }
                if (drawable == SelectableDrawable.this.mState.mNormal || drawable == SelectableDrawable.this.mState.mSelect) {
                    SelectableDrawable.this.getCallback().unscheduleDrawable(SelectableDrawable.this, runnable);
                }
            }
        };
        this.mState = childrenState;
        this.mState.mNormal.setCallback(this.mChildrenCallback);
        this.mState.mSelect.setCallback(this.mChildrenCallback);
    }

    private static int calculateAlpha(float f, int i, int i2, TimeInterpolator timeInterpolator) {
        if (f > 1.0f) {
            f = 1.0f;
        }
        if (timeInterpolator != null) {
            f = timeInterpolator.getInterpolation(f);
        }
        return (int) (((float) i) + (((float) (i2 - i)) * f));
    }

    public void clearColorFilter() {
        this.mState.mNormal.clearColorFilter();
        this.mState.mSelect.clearColorFilter();
    }

    public void draw(Canvas canvas) {
        if (this.mAnimateState == State.IDLE) {
            getCurrent().draw(canvas);
            return;
        }
        this.mState.mNormal.draw(canvas);
        long uptimeMillis = SystemClock.uptimeMillis();
        if (this.mAnimateState == State.PREPARE) {
            this.mStart = uptimeMillis;
            this.mAnimateState = State.RUNNING;
        }
        int alpha = this.mState.mSelect.getAlpha();
        float f = ((float) (uptimeMillis - this.mStart)) / ((float) this.mDuration);
        this.mState.mSelect.setAlpha(calculateAlpha(f, this.mFromAlpha, this.mToAlpha, this.mInterpolator));
        this.mState.mSelect.draw(canvas);
        this.mState.mSelect.setAlpha(alpha);
        if (f < 1.0f) {
            invalidateSelf();
        } else {
            this.mAnimateState = State.IDLE;
        }
    }

    public int getAlpha() {
        return getCurrent().getAlpha();
    }

    public int getChangingConfigurations() {
        return this.mState.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        return this.mState;
    }

    public Drawable getCurrent() {
        return this.mSelected ? this.mState.mSelect : this.mState.mNormal;
    }

    public int getIntrinsicHeight() {
        return getCurrent().getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return getCurrent().getIntrinsicWidth();
    }

    public int getMinimumHeight() {
        return getCurrent().getMinimumHeight();
    }

    public int getMinimumWidth() {
        return getCurrent().getMinimumWidth();
    }

    public int getOpacity() {
        return getCurrent().getOpacity();
    }

    public boolean getPadding(Rect rect) {
        return getCurrent().getPadding(rect);
    }

    public Region getTransparentRegion() {
        return getCurrent().getTransparentRegion();
    }

    public boolean isAutoMirrored() {
        return getCurrent().isAutoMirrored();
    }

    public boolean isStateful() {
        return true;
    }

    public void jumpToCurrentState() {
        super.jumpToCurrentState();
        if (this.mAnimateState != State.IDLE) {
            this.mAnimateState = State.IDLE;
        }
        invalidateSelf();
    }

    public Drawable mutate() {
        if (!this.mMutated) {
            this.mState = this.mState.mutate();
            this.mMutated = true;
        }
        return this;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        this.mState.mNormal.setBounds(rect);
        this.mState.mSelect.setBounds(rect);
    }

    /* access modifiers changed from: protected */
    public boolean onLevelChange(int i) {
        return this.mState.mSelect.setLevel(i) || this.mState.mNormal.setLevel(i);
    }

    /* access modifiers changed from: protected */
    public boolean onStateChange(int[] iArr) {
        boolean z = StateSet.stateSetMatches(STATE_SELECTED, iArr) || StateSet.stateSetMatches(STATE_ACTIVATED, iArr);
        if (this.mSelected == z) {
            return false;
        }
        this.mSelected = z;
        if (this.mAnimateState == State.PREPARE) {
            if ((z && this.mToAlpha == 0) || (!z && this.mFromAlpha == 0)) {
                this.mAnimateState = State.IDLE;
            }
            return false;
        }
        if (z) {
            this.mFromAlpha = 0;
            this.mToAlpha = this.mState.mSelect.getAlpha();
        } else {
            this.mFromAlpha = this.mState.mSelect.getAlpha();
            this.mToAlpha = 0;
        }
        this.mAnimateState = State.PREPARE;
        return true;
    }

    public void setAlpha(int i) {
        this.mState.mNormal.setAlpha(i);
        this.mState.mSelect.setAlpha(i);
        invalidateSelf();
    }

    public void setAutoMirrored(boolean z) {
        this.mState.mNormal.setAutoMirrored(z);
        this.mState.mSelect.setAutoMirrored(z);
    }

    public void setChangingConfigurations(int i) {
        this.mState.mChangingConfigurations = i;
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.mState.mNormal.setColorFilter(colorFilter);
        this.mState.mSelect.setColorFilter(colorFilter);
        invalidateSelf();
    }

    public void setDither(boolean z) {
        this.mState.mSelect.setDither(z);
        this.mState.mNormal.setDither(z);
    }

    public void setDuration(long j) {
        this.mDuration = j;
    }

    public void setFilterBitmap(boolean z) {
        this.mState.mSelect.setFilterBitmap(z);
        this.mState.mNormal.setFilterBitmap(z);
    }

    public void setInterpolator(TimeInterpolator timeInterpolator) {
        this.mInterpolator = timeInterpolator;
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.mState.mSelect.setVisible(z, z2) || this.mState.mNormal.setVisible(z, z2);
    }
}
