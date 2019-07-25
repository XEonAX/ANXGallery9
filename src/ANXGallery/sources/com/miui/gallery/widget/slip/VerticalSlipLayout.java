package com.miui.gallery.widget.slip;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.Scroller;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import miui.view.animation.CubicEaseOutInterpolator;

public class VerticalSlipLayout extends FrameLayout {
    private int mActivePointerId;
    private View mBottomView;
    private boolean mDragEnable;
    private int mFixedSideSlipDis;
    /* access modifiers changed from: private */
    public boolean mFlingToSlipped;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsBeingDragged;
    /* access modifiers changed from: private */
    public boolean mIsSlipped;
    private boolean mIsSlippedWhenEnter;
    private float mLastMotionX;
    private float mLastMotionY;
    private int mMaxSlipY;
    private int mMaximumVelocity;
    private int mMinSlipY;
    private int mMinimumVelocity;
    /* access modifiers changed from: private */
    public Drawable mNonSlippedDrawable;
    /* access modifiers changed from: private */
    public OnSlipListener mSlipListener;
    private int mSlipMode;
    /* access modifiers changed from: private */
    public SlipRunnable mSlipRunnable;
    /* access modifiers changed from: private */
    public int mSlipState;
    private boolean mSlipViewInitialized;
    /* access modifiers changed from: private */
    public Drawable mSlippedDrawable;
    private int mTopVInitMarginBottom;
    private int mTopVInitMarginTop;
    private View mTopView;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;

    public interface OnSlipListener {
        void onSlipEnd(boolean z);

        void onSlipStart();

        void onSlipStateChanged(int i);

        void onSlipping(float f);
    }

    private class SlipRunnable implements Runnable {
        private boolean isAbort;
        private final Interpolator mInterpolator = new CubicEaseOutInterpolator();
        private Scroller mScroller;
        private int mTargetY;

        SlipRunnable(Context context) {
            this.mScroller = new Scroller(context, this.mInterpolator);
        }

        private void completeSlip() {
            VerticalSlipLayout.this.mFlingToSlipped = false;
            this.mScroller.abortAnimation();
            VerticalSlipLayout.this.refreshSlipStatusByTarget(this.mTargetY);
            VerticalSlipLayout.this.setSlipState(0);
            VerticalSlipLayout.this.onSlipEnd();
        }

        public void abort() {
            VerticalSlipLayout.this.mFlingToSlipped = false;
            this.isAbort = true;
            this.mScroller.abortAnimation();
            VerticalSlipLayout.this.removeCallbacks(this);
        }

        public void run() {
            if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
                if (!this.isAbort) {
                    completeSlip();
                }
                return;
            }
            VerticalSlipLayout.this.performSlipTo((float) this.mScroller.getCurrY());
            VerticalSlipLayout.this.postOnAnimation(this);
        }

