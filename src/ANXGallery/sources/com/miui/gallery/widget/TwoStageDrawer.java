package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.widget.AdapterView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.Scroller;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;

public class TwoStageDrawer extends RelativeLayout {
    private int mActionPointerId;
    private boolean mAlwaysShowTargetViewDivider;
    private DrawerAnimEndListener mAnimEndListener;
    private boolean mAutoClose;
    /* access modifiers changed from: private */
    public boolean mCanScrollDown;
    private Drawable mContentViewBackground;
    private int mDetectMode;
    private int mDividerHeight;
    private float mDownTranslationY;
    private View mDownView;
    private float mDownX;
    private float mDownY;
    private boolean mDragEnabled;
    private boolean mDrawDividerWhenContentEmpty;
    private DrawerListener mDrawerListener;
    private int mInitialDrawerState;
    /* access modifiers changed from: private */
    public boolean mIsFirstLayoutChanged;
    private float mLastY;
    private int mMinimumFlingVelocity;
    private OnGlobalLayoutListener mOnGlobalLayoutListener;
    private boolean mPendingScroll;
    /* access modifiers changed from: private */
    public boolean mPendingTranslate;
    /* access modifiers changed from: private */
    public int mPrimaryContentHeight;
    /* access modifiers changed from: private */
    public boolean mPrimaryContentHeightChanged;
    /* access modifiers changed from: private */
    public View mPrimaryContentView;
    private int mPrimaryContentViewId;
    private Drawable mScrollDivider;
    private int mScrollableViewId;
    /* access modifiers changed from: private */
    public ScrollableView mScrollableViewWrapper;
    private Scroller mScroller;
    /* access modifiers changed from: private */
    public boolean mScrolling;
    /* access modifiers changed from: private */
    public int mSecondaryContentHeight;
    /* access modifiers changed from: private */
    public boolean mSecondaryContentHeightChanged;
    /* access modifiers changed from: private */
    public View mSecondaryContentView;
    private int mSecondaryContentViewId;
    private boolean mSupportMultiPoint;
    private View mTargetView;
    private View mTargetViewAncestor;
    private int mTargetViewId;
    private int mTouchMode;
    private int mTouchSlop;
    private TriggerListener mTriggerListener;
    private boolean mTriggerOn;
    /* access modifiers changed from: private */
    public View mTriggerView;
    /* access modifiers changed from: private */
    public int mTriggerViewHeight;
    private int mTriggerViewId;
    private VelocityTracker mVelocityTracker;

    private static class AdapterViewWrapper implements ScrollableView {
        private AdapterView<?> mAdapterView;

        public AdapterViewWrapper(AdapterView<?> adapterView) {
            this.mAdapterView = adapterView;
        }

        public boolean canScrollDown() {
            if (this.mAdapterView.getFirstVisiblePosition() > 0) {
                return true;
            }
            int paddingTop = this.mAdapterView.getPaddingTop();
            int childCount = this.mAdapterView.getChildCount();
            for (int i = 0; i < childCount; i++) {
                if (this.mAdapterView.getChildAt(i).getTop() < paddingTop) {
                    return true;
                }
            }
            return false;
        }
    }

    public interface DrawerAnimEndListener {
        void onDrawerAnimEnd(boolean z);
    }

    public interface DrawerListener {
        void onDrawerClose(TwoStageDrawer twoStageDrawer);

        void onDrawerHalfOpen(TwoStageDrawer twoStageDrawer);

        void onDrawerOpen(TwoStageDrawer twoStageDrawer);

        void onDrawerSlide(TwoStageDrawer twoStageDrawer, float f);
    }

    private static class FixedViewWrapper implements ScrollableView {
        public boolean canScrollDown() {
            return false;
        }
    }

    private class MyOnScrollChangeListener implements OnScrollChangedListener {
        private MyOnScrollChangeListener() {
        }

        public void onScrollChanged() {
            boolean z = TwoStageDrawer.this.mScrollableViewWrapper != null && TwoStageDrawer.this.mScrollableViewWrapper.canScrollDown();
            if (TwoStageDrawer.this.mCanScrollDown != z) {
                TwoStageDrawer.this.mCanScrollDown = z;
                TwoStageDrawer.this.invalidate();
            }
        }
    }

    private static class RecyclerViewWrapper implements ScrollableView {
        private RecyclerView mRecycler;

        public RecyclerViewWrapper(RecyclerView recyclerView) {
            this.mRecycler = recyclerView;
        }

        public boolean canScrollDown() {
            return this.mRecycler.canScrollVertically(-1);
        }
    }

    private static class ScrollViewWrapper implements ScrollableView {
        private ScrollView mScrollView;

        public ScrollViewWrapper(ScrollView scrollView) {
            this.mScrollView = scrollView;
        }

        public boolean canScrollDown() {
            return this.mScrollView.getScrollY() > 0;
        }
    }

