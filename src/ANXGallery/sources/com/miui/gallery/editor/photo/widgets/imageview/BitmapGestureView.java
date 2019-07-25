package com.miui.gallery.editor.photo.widgets.imageview;

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
import com.miui.gallery.editor.photo.widgets.StrokeImageHelper;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder.ParamsChangeListener;

public class BitmapGestureView extends View {
    /* access modifiers changed from: protected */
    public BitmapGestureParamsHolder mBitmapGestureParamsHolder;
    private Paint mBitmapPaint = new Paint(3);
    private CustomGesListener mCustomGesListener = new CustomGesListener();
    private CustomScaleListener mCustomScaleListener = new CustomScaleListener();
    /* access modifiers changed from: protected */
    public Bitmap mDisplayBitmap;
    protected Canvas mDisplayCanvas;
    private boolean mDrawOrigin = false;
    /* access modifiers changed from: private */
    public FeatureGesListener mFeatureGestureListener;
    private boolean mForceHandleEventByChild = false;
    private GestureDetector mGestureDetector;
    protected Bitmap mOriginBitmap;
    private ParamsChangeListener mParamsChangeListener = new ParamsChangeListener() {
        public void onBitmapMatrixChanged() {
            BitmapGestureView.this.onBitmapMatrixChanged();
            BitmapGestureView.this.invalidate();
        }

        public void onCanvasMatrixChange() {
            BitmapGestureView.this.onCanvasMatrixChange();
            BitmapGestureView.this.invalidate();
        }
    };
    private ScaleGestureDetector mScaleGestureDetector;
    /* access modifiers changed from: protected */
    public State mState = State.NOT_DEFINE;
    private StrokeImageHelper mStrokeImageHelper;
    /* access modifiers changed from: private */
    public float mTouchMinSize;

