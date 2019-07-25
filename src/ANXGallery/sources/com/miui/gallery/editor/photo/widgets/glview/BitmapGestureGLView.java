package com.miui.gallery.editor.photo.widgets.glview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.opengl.GLSurfaceView;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.ViewConfiguration;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureParamsHolder.ParamsChangeListener;

public class BitmapGestureGLView extends GLSurfaceView {
    /* access modifiers changed from: protected */
    public BitmapGestureParamsHolder mBitmapGestureParamsHolder;
    private CustomGesListener mCustomGesListener = new CustomGesListener();
    private CustomScaleListener mCustomScaleListener = new CustomScaleListener();
    /* access modifiers changed from: private */
    public FeatureGesListener mFeatureGestureListener;
    private GestureDetector mGestureDetector;
    /* access modifiers changed from: protected */
    public Bitmap mOriginBitmap;
    private ParamsChangeListener mParamsChangeListener = new ParamsChangeListener() {
        public void onBitmapMatrixChanged() {
            BitmapGestureGLView.this.onBitmapMatrixChange();
        }

        public void onCanvasMatrixChange() {
            BitmapGestureGLView.this.onCanvasMatrixChange();
        }
    };
    private ScaleGestureDetector mScaleGestureDetector;
    protected State mState = State.NOT_DEFINE;
    /* access modifiers changed from: private */
    public float mTouchMinSize;

