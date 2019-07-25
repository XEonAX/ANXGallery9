package com.miui.gallery.view;

import android.content.Context;
import android.os.Handler;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import com.miui.gallery.util.MiscUtil;

public class ScaleGestureDetector {
    /* access modifiers changed from: private */
    public int mAnchoredScaleMode;
    /* access modifiers changed from: private */
    public float mAnchoredScaleStartX;
    /* access modifiers changed from: private */
    public float mAnchoredScaleStartY;
    private final Context mContext;
    private float mCurrSpan;
    private float mCurrSpanX;
    private float mCurrSpanY;
    private long mCurrTime;
    private boolean mEventBeforeOrAboveStartingGestureEvent;
    private float mFocusX;
    private float mFocusY;
    private GestureDetector mGestureDetector;
    private final Handler mHandler;
    private boolean mInProgress;
    private float mInitialSpan;
    private final OnScaleGestureListener mListener;
    private int mMinSpan;
    private float mPrevSpan;
    private float mPrevSpanX;
    private float mPrevSpanY;
    private long mPrevTime;
    private boolean mQuickScaleEnabled;
    private int mSpanSlop;
    private boolean mStylusScaleEnabled;

    public interface OnScaleGestureListener {
        boolean onScale(ScaleGestureDetector scaleGestureDetector);

        boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector);