    public interface ScrollableView {
        boolean canScrollDown();
    }

    public interface TriggerListener {
        void onTriggerOpen(TwoStageDrawer twoStageDrawer);

        void onTriggerSlide(TwoStageDrawer twoStageDrawer, float f);
    }

    public TwoStageDrawer(Context context) {
        this(context, null);
    }

    public TwoStageDrawer(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public TwoStageDrawer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mActionPointerId = -1;
        this.mIsFirstLayoutChanged = true;
        this.mInitialDrawerState = 0;
        this.mSupportMultiPoint = true;
        this.mOnGlobalLayoutListener = new OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                boolean z;
                int access$100 = TwoStageDrawer.this.getViewHeight(TwoStageDrawer.this.mPrimaryContentView);
                if (access$100 != TwoStageDrawer.this.mPrimaryContentHeight) {
                    TwoStageDrawer.this.mPrimaryContentHeightChanged = (TwoStageDrawer.this.mPrimaryContentHeight == 0 || access$100 == 0) ? false : true;
                    TwoStageDrawer.this.mPrimaryContentHeight = access$100;
                    z = true;
                } else {
                    z = false;
                }
                int access$1002 = TwoStageDrawer.this.getViewHeight(TwoStageDrawer.this.mSecondaryContentView);
                if (access$1002 != TwoStageDrawer.this.mSecondaryContentHeight) {
                    TwoStageDrawer.this.mSecondaryContentHeightChanged = (TwoStageDrawer.this.mSecondaryContentHeight == 0 || access$1002 == 0) ? false : true;
                    TwoStageDrawer.this.mSecondaryContentHeight = access$1002;
                    z = true;
                }
                int access$1003 = TwoStageDrawer.this.getViewHeight(TwoStageDrawer.this.mTriggerView);
                if (access$1003 != TwoStageDrawer.this.mTriggerViewHeight) {
                    TwoStageDrawer.this.mTriggerViewHeight = access$1003;
                    z = true;
                }
                if (!z) {
                    return;
                }
                if (TwoStageDrawer.this.mIsFirstLayoutChanged) {
                    TwoStageDrawer.this.mIsFirstLayoutChanged = false;
                    TwoStageDrawer.this.onFirstLayoutChanged();
                } else if (TwoStageDrawer.this.mScrolling) {
                    TwoStageDrawer.this.mPendingTranslate = true;
                } else {
                    TwoStageDrawer.this.adaptiveTranslate();
                }
            }
        };
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.mMinimumFlingVelocity = ViewConfiguration.get(context).getScaledMinimumFlingVelocity();
        this.mScroller = new Scroller(context);
        this.mVelocityTracker = VelocityTracker.obtain();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.TwoStageDrawer, i, 0);
        this.mPrimaryContentViewId = obtainStyledAttributes.getResourceId(6, 0);
        this.mSecondaryContentViewId = obtainStyledAttributes.getResourceId(9, 0);
        this.mTargetViewId = obtainStyledAttributes.getResourceId(10, 0);
        this.mScrollableViewId = obtainStyledAttributes.getResourceId(8, 0);
        this.mScrollDivider = obtainStyledAttributes.getDrawable(7);
        if (this.mScrollDivider != null) {
            this.mDividerHeight = this.mScrollDivider.getIntrinsicHeight();
        }
        this.mTriggerViewId = obtainStyledAttributes.getResourceId(3, 0);
        this.mContentViewBackground = obtainStyledAttributes.getDrawable(4);
        this.mDragEnabled = obtainStyledAttributes.getBoolean(5, false);
        this.mAlwaysShowTargetViewDivider = obtainStyledAttributes.getBoolean(0, true);
        this.mDrawDividerWhenContentEmpty = obtainStyledAttributes.getBoolean(1, true);
        obtainStyledAttributes.recycle();
        getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
    }

    /* access modifiers changed from: private */
    public void adaptiveTranslate() {
        if (this.mPrimaryContentView != null || this.mSecondaryContentView != null) {
            int translationY = (int) this.mTargetView.getTranslationY();
            if (translationY == 0) {
                return;
            }
            if (this.mPrimaryContentView == null || this.mPrimaryContentView.getTranslationY() != 0.0f) {
                if (this.mSecondaryContentView != null && this.mSecondaryContentView.getTranslationY() == 0.0f) {
                    startScroll(translationY, this.mSecondaryContentHeight - translationY);
                }
            } else if (this.mSecondaryContentView == null || this.mSecondaryContentView.getTranslationY() != 0.0f) {
                startScroll(translationY, this.mPrimaryContentHeight - translationY);
            } else {
                startScroll(translationY, (this.mPrimaryContentHeight + this.mSecondaryContentHeight) - translationY);
            }
        }
    }

    private int computeScrollDuration(int i, float f) {
        float abs = Math.abs(f);
        int round = abs == 0.0f ? 0 : Math.round(Math.abs(((float) i) / abs) * 1000.0f) * 4;
        if (round > 800) {
            return 800;
        }
        return round;
    }

    private void dispatchTouchEventToChild(View view, MotionEvent motionEvent) {
        float f = -(((float) view.getLeft()) + view.getTranslationX());
        float f2 = -(((float) view.getTop()) + view.getTranslationY());
        motionEvent.offsetLocation(f, f2);
        view.dispatchTouchEvent(motionEvent);
        motionEvent.offsetLocation(-f, -f2);
    }

    private void dispatchTouchEventToChild(View view, MotionEvent motionEvent, int i) {
        dispatchTouchEventToChild(view, motionEvent, i, false);
    }

    private void dispatchTouchEventToChild(View view, MotionEvent motionEvent, int i, boolean z) {
        MotionEvent motionEvent2;
        if (z) {
            motionEvent2 = MotionEvent.obtain(motionEvent.getEventTime(), motionEvent.getEventTime(), i, motionEvent.getX(), motionEvent.getY(), motionEvent.getMetaState());
        } else {
            motionEvent2 = MotionEvent.obtain(motionEvent);
            motionEvent2.setAction(i);
        }
        dispatchTouchEventToChild(view, motionEvent2);
        motionEvent2.recycle();
    }

    private boolean drawPrimaryContentView(Canvas canvas, View view, long j) {
        int i;
        int translationY = (int) this.mTargetView.getTranslationY();
        if (translationY <= 0) {
            return true;
        }
        int width = getWidth();
        if (this.mDividerHeight <= 0 || translationY >= this.mPrimaryContentHeight) {
            i = 0;
        } else {
            this.mScrollDivider.setBounds(0, 0, width, this.mDividerHeight + 0);
            this.mScrollDivider.draw(canvas);
            i = this.mDividerHeight + 0;
        }
        if (this.mContentViewBackground != null) {
            this.mContentViewBackground.setBounds(0, i, width, translationY);
            this.mContentViewBackground.draw(canvas);
        }
        canvas.save();
        canvas.clipRect(0, i, width, translationY);
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas.restore();
        return drawChild;
    }

    private boolean drawSecondaryContentView(Canvas canvas, View view, long j) {
        int translationY = (int) this.mTargetView.getTranslationY();
        if (translationY <= this.mPrimaryContentHeight) {
            return true;
        }
        int width = getWidth();
        int i = this.mPrimaryContentHeight;
        if (translationY > this.mPrimaryContentHeight && translationY < this.mPrimaryContentHeight + this.mSecondaryContentHeight && this.mDividerHeight > 0) {
            this.mScrollDivider.setBounds(0, i, width, this.mDividerHeight + i);
            this.mScrollDivider.draw(canvas);
            i += this.mDividerHeight;
        }
        if (this.mContentViewBackground != null) {
            this.mContentViewBackground.setBounds(0, i, width, translationY);
            this.mContentViewBackground.draw(canvas);
        }
        canvas.save();
        canvas.clipRect(0, i, width, translationY);
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas.restore();
        return drawChild;
    }

    private boolean drawTargetViewAncestor(Canvas canvas, View view, long j) {
        boolean drawChild = super.drawChild(canvas, view, j);
        int translationY = (int) this.mTargetView.getTranslationY();
        if (this.mAlwaysShowTargetViewDivider || ((translationY <= 0 && this.mCanScrollDown) || (this.mDrawDividerWhenContentEmpty && this.mPrimaryContentHeight == 0 && this.mSecondaryContentHeight == 0))) {
            int width = getWidth();
            if (this.mDividerHeight > 0) {
                this.mScrollDivider.setBounds(0, translationY, width, this.mDividerHeight + translationY);
                this.mScrollDivider.draw(canvas);
            }
        }
        return drawChild;
    }

    private boolean drawTriggerView(Canvas canvas, View view, long j) {
        int translationY = (int) this.mTargetView.getTranslationY();
        if (translationY <= this.mPrimaryContentHeight + this.mSecondaryContentHeight) {
            return true;
        }
        int width = getWidth();
        int i = this.mPrimaryContentHeight + this.mSecondaryContentHeight;
        if (this.mContentViewBackground != null) {
            this.mContentViewBackground.setBounds(0, i, width, translationY);
            this.mContentViewBackground.draw(canvas);
        }
        canvas.save();
        canvas.clipRect(0, i, width, translationY);
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas.restore();
        return drawChild;
    }

    private View getTouchDownView(int i, int i2) {
        View[] viewArr;
        Rect rect = new Rect();
        for (View view : new View[]{this.mTargetViewAncestor, this.mTriggerView, this.mSecondaryContentView, this.mPrimaryContentView}) {
            if (view != null && view.getVisibility() == 0) {
                int x = (int) view.getX();
                int y = (int) view.getY();
                rect.set(x, y, view.getWidth() + x, view.getHeight() + y);
                if (rect.contains(i, i2)) {
                    return view;
                }
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public int getViewHeight(View view) {
        if (view == null || view.getVisibility() == 8) {
            return 0;
        }
        int measuredHeight = view.getMeasuredHeight();
        if (!(view instanceof ViewGroup)) {
            return measuredHeight;
        }
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        return measuredHeight + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
    }

    private void notifyDrawerStateChanged() {
        if (this.mDrawerListener == null) {
            return;
        }
        if (this.mPrimaryContentView != null || this.mSecondaryContentView != null) {
            int translationY = (int) this.mTargetView.getTranslationY();
            if (this.mDetectMode == 2) {
                this.mDrawerListener.onDrawerSlide(this, ((float) Math.min(this.mPrimaryContentHeight + this.mSecondaryContentHeight, Math.max(translationY, 0))) / ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight)));
            } else if (translationY == 0) {
                this.mDrawerListener.onDrawerClose(this);
            } else if (translationY == this.mPrimaryContentHeight) {
                if (this.mSecondaryContentHeight == 0) {
                    this.mDrawerListener.onDrawerOpen(this);
                } else {
                    this.mDrawerListener.onDrawerHalfOpen(this);
                }
            } else if (translationY == this.mPrimaryContentHeight + this.mSecondaryContentHeight) {
                this.mDrawerListener.onDrawerOpen(this);
            } else {
                this.mDrawerListener.onDrawerSlide(this, ((float) translationY) / ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight)));
            }
        }
    }

    private void notifyTriggerStateChanged() {
        if (this.mTriggerListener != null && this.mTriggerViewHeight > 0 && this.mDetectMode == 2) {
            int i = this.mTriggerViewHeight;
            int translationY = (((int) this.mTargetView.getTranslationY()) - this.mPrimaryContentHeight) - this.mSecondaryContentHeight;
            this.mTriggerListener.onTriggerSlide(this, ((float) translationY) / ((float) i));
            if (translationY >= i) {
                if (!this.mTriggerOn) {
                    this.mTriggerOn = true;
                    this.mTriggerListener.onTriggerOpen(this);
                }
            } else if (this.mTriggerOn) {
                this.mTriggerOn = false;
            }
        }
    }

    private void offsetTranslationAnimation(float f, float f2) {
        float f3;
        int translationY = (int) this.mTargetView.getTranslationY();
        float f4 = (translationY > this.mPrimaryContentHeight + this.mSecondaryContentHeight ? ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight)) + (((float) ((translationY - this.mPrimaryContentHeight) - this.mSecondaryContentHeight)) * 2.0f) : (float) translationY) + f;
        if (this.mDownTranslationY == ((float) this.mPrimaryContentHeight) || this.mTargetView.getTranslationY() > ((float) this.mPrimaryContentHeight) || f2 <= ((float) this.mMinimumFlingVelocity)) {
            f3 = Math.max(0.0f, Math.min(f4, this.mTriggerViewHeight <= 0 ? (float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight) : 2.14748365E9f));
        } else {
            f3 = Math.max(0.0f, Math.min(f4, (float) (this.mPrimaryContentView != null ? this.mPrimaryContentHeight : this.mSecondaryContentHeight)));
        }
        updateTranslationAnimation(f3 > ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight)) ? this.mPrimaryContentHeight + this.mSecondaryContentHeight + ((int) (((f3 - ((float) this.mPrimaryContentHeight)) - ((float) this.mSecondaryContentHeight)) / 2.0f)) : (int) f3);
        invalidate();
    }

    /* access modifiers changed from: private */
    public void onFirstLayoutChanged() {
        int i = 0;
        switch (this.mInitialDrawerState) {
            case 0:
                i = this.mSecondaryContentHeight + this.mPrimaryContentHeight;
                break;
            case 1:
                i = this.mPrimaryContentHeight;
                break;
        }
        updateTranslationAnimation(i);
    }

    private void startScroll(int i, int i2) {
        this.mScroller.startScroll(0, i, 0, i2);
        this.mScrolling = true;
        invalidate();
    }

    private void startScroll(int i, int i2, float f) {
        int computeScrollDuration = computeScrollDuration(i2, f);
        if (computeScrollDuration > 0) {
            startScroll(i, i2, computeScrollDuration);
        } else {
            startScroll(i, i2);
        }
    }

    private void startScroll(int i, int i2, int i3) {
        this.mScroller.startScroll(0, i, 0, i2, i3);
        this.mScrolling = true;
        invalidate();
    }

    private void updateTranslationAnimation(int i) {
        this.mTargetView.setTranslationY((float) i);
        int finalY = this.mScroller.getFinalY();
        if (this.mPrimaryContentView != null) {
            if (!this.mPrimaryContentHeightChanged) {
                if (i < this.mPrimaryContentHeight) {
                    this.mPrimaryContentView.setTranslationY((float) (i - this.mPrimaryContentHeight));
                } else if (this.mPrimaryContentView.getTranslationY() != 0.0f) {
                    this.mPrimaryContentView.setTranslationY(0.0f);
                }
            } else if (finalY == 0) {
                this.mPrimaryContentView.setTranslationY((float) (-this.mPrimaryContentHeight));
            } else {
                this.mPrimaryContentView.setTranslationY(0.0f);
            }
        }
        if (this.mSecondaryContentView != null) {
            if (!this.mSecondaryContentHeightChanged) {
                if (i <= this.mPrimaryContentHeight) {
                    this.mSecondaryContentView.setTranslationY((float) ((0 - this.mPrimaryContentHeight) - this.mSecondaryContentHeight));
                } else {
                    this.mSecondaryContentView.setTranslationY((float) ((i - this.mPrimaryContentHeight) - this.mSecondaryContentHeight));
                }
            } else if (finalY == 0 || finalY == this.mPrimaryContentHeight) {
                this.mSecondaryContentView.setTranslationY((float) (-(this.mPrimaryContentHeight + this.mSecondaryContentHeight)));
            } else {
                this.mSecondaryContentView.setTranslationY(0.0f);
            }
        }
        if (this.mTriggerView != null) {
            if (i <= this.mPrimaryContentHeight + this.mSecondaryContentHeight) {
                this.mTriggerView.setTranslationY((float) (((0 - this.mPrimaryContentHeight) - this.mSecondaryContentHeight) - this.mTriggerViewHeight));
            } else {
                this.mTriggerView.setTranslationY(0.0f);
            }
        }
        notifyTriggerStateChanged();
    }

    public void closeDrawer(boolean z, DrawerAnimEndListener drawerAnimEndListener) {
        this.mAnimEndListener = drawerAnimEndListener;
        if (z) {
            int translationY = (int) this.mTargetView.getTranslationY();
            startScroll(translationY, -translationY, 500);
            return;
        }
        this.mScroller.forceFinished(true);
        updateTranslationAnimation(0);
        notifyDrawerStateChanged();
        invalidate();
    }

    public void computeScroll() {
        super.computeScroll();
        if (this.mTargetView == null) {
            return;
        }
        if (this.mScroller.computeScrollOffset()) {
            updateTranslationAnimation(this.mScroller.getCurrY());
            postInvalidateOnAnimation();
            return;
        }
        if (this.mAnimEndListener != null) {
            this.mAnimEndListener.onDrawerAnimEnd(isDrawerOpen());
            this.mAnimEndListener = null;
        }
        if (this.mScrolling) {
            this.mScrolling = false;
            notifyDrawerStateChanged();
            if (this.mPendingTranslate) {
                adaptiveTranslate();
                this.mPendingTranslate = false;
                return;
            }
            this.mPrimaryContentHeightChanged = false;
            this.mSecondaryContentHeightChanged = false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:86:0x0166, code lost:
        if (r12.mScrollableViewWrapper.canScrollDown() == false) goto L_0x0169;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x017d, code lost:
        if (r12.mScrollableViewWrapper != null) goto L_0x016b;
     */
    /* JADX WARNING: Removed duplicated region for block: B:105:0x01a8  */
    /* JADX WARNING: Removed duplicated region for block: B:96:0x0182  */
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (!this.mSupportMultiPoint && motionEvent.getPointerCount() > 1) {
            this.mDetectMode = 0;
            return super.dispatchTouchEvent(motionEvent);
        } else if ((!this.mDragEnabled && this.mTriggerView == null) || ((this.mPrimaryContentHeight <= 0 && this.mSecondaryContentHeight <= 0 && this.mTriggerViewHeight <= 0) || (actionMasked != 0 && this.mDetectMode == 0))) {
            return super.dispatchTouchEvent(motionEvent);
        } else {
            switch (actionMasked) {
                case 0:
                case 5:
                    int actionIndex = motionEvent.getActionIndex();
                    this.mActionPointerId = motionEvent.getPointerId(actionIndex);
                    this.mVelocityTracker.clear();
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mDownX = motionEvent.getX(actionIndex);
                    float y = motionEvent.getY(actionIndex);
                    this.mLastY = y;
                    this.mDownY = y;
                    this.mDownTranslationY = this.mTargetView.getTranslationY();
                    this.mDownView = getTouchDownView((int) this.mDownX, (int) this.mDownY);
                    this.mDetectMode = 1;
                    this.mTouchMode = 0;
                    this.mPendingScroll = false;
                    break;
                case 1:
                    int translationY = (int) this.mTargetView.getTranslationY();
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    if (!this.mAutoClose || translationY == 0) {
                        if (translationY != 0) {
                            if (translationY >= this.mPrimaryContentHeight) {
                                if (translationY > this.mPrimaryContentHeight && translationY != this.mPrimaryContentHeight + this.mSecondaryContentHeight) {
                                    if (this.mVelocityTracker.getYVelocity() <= ((float) this.mMinimumFlingVelocity)) {
                                        startScroll(translationY, this.mPrimaryContentHeight - translationY, this.mVelocityTracker.getYVelocity());
                                        break;
                                    } else {
                                        startScroll(translationY, (this.mPrimaryContentHeight + this.mSecondaryContentHeight) - translationY, this.mVelocityTracker.getYVelocity());
                                        break;
                                    }
                                }
                            } else if (this.mVelocityTracker.getYVelocity() <= ((float) this.mMinimumFlingVelocity)) {
                                startScroll(translationY, -translationY, this.mVelocityTracker.getYVelocity());
                                break;
                            } else {
                                startScroll(translationY, this.mPrimaryContentHeight - translationY, this.mVelocityTracker.getYVelocity());
                                break;
                            }
                        }
                    } else {
                        startScroll(translationY, -translationY, this.mVelocityTracker.getYVelocity());
                        break;
                    }
                    break;
                case 2:
                    int findPointerIndex = motionEvent.findPointerIndex(this.mActionPointerId);
                    if (findPointerIndex == -1) {
                        this.mActionPointerId = motionEvent.getPointerId(0);
                        findPointerIndex = 0;
                    }
                    float x = motionEvent.getX(findPointerIndex);
                    float y2 = motionEvent.getY(findPointerIndex);
                    float abs = Math.abs(x - this.mDownX);
                    float abs2 = Math.abs(y2 - this.mDownY);
                    if (this.mDetectMode == 1) {
                        if (abs <= ((float) this.mTouchSlop) || abs <= abs2) {
                            if (abs2 > ((float) this.mTouchSlop)) {
                                if (!this.mDragEnabled && this.mTriggerView != null && y2 - this.mDownY < 0.0f) {
                                    this.mDetectMode = 0;
                                    break;
                                } else {
                                    this.mDetectMode = 2;
                                    getParent().requestDisallowInterceptTouchEvent(true);
                                    if (this.mPrimaryContentView != null && this.mDownView == this.mPrimaryContentView) {
                                        dispatchTouchEventToChild(this.mPrimaryContentView, motionEvent, 3);
                                    }
                                    if (this.mSecondaryContentView != null && this.mDownView == this.mSecondaryContentView) {
                                        dispatchTouchEventToChild(this.mSecondaryContentView, motionEvent, 3);
                                    }
                                    if (this.mTriggerView != null && this.mDownView == this.mTriggerView) {
                                        dispatchTouchEventToChild(this.mTriggerView, motionEvent, 3);
                                    }
                                }
                            }
                        } else {
                            this.mDetectMode = 0;
                        }
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float f = y2 - this.mLastY;
                    if (this.mDetectMode == 2 && (f >= 1.0f || f <= -1.0f)) {
                        int i = this.mTouchMode;
                        if (f > 0.0f) {
                            if (this.mTargetView.getTranslationY() < ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight + this.mTriggerViewHeight))) {
                                if (this.mScrollableViewWrapper != null) {
                                    break;
                                }
                            }
                            i = 2;
                            if (i == 1) {
                                if (this.mTouchMode == 2) {
                                    dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent, 1);
                                } else if (this.mDownView == this.mTargetViewAncestor && this.mTouchMode == 0) {
                                    dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent, 3);
                                }
                                offsetTranslationAnimation(f, this.mVelocityTracker.getYVelocity());
                                notifyDrawerStateChanged();
                            } else if (i == 2) {
                                if (this.mTouchMode != 1 && (this.mDownView == this.mTargetViewAncestor || this.mTouchMode != 0)) {
                                    dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent);
                                } else if (this.mPendingScroll) {
                                    this.mPendingScroll = false;
                                    motionEvent.offsetLocation(0.0f, this.mLastY - y2);
                                    dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent, 0, true);
                                    if (this.mTouchMode == 1) {
                                        motionEvent.offsetLocation(0.0f, y2 - this.mLastY);
                                        dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent, 2, true);
                                    }
                                } else {
                                    this.mDownX = x;
                                    this.mDownY = y2;
                                    this.mDetectMode = 1;
                                    this.mPendingScroll = true;
                                    i = 1;
                                }
                            }
                            if (this.mPendingScroll && this.mDetectMode == 2) {
                                this.mPendingScroll = false;
                            }
                            this.mTouchMode = i;
                            this.mLastY = y2;
                            break;
                        } else {
                            if (f < 0.0f) {
                                if (this.mTargetView.getTranslationY() <= 0.0f) {
                                    break;
                                }
                            }
                            if (i == 1) {
                            }
                            this.mPendingScroll = false;
                            this.mTouchMode = i;
                            this.mLastY = y2;
                        }
                        i = 1;
                        if (i == 1) {
                        }
                        this.mPendingScroll = false;
                        this.mTouchMode = i;
                        this.mLastY = y2;
                    }
                    break;
                case 3:
                    int translationY2 = (int) this.mTargetView.getTranslationY();
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    if (translationY2 != 0 && (this.mAutoClose || !(translationY2 == this.mPrimaryContentHeight || translationY2 == this.mPrimaryContentHeight + this.mSecondaryContentHeight))) {
                        startScroll(translationY2, -translationY2, this.mVelocityTracker.getYVelocity());
                        break;
                    }
                case 6:
                    int actionIndex2 = motionEvent.getActionIndex();
                    if (motionEvent.getPointerId(actionIndex2) == this.mActionPointerId) {
                        int i2 = actionIndex2 == 0 ? 1 : 0;
                        this.mActionPointerId = motionEvent.getPointerId(i2);
                        this.mDownX = motionEvent.getX(i2);
                        float y3 = motionEvent.getY(i2);
                        this.mDownY = y3;
                        this.mLastY = y3;
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    break;
            }
            if (this.mDetectMode == 2) {
                if (this.mTouchMode == 2) {
                    if (actionMasked != 2) {
                        dispatchTouchEventToChild(this.mTargetViewAncestor, motionEvent);
                    }
                } else if (this.mTouchMode != 1 && this.mTouchMode == 0) {
                    super.dispatchTouchEvent(motionEvent);
                }
            } else if (this.mDetectMode == 1) {
                super.dispatchTouchEvent(motionEvent);
            }
            if (actionMasked == 1 || actionMasked == 3) {
                this.mVelocityTracker.clear();
                this.mDetectMode = 1;
                this.mTouchMode = 0;
                this.mPendingScroll = false;
                this.mTriggerOn = false;
            }
            return true;
        }
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View view, long j) {
        return view == this.mPrimaryContentView ? drawPrimaryContentView(canvas, view, j) : view == this.mSecondaryContentView ? drawSecondaryContentView(canvas, view, j) : view == this.mTargetViewAncestor ? drawTargetViewAncestor(canvas, view, j) : view == this.mTriggerView ? drawTriggerView(canvas, view, j) : super.drawChild(canvas, view, j);
    }

    public void halfCloseDrawer(boolean z, DrawerAnimEndListener drawerAnimEndListener) {
        if (this.mPrimaryContentView != null && this.mSecondaryContentView != null) {
            this.mAnimEndListener = drawerAnimEndListener;
            if (z) {
                int translationY = (int) this.mTargetView.getTranslationY();
                startScroll(translationY, this.mPrimaryContentHeight - translationY, 500);
            } else {
                this.mScroller.forceFinished(true);
                updateTranslationAnimation(this.mPrimaryContentHeight);
                notifyDrawerStateChanged();
                invalidate();
            }
        }
    }

    public void halfOpenDrawer() {
        halfOpenDrawer(false);
    }

    public void halfOpenDrawer(boolean z) {
        if (this.mPrimaryContentView != null && this.mSecondaryContentView != null) {
            getViewTreeObserver().dispatchOnGlobalLayout();
            if (z) {
                int translationY = (int) this.mTargetView.getTranslationY();
                startScroll(translationY, this.mPrimaryContentHeight - translationY, 800);
            } else {
                updateTranslationAnimation(this.mPrimaryContentHeight);
                notifyDrawerStateChanged();
                invalidate();
            }
        }
    }

    public boolean isAnimating() {
        return !this.mScroller.isFinished();
    }

    public boolean isDrawerHalfOpen() {
        float translationY = this.mTargetView.getTranslationY();
        return (this.mPrimaryContentView == null || this.mSecondaryContentView == null || translationY == 0.0f || translationY != ((float) this.mPrimaryContentHeight)) ? false : true;
    }

    public boolean isDrawerOpen() {
        float translationY = this.mTargetView.getTranslationY();
        return ((this.mPrimaryContentView == null && this.mSecondaryContentView == null) || translationY == 0.0f || translationY != ((float) (this.mPrimaryContentHeight + this.mSecondaryContentHeight))) ? false : true;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        if (this.mPrimaryContentViewId > 0) {
            this.mPrimaryContentView = findViewById(this.mPrimaryContentViewId);
            if (this.mPrimaryContentView == null) {
                throw new IllegalArgumentException("The primaryContentView attribute is must refer to an existing child.");
            } else if (this.mPrimaryContentView.getParent() != this) {
                throw new IllegalArgumentException("The primaryContentView attribute is must be a direct child of TwoStageDrawer.");
            }
        }
        if (this.mSecondaryContentViewId > 0) {
            this.mSecondaryContentView = findViewById(this.mSecondaryContentViewId);
            if (this.mSecondaryContentView == null) {
                throw new IllegalArgumentException("The secondaryContentView attribute is must refer to an existing child.");
            } else if (this.mSecondaryContentView.getParent() != this) {
                throw new IllegalArgumentException("The secondaryContentView attribute is must be a direct child of TwoStageDrawer.");
            }
        }
        if (this.mTargetViewId > 0) {
            setTargetView(findViewById(this.mTargetViewId));
        }
        if (this.mScrollableViewId > 0) {
            setScrollableView(this.mTargetView.findViewById(this.mScrollableViewId));
        }
        if (this.mTriggerViewId > 0) {
            this.mTriggerView = findViewById(this.mTriggerViewId);
            if (this.mTriggerView == null) {
                throw new IllegalArgumentException("The triggerView attribute is must refer to an existing child.");
            } else if (this.mTriggerView.getParent() != this) {
                throw new IllegalArgumentException("The triggerView attribute is must be a direct child of TwoStageDrawer.");
            }
        }
    }

    public void openDrawer() {
        openDrawer(false, null);
    }

    public void openDrawer(boolean z, DrawerAnimEndListener drawerAnimEndListener) {
        getViewTreeObserver().dispatchOnGlobalLayout();
        this.mAnimEndListener = drawerAnimEndListener;
        if (z) {
            int translationY = (int) this.mTargetView.getTranslationY();
            startScroll(translationY, (this.mPrimaryContentHeight + this.mSecondaryContentHeight) - translationY, 800);
            return;
        }
        this.mScroller.forceFinished(true);
        updateTranslationAnimation(this.mPrimaryContentHeight + this.mSecondaryContentHeight);
        notifyDrawerStateChanged();
        invalidate();
    }

    public void setAlwaysShowTargetViewDivider(boolean z) {
        this.mAlwaysShowTargetViewDivider = z;
    }

    public void setAutoClose(boolean z) {
        this.mAutoClose = z;
    }

    public void setContentViewBackground(Drawable drawable) {
        this.mContentViewBackground = drawable;
    }

    public void setDragEnabled(boolean z) {
        this.mDragEnabled = z;
    }

    public void setDrawerListener(DrawerListener drawerListener) {
        this.mDrawerListener = drawerListener;
    }

    public void setInitialDrawerState(int i) {
        this.mInitialDrawerState = i;
    }

    public void setPrimaryContentView(View view) {
        this.mPrimaryContentView = view;
    }

    public void setScrollDivider(Drawable drawable) {
        this.mScrollDivider = drawable;
        if (this.mScrollDivider != null) {
            this.mDividerHeight = this.mScrollDivider.getIntrinsicHeight();
        } else {
            this.mDividerHeight = 0;
        }
    }

    public void setScrollableView(View view) {
        if (view != null) {
            if (view instanceof ScrollableView) {
                this.mScrollableViewWrapper = (ScrollableView) view;
            } else if (view instanceof ScrollView) {
                this.mScrollableViewWrapper = new ScrollViewWrapper((ScrollView) view);
            } else if (view instanceof AdapterView) {
                this.mScrollableViewWrapper = new AdapterViewWrapper((AdapterView) view);
            } else if (view instanceof RecyclerView) {
                this.mScrollableViewWrapper = new RecyclerViewWrapper((RecyclerView) view);
            } else {
                Log.w("TwoStageDrawer", "The scrollableView is a fixed view that can't scroll all the time");
                this.mScrollableViewWrapper = new FixedViewWrapper();
            }
            view.getViewTreeObserver().addOnScrollChangedListener(new MyOnScrollChangeListener());
            return;
        }
        throw new IllegalArgumentException("The scrollableView attribute is must refer to an existing child of targetView.");
    }

    public void setSecondaryContentView(View view) {
        this.mSecondaryContentView = view;
    }

    public void setSupportMultiPoint(boolean z) {
        this.mSupportMultiPoint = z;
    }

    public void setTargetView(View view) {
        if (view == null) {
            throw new IllegalArgumentException("The targetView attribute is must refer to an existing child.");
        } else if (this.mTargetView != view) {
            View view2 = this.mTargetView;
            this.mTargetView = view;
            this.mTargetViewAncestor = this.mTargetView;
            while (this.mTargetViewAncestor != null && this.mTargetViewAncestor.getParent() != this) {
                this.mTargetViewAncestor = (View) this.mTargetViewAncestor.getParent();
            }
            if (view2 != null) {
                updateTranslationAnimation((int) view2.getTranslationY());
            }
        }
    }

    public void setTriggerListener(TriggerListener triggerListener) {
        this.mTriggerListener = triggerListener;
    }
}
