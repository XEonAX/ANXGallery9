package uk.co.senab.photoview.gestures;

import android.content.Context;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import java.util.Locale;

public class RotateGestureDetector {
    private static boolean DEBUG = Log.isLoggable("RotateGestureDetector", 3);
    private boolean isInProgress;
    private float mDegrees;
    private double mDistanceDiffLimit = 50.0d;
    private int mFirstPointerID;
    private float mFirstPointerLastX;
    private float mFirstPointerLastY;
    private float mFocusX;
    private float mFocusY;
    private boolean mIsBeingRotated = false;
    private boolean mIsClockwise;
    private OnRotationGestureListener mListener;
    private int mMaxVelocity;
    private int mMinVelocity;
    private double mPointersLastDistance;
    private float mRotateSlop = 10.0f;
    private int mSecondPointerID;
    private float mSecondPointerLastX;
    private float mSecondPointerLastY;
    private VelocityTracker mTracker;

    public interface OnRotationGestureListener {
        boolean onRotate(RotateGestureDetector rotateGestureDetector);

        boolean onRotateBegin(RotateGestureDetector rotateGestureDetector);

        void onRotateEnd(RotateGestureDetector rotateGestureDetector, boolean z, float f);
    }

    public RotateGestureDetector(Context context, OnRotationGestureListener onRotationGestureListener) {
        this.mListener = onRotationGestureListener;
        this.mFirstPointerID = -1;
        this.mSecondPointerID = -1;
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mMinVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mMaxVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
    }

    private float calculateDegrees(float f, float f2) {
        float clipAngle = clipAngle(f2) - clipAngle(f);
        return clipAngle < -180.0f ? clipAngle + 360.0f : clipAngle > 180.0f ? clipAngle - 360.0f : clipAngle;
    }

    private float calculateDegrees(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        return calculateDegrees((float) Math.toDegrees((double) ((float) Math.atan2((double) (f4 - f2), (double) (f3 - f)))), (float) Math.toDegrees((double) ((float) Math.atan2((double) (f8 - f6), (double) (f7 - f5)))));
    }

    private double calculateDistance(double d, double d2, double d3, double d4) {
        return Math.sqrt(Math.pow(d - d3, 2.0d) + Math.pow(d2 - d4, 2.0d));
    }

    private void callRotateEnd() {
        if (this.isInProgress) {
            this.isInProgress = false;
            this.mTracker.computeCurrentVelocity(1000, (float) this.mMaxVelocity);
            float xVelocity = this.mTracker.getXVelocity(this.mFirstPointerID);
            float xVelocity2 = this.mTracker.getXVelocity(this.mSecondPointerID);
            float yVelocity = this.mTracker.getYVelocity(this.mFirstPointerID);
            float yVelocity2 = this.mTracker.getYVelocity(this.mSecondPointerID);
            float f = xVelocity2 - xVelocity;
            float f2 = yVelocity2 - yVelocity;
            float f3 = (Math.abs(f) > Math.abs(f2) ? f : f2) / 2.0f;
            if (DEBUG) {
                Log.i("RotateGestureDetector", String.format("x1 %s, x1 %s, y1 %s, y2 %s, deltaX %s, deltaY %s, clockwise %s", new Object[]{Float.valueOf(xVelocity), Float.valueOf(xVelocity), Float.valueOf(yVelocity), Float.valueOf(yVelocity2), Float.valueOf(f), Float.valueOf(f2), Boolean.valueOf(this.mIsClockwise)}));
            }
            if (this.mListener != null) {
                this.mListener.onRotateEnd(this, this.mIsClockwise, f3);
            }
        }
        this.mIsBeingRotated = false;
        releaseTracker();
    }

    private boolean checkPointerIndex(MotionEvent motionEvent, int i) {
        return i > -1 && i < motionEvent.getPointerCount();
    }

    private float clipAngle(float f) {
        return f % 360.0f;
    }

    private void ensureTracker() {
        if (this.mTracker == null) {
            this.mTracker = VelocityTracker.obtain();
        }
    }

    private void releaseTracker() {
        if (this.mTracker != null) {
            this.mTracker.recycle();
            this.mTracker = null;
        }
    }

    public float getFocusX() {
        return this.mFocusX;
    }

    public float getFocusY() {
        return this.mFocusY;
    }

    public float getRotateDegrees() {
        return this.mDegrees;
    }

