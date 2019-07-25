package com.miui.gallery.view;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

public class GestureDetector {
    private static final int DOUBLE_TAP_TIMEOUT = ViewConfiguration.getDoubleTapTimeout();
    private static final int LONGPRESS_TIMEOUT = ViewConfiguration.getLongPressTimeout();
    private static final int TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
    private boolean mAlwaysInBiggerTapRegion;
    private boolean mAlwaysInTapRegion;
    private OnContextClickListener mContextClickListener;
    /* access modifiers changed from: private */
    public MotionEvent mCurrentDownEvent;
    /* access modifiers changed from: private */
    public boolean mDeferConfirmSingleTap;
    /* access modifiers changed from: private */
    public OnDoubleTapListener mDoubleTapListener;
    private int mDoubleTapSlopSquare;
    private int mDoubleTapTouchSlopSquare;
    private float mDownFocusX;
    private float mDownFocusY;
    private final Handler mHandler;
    private boolean mIgnoreNextUpEvent;
    private boolean mInContextClick;
    private boolean mInLongPress;
    private boolean mIsDoubleTapEnabled;
    private boolean mIsDoubleTapping;
    private boolean mIsLongpressEnabled;
    private float mLastFocusX;
    private float mLastFocusY;
    /* access modifiers changed from: private */
    public final OnGestureListener mListener;
    private int mMaximumFlingVelocity;
    private int mMinimumFlingVelocity;
    private MotionEvent mPreviousUpEvent;
    /* access modifiers changed from: private */
    public boolean mStillDown;
    private int mTouchSlopSquare;
    private VelocityTracker mVelocityTracker;

    private class GestureHandler extends Handler {
        GestureHandler() {
        }

