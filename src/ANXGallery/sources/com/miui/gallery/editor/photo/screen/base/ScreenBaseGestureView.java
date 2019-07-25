package com.miui.gallery.editor.photo.screen.base;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.View;
import android.view.ViewConfiguration;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder.ParamsChangeListener;

public abstract class ScreenBaseGestureView extends View implements ParamsChangeListener {
    protected BitmapGestureParamsHolder mBitmapGestureParamsHolder;
    protected Paint mBitmapPaint = new Paint(3);
    /* access modifiers changed from: private */
    public FeatureGesListener mCropGestureListener;
    /* access modifiers changed from: private */
    public FeatureGesListener mCurrentGestureListener;
    private CustomGesListener mCustomGesListener = new CustomGesListener();
    private CustomScaleListener mCustomScaleListener = new CustomScaleListener();
    protected Bitmap mDisplayBitmap;
    protected Canvas mDisplayCanvas;
    /* access modifiers changed from: private */
    public FeatureGesListener mFeatureGestureListener;
    private boolean mForceHandleEventByChild = false;
    private GestureDetector mGestureDetector;
    protected Bitmap mOriginBitmap;
    private ScaleGestureDetector mScaleGestureDetector;
    protected State mState = State.NOT_DEFINE;
    /* access modifiers changed from: private */
    public float mTouchMinSize;