        void onScaleEnd(ScaleGestureDetector scaleGestureDetector);
    }

    public ScaleGestureDetector(Context context, OnScaleGestureListener onScaleGestureListener) {
        this(context, onScaleGestureListener, null);
    }

    public ScaleGestureDetector(Context context, OnScaleGestureListener onScaleGestureListener, Handler handler) {
        this.mAnchoredScaleMode = 0;
        this.mContext = context;
        this.mListener = onScaleGestureListener;
        this.mSpanSlop = ViewConfiguration.get(context).getScaledTouchSlop() * 2;
        this.mMinSpan = Math.max(this.mSpanSlop, MiscUtil.getDimensionPixelOffset(context.getResources(), "config_minScalingSpan", "dimen", "android"));
        this.mHandler = handler;
        int i = context.getApplicationInfo().targetSdkVersion;
        if (i > 18) {
            setQuickScaleEnabled(true);
        }
        if (i > 22) {
            setStylusScaleEnabled(true);
        }
    }

    private boolean inAnchoredScaleMode() {
        return this.mAnchoredScaleMode != 0;
    }

    public float getFocusX() {
        return this.mFocusX;
    }

    public float getFocusY() {
        return this.mFocusY;
    }

    public float getScaleFactor() {
        float f = 1.0f;
        if (inAnchoredScaleMode()) {
            boolean z = (this.mEventBeforeOrAboveStartingGestureEvent && this.mCurrSpan < this.mPrevSpan) || (!this.mEventBeforeOrAboveStartingGestureEvent && this.mCurrSpan > this.mPrevSpan);
            float abs = Math.abs(1.0f - (this.mCurrSpan / this.mPrevSpan)) * 0.5f;
            if (this.mPrevSpan > 0.0f) {
                f = z ? 1.0f + abs : 1.0f - abs;
            }
            return f;
        }
        if (this.mPrevSpan > 0.0f) {
            f = this.mCurrSpan / this.mPrevSpan;
        }
        return f;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        float f;
        float f2;
        MotionEvent motionEvent2 = motionEvent;
        this.mCurrTime = motionEvent.getEventTime();
        int actionMasked = motionEvent.getActionMasked();
        if (this.mQuickScaleEnabled) {
            this.mGestureDetector.onTouchEvent(motionEvent2);
        }
        int pointerCount = motionEvent.getPointerCount();
        boolean z = (motionEvent.getButtonState() & 32) != 0;
        boolean z2 = this.mAnchoredScaleMode == 2 && !z;
        boolean z3 = actionMasked == 1 || actionMasked == 3 || z2;
        if (actionMasked == 0 || z3) {
            if (this.mInProgress) {
                this.mListener.onScaleEnd(this);
                this.mInProgress = false;
                this.mInitialSpan = 0.0f;
                this.mAnchoredScaleMode = 0;
            } else if (inAnchoredScaleMode() && z3) {
                this.mInProgress = false;
                this.mInitialSpan = 0.0f;
                this.mAnchoredScaleMode = 0;
            }
            if (z3) {
                return true;
            }
        }
        if (!this.mInProgress && this.mStylusScaleEnabled && !inAnchoredScaleMode() && !z3 && z) {
            this.mAnchoredScaleStartX = motionEvent.getX();
            this.mAnchoredScaleStartY = motionEvent.getY();
            this.mAnchoredScaleMode = 2;
            this.mInitialSpan = 0.0f;
        }
        boolean z4 = actionMasked == 0 || actionMasked == 6 || actionMasked == 5 || z2;
        boolean z5 = actionMasked == 6;
        int actionIndex = z5 ? motionEvent.getActionIndex() : -1;
        int i = z5 ? pointerCount - 1 : pointerCount;
        if (inAnchoredScaleMode()) {
            f2 = this.mAnchoredScaleStartX;
            f = this.mAnchoredScaleStartY;
            if (motionEvent.getY() < f) {
                this.mEventBeforeOrAboveStartingGestureEvent = true;
            } else {
                this.mEventBeforeOrAboveStartingGestureEvent = false;
            }
        } else {
            float f3 = 0.0f;
            float f4 = 0.0f;
            for (int i2 = 0; i2 < pointerCount; i2++) {
                if (actionIndex != i2) {
                    f3 += motionEvent2.getX(i2);
                    f4 += motionEvent2.getY(i2);
                }
            }
            float f5 = (float) i;
            float f6 = f3 / f5;
            f = f4 / f5;
            f2 = f6;
        }
        float f7 = 0.0f;
        float f8 = 0.0f;
        for (int i3 = 0; i3 < pointerCount; i3++) {
            if (actionIndex != i3) {
                f7 += Math.abs(motionEvent2.getX(i3) - f2);
                f8 += Math.abs(motionEvent2.getY(i3) - f);
            }
        }
        float f9 = (float) i;
        float f10 = (f7 / f9) * 2.0f;
        float f11 = (f8 / f9) * 2.0f;
        float hypot = inAnchoredScaleMode() ? f11 : (float) Math.hypot((double) f10, (double) f11);
        boolean z6 = this.mInProgress;
        this.mFocusX = f2;
        this.mFocusY = f;
        if (!inAnchoredScaleMode() && this.mInProgress && (hypot < ((float) this.mMinSpan) || z4)) {
            this.mListener.onScaleEnd(this);
            this.mInProgress = false;
            this.mInitialSpan = hypot;
        }
        if (z4) {
            this.mCurrSpanX = f10;
            this.mPrevSpanX = f10;
            this.mCurrSpanY = f11;
            this.mPrevSpanY = f11;
            this.mCurrSpan = hypot;
            this.mPrevSpan = hypot;
            this.mInitialSpan = hypot;
        }
        int i4 = inAnchoredScaleMode() ? this.mSpanSlop : this.mMinSpan;
        if (!this.mInProgress && hypot >= ((float) i4) && (z6 || Math.abs(hypot - this.mInitialSpan) > ((float) this.mSpanSlop))) {
            this.mCurrSpanX = f10;
            this.mPrevSpanX = f10;
            this.mCurrSpanY = f11;
            this.mPrevSpanY = f11;
            this.mCurrSpan = hypot;
            this.mPrevSpan = hypot;
            this.mPrevTime = this.mCurrTime;
            this.mInProgress = this.mListener.onScaleBegin(this);
        }
        if (actionMasked == 2) {
            this.mCurrSpanX = f10;
            this.mCurrSpanY = f11;
            this.mCurrSpan = hypot;
            if (this.mInProgress ? this.mListener.onScale(this) : true) {
                this.mPrevSpanX = this.mCurrSpanX;
                this.mPrevSpanY = this.mCurrSpanY;
                this.mPrevSpan = this.mCurrSpan;
                this.mPrevTime = this.mCurrTime;
            }
        }
        return true;
    }

    public void setQuickScaleEnabled(boolean z) {
        this.mQuickScaleEnabled = z;
        if (this.mQuickScaleEnabled && this.mGestureDetector == null) {
            this.mGestureDetector = new GestureDetector(this.mContext, new SimpleOnGestureListener() {
                public boolean onDoubleTap(MotionEvent motionEvent) {
                    ScaleGestureDetector.this.mAnchoredScaleStartX = motionEvent.getX();
                    ScaleGestureDetector.this.mAnchoredScaleStartY = motionEvent.getY();
                    ScaleGestureDetector.this.mAnchoredScaleMode = 1;
                    return true;
                }
            }, this.mHandler);
        }
    }

    public void setScaleMinSpan(int i) {
        this.mMinSpan = Math.max(i, this.mSpanSlop);
    }

    public void setStylusScaleEnabled(boolean z) {
        this.mStylusScaleEnabled = z;
    }
}