        GestureHandler(Handler handler) {
            super(handler.getLooper());
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    GestureDetector.this.mListener.onShowPress(GestureDetector.this.mCurrentDownEvent);
                    return;
                case 2:
                    GestureDetector.this.dispatchLongPress();
                    return;
                case 3:
                    if (GestureDetector.this.mDoubleTapListener == null) {
                        return;
                    }
                    if (!GestureDetector.this.mStillDown) {
                        GestureDetector.this.mDoubleTapListener.onSingleTapConfirmed(GestureDetector.this.mCurrentDownEvent);
                        return;
                    } else {
                        GestureDetector.this.mDeferConfirmSingleTap = true;
                        return;
                    }
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown message ");
                    sb.append(message);
                    throw new RuntimeException(sb.toString());
            }
        }
    }

    public interface OnContextClickListener {
    }

    public interface OnDoubleTapListener {
        boolean onDoubleTap(MotionEvent motionEvent);

        boolean onDoubleTapEvent(MotionEvent motionEvent);

        boolean onSingleTapConfirmed(MotionEvent motionEvent);
    }

    public interface OnGestureListener {
        boolean onDown(MotionEvent motionEvent);

        boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

        void onLongPress(MotionEvent motionEvent);

        boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

        void onShowPress(MotionEvent motionEvent);

        boolean onSingleTapUp(MotionEvent motionEvent);
    }

    public static class SimpleOnGestureListener implements OnContextClickListener, OnDoubleTapListener, OnGestureListener {
        public boolean onDoubleTap(MotionEvent motionEvent) {
            return false;
        }

        public boolean onDoubleTapEvent(MotionEvent motionEvent) {
            return false;
        }

        public boolean onDown(MotionEvent motionEvent) {
            return false;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
            return false;
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            return false;
        }
    }

    public GestureDetector(Context context, OnGestureListener onGestureListener) {
        this(context, onGestureListener, null);
    }

    public GestureDetector(Context context, OnGestureListener onGestureListener, Handler handler) {
        if (handler != null) {
            this.mHandler = new GestureHandler(handler);
        } else {
            this.mHandler = new GestureHandler();
        }
        this.mListener = onGestureListener;
        if (onGestureListener instanceof OnDoubleTapListener) {
            setOnDoubleTapListener((OnDoubleTapListener) onGestureListener);
        }
        if (onGestureListener instanceof OnContextClickListener) {
            setContextClickListener((OnContextClickListener) onGestureListener);
        }
        init(context);
    }

    private void cancel() {
        this.mHandler.removeMessages(1);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(3);
        this.mVelocityTracker.recycle();
        this.mVelocityTracker = null;
        this.mIsDoubleTapping = false;
        this.mStillDown = false;
        this.mAlwaysInTapRegion = false;
        this.mAlwaysInBiggerTapRegion = false;
        this.mDeferConfirmSingleTap = false;
        this.mInLongPress = false;
        this.mInContextClick = false;
        this.mIgnoreNextUpEvent = false;
    }

    private void cancelTaps() {
        this.mHandler.removeMessages(1);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(3);
        this.mIsDoubleTapping = false;
        this.mAlwaysInTapRegion = false;
        this.mAlwaysInBiggerTapRegion = false;
        this.mDeferConfirmSingleTap = false;
        this.mInLongPress = false;
        this.mInContextClick = false;
        this.mIgnoreNextUpEvent = false;
    }

    /* access modifiers changed from: private */
    public void dispatchLongPress() {
        this.mHandler.removeMessages(3);
        this.mDeferConfirmSingleTap = false;
        this.mInLongPress = true;
        this.mListener.onLongPress(this.mCurrentDownEvent);
    }

    private void init(Context context) {
        int i;
        int i2;
        if (this.mListener != null) {
            this.mIsLongpressEnabled = true;
            this.mIsDoubleTapEnabled = true;
            if (context == null) {
                i = ViewConfiguration.getTouchSlop();
                i2 = 100;
                this.mMinimumFlingVelocity = ViewConfiguration.getMinimumFlingVelocity();
                this.mMaximumFlingVelocity = ViewConfiguration.getMaximumFlingVelocity();
            } else {
                ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
                int scaledTouchSlop = viewConfiguration.getScaledTouchSlop();
                int scaledDoubleTapSlop = viewConfiguration.getScaledDoubleTapSlop();
                this.mMinimumFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
                this.mMaximumFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
                i = scaledTouchSlop;
                i2 = scaledDoubleTapSlop;
            }
            int i3 = i * i;
            this.mTouchSlopSquare = i3;
            this.mDoubleTapTouchSlopSquare = i3;
            this.mDoubleTapSlopSquare = i2 * i2;
            return;
        }
        throw new NullPointerException("OnGestureListener must not be null");
    }

    private boolean isConsideredDoubleTap(MotionEvent motionEvent, MotionEvent motionEvent2, MotionEvent motionEvent3) {
        boolean z = false;
        if (!this.mIsDoubleTapEnabled || !this.mAlwaysInBiggerTapRegion) {
            return false;
        }
        long eventTime = motionEvent3.getEventTime() - motionEvent2.getEventTime();
        if (eventTime > ((long) DOUBLE_TAP_TIMEOUT) || eventTime < 40) {
            return false;
        }
        int x = ((int) motionEvent.getX()) - ((int) motionEvent3.getX());
        int y = ((int) motionEvent.getY()) - ((int) motionEvent3.getY());
        if ((x * x) + (y * y) < this.mDoubleTapSlopSquare) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:102:0x022e  */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x0215  */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        boolean z2;
        boolean z3;
        int action = motionEvent.getAction();
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        int i = action & 255;
        boolean z4 = i == 6;
        int actionIndex = z4 ? motionEvent.getActionIndex() : -1;
        int pointerCount = motionEvent.getPointerCount();
        float f = 0.0f;
        float f2 = 0.0f;
        for (int i2 = 0; i2 < pointerCount; i2++) {
            if (actionIndex != i2) {
                f += motionEvent.getX(i2);
                f2 += motionEvent.getY(i2);
            }
        }
        float f3 = (float) (z4 ? pointerCount - 1 : pointerCount);
        float f4 = f / f3;
        float f5 = f2 / f3;
        switch (i) {
            case 0:
                if (this.mDoubleTapListener != null) {
                    boolean hasMessages = this.mHandler.hasMessages(3);
                    if (hasMessages) {
                        this.mHandler.removeMessages(3);
                    }
                    if (this.mCurrentDownEvent == null || this.mPreviousUpEvent == null || !hasMessages || !isConsideredDoubleTap(this.mCurrentDownEvent, this.mPreviousUpEvent, motionEvent)) {
                        this.mHandler.sendEmptyMessageDelayed(3, (long) DOUBLE_TAP_TIMEOUT);
                    } else {
                        this.mIsDoubleTapping = true;
                        z = this.mDoubleTapListener.onDoubleTap(this.mCurrentDownEvent) | false | this.mDoubleTapListener.onDoubleTapEvent(motionEvent);
                        this.mLastFocusX = f4;
                        this.mDownFocusX = f4;
                        this.mLastFocusY = f5;
                        this.mDownFocusY = f5;
                        if (this.mCurrentDownEvent != null) {
                            this.mCurrentDownEvent.recycle();
                        }
                        this.mCurrentDownEvent = MotionEvent.obtain(motionEvent);
                        this.mAlwaysInTapRegion = true;
                        this.mAlwaysInBiggerTapRegion = true;
                        this.mStillDown = true;
                        this.mInLongPress = false;
                        this.mDeferConfirmSingleTap = false;
                        if (this.mIsLongpressEnabled) {
                            this.mHandler.removeMessages(2);
                            this.mHandler.sendEmptyMessageAtTime(2, this.mCurrentDownEvent.getDownTime() + ((long) TAP_TIMEOUT) + ((long) LONGPRESS_TIMEOUT));
                        }
                        this.mHandler.sendEmptyMessageAtTime(1, this.mCurrentDownEvent.getDownTime() + ((long) TAP_TIMEOUT));
                        return z | this.mListener.onDown(motionEvent);
                    }
                }
                z = false;
                this.mLastFocusX = f4;
                this.mDownFocusX = f4;
                this.mLastFocusY = f5;
                this.mDownFocusY = f5;
                if (this.mCurrentDownEvent != null) {
                }
                this.mCurrentDownEvent = MotionEvent.obtain(motionEvent);
                this.mAlwaysInTapRegion = true;
                this.mAlwaysInBiggerTapRegion = true;
                this.mStillDown = true;
                this.mInLongPress = false;
                this.mDeferConfirmSingleTap = false;
                if (this.mIsLongpressEnabled) {
                }
                this.mHandler.sendEmptyMessageAtTime(1, this.mCurrentDownEvent.getDownTime() + ((long) TAP_TIMEOUT));
                return z | this.mListener.onDown(motionEvent);
            case 1:
                this.mStillDown = false;
                MotionEvent obtain = MotionEvent.obtain(motionEvent);
                if (this.mIsDoubleTapping) {
                    z3 = this.mDoubleTapListener.onDoubleTapEvent(motionEvent) | false;
                } else {
                    if (this.mInLongPress) {
                        this.mHandler.removeMessages(3);
                        this.mInLongPress = false;
                    } else if (this.mAlwaysInTapRegion && !this.mIgnoreNextUpEvent) {
                        boolean onSingleTapUp = this.mListener.onSingleTapUp(motionEvent);
                        if (this.mDeferConfirmSingleTap && this.mDoubleTapListener != null) {
                            this.mDoubleTapListener.onSingleTapConfirmed(motionEvent);
                        }
                        z3 = onSingleTapUp;
                    } else if (!this.mIgnoreNextUpEvent) {
                        VelocityTracker velocityTracker = this.mVelocityTracker;
                        int pointerId = motionEvent.getPointerId(0);
                        velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumFlingVelocity);
                        float yVelocity = velocityTracker.getYVelocity(pointerId);
                        float xVelocity = velocityTracker.getXVelocity(pointerId);
                        if (Math.abs(yVelocity) > ((float) this.mMinimumFlingVelocity) || Math.abs(xVelocity) > ((float) this.mMinimumFlingVelocity)) {
                            z3 = this.mListener.onFling(this.mCurrentDownEvent, motionEvent, xVelocity, yVelocity);
                        }
                    }
                    z3 = false;
                }
                if (this.mPreviousUpEvent != null) {
                    this.mPreviousUpEvent.recycle();
                }
                this.mPreviousUpEvent = obtain;
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                this.mIsDoubleTapping = false;
                this.mDeferConfirmSingleTap = false;
                this.mIgnoreNextUpEvent = false;
                this.mHandler.removeMessages(1);
                this.mHandler.removeMessages(2);
                break;
            case 2:
                if (this.mInLongPress || this.mInContextClick) {
                    return false;
                }
                float f6 = this.mLastFocusX - f4;
                float f7 = this.mLastFocusY - f5;
                if (this.mIsDoubleTapping) {
                    return false | this.mDoubleTapListener.onDoubleTapEvent(motionEvent);
                }
                if (this.mAlwaysInTapRegion) {
                    int i3 = (int) (f4 - this.mDownFocusX);
                    int i4 = (int) (f5 - this.mDownFocusY);
                    int i5 = (i3 * i3) + (i4 * i4);
                    if (i5 > this.mTouchSlopSquare) {
                        z2 = this.mListener.onScroll(this.mCurrentDownEvent, motionEvent, f6, f7);
                        this.mLastFocusX = f4;
                        this.mLastFocusY = f5;
                        this.mAlwaysInTapRegion = false;
                        this.mHandler.removeMessages(3);
                        this.mHandler.removeMessages(1);
                        this.mHandler.removeMessages(2);
                    } else {
                        z2 = false;
                    }
                    if (i5 > this.mDoubleTapTouchSlopSquare) {
                        this.mAlwaysInBiggerTapRegion = false;
                        break;
                    }
                } else if (Math.abs(f6) < 1.0f && Math.abs(f7) < 1.0f) {
                    return false;
                } else {
                    boolean onScroll = this.mListener.onScroll(this.mCurrentDownEvent, motionEvent, f6, f7);
                    this.mLastFocusX = f4;
                    this.mLastFocusY = f5;
                    return onScroll;
                }
                break;
            case 3:
                cancel();
                return false;
            case 5:
                this.mLastFocusX = f4;
                this.mDownFocusX = f4;
                this.mLastFocusY = f5;
                this.mDownFocusY = f5;
                cancelTaps();
                return false;
            case 6:
                this.mLastFocusX = f4;
                this.mDownFocusX = f4;
                this.mLastFocusY = f5;
                this.mDownFocusY = f5;
                this.mVelocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumFlingVelocity);
                int actionIndex2 = motionEvent.getActionIndex();
                int pointerId2 = motionEvent.getPointerId(actionIndex2);
                float xVelocity2 = this.mVelocityTracker.getXVelocity(pointerId2);
                float yVelocity2 = this.mVelocityTracker.getYVelocity(pointerId2);
                for (int i6 = 0; i6 < pointerCount; i6++) {
                    if (i6 != actionIndex2) {
                        int pointerId3 = motionEvent.getPointerId(i6);
                        if ((this.mVelocityTracker.getXVelocity(pointerId3) * xVelocity2) + (this.mVelocityTracker.getYVelocity(pointerId3) * yVelocity2) < 0.0f) {
                            this.mVelocityTracker.clear();
                            return false;
                        }
                    }
                }
                return false;
            default:
                return false;
        }
        return z2;
    }

    public void setContextClickListener(OnContextClickListener onContextClickListener) {
        this.mContextClickListener = onContextClickListener;
    }

    public void setIsDoubleTapEnabled(boolean z) {
        this.mIsDoubleTapEnabled = z;
    }

    public void setOnDoubleTapListener(OnDoubleTapListener onDoubleTapListener) {
        this.mDoubleTapListener = onDoubleTapListener;
    }
}
