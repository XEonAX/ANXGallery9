package uk.co.senab.photoview.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.Log;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.VelocityTracker;
import com.miui.gallery.util.MiscUtil;
import uk.co.senab.photoview.log.LogManager;

@TargetApi(8)
public class FroyoGestureDetector extends EclairGestureDetector {
    private static boolean DEBUG = Log.isLoggable("FroyoGestureDetector", 3);
    protected final ScaleGestureDetector mDetector;
    private float mMultiPointerDiff = 10.0f;
    private int mPrimaryPointerId = -1;
    private float mSecondLastTouchX;
    private float mSecondLastTouchY;
    private int mSecondPointerId = -1;

    public FroyoGestureDetector(Context context) {
        super(context);
        this.mDetector = new ScaleGestureDetector(context, new OnScaleGestureListener() {
            public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
                float scaleFactor = scaleGestureDetector.getScaleFactor();
                if (Float.isNaN(scaleFactor) || Float.isInfinite(scaleFactor)) {
                    return false;
                }
                FroyoGestureDetector.this.mListener.onScale(scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
                return true;
            }

            public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
                return true;
            }

            public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            }
        });
    }

    private double calculateDistance(double d, double d2) {
        return Math.sqrt((d * d) + (d2 * d2));
    }

    private boolean checkPointerIndex(MotionEvent motionEvent, int i) {
        return i > -1 && i < motionEvent.getPointerCount();
    }

    /* JADX WARNING: Removed duplicated region for block: B:65:0x01b3  */
    private boolean handleDragEvent(MotionEvent motionEvent) {
        boolean z;
        MotionEvent motionEvent2 = motionEvent;
        boolean z2 = false;
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.mVelocityTracker = VelocityTracker.obtain();
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEvent2);
                } else {
                    LogManager.getLogger().d("FroyoGestureDetector", "Velocity tracker is null");
                }
                int actionIndex = motionEvent.getActionIndex();
                this.mPrimaryPointerId = motionEvent2.getPointerId(actionIndex);
                this.mLastTouchX = motionEvent2.getX(actionIndex);
                this.mLastTouchY = motionEvent2.getY(actionIndex);
                this.mIsDragging = false;
                if (DEBUG) {
                    LogManager.getLogger().d("FroyoGestureDetector", String.format("ACTION_DOWN pointer id %s", new Object[]{Integer.valueOf(this.mPrimaryPointerId)}));
                    break;
                }
                break;
            case 1:
                if (this.mIsDragging && this.mVelocityTracker != null) {
                    this.mLastTouchX = getActiveX(motionEvent);
                    this.mLastTouchY = getActiveY(motionEvent);
                    this.mVelocityTracker.addMovement(motionEvent2);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float xVelocity = this.mVelocityTracker.getXVelocity(this.mPrimaryPointerId);
                    float yVelocity = this.mVelocityTracker.getYVelocity(this.mPrimaryPointerId);
                    if (Math.max(Math.abs(xVelocity), Math.abs(yVelocity)) >= this.mMinimumVelocity) {
                        this.mListener.onFling(this.mLastTouchX, this.mLastTouchY, -xVelocity, -yVelocity);
                    }
                }
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                this.mIsDragging = false;
                break;
            case 2:
                float activeX = getActiveX(motionEvent);
                float activeY = getActiveY(motionEvent);
                float f = activeX - this.mLastTouchX;
                float f2 = activeY - this.mLastTouchY;
                if (!this.mIsDragging) {
                    if (this.mSecondPointerId != -1) {
                        int findPointerIndex = motionEvent2.findPointerIndex(this.mSecondPointerId);
                        if (checkPointerIndex(motionEvent2, findPointerIndex)) {
                            float x = motionEvent2.getX(findPointerIndex);
                            float y = motionEvent2.getY(findPointerIndex);
                            float f3 = x - this.mSecondLastTouchX;
                            float f4 = y - this.mSecondLastTouchY;
                            if (DEBUG) {
                                LogManager.getLogger().d("FroyoGestureDetector", String.format("dx %s, dy %s, secondDx %s. secondDy %s", new Object[]{Float.valueOf(f), Float.valueOf(f2), Float.valueOf(f3), Float.valueOf(f4)}));
                            }
                            if (!MiscUtil.floatNear(f, f3, this.mMultiPointerDiff) || !MiscUtil.floatNear(f2, f4, this.mMultiPointerDiff)) {
                                this.mLastTouchX = activeX;
                                this.mLastTouchY = activeY;
                                this.mSecondLastTouchX = x;
                                this.mSecondLastTouchY = y;
                            } else {
                                this.mIsDragging = calculateDistance((double) f, (double) f2) >= ((double) this.mTouchSlop);
                            }
                            z = false;
                            if (z) {
                                if (calculateDistance((double) f, (double) f2) >= ((double) this.mTouchSlop)) {
                                    z2 = true;
                                }
                                this.mIsDragging = z2;
                            }
                        } else {
                            this.mSecondPointerId = -1;
                        }
                    }
                    z = true;
                    if (z) {
                    }
                }
                if (this.mIsDragging) {
                    this.mListener.onDrag(f, f2);
                    this.mLastTouchX = activeX;
                    this.mLastTouchY = activeY;
                    if (this.mVelocityTracker != null) {
                        this.mVelocityTracker.addMovement(motionEvent2);
                        break;
                    }
                }
                break;
            case 3:
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                this.mIsDragging = false;
                break;
            case 5:
                int actionIndex2 = motionEvent.getActionIndex();
                this.mSecondPointerId = motionEvent2.getPointerId(actionIndex2);
                this.mSecondLastTouchX = motionEvent2.getX(actionIndex2);
                this.mSecondLastTouchY = motionEvent2.getY(actionIndex2);
                if (DEBUG) {
                    LogManager.getLogger().d("FroyoGestureDetector", String.format("ACTION_POINTER_DOWN pointer id %s", new Object[]{Integer.valueOf(this.mSecondPointerId)}));
                    break;
                }
                break;
            case 6:
                int actionIndex3 = motionEvent.getActionIndex();
                int pointerId = motionEvent2.getPointerId(actionIndex3);
                if (pointerId == this.mPrimaryPointerId) {
                    if (this.mSecondPointerId != -1) {
                        this.mPrimaryPointerId = this.mSecondPointerId;
                    } else {
                        this.mPrimaryPointerId = motionEvent2.getPointerId(actionIndex3 == 0 ? 1 : 0);
                    }
                    int findPointerIndex2 = motionEvent2.findPointerIndex(this.mPrimaryPointerId);
                    if (!checkPointerIndex(motionEvent2, findPointerIndex2)) {
                        LogManager.getLogger().e("FroyoGestureDetector", String.format("new primary id %s, new index %s, count %s", new Object[]{Integer.valueOf(this.mPrimaryPointerId), Integer.valueOf(findPointerIndex2), Integer.valueOf(motionEvent.getPointerCount())}));
                    }
                    this.mLastTouchX = getActiveX(motionEvent);
                    this.mLastTouchY = getActiveY(motionEvent);
                    if (this.mVelocityTracker != null) {
                        this.mVelocityTracker.clear();
                    }
                }
                if (!this.mIsDragging && (this.mSecondPointerId == this.mPrimaryPointerId || this.mSecondPointerId == pointerId)) {
                    this.mSecondPointerId = -1;
                    int pointerCount = motionEvent.getPointerCount();
                    if (pointerCount > 1) {
                        int i = 0;
                        while (true) {
                            if (i < pointerCount) {
                                int pointerId2 = motionEvent2.getPointerId(i);
                                if (this.mPrimaryPointerId == pointerId2 || pointerId2 == pointerId) {
                                    i++;
                                } else {
                                    this.mSecondPointerId = pointerId2;
                                }
                            }
                        }
                    }
                }
                if (DEBUG) {
                    LogManager.getLogger().d("FroyoGestureDetector", String.format("pointer info after ACTION_POINTER_UP, primary %s, second %s, count %s", new Object[]{Integer.valueOf(this.mPrimaryPointerId), Integer.valueOf(this.mSecondPointerId), Integer.valueOf(motionEvent.getPointerCount())}));
                    break;
                }
                break;
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public float getActiveX(MotionEvent motionEvent) {
        int findPointerIndex = motionEvent.findPointerIndex(this.mPrimaryPointerId);
        return checkPointerIndex(motionEvent, findPointerIndex) ? motionEvent.getX(findPointerIndex) : motionEvent.getX();
    }

    /* access modifiers changed from: 0000 */
    public float getActiveY(MotionEvent motionEvent) {
        int findPointerIndex = motionEvent.findPointerIndex(this.mPrimaryPointerId);
        return checkPointerIndex(motionEvent, findPointerIndex) ? motionEvent.getY(findPointerIndex) : motionEvent.getY();
    }

    public boolean isScaling() {
        return this.mDetector.isInProgress();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.mDetector.onTouchEvent(motionEvent);
        return handleDragEvent(motionEvent);
    }
}