    public boolean isInProgress() {
        return this.isInProgress;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        float f;
        float f2;
        float f3;
        MotionEvent motionEvent2 = motionEvent;
        ensureTracker();
        this.mTracker.addMovement(motionEvent2);
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.mFirstPointerLastX = motionEvent.getX();
                this.mFirstPointerLastY = motionEvent.getY();
                this.mFirstPointerID = motionEvent2.getPointerId(0);
                this.mDegrees = 0.0f;
                callRotateEnd();
                break;
            case 1:
                callRotateEnd();
                this.mFirstPointerID = -1;
                break;
            case 2:
                if (!(this.mFirstPointerID == -1 || this.mSecondPointerID == -1)) {
                    int findPointerIndex = motionEvent2.findPointerIndex(this.mFirstPointerID);
                    int findPointerIndex2 = motionEvent2.findPointerIndex(this.mSecondPointerID);
                    if (checkPointerIndex(motionEvent2, findPointerIndex) && checkPointerIndex(motionEvent2, findPointerIndex2)) {
                        float x = motionEvent2.getX(findPointerIndex);
                        float y = motionEvent2.getY(findPointerIndex);
                        float x2 = motionEvent2.getX(findPointerIndex2);
                        float y2 = motionEvent2.getY(findPointerIndex2);
                        if (!this.mIsBeingRotated) {
                            float f4 = y2;
                            f2 = y;
                            f = x2;
                            double calculateDistance = calculateDistance((double) x, (double) y, (double) x2, (double) y2);
                            if (DEBUG) {
                                Log.d("RotateGestureDetector", String.format(Locale.US, "distance old %s, distance new %s", new Object[]{Double.valueOf(this.mPointersLastDistance), Double.valueOf(calculateDistance)}));
                            }
                            if (Math.abs(this.mPointersLastDistance - calculateDistance) > this.mDistanceDiffLimit) {
                                this.mFirstPointerLastX = x;
                                this.mFirstPointerLastY = f2;
                                this.mSecondPointerLastX = f;
                                f3 = f4;
                                this.mSecondPointerLastY = f3;
                                this.mPointersLastDistance = calculateDistance((double) this.mFirstPointerLastX, (double) this.mFirstPointerLastY, (double) this.mSecondPointerLastX, (double) this.mSecondPointerLastY);
                            } else {
                                f3 = f4;
                                if (Math.abs(calculateDegrees(this.mFirstPointerLastX, this.mFirstPointerLastY, this.mSecondPointerLastX, this.mSecondPointerLastY, x, f2, f, f3)) > this.mRotateSlop) {
                                    this.mIsBeingRotated = true;
                                    this.mFirstPointerLastX = x;
                                    this.mFirstPointerLastY = f2;
                                    this.mSecondPointerLastX = f;
                                    this.mSecondPointerLastY = f3;
                                    if (this.mListener != null) {
                                        this.isInProgress = this.mListener.onRotateBegin(this);
                                    }
                                }
                            }
                        } else {
                            f3 = y2;
                            f2 = y;
                            f = x2;
                        }
                        if (this.mIsBeingRotated) {
                            this.mDegrees = calculateDegrees(this.mFirstPointerLastX, this.mFirstPointerLastY, this.mSecondPointerLastX, this.mSecondPointerLastY, x, f2, f, f3);
                            this.mFocusX = (x + f) / 2.0f;
                            this.mFocusY = (f2 + f3) / 2.0f;
                            if (DEBUG) {
                                Log.d("RotateGestureDetector", String.format("degrees %s, focusX %s, focusY %s", new Object[]{Float.valueOf(this.mDegrees), Float.valueOf(this.mFocusX), Float.valueOf(this.mFocusY)}));
                            }
                            if (Math.abs(this.mDegrees) > 2.0f) {
                                this.mIsClockwise = this.mDegrees > 0.0f;
                            }
                            if (this.mListener != null ? this.mListener.onRotate(this) : true) {
                                this.mFirstPointerLastX = x;
                                this.mFirstPointerLastY = f2;
                                this.mSecondPointerLastX = f;
                                this.mSecondPointerLastY = f3;
                                break;
                            }
                        }
                    } else {
                        Log.w("RotateGestureDetector", String.format("illegal pointer index, count[%s], pointer1[%s], pointer2[%s]", new Object[]{Integer.valueOf(motionEvent.getPointerCount()), Integer.valueOf(findPointerIndex), Integer.valueOf(findPointerIndex2)}));
                        break;
                    }
                }
                break;
            case 3:
                callRotateEnd();
                this.mFirstPointerID = -1;
                this.mSecondPointerID = -1;
                break;
            case 5:
                int actionIndex = motionEvent.getActionIndex();
                this.mSecondPointerLastX = motionEvent2.getX(actionIndex);
                this.mSecondPointerLastY = motionEvent2.getY(actionIndex);
                this.mSecondPointerID = motionEvent2.getPointerId(actionIndex);
                this.mDegrees = 0.0f;
                callRotateEnd();
                this.mPointersLastDistance = calculateDistance((double) this.mSecondPointerLastX, (double) this.mSecondPointerLastY, (double) this.mFirstPointerLastX, (double) this.mFirstPointerLastY);
                break;
            case 6:
                callRotateEnd();
                this.mSecondPointerID = -1;
                break;
        }
        return true;
    }
}