    private class CustomGesListener implements OnGestureListener {
        private CustomGesListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            if (ScreenBaseGestureView.this.mState != State.BY_CHILD) {
                if (motionEvent.getPointerCount() > 1) {
                    ScreenBaseGestureView.this.mState = State.SCALE_MOVE;
                } else if (ScreenBaseGestureView.this.mCropGestureListener != null && ScreenBaseGestureView.this.mCropGestureListener.onDown(motionEvent)) {
                    ScreenBaseGestureView.this.mCurrentGestureListener = ScreenBaseGestureView.this.mCropGestureListener;
                } else if (ScreenBaseGestureView.this.mFeatureGestureListener != null) {
                    ScreenBaseGestureView.this.mCurrentGestureListener = ScreenBaseGestureView.this.mFeatureGestureListener;
                    return ScreenBaseGestureView.this.mFeatureGestureListener.onDown(motionEvent);
                }
            } else if (ScreenBaseGestureView.this.mCropGestureListener != null && ScreenBaseGestureView.this.mCropGestureListener.onDown(motionEvent)) {
                ScreenBaseGestureView.this.mCurrentGestureListener = ScreenBaseGestureView.this.mCropGestureListener;
            } else if (ScreenBaseGestureView.this.mFeatureGestureListener != null) {
                ScreenBaseGestureView.this.mCurrentGestureListener = ScreenBaseGestureView.this.mFeatureGestureListener;
                return ScreenBaseGestureView.this.mFeatureGestureListener.onDown(motionEvent);
            }
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (ScreenBaseGestureView.this.mState == State.SCALE_MOVE) {
                ScreenBaseGestureView.this.getBitmapGestureParamsHolder().mCanvasMatrix.postTranslate(-f, -f2);
                ScreenBaseGestureView.this.getBitmapGestureParamsHolder().performCanvasMatrixChange();
            } else if (ScreenBaseGestureView.this.mState == State.BY_CHILD) {
                if (ScreenBaseGestureView.this.mCurrentGestureListener != null) {
                    ScreenBaseGestureView.this.mCurrentGestureListener.onScroll(motionEvent, motionEvent2, f, f2);
                }
            } else if (motionEvent2.getPointerCount() > 1) {
                ScreenBaseGestureView.this.mState = State.SCALE_MOVE;
            } else if (((float) Math.hypot((double) (motionEvent2.getX() - motionEvent.getX()), (double) (motionEvent2.getY() - motionEvent.getY()))) > ScreenBaseGestureView.this.mTouchMinSize) {
                ScreenBaseGestureView.this.mState = State.BY_CHILD;
            } else {
                ScreenBaseGestureView.this.mState = State.NOT_DEFINE;
            }
            return true;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            if (!(ScreenBaseGestureView.this.mState == State.SCALE_MOVE || ScreenBaseGestureView.this.mCurrentGestureListener == null)) {
                ScreenBaseGestureView.this.mState = State.BY_CHILD;
                ScreenBaseGestureView.this.mCurrentGestureListener.onSingleTapUp(motionEvent);
            }
            return true;
        }
    }

    private class CustomScaleListener implements OnScaleGestureListener {
        private CustomScaleListener() {
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (ScreenBaseGestureView.this.mState != State.BY_CHILD) {
                float scaleFactor = scaleGestureDetector.getScaleFactor();
                ScreenBaseGestureView.this.mState = State.SCALE_MOVE;
                if (ScreenBaseGestureView.this.mCropGestureListener == null && scaleFactor > 1.0f && ScreenBaseGestureView.this.mBitmapGestureParamsHolder.mBitmapDisplayRect.width() > ScreenBaseGestureView.this.mBitmapGestureParamsHolder.mMaxWidthScale) {
                    return false;
                }
                ScreenBaseGestureView.this.mBitmapGestureParamsHolder.performScale(scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
            } else if (ScreenBaseGestureView.this.mCurrentGestureListener != null) {
                ScreenBaseGestureView.this.mCurrentGestureListener.onScale(scaleGestureDetector);
            }
            return true;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (ScreenBaseGestureView.this.mState != State.BY_CHILD) {
                ScreenBaseGestureView.this.mState = State.SCALE_MOVE;
            } else if (ScreenBaseGestureView.this.mCurrentGestureListener != null) {
                ScreenBaseGestureView.this.mCurrentGestureListener.onScaleBegin(scaleGestureDetector);
            }
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            if (ScreenBaseGestureView.this.mState == State.BY_CHILD && ScreenBaseGestureView.this.mCurrentGestureListener != null) {
                ScreenBaseGestureView.this.mCurrentGestureListener.onScaleEnd(scaleGestureDetector);
            }
        }
    }

    public interface FeatureGesListener extends OnScaleGestureListener {
        void onActionUp(float f, float f2);

        boolean onDown(MotionEvent motionEvent);

        void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2);

        void onSingleTapUp(MotionEvent motionEvent);
    }

    protected enum State {
        NOT_DEFINE,
        SCALE_MOVE,
        BY_CHILD
    }

    public ScreenBaseGestureView(Context context) {
        super(context);
        init();
    }

    public ScreenBaseGestureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public ScreenBaseGestureView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mBitmapGestureParamsHolder = new BitmapGestureParamsHolder(this, this);
        this.mGestureDetector = new GestureDetector(getContext(), this.mCustomGesListener);
        this.mScaleGestureDetector = new ScaleGestureDetector(getContext(), this.mCustomScaleListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mTouchMinSize = (float) ViewConfiguration.get(getContext()).getScaledTouchSlop();
    }

    private void onActionUp(float f, float f2) {
        if (this.mCropGestureListener != null) {
            this.mCropGestureListener.onActionUp(f, f2);
        } else {
            this.mBitmapGestureParamsHolder.resetMatrixWithAnim();
        }
        if (!(this.mCurrentGestureListener == null || this.mCurrentGestureListener == this.mCropGestureListener)) {
            this.mCurrentGestureListener.onActionUp(f, f2);
        }
        invalidate();
    }

    public float convertDistanceX(float f) {
        return this.mBitmapGestureParamsHolder.convertDistanceX(f);
    }

    public float convertDistanceY(float f) {
        return this.mBitmapGestureParamsHolder.convertDistanceY(f);
    }

    public void convertPointToViewPortCoordinate(MotionEvent motionEvent, float[] fArr) {
        fArr[0] = motionEvent.getX();
        fArr[1] = motionEvent.getY();
        convertPointToViewPortCoordinate(fArr);
    }

    public void convertPointToViewPortCoordinate(float[] fArr) {
        this.mBitmapGestureParamsHolder.convertPointToViewPortCoordinate(fArr);
    }

    public void disableChildHandleMode() {
        this.mForceHandleEventByChild = false;
    }

    public void enableChildHandleMode() {
        this.mForceHandleEventByChild = true;
    }

    public BitmapGestureParamsHolder getBitmapGestureParamsHolder() {
        return this.mBitmapGestureParamsHolder;
    }

    public Bitmap getOriginBitmap() {
        return this.mOriginBitmap;
    }

    public int getRectOverScrollStatus(RectF rectF) {
        return getRectOverScrollStatus(rectF, 0.5f);
    }

    /* access modifiers changed from: protected */
    public int getRectOverScrollStatus(RectF rectF, float f) {
        RectF rectF2 = this.mBitmapGestureParamsHolder.mBitmapDisplayRect;
        RectF rectF3 = this.mBitmapGestureParamsHolder.mDisplayRect;
        float width = rectF.width() * f;
        float height = rectF.height() * f;
        float max = Math.max(rectF2.left, rectF3.left);
        float max2 = Math.max(rectF2.top, rectF3.top);
        float min = Math.min(rectF2.right, rectF3.right);
        float min2 = Math.min(rectF2.bottom, rectF3.bottom);
        int i = rectF.left - max < (-width) ? 8 : rectF.right > min + width ? 4 : 0;
        return rectF.top - max2 < (-height) ? i | 2 : rectF.bottom > min2 + height ? i | 1 : i;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mBitmapGestureParamsHolder.onSizeChanged(i, i2, i3, i4);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.mDisplayBitmap == null) {
            return false;
        }
        if (motionEvent.getAction() == 0) {
            this.mState = State.NOT_DEFINE;
        }
        if (motionEvent.getPointerCount() > 1) {
            this.mState = State.SCALE_MOVE;
        }
        if (this.mForceHandleEventByChild) {
            this.mState = State.BY_CHILD;
        }
        this.mScaleGestureDetector.onTouchEvent(motionEvent);
        this.mGestureDetector.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action == 1 || action == 3) {
            onActionUp(motionEvent.getX(), motionEvent.getY());
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void refreshDisplayCanvas() {
        this.mDisplayCanvas.drawBitmap(this.mOriginBitmap, 0.0f, 0.0f, this.mBitmapPaint);
    }

    public void setBitmap(Bitmap bitmap) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        this.mOriginBitmap = bitmap;
        this.mDisplayBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        this.mDisplayCanvas = new Canvas(this.mDisplayBitmap);
        refreshDisplayCanvas();
        this.mBitmapGestureParamsHolder.setBitmap(bitmap);
    }

    public void setCropGestureListener(FeatureGesListener featureGesListener) {
        this.mCropGestureListener = featureGesListener;
    }

    public void setFeatureGestureListener(FeatureGesListener featureGesListener) {
        this.mFeatureGestureListener = featureGesListener;
    }
}
