package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.graphics.PointF;
import android.view.MotionEvent;

public class TranslateDetector {
    private OnTranslateListener mGestureListener;
    private PointF mStartPoint = new PointF();
    private PointF mStartPointOne = new PointF();
    private State mState = State.IDLE;

    public interface OnTranslateListener {
        void onTranslate(float f, float f2);

        boolean onTranslateBegin();

        void onTranslateEnd();
    }

    private enum State {
        IN_PROGRESS,
        IDLE
    }

    public TranslateDetector(OnTranslateListener onTranslateListener) {
        this.mGestureListener = onTranslateListener;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        if (actionMasked == 0) {
            this.mStartPoint.set(motionEvent.getX(0), motionEvent.getY(0));
            if (this.mGestureListener.onTranslateBegin()) {
                this.mState = State.IN_PROGRESS;
            } else {
                this.mState = State.IDLE;
            }
            return true;
        } else if (this.mState != State.IN_PROGRESS) {
            return false;
        } else {
            if (actionMasked == 2) {
                if (actionIndex == 0) {
                    float x = motionEvent.getX() - this.mStartPoint.x;
                    float y = motionEvent.getY() - this.mStartPoint.y;
                    if (motionEvent.getPointerCount() > 1) {
                        x = ((x + motionEvent.getX(1)) - this.mStartPointOne.x) / 2.0f;
                        y = ((y + motionEvent.getY(1)) - this.mStartPointOne.y) / 2.0f;
                        this.mStartPointOne.set(motionEvent.getX(1), motionEvent.getY(1));
                    }
                    this.mGestureListener.onTranslate(x, y);
                    this.mStartPoint.set(motionEvent.getX(), motionEvent.getY());
                }
            } else if (actionMasked == 5) {
                if (actionIndex == 0) {
                    this.mStartPoint.set(motionEvent.getX(0), motionEvent.getY(0));
                } else if (actionIndex == 1) {
                    this.mStartPointOne.set(motionEvent.getX(1), motionEvent.getY(1));
                }
            } else if (actionMasked != 6) {
                this.mState = State.IDLE;
                this.mGestureListener.onTranslateEnd();
            } else if (actionIndex == 0) {
                this.mStartPoint.set(motionEvent.getX(1), motionEvent.getY(1));
            }
            return true;
        }
    }
}