    private class CustomGesListener implements OnGestureListener {
        private CustomGesListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            if (BitmapGestureGLView.this.mState != State.BY_CHILD) {
                if (motionEvent.getPointerCount() > 1) {
                    BitmapGestureGLView.this.mState = State.SCALE_MOVE;
                } else if (BitmapGestureGLView.this.mFeatureGestureListener != null) {
                    return BitmapGestureGLView.this.mFeatureGestureListener.onDown(motionEvent);
                }
            } else if (BitmapGestureGLView.this.mFeatureGestureListener != null) {
                return BitmapGestureGLView.this.mFeatureGestureListener.onDown(motionEvent);
            }
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (BitmapGestureGLView.this.mState == State.SCALE_MOVE) {
                BitmapGestureGLView.this.mBitmapGestureParamsHolder.performTransition(-f, -f2);
            } else if (BitmapGestureGLView.this.mState == State.BY_CHILD) {
                if (BitmapGestureGLView.this.mFeatureGestureListener != null) {
                    BitmapGestureGLView.this.mFeatureGestureListener.onScroll(motionEvent, motionEvent2, f, f2);
                }
            } else if (motionEvent2.getPointerCount() > 1) {
                BitmapGestureGLView.this.mState = State.SCALE_MOVE;
            } else if (((float) Math.hypot((double) (motionEvent2.getX() - motionEvent.getX()), (double) (motionEvent2.getY() - motionEvent.getY()))) > BitmapGestureGLView.this.mTouchMinSize) {
                BitmapGestureGLView.this.mState = State.BY_CHILD;
            } else {
                BitmapGestureGLView.this.mState = State.NOT_DEFINE;
            }
            return true;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            if (!(BitmapGestureGLView.this.mState == State.SCALE_MOVE || BitmapGestureGLView.this.mFeatureGestureListener == null)) {
                BitmapGestureGLView.this.mState = State.BY_CHILD;
                BitmapGestureGLView.this.mFeatureGestureListener.onSingleTapUp(motionEvent);
            }
            return true;
        }
    }

    private class CustomScaleListener implements OnScaleGestureListener {
        private CustomScaleListener() {
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureGLView.this.mState != State.BY_CHILD) {
                float scaleFactor = scaleGestureDetector.getScaleFactor();
                BitmapGestureGLView.this.mState = State.SCALE_MOVE;
                if (scaleFactor > 1.0f && BitmapGestureGLView.this.mBitmapGestureParamsHolder.mBitmapDisplayRect.width() > BitmapGestureGLView.this.mBitmapGestureParamsHolder.mMaxWidthScale) {
                    return false;
                }
                BitmapGestureGLView.this.mBitmapGestureParamsHolder.performScale(scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
            } else if (BitmapGestureGLView.this.mFeatureGestureListener != null) {
                BitmapGestureGLView.this.mFeatureGestureListener.onScale(scaleGestureDetector);
            }
            return true;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureGLView.this.mState != State.BY_CHILD) {
                BitmapGestureGLView.this.mState = State.SCALE_MOVE;
            } else if (BitmapGestureGLView.this.mFeatureGestureListener != null) {
                BitmapGestureGLView.this.mFeatureGestureListener.onScaleBegin(scaleGestureDetector);
            }
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            if (BitmapGestureGLView.this.mState == State.BY_CHILD && BitmapGestureGLView.this.mFeatureGestureListener != null) {
                BitmapGestureGLView.this.mFeatureGestureListener.onScaleEnd(scaleGestureDetector);
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

    public BitmapGestureGLView(Context context) {
        super(context);
        init();
    }

    protected static final float convertBitmapX(float f, float f2) {
        return ((f - (f2 / 2.0f)) * 2.0f) / f2;
    }

    protected static final float convertBitmapY(float f, float f2) {
        return ((-(f - (f2 / 2.0f))) * 2.0f) / f2;
    }

    public static void convertPointToBitmap(float[] fArr, float f, float f2) {
        for (int i = 0; i < fArr.length; i += 2) {
            fArr[i] = convertBitmapX(fArr[i], f);
            int i2 = i + 1;
            fArr[i2] = convertBitmapY(fArr[i2], f2);
        }
    }

    public static void generateVertexPositionToBitmap(RectF rectF, float[] fArr, float f, float f2) {
        fArr[0] = rectF.left;
        fArr[1] = rectF.bottom;
        fArr[2] = rectF.right;
        fArr[3] = rectF.bottom;
        fArr[4] = rectF.left;
        fArr[5] = rectF.top;
        fArr[6] = rectF.right;
        fArr[7] = rectF.top;
        convertPointToBitmap(fArr, f, f2);
    }

    private void init() {
        this.mTouchMinSize = (float) ViewConfiguration.get(getContext()).getScaledTouchSlop();
        this.mGestureDetector = new GestureDetector(getContext(), this.mCustomGesListener);
        this.mScaleGestureDetector = new ScaleGestureDetector(getContext(), this.mCustomScaleListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mBitmapGestureParamsHolder = new BitmapGestureParamsHolder(this, this.mParamsChangeListener);
        setEGLContextClientVersion(2);
        setEGLConfigChooser(8, 8, 8, 8, 16, 0);
        setZOrderOnTop(true);
        getHolder().setFormat(-2);
    }

    private void onActionUp(float f, float f2) {
        this.mBitmapGestureParamsHolder.resetMatrixWithAnim();
        if (this.mFeatureGestureListener != null) {
            this.mFeatureGestureListener.onActionUp(f, f2);
        }
    }

    /* access modifiers changed from: protected */
    public void convertPoint(float[] fArr) {
        for (int i = 0; i < fArr.length; i += 2) {
            fArr[i] = convertX(fArr[i]);
            int i2 = i + 1;
            fArr[i2] = convertY(fArr[i2]);
        }
    }

    /* access modifiers changed from: protected */
    public final float convertX(float f) {
        return ((f - this.mBitmapGestureParamsHolder.mDisplayRect.centerX()) * 2.0f) / this.mBitmapGestureParamsHolder.mDisplayRect.width();
    }

    /* access modifiers changed from: protected */
    public final float convertY(float f) {
        return ((-(f - this.mBitmapGestureParamsHolder.mDisplayRect.centerY())) * 2.0f) / this.mBitmapGestureParamsHolder.mDisplayRect.height();
    }

    /* access modifiers changed from: protected */
    public void generateVertexPosition(RectF rectF, float[] fArr) {
        fArr[0] = rectF.left;
        fArr[1] = rectF.bottom;
        fArr[2] = rectF.right;
        fArr[3] = rectF.bottom;
        fArr[4] = rectF.left;
        fArr[5] = rectF.top;
        fArr[6] = rectF.right;
        fArr[7] = rectF.top;
        convertPoint(fArr);
    }

    /* access modifiers changed from: protected */
    public void generateVertexPositionReverse(RectF rectF, float[] fArr) {
        fArr[0] = rectF.left;
        fArr[1] = rectF.top;
        fArr[2] = rectF.right;
        fArr[3] = rectF.top;
        fArr[4] = rectF.left;
        fArr[5] = rectF.bottom;
        fArr[6] = rectF.right;
        fArr[7] = rectF.bottom;
        convertPoint(fArr);
    }

    /* access modifiers changed from: protected */
    public void onBitmapMatrixChange() {
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mBitmapGestureParamsHolder.onSizeChanged(i, i2, i3, i4);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            this.mState = State.NOT_DEFINE;
        }
        if (motionEvent.getPointerCount() > 1) {
            this.mState = State.SCALE_MOVE;
        }
        this.mScaleGestureDetector.onTouchEvent(motionEvent);
        this.mGestureDetector.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action == 1 || action == 3) {
            onActionUp(motionEvent.getX(), motionEvent.getY());
        }
        return true;
    }

    public void setBitmap(Bitmap bitmap) {
        this.mOriginBitmap = bitmap;
        this.mBitmapGestureParamsHolder.setBitmap(bitmap);
    }

    public void setFeatureGestureListener(FeatureGesListener featureGesListener) {
        this.mFeatureGestureListener = featureGesListener;
    }
}
