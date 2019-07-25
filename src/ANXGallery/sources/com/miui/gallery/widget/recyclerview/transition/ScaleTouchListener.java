package com.miui.gallery.widget.recyclerview.transition;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import com.miui.gallery.util.Log;
import com.miui.gallery.view.ScaleGestureDetector;
import com.miui.gallery.view.ScaleGestureDetector.OnScaleGestureListener;
import java.lang.ref.WeakReference;

class ScaleTouchListener implements OnItemTouchListener, OnScaleGestureListener {
    private int mCurZoomFlag = 0;
    private final ScaleGestureDetector mDetector;
    private final WeakReference<RecyclerView> mFrom;
    private boolean mInterceptTouch = false;
    private final OnScaleListener mScaleListener;
    private int mSupportZoomFlag = 0;
    private boolean mUnsupportedZoom = false;
    private WeakReference<RecyclerView> mZoomInTo;
    private WeakReference<RecyclerView> mZoomOutTo;

    interface OnScaleListener {
        boolean onScale(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f);

        boolean onScaleBegin(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f, float f2, float f3);

        void onScaleEnd(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f);
    }

    public ScaleTouchListener(RecyclerView recyclerView, OnScaleListener onScaleListener) {
        this.mFrom = new WeakReference<>(recyclerView);
        this.mScaleListener = onScaleListener;
        this.mDetector = new ScaleGestureDetector(recyclerView.getContext(), this);
        this.mDetector.setScaleMinSpan(ViewConfiguration.get(recyclerView.getContext()).getScaledTouchSlop() * 2);
    }

    private void disallowInterceptTouchEvent(boolean z) {
        View view = (View) this.mFrom.get();
        if (view == null) {
            Log.w("ScaleTouchListener", "the from view has recycled");
            return;
        }
        ViewParent parent = view.getParent();
        if (parent == null) {
            Log.w("ScaleTouchListener", "parent of the from view is null");
        } else {
            parent.requestDisallowInterceptTouchEvent(z);
        }
    }

    private RecyclerView getCurToView() {
        if (this.mCurZoomFlag == 1) {
            return (RecyclerView) this.mZoomInTo.get();
        }
        if (this.mCurZoomFlag == 2) {
            return (RecyclerView) this.mZoomOutTo.get();
        }
        return null;
    }

    private boolean isViewAttached() {
        if (this.mFrom.get() == null) {
            Log.w("ScaleTouchListener", "mFrom view is detached");
            this.mInterceptTouch = false;
            return false;
        } else if (getCurToView() != null) {
            return true;
        } else {
            Log.w("ScaleTouchListener", "mTo view is detached");
            this.mInterceptTouch = false;
            return false;
        }
    }

    private boolean supportZoomIn() {
        return (this.mSupportZoomFlag & 1) == 1;
    }

    private boolean supportZoomOut() {
        return (this.mSupportZoomFlag & 2) == 2;
    }

    public void bindZoomView(RecyclerView recyclerView, int i) {
        this.mSupportZoomFlag |= i;
        if (i == 1) {
            this.mZoomInTo = new WeakReference<>(recyclerView);
        }
        if (i == 2) {
            this.mZoomOutTo = new WeakReference<>(recyclerView);
        }
    }

    public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
        if (motionEvent.getActionMasked() == 0) {
            disallowInterceptTouchEvent(false);
            this.mInterceptTouch = false;
            this.mUnsupportedZoom = false;
        }
        this.mDetector.onTouchEvent(motionEvent);
        return this.mInterceptTouch;
    }

    public void onRequestDisallowInterceptTouchEvent(boolean z) {
    }

    public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
        boolean z;
        if (this.mUnsupportedZoom) {
            Log.d("ScaleTouchListener", "onScale: unsupported zoom %d", (Object) Integer.valueOf(this.mCurZoomFlag));
            return false;
        }
        float scaleFactor = scaleGestureDetector.getScaleFactor();
        if (Float.isNaN(scaleFactor) || Float.isInfinite(scaleFactor)) {
            Log.e("ScaleTouchListener", "illegal scale factor %s", (Object) Float.valueOf(scaleFactor));
            return false;
        }
        Log.d("ScaleTouchListener", "onScale scaleFactor %s", (Object) Float.valueOf(scaleFactor));
        if (this.mCurZoomFlag == 0) {
            if (scaleFactor > 1.0f || scaleFactor < 1.0f) {
                if (scaleFactor <= 1.0f || !supportZoomIn()) {
                    z = false;
                } else {
                    this.mCurZoomFlag = 1;
                    z = true;
                }
                if (scaleFactor < 1.0f && supportZoomOut()) {
                    this.mCurZoomFlag = 2;
                    z = true;
                }
                if (!z) {
                    this.mUnsupportedZoom = true;
                    disallowInterceptTouchEvent(false);
                } else if (this.mScaleListener != null) {
                    this.mInterceptTouch = this.mScaleListener.onScaleBegin((RecyclerView) this.mFrom.get(), getCurToView(), this.mCurZoomFlag, scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
                }
            }
        } else if (!isViewAttached()) {
            return false;
        } else {
            if (this.mScaleListener != null) {
                this.mInterceptTouch = this.mScaleListener.onScale((RecyclerView) this.mFrom.get(), getCurToView(), this.mCurZoomFlag, scaleFactor);
            }
        }
        return this.mInterceptTouch;
    }

    public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
        this.mInterceptTouch = true;
        this.mCurZoomFlag = 0;
        disallowInterceptTouchEvent(true);
        Log.d("ScaleTouchListener", "onScaleBegin scaleFactor %s", (Object) Float.valueOf(scaleGestureDetector.getScaleFactor()));
        return true;
    }

    public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        if (isViewAttached()) {
            if (this.mUnsupportedZoom) {
                Log.d("ScaleTouchListener", "onScaleEnd: unsupported zoom %d", (Object) Integer.valueOf(this.mCurZoomFlag));
                return;
            }
            float scaleFactor = scaleGestureDetector.getScaleFactor();
            Log.d("ScaleTouchListener", "onScaleEnd scaleFactor %s", (Object) Float.valueOf(scaleFactor));
            if (this.mScaleListener != null) {
                this.mScaleListener.onScaleEnd((RecyclerView) this.mFrom.get(), getCurToView(), this.mCurZoomFlag, scaleFactor);
            }
        }
    }

    public void onTouchEvent(RecyclerView recyclerView, MotionEvent motionEvent) {
        if (motionEvent.getActionMasked() == 0) {
            this.mInterceptTouch = false;
            this.mUnsupportedZoom = false;
        }
        this.mDetector.onTouchEvent(motionEvent);
    }
}
