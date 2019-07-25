package com.miui.gallery.hybrid.pulltorefresh;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.miui.gallery.R;

public abstract class PullToRefreshBase<T extends View> extends LinearLayout {
    private Mode mCurrentMode;
    private SmoothScrollRunnable mCurrentSmoothScrollRunnable;
    private boolean mFilterTouchEvents = true;
    private LoadingLayout mFooterLayout;
    private LoadingLayout mHeaderLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsBeingDragged = false;
    private float mLastMotionX;
    private float mLastMotionY;
    private boolean mLayoutVisibilityChangesEnabled = true;
    private AnimationStyle mLoadingAnimationStyle = AnimationStyle.getDefault();
    private int mMaximumPullScroll;
    private Mode mMode = Mode.getDefault();
    private OnPullEventListener<T> mOnPullEventListener;
    private OnRefreshListener<T> mOnRefreshListener;
    private OnRefreshListener2<T> mOnRefreshListener2;
    private boolean mOverScrollEnabled = true;
    T mRefreshableView;
    private FrameLayout mRefreshableViewWrapper;
    /* access modifiers changed from: private */
    public Interpolator mScrollAnimationInterpolator;
    private boolean mScrollingWhileRefreshingEnabled = false;
    private boolean mShowViewWhileRefreshing = true;
    private State mState = State.RESET;
    private int mTouchSlop;