    private class CustomGesListener implements OnGestureListener {
        private CustomGesListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            if (BitmapGestureView.this.mState != State.BY_CHILD) {
                if (motionEvent.getPointerCount() > 1) {
                    BitmapGestureView.this.mState = State.SCALE_MOVE;
                } else if (BitmapGestureView.this.mFeatureGestureListener != null) {
                    return BitmapGestureView.this.mFeatureGestureListener.onDown(motionEvent);
                }
            } else if (BitmapGestureView.this.mFeatureGestureListener != null) {
                return BitmapGestureView.this.mFeatureGestureListener.onDown(motionEvent);
            }
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (BitmapGestureView.this.mState == State.SCALE_MOVE) {
                BitmapGestureView.this.mBitmapGestureParamsHolder.performTransition(-f, -f2);
            } else if (BitmapGestureView.this.mState == State.BY_CHILD) {
                if (BitmapGestureView.this.mFeatureGestureListener != null) {
                    BitmapGestureView.this.mFeatureGestureListener.onScroll(motionEvent, motionEvent2, f, f2);
                }
            } else if (motionEvent2.getPointerCount() > 1) {
                BitmapGestureView.this.mState = State.SCALE_MOVE;
            } else if (((float) Math.hypot((double) (motionEvent2.getX() - motionEvent.getX()), (double) (motionEvent2.getY() - motionEvent.getY()))) > BitmapGestureView.this.mTouchMinSize) {
                BitmapGestureView.this.mState = State.BY_CHILD;
            } else {
                BitmapGestureView.this.mState = State.NOT_DEFINE;
            }
            return true;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            if (!(BitmapGestureView.this.mState == State.SCALE_MOVE || BitmapGestureView.this.mFeatureGestureListener == null)) {
                BitmapGestureView.this.mState = State.BY_CHILD;
                BitmapGestureView.this.mFeatureGestureListener.onSingleTapUp(motionEvent);
            }
            return true;
        }
    }

    private class CustomScaleListener implements OnScaleGestureListener {
        private CustomScaleListener() {
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureView.this.mState != State.BY_CHILD) {
                float scaleFactor = scaleGestureDetector.getScaleFactor();
                BitmapGestureView.this.mState = State.SCALE_MOVE;
                if (scaleFactor > 1.0f && BitmapGestureView.this.mBitmapGestureParamsHolder.mBitmapDisplayRect.width() > BitmapGestureView.this.mBitmapGestureParamsHolder.mMaxWidthScale) {
                    return false;
                }
                BitmapGestureView.this.mBitmapGestureParamsHolder.performScale(scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
            } else if (BitmapGestureView.this.mFeatureGestureListener != null) {
                BitmapGestureView.this.mFeatureGestureListener.onScale(scaleGestureDetector);
            }
            return true;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureView.this.mState != State.BY_CHILD) {
                BitmapGestureView.this.mState = State.SCALE_MOVE;
            } else if (BitmapGestureView.this.mFeatureGestureListener != null) {
                BitmapGestureView.this.mFeatureGestureListener.onScaleBegin(scaleGestureDetector);
            }
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureView.this.mState == State.BY_CHILD && BitmapGestureView.this.mFeatureGestureListener != null) {
                BitmapGestureView.this.mFeatureGestureListener.onScaleEnd(scaleGestureDetector);
            }
        }
    }

    protected interface FeatureGesListener extends OnScaleGestureListener {
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

    public BitmapGestureView(Context context) {
        super(context);
        init();
    }

    public BitmapGestureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public BitmapGestureView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mBitmapGestureParamsHolder = new BitmapGestureParamsHolder(this, this.mParamsChangeListener);
        this.mGestureDetector = new GestureDetector(getContext(), this.mCustomGesListener);
        this.mScaleGestureDetector = new ScaleGestureDetector(getContext(), this.mCustomScaleListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mTouchMinSize = (float) ViewConfiguration.get(getContext()).getScaledTouchSlop();
        this.mStrokeImageHelper = new StrokeImageHelper(getContext());
    }

    private void onActionUp(float f, float f2) {
        this.mBitmapGestureParamsHolder.resetMatrixWithAnim();
        if (this.mFeatureGestureListener != null) {
            this.mFeatureGestureListener.onActionUp(f, f2);
        }
        invalidate();
    }

    /* access modifiers changed from: protected */
    public float convertDistanceX(float f) {
        return this.mBitmapGestureParamsHolder.convertDistanceX(f);
    }

    /* access modifiers changed from: protected */
    public float convertDistanceY(float f) {
        return this.mBitmapGestureParamsHolder.convertDistanceY(f);
    }

    /* access modifiers changed from: protected */
    public void convertPointToViewPortCoordinate(MotionEvent motionEvent, float[] fArr) {
        fArr[0] = motionEvent.getX();
        fArr[1] = motionEvent.getY();
        convertPointToViewPortCoordinate(fArr);
    }

    /* access modifiers changed from: protected */
    public void convertPointToViewPortCoordinate(float[] fArr) {
        this.mBitmapGestureParamsHolder.convertPointToViewPortCoordinate(fArr);
    }

    /* access modifiers changed from: protected */
    public void disableChildHandleMode() {
        this.mForceHandleEventByChild = false;
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas) {
    }

    public void drawOrigin(boolean z) {
        this.mDrawOrigin = z;
        invalidate();
    }

    /* access modifiers changed from: protected */
    public void enableChildHandleMode() {
        this.mForceHandleEventByChild = true;
    }

    /* access modifiers changed from: protected */
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
    public void onBitmapMatrixChanged() {
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
    }

    public void onClear() {
    }

    /* access modifiers changed from: protected */
    public final void onDraw(Canvas canvas) {
        if (this.mDisplayBitmap != null && !this.mDisplayBitmap.isRecycled()) {
            canvas.save();
            canvas.concat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
            canvas.drawBitmap(this.mDrawOrigin ? this.mOriginBitmap : this.mDisplayBitmap, this.mBitmapGestureParamsHolder.mBitmapToDisplayMatrix, this.mBitmapPaint);
            canvas.restore();
            drawChild(canvas);
            this.mStrokeImageHelper.draw(canvas, this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
        }
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
        this.mDisplayCanvas = new Canvas(this.mDisplayBitmap);
        this.mDisplayCanvas.drawBitmap(this.mOriginBitmap, 0.0f, 0.0f, this.mBitmapPaint);
    }

    public void setBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            this.mOriginBitmap = bitmap;
            this.mDisplayBitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
            this.mBitmapGestureParamsHolder.setBitmap(bitmap);
            refreshDisplayCanvas();
        }
    }

    public void setFeatureGestureListener(FeatureGesListener featureGesListener) {
        this.mFeatureGestureListener = featureGesListener;
    }
}