        public void slipTo(int i, int i2) {
            abort();
            boolean z = false;
            this.isAbort = false;
            int access$1300 = VerticalSlipLayout.this.getSlipY();
            int i3 = i - access$1300;
            this.mTargetY = i;
            if (i3 == 0) {
                completeSlip();
                return;
            }
            VerticalSlipLayout verticalSlipLayout = VerticalSlipLayout.this;
            if (VerticalSlipLayout.this.getSlippedY() == i) {
                z = true;
            }
            verticalSlipLayout.mFlingToSlipped = z;
            VerticalSlipLayout.this.setSlipState(2);
            this.mScroller.startScroll(0, access$1300, 0, i3, 250);
            VerticalSlipLayout.this.postOnAnimation(this);
        }
    }

    public VerticalSlipLayout(Context context) {
        this(context, null);
    }

    public VerticalSlipLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public VerticalSlipLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mDragEnable = true;
        this.mInitialMotionX = 0.0f;
        this.mInitialMotionY = 0.0f;
        this.mLastMotionY = 0.0f;
        this.mLastMotionX = 0.0f;
        this.mActivePointerId = -1;
        this.mSlipMode = 0;
        this.mSlipState = 0;
        this.mIsSlippedWhenEnter = false;
        this.mMinSlipY = -1;
        this.mMaxSlipY = -1;
        this.mFixedSideSlipDis = 0;
        this.mIsSlipped = false;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.VerticalSlipLayout, i, 0);
        this.mSlipMode = obtainStyledAttributes.getInt(1, 0);
        this.mIsSlippedWhenEnter = obtainStyledAttributes.getBoolean(3, false);
        this.mFixedSideSlipDis = obtainStyledAttributes.getDimensionPixelSize(0, 0);
        Drawable drawable = obtainStyledAttributes.getDrawable(2);
        if (drawable != null) {
            this.mSlippedDrawable = drawable;
        }
        obtainStyledAttributes.recycle();
        initViewPager();
    }

    private int calculateSlipTo(float f, int i) {
        float abs = Math.abs(f) / ((float) (getMaxSlipY() - getMinSlipY()));
        float max = (float) Math.max(this.mMinimumVelocity * 10, this.mMaximumVelocity / 10);
        if (f > 0.0f) {
            if (abs > 0.2f) {
                return ((float) i) < (-max) ? getMinSlipY() : getMaxSlipY();
            } else if (abs <= 0.05f) {
                return getMinSlipY();
            } else {
                return i > this.mMinimumVelocity ? getMaxSlipY() : getMinSlipY();
            }
        } else if (abs > 0.2f) {
            return ((float) i) > max ? getMaxSlipY() : getMinSlipY();
        } else if (abs <= 0.05f) {
            return getMaxSlipY();
        } else {
            return i < (-this.mMinimumVelocity) ? getMinSlipY() : getMaxSlipY();
        }
    }

    private boolean canSlip() {
        return this.mSlipMode != 0 && this.mDragEnable && this.mSlipViewInitialized && getMinSlipY() < getMaxSlipY();
    }

    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mActivePointerId = -1;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private void ensureVelocityTracker() {
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
    }

    private LayoutParams getLayoutParams(View view) {
        return (LayoutParams) view.getLayoutParams();
    }

    private int getMaxSlipY() {
        return this.mMaxSlipY;
    }

    private int getMinSlipY() {
        return this.mMinSlipY;
    }

    /* access modifiers changed from: private */
    public int getSlipY() {
        if (this.mSlipMode == 1) {
            return this.mTopView.getTop();
        }
        if (this.mSlipMode == 2) {
            return this.mTopView.getBottom();
        }
        return -1;
    }

    /* access modifiers changed from: private */
    public int getSlippedY() {
        switch (this.mSlipMode) {
            case 1:
                return getMaxSlipY();
            case 2:
                return getMinSlipY();
            default:
                return 0;
        }
    }

    private void initSlipParams() {
        switch (this.mSlipMode) {
            case 1:
                this.mMinSlipY = this.mTopVInitMarginTop;
                this.mMaxSlipY = this.mBottomView.getBottom();
                return;
            case 2:
                this.mMinSlipY = this.mBottomView.getTop();
                this.mMaxSlipY = ((getLayoutParams(this.mTopView).topMargin + this.mTopView.getHeight()) + getLayoutParams(this.mTopView).bottomMargin) - this.mTopVInitMarginBottom;
                return;
            default:
                return;
        }
    }

    private void initSlipView() {
        int childCount = getChildCount();
        if (childCount >= 2) {
            this.mTopView = getChildAt(childCount - 1);
            this.mBottomView = getChildAt(childCount - 2);
            this.mTopVInitMarginTop = getLayoutParams(this.mTopView).topMargin;
            this.mTopVInitMarginBottom = getLayoutParams(this.mTopView).bottomMargin;
            setBottomViewVisible(this.mIsSlippedWhenEnter);
            this.mSlipViewInitialized = true;
        }
    }

    private void initViewPager() {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
        this.mMinimumVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mMaximumVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        setBackground(this.mNonSlippedDrawable);
    }

    private boolean needInitSlipParams() {
        return this.mMinSlipY == -1;
    }

    private boolean needIntercept(float f, float f2) {
        boolean z = false;
        if (Math.abs(f) > Math.abs(f2)) {
            return false;
        }
        if (this.mSlipMode == 2) {
            if (isSlipped()) {
                if (f2 > 0.0f) {
                    z = true;
                }
                return z;
            }
            if (f2 < 0.0f) {
                double abs = (double) Math.abs(f2);
                double tan = Math.tan(0.3141592653589793d);
                Double.isNaN(abs);
                if (abs * tan > ((double) Math.abs(f))) {
                    z = true;
                }
            }
            return z;
        } else if (this.mSlipMode != 1) {
            return false;
        } else {
            if (isSlipped()) {
                if (f2 < 0.0f) {
                    z = true;
                }
                return z;
            }
            if (f2 > 0.0f) {
                double abs2 = (double) Math.abs(f2);
                double tan2 = Math.tan(0.3141592653589793d);
                Double.isNaN(abs2);
                if (abs2 * tan2 > ((double) Math.abs(f))) {
                    z = true;
                }
            }
            return z;
        }
    }

    /* access modifiers changed from: private */
    public void notifySlipAnimChildren(View view, float f) {
        if (this.mSlipListener != null) {
            this.mSlipListener.onSlipping(f);
        }
        if (view instanceof ISlipAnimView) {
            ((ISlipAnimView) view).onSlipping(f);
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                notifySlipAnimChildren(viewGroup.getChildAt(i), f);
            }
        }
    }

    /* access modifiers changed from: private */
    public void onSlipEnd() {
        post(new Runnable() {
            public void run() {
                if (VerticalSlipLayout.this.mIsSlipped) {
                    VerticalSlipLayout.this.setBackground(VerticalSlipLayout.this.mSlippedDrawable);
                } else {
                    VerticalSlipLayout.this.setBackground(VerticalSlipLayout.this.mNonSlippedDrawable);
                    VerticalSlipLayout.this.setBottomViewVisible(false);
                }
                VerticalSlipLayout.this.notifySlipAnimChildren(VerticalSlipLayout.this, VerticalSlipLayout.this.mIsSlipped ? 1.0f : 0.0f);
                VerticalSlipLayout.this.requestLayout();
                if (VerticalSlipLayout.this.mSlipListener != null) {
                    VerticalSlipLayout.this.mSlipListener.onSlipEnd(VerticalSlipLayout.this.mIsSlipped);
                }
                Log.d("VerticalSlipLayout", "onSlipEnd %s", (Object) Boolean.valueOf(VerticalSlipLayout.this.mIsSlipped));
            }
        });
    }

    /* access modifiers changed from: private */
    public void onSlipStart() {
        setBackground(this.mSlippedDrawable);
        setBottomViewVisible(true);
        if (this.mSlipListener != null) {
            this.mSlipListener.onSlipStart();
        }
    }

    private void performSlipBy(float f) {
        performSlipTo(Math.min(Math.max(((float) getSlipY()) + f, (float) getMinSlipY()), (float) getMaxSlipY()));
    }

    /* access modifiers changed from: private */
    public void performSlipTo(float f) {
        LayoutParams layoutParams = getLayoutParams(this.mTopView);
        float minSlipY = ((f - ((float) getMinSlipY())) * 1.0f) / ((float) (getMaxSlipY() - getMinSlipY()));
        if (this.mSlipMode == 1) {
            layoutParams.topMargin = (int) (((float) getHeight()) - f);
            if (((double) this.mFixedSideSlipDis) > 18.0d) {
                layoutParams.bottomMargin = (int) (((float) this.mFixedSideSlipDis) * minSlipY);
            }
        } else if (this.mSlipMode == 2) {
            minSlipY = 1.0f - minSlipY;
            layoutParams.bottomMargin = (int) (((float) getHeight()) - f);
            if (((double) this.mFixedSideSlipDis) > 18.0d) {
                layoutParams.topMargin = (int) (((float) this.mFixedSideSlipDis) * minSlipY);
            }
        }
        notifySlipAnimChildren(this, minSlipY);
        this.mTopView.setLayoutParams(layoutParams);
    }

    /* access modifiers changed from: private */
    public void refreshSlipStatusByTarget(int i) {
        boolean z = false;
        if (this.mSlipMode == 1) {
            if (i > getMinSlipY()) {
                z = true;
            }
            this.mIsSlipped = z;
        } else if (this.mSlipMode == 2) {
            if (i < getMaxSlipY()) {
                z = true;
            }
            this.mIsSlipped = z;
        }
    }

    private void resetSlipParams() {
        this.mMinSlipY = -1;
        this.mMaxSlipY = -1;
    }

    /* access modifiers changed from: private */
    public void setBottomViewVisible(boolean z) {
        this.mBottomView.setVisibility(z ? 0 : 4);
    }

    /* access modifiers changed from: private */
    public void setSlipState(int i) {
        if (this.mSlipState != i) {
            this.mSlipState = i;
            if (this.mSlipListener != null) {
                this.mSlipListener.onSlipStateChanged(i);
            }
        }
    }

    private void setSlippedInternal(boolean z) {
        if (this.mSlipMode == 1) {
            slipTo(getMaxSlipY(), 0, z);
        } else if (this.mSlipMode == 2) {
            slipTo(getMinSlipY(), 0, z);
        }
    }

    private void setUnSlippedInternal(boolean z) {
        if (this.mSlipMode == 1) {
            slipTo(getMinSlipY(), 0, z);
        } else if (this.mSlipMode == 2) {
            slipTo(getMaxSlipY(), 0, z);
        }
    }

    private void slipTo(final int i, final int i2, final boolean z) {
        post(new Runnable() {
            public void run() {
                if (VerticalSlipLayout.this.mSlipState == 0) {
                    VerticalSlipLayout.this.setSlipState(2);
                    VerticalSlipLayout.this.onSlipStart();
                }
                if (z) {
                    if (VerticalSlipLayout.this.mSlipRunnable == null) {
                        VerticalSlipLayout.this.mSlipRunnable = new SlipRunnable(VerticalSlipLayout.this.getContext());
                    }
                    VerticalSlipLayout.this.mSlipRunnable.slipTo(i, i2);
                    return;
                }
                if (VerticalSlipLayout.this.mSlipRunnable != null) {
                    VerticalSlipLayout.this.mSlipRunnable.abort();
                }
                VerticalSlipLayout.this.performSlipTo((float) i);
                VerticalSlipLayout.this.refreshSlipStatusByTarget(i);
                VerticalSlipLayout.this.setSlipState(0);
                VerticalSlipLayout.this.onSlipEnd();
            }
        });
    }

    private void startDrag() {
        this.mIsBeingDragged = true;
        setSlipState(1);
        onSlipStart();
    }

    private float translateTouchDistance(float f) {
        return f * 0.6f;
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (this.mSlipState == 2) {
            return false;
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    public boolean isFlingToSlipped() {
        return this.mFlingToSlipped;
    }

    public boolean isSlipped() {
        return this.mIsSlipped;
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        if (this.mSlipRunnable != null) {
            this.mSlipRunnable.abort();
        }
        this.mSlipListener = null;
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        if (!this.mSlipViewInitialized) {
            initSlipView();
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (!canSlip() || motionEvent.getPointerCount() > 1) {
            return false;
        }
        switch (motionEvent.getAction() & 255) {
            case 0:
                this.mIsBeingDragged = false;
                float x = motionEvent.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                float y = motionEvent.getY();
                this.mInitialMotionY = y;
                this.mLastMotionY = y;
                this.mActivePointerId = motionEvent.getPointerId(0);
                break;
            case 1:
            case 3:
                endDrag();
                return false;
            case 2:
                if (this.mActivePointerId != -1) {
                    int findPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                    if (findPointerIndex >= 0) {
                        float x2 = motionEvent.getX(findPointerIndex);
                        float y2 = motionEvent.getY(findPointerIndex);
                        if (!this.mIsBeingDragged && Math.abs(y2 - this.mInitialMotionY) > ((float) (this.mTouchSlop * 2))) {
                            if (needIntercept(x2 - this.mInitialMotionX, y2 - this.mInitialMotionY)) {
                                this.mInitialMotionX = this.mLastMotionX;
                                this.mInitialMotionY = this.mLastMotionY;
                                startDrag();
                                Log.d("VerticalSlipLayout", "onSlipStart");
                            } else {
                                this.mActivePointerId = -1;
                            }
                        }
                        if (this.mIsBeingDragged) {
                            performSlipBy(translateTouchDistance(y2 - this.mLastMotionY));
                        }
                        this.mLastMotionX = x2;
                        this.mLastMotionY = y2;
                        break;
                    }
                }
                break;
        }
        if (this.mIsBeingDragged) {
            ensureVelocityTracker();
            this.mVelocityTracker.addMovement(motionEvent);
        }
        return this.mIsBeingDragged;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (this.mSlipViewInitialized) {
            if (needInitSlipParams()) {
                initSlipParams();
            }
            if (this.mIsSlippedWhenEnter) {
                this.mIsSlippedWhenEnter = false;
                setSlippedInternal(false);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        resetSlipParams();
        super.onSizeChanged(i, i2, i3, i4);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int i = 0;
        if (!canSlip()) {
            return false;
        }
        int action = motionEvent.getAction() & 255;
        if (action != 0 || motionEvent.getEdgeFlags() == 0) {
            switch (action) {
                case 0:
                    this.mIsBeingDragged = false;
                    float x = motionEvent.getX();
                    this.mInitialMotionX = x;
                    this.mLastMotionX = x;
                    float y = motionEvent.getY();
                    this.mInitialMotionY = y;
                    this.mLastMotionY = y;
                    this.mActivePointerId = motionEvent.getPointerId(0);
                    break;
                case 1:
                    if (this.mIsBeingDragged) {
                        if (this.mActivePointerId != -1) {
                            int findPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                            if (findPointerIndex >= 0) {
                                this.mVelocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
                                int yVelocity = (int) this.mVelocityTracker.getYVelocity(this.mActivePointerId);
                                slipTo(calculateSlipTo(translateTouchDistance(motionEvent.getY(findPointerIndex) - this.mInitialMotionY), yVelocity), yVelocity, true);
                            }
                        } else {
                            setUnSlipped(true);
                        }
                    }
                    endDrag();
                    break;
                case 2:
                    if (this.mActivePointerId != -1) {
                        int findPointerIndex2 = motionEvent.findPointerIndex(this.mActivePointerId);
                        if (findPointerIndex2 >= 0) {
                            float x2 = motionEvent.getX(findPointerIndex2);
                            float y2 = motionEvent.getY(findPointerIndex2);
                            if (!this.mIsBeingDragged && Math.abs(y2 - this.mInitialMotionY) > ((float) (this.mTouchSlop * 2))) {
                                if (needIntercept(x2 - this.mInitialMotionX, y2 - this.mInitialMotionY)) {
                                    this.mInitialMotionX = this.mLastMotionX;
                                    this.mInitialMotionY = this.mLastMotionY;
                                    startDrag();
                                    Log.d("VerticalSlipLayout", "onSlipStart");
                                } else {
                                    this.mActivePointerId = -1;
                                }
                            }
                            if (this.mIsBeingDragged) {
                                performSlipBy(translateTouchDistance(y2 - this.mLastMotionY));
                            }
                            this.mLastMotionX = x2;
                            this.mLastMotionY = y2;
                            break;
                        }
                    }
                    break;
                case 3:
                    if (this.mIsBeingDragged) {
                        if (this.mActivePointerId != -1) {
                            int findPointerIndex3 = motionEvent.findPointerIndex(this.mActivePointerId);
                            if (findPointerIndex3 >= 0) {
                                slipTo(calculateSlipTo(translateTouchDistance(motionEvent.getY(findPointerIndex3) - this.mInitialMotionY), 0), 0, true);
                            }
                        } else {
                            setUnSlipped(true);
                        }
                    }
                    endDrag();
                    break;
                case 5:
                    int actionIndex = motionEvent.getActionIndex();
                    float x3 = motionEvent.getX(actionIndex);
                    float y3 = motionEvent.getY(actionIndex);
                    this.mLastMotionX = x3;
                    this.mLastMotionY = y3;
                    this.mActivePointerId = motionEvent.getPointerId(actionIndex);
                    if (!this.mIsBeingDragged) {
                        this.mInitialMotionX = x3;
                        this.mInitialMotionY = y3;
                        break;
                    }
                    break;
                case 6:
                    int actionIndex2 = motionEvent.getActionIndex();
                    if (this.mActivePointerId == motionEvent.getPointerId(actionIndex2)) {
                        if (actionIndex2 == 0) {
                            i = 1;
                        }
                        float x4 = motionEvent.getX(i);
                        float y4 = motionEvent.getY(i);
                        this.mLastMotionX = x4;
                        this.mLastMotionY = y4;
                        this.mActivePointerId = motionEvent.getPointerId(i);
                        if (!this.mIsBeingDragged) {
                            this.mInitialMotionX = x4;
                            this.mInitialMotionY = y4;
                            break;
                        }
                    }
                    break;
            }
            if (this.mIsBeingDragged) {
                ensureVelocityTracker();
                this.mVelocityTracker.addMovement(motionEvent);
            }
            return true;
        }
        endDrag();
        return false;
    }

    public void setDraggable(boolean z) {
        this.mDragEnable = z;
    }

    public void setFixedSideSlipDistance(int i) {
        this.mFixedSideSlipDis = i;
        if (isSlipped()) {
            setSlippedInternal(false);
        }
    }

    public void setOnSlipListener(OnSlipListener onSlipListener) {
        this.mSlipListener = onSlipListener;
    }

    public void setSlipped(boolean z) {
        if (canSlip() && !isSlipped()) {
            setSlippedInternal(z);
        }
    }

    public void setSlippedWhenEnter(boolean z) {
        if (this.mMinSlipY != -1) {
            setSlipped(true);
        } else {
            this.mIsSlippedWhenEnter = z;
        }
    }

    public void setUnSlipped(boolean z) {
        if (canSlip() && isSlipped()) {
            setUnSlippedInternal(z);
        }
    }
}