    /* renamed from: com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase$3 reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$AnimationStyle = new int[AnimationStyle.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(29:0|(2:1|2)|3|(2:5|6)|7|(2:9|10)|11|(2:13|14)|15|(2:17|18)|19|21|22|23|24|25|26|27|28|29|30|31|32|33|35|36|37|38|40) */
        /* JADX WARNING: Can't wrap try/catch for region: R(31:0|(2:1|2)|3|5|6|7|(2:9|10)|11|(2:13|14)|15|17|18|19|21|22|23|24|25|26|27|28|29|30|31|32|33|35|36|37|38|40) */
        /* JADX WARNING: Can't wrap try/catch for region: R(32:0|1|2|3|5|6|7|(2:9|10)|11|(2:13|14)|15|17|18|19|21|22|23|24|25|26|27|28|29|30|31|32|33|35|36|37|38|40) */
        /* JADX WARNING: Can't wrap try/catch for region: R(33:0|1|2|3|5|6|7|9|10|11|(2:13|14)|15|17|18|19|21|22|23|24|25|26|27|28|29|30|31|32|33|35|36|37|38|40) */
        /* JADX WARNING: Can't wrap try/catch for region: R(34:0|1|2|3|5|6|7|9|10|11|13|14|15|17|18|19|21|22|23|24|25|26|27|28|29|30|31|32|33|35|36|37|38|40) */
        /* JADX WARNING: Code restructure failed: missing block: B:41:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:23:0x005b */
        /* JADX WARNING: Missing exception handler attribute for start block: B:25:0x0065 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:27:0x006f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:29:0x0079 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:31:0x0084 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:37:0x00a2 */
        static {
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$AnimationStyle[AnimationStyle.FLIP.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode = new int[Mode.values().length];
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.PULL_FROM_END.ordinal()] = 1;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.PULL_FROM_START.ordinal()] = 2;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.MANUAL_REFRESH_ONLY.ordinal()] = 3;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[Mode.BOTH.ordinal()] = 4;
            } catch (NoSuchFieldError unused5) {
            }
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State = new int[State.values().length];
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.RESET.ordinal()] = 1;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.PULL_TO_REFRESH.ordinal()] = 2;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.RELEASE_TO_REFRESH.ordinal()] = 3;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.REFRESHING.ordinal()] = 4;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.MANUAL_REFRESHING.ordinal()] = 5;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State[State.OVERSCROLLING.ordinal()] = 6;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation = new int[Orientation.values().length];
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[Orientation.HORIZONTAL.ordinal()] = 1;
            $SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[Orientation.VERTICAL.ordinal()] = 2;
        }
    }

    public enum AnimationStyle {
        ROTATE,
        FLIP;

        static AnimationStyle getDefault() {
            return ROTATE;
        }

        static AnimationStyle mapIntToValue(int i) {
            return i != 1 ? ROTATE : FLIP;
        }

        /* access modifiers changed from: 0000 */
        public LoadingLayout createLoadingLayout(Context context, Mode mode, Orientation orientation, TypedArray typedArray) {
            int i = AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$AnimationStyle[ordinal()];
            return new FlipLoadingLayout(context, mode, orientation, typedArray);
        }
    }

    public enum Mode {
        DISABLED(0),
        PULL_FROM_START(1),
        PULL_FROM_END(2),
        BOTH(3),
        MANUAL_REFRESH_ONLY(4);
        
        public static Mode PULL_DOWN_TO_REFRESH;
        public static Mode PULL_UP_TO_REFRESH;
        private int mIntValue;

        static {
            PULL_DOWN_TO_REFRESH = PULL_FROM_START;
            PULL_UP_TO_REFRESH = PULL_FROM_END;
        }

        private Mode(int i) {
            this.mIntValue = i;
        }

        static Mode getDefault() {
            return PULL_FROM_START;
        }

        static Mode mapIntToValue(int i) {
            Mode[] values;
            for (Mode mode : values()) {
                if (i == mode.getIntValue()) {
                    return mode;
                }
            }
            return getDefault();
        }

        /* access modifiers changed from: 0000 */
        public int getIntValue() {
            return this.mIntValue;
        }

        /* access modifiers changed from: 0000 */
        public boolean permitsPullToRefresh() {
            return (this == DISABLED || this == MANUAL_REFRESH_ONLY) ? false : true;
        }

        public boolean showFooterLoadingLayout() {
            return this == PULL_FROM_END || this == BOTH || this == MANUAL_REFRESH_ONLY;
        }

        public boolean showHeaderLoadingLayout() {
            return this == PULL_FROM_START || this == BOTH;
        }
    }

    public interface OnPullEventListener<V extends View> {
        void onPullEvent(PullToRefreshBase<V> pullToRefreshBase, State state, Mode mode);
    }

    public interface OnRefreshListener<V extends View> {
        void onRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    public interface OnRefreshListener2<V extends View> {
        void onPullDownToRefresh(PullToRefreshBase<V> pullToRefreshBase);

        void onPullUpToRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    interface OnSmoothScrollFinishedListener {
        void onSmoothScrollFinished();
    }

    public enum Orientation {
        VERTICAL,
        HORIZONTAL
    }

    final class SmoothScrollRunnable implements Runnable {
        private boolean mContinueRunning = true;
        private int mCurrentY = -1;
        private final long mDuration;
        private final Interpolator mInterpolator;
        private OnSmoothScrollFinishedListener mListener;
        private final int mScrollFromY;
        private final int mScrollToY;
        private long mStartTime = -1;

        public SmoothScrollRunnable(int i, int i2, long j, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
            this.mScrollFromY = i;
            this.mScrollToY = i2;
            this.mInterpolator = PullToRefreshBase.this.mScrollAnimationInterpolator;
            this.mDuration = j;
            this.mListener = onSmoothScrollFinishedListener;
        }

        public void run() {
            if (this.mStartTime == -1) {
                this.mStartTime = System.currentTimeMillis();
            } else {
                this.mCurrentY = this.mScrollFromY - Math.round(((float) (this.mScrollFromY - this.mScrollToY)) * this.mInterpolator.getInterpolation(((float) Math.max(Math.min(((System.currentTimeMillis() - this.mStartTime) * 1000) / this.mDuration, 1000), 0)) / 1000.0f));
                PullToRefreshBase.this.setHeaderScroll(this.mCurrentY);
            }
            if (this.mContinueRunning && this.mScrollToY != this.mCurrentY) {
                ViewCompat.postOnAnimation(PullToRefreshBase.this, this);
            } else if (this.mListener != null) {
                this.mListener.onSmoothScrollFinished();
            }
        }

        public void stop() {
            this.mContinueRunning = false;
            PullToRefreshBase.this.removeCallbacks(this);
        }
    }

    public enum State {
        RESET(0),
        PULL_TO_REFRESH(1),
        RELEASE_TO_REFRESH(2),
        REFRESHING(8),
        MANUAL_REFRESHING(9),
        OVERSCROLLING(16);
        
        private int mIntValue;

        private State(int i) {
            this.mIntValue = i;
        }

        static State mapIntToValue(int i) {
            State[] values;
            for (State state : values()) {
                if (i == state.getIntValue()) {
                    return state;
                }
            }
            return RESET;
        }

        /* access modifiers changed from: 0000 */
        public int getIntValue() {
            return this.mIntValue;
        }
    }

    public PullToRefreshBase(Context context) {
        super(context);
        init(context, null);
    }

    public PullToRefreshBase(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context, attributeSet);
    }

    public PullToRefreshBase(Context context, Mode mode) {
        super(context);
        this.mMode = mode;
        init(context, null);
    }

    public PullToRefreshBase(Context context, Mode mode, AnimationStyle animationStyle) {
        super(context);
        this.mMode = mode;
        this.mLoadingAnimationStyle = animationStyle;
        init(context, null);
    }

    private void addRefreshableView(Context context, T t) {
        this.mRefreshableViewWrapper = new FrameLayout(context);
        this.mRefreshableViewWrapper.addView(t, -1, -1);
        addViewInternal(this.mRefreshableViewWrapper, new LayoutParams(-1, -1));
    }

    /* access modifiers changed from: private */
    public void callRefreshListener() {
        if (this.mOnRefreshListener != null) {
            this.mOnRefreshListener.onRefresh(this);
        } else if (this.mOnRefreshListener2 == null) {
        } else {
            if (this.mCurrentMode == Mode.PULL_FROM_START) {
                this.mOnRefreshListener2.onPullDownToRefresh(this);
            } else if (this.mCurrentMode == Mode.PULL_FROM_END) {
                this.mOnRefreshListener2.onPullUpToRefresh(this);
            }
        }
    }

    private LayoutParams getLoadingLayoutLayoutParams() {
        return AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1 ? new LayoutParams(-1, -2) : new LayoutParams(-2, -1);
    }

    private int getMaximumPullScroll() {
        return AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1 ? this.mMaximumPullScroll != 0 ? this.mMaximumPullScroll : Math.round(((float) getHeight()) / 2.0f) : Math.round(((float) getWidth()) / 2.0f);
    }

    private void init(Context context, AttributeSet attributeSet) {
        if (AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1) {
            setOrientation(1);
        } else {
            setOrientation(0);
        }
        setGravity(17);
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.PullToRefresh);
        if (obtainStyledAttributes.hasValue(13)) {
            this.mMode = Mode.mapIntToValue(obtainStyledAttributes.getInteger(13, 0));
        }
        if (obtainStyledAttributes.hasValue(1)) {
            this.mLoadingAnimationStyle = AnimationStyle.mapIntToValue(obtainStyledAttributes.getInteger(1, 0));
        }
        this.mRefreshableView = createRefreshableView(context, attributeSet);
        addRefreshableView(context, this.mRefreshableView);
        this.mHeaderLayout = createLoadingLayout(context, Mode.PULL_FROM_START, obtainStyledAttributes);
        this.mFooterLayout = createLoadingLayout(context, Mode.PULL_FROM_END, obtainStyledAttributes);
        if (obtainStyledAttributes.hasValue(15)) {
            Drawable drawable = obtainStyledAttributes.getDrawable(15);
            if (drawable != null) {
                this.mRefreshableView.setBackgroundDrawable(drawable);
            }
        } else if (obtainStyledAttributes.hasValue(0)) {
            Drawable drawable2 = obtainStyledAttributes.getDrawable(0);
            if (drawable2 != null) {
                this.mRefreshableView.setBackgroundDrawable(drawable2);
            }
        }
        if (obtainStyledAttributes.hasValue(14)) {
            this.mOverScrollEnabled = obtainStyledAttributes.getBoolean(14, true);
        }
        if (obtainStyledAttributes.hasValue(17)) {
            this.mScrollingWhileRefreshingEnabled = obtainStyledAttributes.getBoolean(17, false);
        }
        if (obtainStyledAttributes.hasValue(12)) {
            this.mMaximumPullScroll = obtainStyledAttributes.getDimensionPixelOffset(12, 0);
        }
        handleStyledAttributes(obtainStyledAttributes);
        obtainStyledAttributes.recycle();
        updateUIForMode();
    }

    private boolean isReadyForPull() {
        int i = AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[this.mMode.ordinal()];
        boolean z = false;
        if (i != 4) {
            switch (i) {
                case 1:
                    return isReadyForPullEnd();
                case 2:
                    return isReadyForPullStart();
                default:
                    return false;
            }
        } else {
            if (isReadyForPullEnd() || isReadyForPullStart()) {
                z = true;
            }
            return z;
        }
    }

    private void pullEvent() {
        float f;
        float f2;
        int i;
        int i2;
        if (AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1) {
            f2 = this.mInitialMotionY;
            f = this.mLastMotionY;
        } else {
            f2 = this.mInitialMotionX;
            f = this.mLastMotionX;
        }
        if (AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[this.mCurrentMode.ordinal()] != 1) {
            i2 = Math.round(Math.min(f2 - f, 0.0f) / 2.0f);
            i = getHeaderSize();
        } else {
            i2 = Math.round(Math.max(f2 - f, 0.0f) / 2.0f);
            i = getFooterSize();
        }
        setHeaderScroll(i2);
        if (i2 != 0 && !isRefreshing()) {
            float abs = ((float) Math.abs(i2)) / ((float) i);
            if (AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[this.mCurrentMode.ordinal()] != 1) {
                this.mHeaderLayout.onPull(abs);
            } else {
                this.mFooterLayout.onPull(abs);
            }
            if (this.mState != State.PULL_TO_REFRESH && i >= Math.abs(i2)) {
                setState(State.PULL_TO_REFRESH, new boolean[0]);
            } else if (this.mState == State.PULL_TO_REFRESH && i < Math.abs(i2)) {
                setState(State.RELEASE_TO_REFRESH, new boolean[0]);
            }
        }
    }

    private final void smoothScrollTo(int i, long j) {
        smoothScrollTo(i, j, 0, null);
    }

    private final void smoothScrollTo(int i, long j, long j2, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
        if (this.mCurrentSmoothScrollRunnable != null) {
            this.mCurrentSmoothScrollRunnable.stop();
        }
        int scrollY = AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1 ? getScrollY() : getScrollX();
        if (scrollY != i) {
            if (this.mScrollAnimationInterpolator == null) {
                this.mScrollAnimationInterpolator = new DecelerateInterpolator();
            }
            SmoothScrollRunnable smoothScrollRunnable = new SmoothScrollRunnable(scrollY, i, j, onSmoothScrollFinishedListener);
            this.mCurrentSmoothScrollRunnable = smoothScrollRunnable;
            if (j2 > 0) {
                postDelayed(this.mCurrentSmoothScrollRunnable, j2);
            } else {
                post(this.mCurrentSmoothScrollRunnable);
            }
        }
    }

    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        View refreshableView = getRefreshableView();
        if (refreshableView instanceof ViewGroup) {
            ((ViewGroup) refreshableView).addView(view, i, layoutParams);
            return;
        }
        throw new UnsupportedOperationException("Refreshable View is not a ViewGroup so can't addView");
    }

    /* access modifiers changed from: protected */
    public final void addViewInternal(View view, int i, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
    }

    /* access modifiers changed from: protected */
    public final void addViewInternal(View view, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, -1, layoutParams);
    }

    /* access modifiers changed from: protected */
    public LoadingLayout createLoadingLayout(Context context, Mode mode, TypedArray typedArray) {
        LoadingLayout createLoadingLayout = this.mLoadingAnimationStyle.createLoadingLayout(context, mode, getPullToRefreshScrollDirection(), typedArray);
        createLoadingLayout.setVisibility(4);
        return createLoadingLayout;
    }

    /* access modifiers changed from: protected */
    public LoadingLayoutProxy createLoadingLayoutProxy(boolean z, boolean z2) {
        LoadingLayoutProxy loadingLayoutProxy = new LoadingLayoutProxy();
        if (z && this.mMode.showHeaderLoadingLayout()) {
            loadingLayoutProxy.addLayout(this.mHeaderLayout);
        }
        if (z2 && this.mMode.showFooterLoadingLayout()) {
            loadingLayoutProxy.addLayout(this.mFooterLayout);
        }
        return loadingLayoutProxy;
    }

    /* access modifiers changed from: protected */
    public abstract T createRefreshableView(Context context, AttributeSet attributeSet);

    public final Mode getCurrentMode() {
        return this.mCurrentMode;
    }

    public final boolean getFilterTouchEvents() {
        return this.mFilterTouchEvents;
    }

    /* access modifiers changed from: protected */
    public final LoadingLayout getFooterLayout() {
        return this.mFooterLayout;
    }

    /* access modifiers changed from: protected */
    public final int getFooterSize() {
        return this.mFooterLayout.getContentSize();
    }

    /* access modifiers changed from: protected */
    public final LoadingLayout getHeaderLayout() {
        return this.mHeaderLayout;
    }

    /* access modifiers changed from: protected */
    public final int getHeaderSize() {
        return this.mHeaderLayout.getContentSize();
    }

    public final ILoadingLayout getLoadingLayoutProxy() {
        return getLoadingLayoutProxy(true, true);
    }

    public final ILoadingLayout getLoadingLayoutProxy(boolean z, boolean z2) {
        return createLoadingLayoutProxy(z, z2);
    }

    public final Mode getMode() {
        return this.mMode;
    }

    public abstract Orientation getPullToRefreshScrollDirection();

    /* access modifiers changed from: protected */
    public int getPullToRefreshScrollDuration() {
        return 200;
    }

    /* access modifiers changed from: protected */
    public int getPullToRefreshScrollDurationLonger() {
        return 325;
    }

    public final T getRefreshableView() {
        return this.mRefreshableView;
    }

    /* access modifiers changed from: protected */
    public FrameLayout getRefreshableViewWrapper() {
        return this.mRefreshableViewWrapper;
    }

    public final boolean getShowViewWhileRefreshing() {
        return this.mShowViewWhileRefreshing;
    }

    public final State getState() {
        return this.mState;
    }

    /* access modifiers changed from: protected */
    public void handleStyledAttributes(TypedArray typedArray) {
    }

    public final boolean isPullToRefreshEnabled() {
        return this.mMode.permitsPullToRefresh();
    }

    /* access modifiers changed from: protected */
    public abstract boolean isReadyForPullEnd();

    /* access modifiers changed from: protected */
    public abstract boolean isReadyForPullStart();

    public final boolean isRefreshing() {
        return this.mState == State.REFRESHING || this.mState == State.MANUAL_REFRESHING;
    }

    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f;
        float f2;
        if (!isPullToRefreshEnabled()) {
            return false;
        }
        int action = motionEvent.getAction();
        if (action == 3 || action == 1) {
            this.mIsBeingDragged = false;
            return false;
        } else if (action != 0 && this.mIsBeingDragged) {
            return true;
        } else {
            if (action != 0) {
                if (action == 2 && isReadyForPull()) {
                    float y = motionEvent.getY();
                    float x = motionEvent.getX();
                    if (AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation[getPullToRefreshScrollDirection().ordinal()] != 1) {
                        f2 = y - this.mLastMotionY;
                        f = x - this.mLastMotionX;
                    } else {
                        f2 = x - this.mLastMotionX;
                        f = y - this.mLastMotionY;
                    }
                    float abs = Math.abs(f2);
                    if (abs > ((float) this.mTouchSlop) && (!this.mFilterTouchEvents || abs > Math.abs(f))) {
                        if (this.mMode.showHeaderLoadingLayout() && f2 >= 1.0f && isReadyForPullStart()) {
                            this.mLastMotionY = y;
                            this.mLastMotionX = x;
                            this.mIsBeingDragged = true;
                            if (this.mMode == Mode.BOTH) {
                                this.mCurrentMode = Mode.PULL_FROM_START;
                            }
                        } else if (this.mMode.showFooterLoadingLayout() && f2 <= -1.0f && isReadyForPullEnd()) {
                            this.mLastMotionY = y;
                            this.mLastMotionX = x;
                            this.mIsBeingDragged = true;
                            if (this.mMode == Mode.BOTH) {
                                this.mCurrentMode = Mode.PULL_FROM_END;
                            }
                        }
                    }
                }
            } else if (isReadyForPull()) {
                float y2 = motionEvent.getY();
                this.mInitialMotionY = y2;
                this.mLastMotionY = y2;
                float x2 = motionEvent.getX();
                this.mInitialMotionX = x2;
                this.mLastMotionX = x2;
                this.mIsBeingDragged = false;
            }
            return this.mIsBeingDragged;
        }
    }

    /* access modifiers changed from: protected */
    public void onPtrRestoreInstanceState(Bundle bundle) {
    }

    /* access modifiers changed from: protected */
    public void onPtrSaveInstanceState(Bundle bundle) {
    }

    /* access modifiers changed from: protected */
    public void onPullToRefresh() {
        switch (this.mCurrentMode) {
            case PULL_FROM_END:
                this.mFooterLayout.pullToRefresh();
                return;
            case PULL_FROM_START:
                this.mHeaderLayout.pullToRefresh();
                return;
            default:
                return;
        }
    }

    public final void onRefreshComplete() {
        if (isRefreshing()) {
            setState(State.RESET, new boolean[0]);
        }
    }

    /* access modifiers changed from: protected */
    public void onRefreshing(boolean z) {
        if (this.mMode.showHeaderLoadingLayout()) {
            this.mHeaderLayout.refreshing();
        }
        if (this.mMode.showFooterLoadingLayout()) {
            this.mFooterLayout.refreshing();
        }
        if (!z) {
            callRefreshListener();
        } else if (this.mShowViewWhileRefreshing) {
            AnonymousClass1 r3 = new OnSmoothScrollFinishedListener() {
                public void onSmoothScrollFinished() {
                    PullToRefreshBase.this.callRefreshListener();
                }
            };
            int i = AnonymousClass3.$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode[this.mCurrentMode.ordinal()];
            if (i == 1 || i == 3) {
                smoothScrollTo(getFooterSize(), (OnSmoothScrollFinishedListener) r3);
            } else {
                smoothScrollTo(-getHeaderSize(), (OnSmoothScrollFinishedListener) r3);
            }
        } else {
            smoothScrollTo(0);
        }
    }

    /* access modifiers changed from: protected */
    public void onReleaseToRefresh() {
        switch (this.mCurrentMode) {
            case PULL_FROM_END:
                this.mFooterLayout.releaseToRefresh();
                return;
            case PULL_FROM_START:
                this.mHeaderLayout.releaseToRefresh();
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        this.mIsBeingDragged = false;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mHeaderLayout.reset();
        this.mFooterLayout.reset();
        smoothScrollTo(0);
    }

    /* access modifiers changed from: protected */
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            setMode(Mode.mapIntToValue(bundle.getInt("ptr_mode", 0)));
            this.mCurrentMode = Mode.mapIntToValue(bundle.getInt("ptr_current_mode", 0));
            this.mScrollingWhileRefreshingEnabled = bundle.getBoolean("ptr_disable_scrolling", false);
            this.mShowViewWhileRefreshing = bundle.getBoolean("ptr_show_refreshing_view", true);
            super.onRestoreInstanceState(bundle.getParcelable("ptr_super"));
            State mapIntToValue = State.mapIntToValue(bundle.getInt("ptr_state", 0));
            if (mapIntToValue == State.REFRESHING || mapIntToValue == State.MANUAL_REFRESHING) {
                setState(mapIntToValue, true);
            }
            onPtrRestoreInstanceState(bundle);
            return;
        }
        super.onRestoreInstanceState(parcelable);
    }

    /* access modifiers changed from: protected */
    public final Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        onPtrSaveInstanceState(bundle);
        bundle.putInt("ptr_state", this.mState.getIntValue());
        bundle.putInt("ptr_mode", this.mMode.getIntValue());
        bundle.putInt("ptr_current_mode", this.mCurrentMode.getIntValue());
        bundle.putBoolean("ptr_disable_scrolling", this.mScrollingWhileRefreshingEnabled);
        bundle.putBoolean("ptr_show_refreshing_view", this.mShowViewWhileRefreshing);
        bundle.putParcelable("ptr_super", super.onSaveInstanceState());
        return bundle;
    }

    /* access modifiers changed from: protected */
    public final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        refreshLoadingViewsSize();
    }

    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (!isPullToRefreshEnabled()) {
            return false;
        }
        if (motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                if (isReadyForPull()) {
                    float y = motionEvent.getY();
                    this.mInitialMotionY = y;
                    this.mLastMotionY = y;
                    float x = motionEvent.getX();
                    this.mInitialMotionX = x;
                    this.mLastMotionX = x;
                    return true;
                }
                break;
            case 1:
            case 3:
                if (this.mIsBeingDragged) {
                    this.mIsBeingDragged = false;
                    if (this.mState == State.RELEASE_TO_REFRESH && (this.mOnRefreshListener != null || this.mOnRefreshListener2 != null)) {
                        setState(State.REFRESHING, true);
                        return true;
                    } else if (isRefreshing()) {
                        smoothScrollTo(0);
                        return true;
                    } else {
                        setState(State.RESET, new boolean[0]);
                        return true;
                    }
                }
                break;
            case 2:
                if (this.mIsBeingDragged) {
                    this.mLastMotionY = motionEvent.getY();
                    this.mLastMotionX = motionEvent.getX();
                    pullEvent();
                    return true;
                }
                break;
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public final void refreshLoadingViewsSize() {
        int maximumPullScroll = (int) (((float) getMaximumPullScroll()) * 1.2f);
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        switch (getPullToRefreshScrollDirection()) {
            case HORIZONTAL:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setWidth(maximumPullScroll);
                    paddingLeft = -maximumPullScroll;
                } else {
                    paddingLeft = 0;
                }
                if (!this.mMode.showFooterLoadingLayout()) {
                    paddingRight = 0;
                    break;
                } else {
                    this.mFooterLayout.setWidth(maximumPullScroll);
                    paddingRight = -maximumPullScroll;
                    break;
                }
            case VERTICAL:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setHeight(maximumPullScroll);
                    paddingTop = -maximumPullScroll;
                } else {
                    paddingTop = 0;
                }
                if (!this.mMode.showFooterLoadingLayout()) {
                    paddingBottom = 0;
                    break;
                } else {
                    this.mFooterLayout.setHeight(maximumPullScroll);
                    paddingBottom = -maximumPullScroll;
                    break;
                }
        }
        setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
    }

    public void setDisableScrollingWhileRefreshing(boolean z) {
        setScrollingWhileRefreshingEnabled(!z);
    }

    public final void setFilterTouchEvents(boolean z) {
        this.mFilterTouchEvents = z;
    }

    /* access modifiers changed from: protected */
    public final void setHeaderScroll(int i) {
        int maximumPullScroll = getMaximumPullScroll();
        int min = Math.min(maximumPullScroll, Math.max(-maximumPullScroll, i));
        if (this.mLayoutVisibilityChangesEnabled) {
            if (min < 0) {
                this.mHeaderLayout.setVisibility(0);
            } else if (min > 0) {
                this.mFooterLayout.setVisibility(0);
            } else {
                this.mHeaderLayout.setVisibility(4);
                this.mFooterLayout.setVisibility(4);
            }
        }
        switch (getPullToRefreshScrollDirection()) {
            case HORIZONTAL:
                scrollTo(min, 0);
                return;
            case VERTICAL:
                scrollTo(0, min);
                return;
            default:
                return;
        }
    }

    public void setLastUpdatedLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setLastUpdatedLabel(charSequence);
    }

    public void setLoadingDrawable(Drawable drawable) {
        getLoadingLayoutProxy().setLoadingDrawable(drawable);
    }

    public void setLongClickable(boolean z) {
        getRefreshableView().setLongClickable(z);
    }

    public final void setMode(Mode mode) {
        if (mode != this.mMode) {
            this.mMode = mode;
            updateUIForMode();
        }
    }

    public void setOnPullEventListener(OnPullEventListener<T> onPullEventListener) {
        this.mOnPullEventListener = onPullEventListener;
    }

    public final void setOnRefreshListener(OnRefreshListener2<T> onRefreshListener2) {
        this.mOnRefreshListener2 = onRefreshListener2;
        this.mOnRefreshListener = null;
    }

    public final void setOnRefreshListener(OnRefreshListener<T> onRefreshListener) {
        this.mOnRefreshListener = onRefreshListener;
        this.mOnRefreshListener2 = null;
    }

    public void setPullLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setPullLabel(charSequence);
    }

    public final void setPullToRefreshEnabled(boolean z) {
        setMode(z ? Mode.getDefault() : Mode.DISABLED);
    }

    public final void setPullToRefreshOverScrollEnabled(boolean z) {
        this.mOverScrollEnabled = z;
    }

    public final void setRefreshing(boolean z) {
        if (!isRefreshing()) {
            setState(State.MANUAL_REFRESHING, z);
        }
    }

    public void setRefreshingLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setRefreshingLabel(charSequence);
    }

    public void setReleaseLabel(CharSequence charSequence) {
        setReleaseLabel(charSequence, Mode.BOTH);
    }

    public void setReleaseLabel(CharSequence charSequence, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setReleaseLabel(charSequence);
    }

    public void setScrollAnimationInterpolator(Interpolator interpolator) {
        this.mScrollAnimationInterpolator = interpolator;
    }

    public final void setScrollingWhileRefreshingEnabled(boolean z) {
        this.mScrollingWhileRefreshingEnabled = z;
    }

    public final void setShowViewWhileRefreshing(boolean z) {
        this.mShowViewWhileRefreshing = z;
    }

    /* access modifiers changed from: 0000 */
    public final void setState(State state, boolean... zArr) {
        this.mState = state;
        switch (this.mState) {
            case RESET:
                onReset();
                break;
            case PULL_TO_REFRESH:
                onPullToRefresh();
                break;
            case RELEASE_TO_REFRESH:
                onReleaseToRefresh();
                break;
            case REFRESHING:
            case MANUAL_REFRESHING:
                onRefreshing(zArr[0]);
                break;
        }
        if (this.mOnPullEventListener != null) {
            this.mOnPullEventListener.onPullEvent(this, this.mState, this.mCurrentMode);
        }
    }

    /* access modifiers changed from: protected */
    public final void smoothScrollTo(int i) {
        smoothScrollTo(i, (long) getPullToRefreshScrollDuration());
    }

    /* access modifiers changed from: protected */
    public final void smoothScrollTo(int i, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
        smoothScrollTo(i, (long) getPullToRefreshScrollDuration(), 0, onSmoothScrollFinishedListener);
    }

    /* access modifiers changed from: protected */
    public void updateUIForMode() {
        LayoutParams loadingLayoutLayoutParams = getLoadingLayoutLayoutParams();
        if (this == this.mHeaderLayout.getParent()) {
            removeView(this.mHeaderLayout);
        }
        if (this.mMode.showHeaderLoadingLayout()) {
            addViewInternal(this.mHeaderLayout, 0, loadingLayoutLayoutParams);
        }
        if (this == this.mFooterLayout.getParent()) {
            removeView(this.mFooterLayout);
        }
        if (this.mMode.showFooterLoadingLayout()) {
            addViewInternal(this.mFooterLayout, loadingLayoutLayoutParams);
        }
        refreshLoadingViewsSize();
        this.mCurrentMode = this.mMode != Mode.BOTH ? this.mMode : Mode.PULL_FROM_START;
    }
}
