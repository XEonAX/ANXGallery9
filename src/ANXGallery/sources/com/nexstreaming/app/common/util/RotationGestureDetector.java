package com.nexstreaming.app.common.util;

import android.view.MotionEvent;

public class RotationGestureDetector {
    private float mFocusX;
    private float mFocusY;
    private boolean mInProgress = false;
    private double mInitialTheta;
    private final OnRotationGestureListener mListener;
    private int mPrimaryPointerId;
    private int mSecondaryPointerId;

    public interface OnRotationGestureListener {
        boolean onBeginRotate(float f, float f2);

        void onEndRotate(boolean z);

        void onRotate(float f, float f2, float f3);
    }

    public RotationGestureDetector(OnRotationGestureListener onRotationGestureListener) {
        this.mListener = onRotationGestureListener;
    }

    public boolean isInProgress() {
        return this.mInProgress;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.mPrimaryPointerId = motionEvent.getPointerId(0);
                return true;
            case 1:
                if (this.mInProgress) {
                    this.mListener.onEndRotate(false);
                    this.mInProgress = false;
                }
                return true;
            case 2:
                if (this.mInProgress) {
                    int findPointerIndex = motionEvent.findPointerIndex(this.mPrimaryPointerId);
                    int findPointerIndex2 = motionEvent.findPointerIndex(this.mSecondaryPointerId);
                    if (findPointerIndex < 0 || findPointerIndex2 < 0) {
                        this.mListener.onEndRotate(false);
                        this.mInProgress = false;
                        return true;
                    }
                    float x = motionEvent.getX(findPointerIndex);
                    this.mListener.onRotate(this.mFocusX, this.mFocusY, (float) (((Math.atan2((double) (motionEvent.getY(findPointerIndex) - motionEvent.getY(findPointerIndex2)), (double) (x - motionEvent.getX(findPointerIndex2))) - this.mInitialTheta) * 180.0d) / 3.141592653589793d));
                }
                return true;
            case 3:
                if (this.mInProgress) {
                    this.mListener.onEndRotate(true);
                    this.mInProgress = false;
                }
                return true;
            case 5:
                if (!this.mInProgress) {
                    this.mSecondaryPointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
                    if (this.mSecondaryPointerId == this.mPrimaryPointerId) {
                        return true;
                    }
                    int findPointerIndex3 = motionEvent.findPointerIndex(this.mPrimaryPointerId);
                    int findPointerIndex4 = motionEvent.findPointerIndex(this.mSecondaryPointerId);
                    if (findPointerIndex3 < 0 || findPointerIndex4 < 0) {
                        this.mListener.onEndRotate(false);
                        this.mInProgress = false;
                        return true;
                    }
                    float x2 = motionEvent.getX(findPointerIndex3);
                    float y = motionEvent.getY(findPointerIndex3);
                    float x3 = motionEvent.getX(findPointerIndex4);
                    float y2 = motionEvent.getY(findPointerIndex4);
                    this.mFocusX = (x2 + x3) / 2.0f;
                    this.mFocusY = (y + y2) / 2.0f;
                    this.mInitialTheta = Math.atan2((double) (y - y2), (double) (x2 - x3));
                    if (this.mListener.onBeginRotate(this.mFocusX, this.mFocusY)) {
                        this.mInProgress = true;
                    }
                }
                return true;
            case 6:
                int pointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
                if (this.mInProgress && (this.mSecondaryPointerId == pointerId || this.mPrimaryPointerId == pointerId)) {
                    this.mListener.onEndRotate(false);
                    this.mInProgress = false;
                }
                return true;
            default:
                return true;
        }
    }
}
