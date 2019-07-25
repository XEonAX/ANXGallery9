package com.miui.gallery.editor.photo.widgets.imageview;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.View;
import com.miui.gallery.editor.photo.widgets.imageview.MatrixTransition.MatrixUpdateListener;

public class BitmapGestureParamsHolder {
    private Matrix mAnimTargetMatrix = new Matrix();
    public RectF mBitmapDisplayInitRect = new RectF();
    public RectF mBitmapDisplayInsideRect = new RectF();
    public RectF mBitmapDisplayRect = new RectF();
    public RectF mBitmapRect = new RectF();
    public Matrix mBitmapToDisplayMatrix = new Matrix();
    public Matrix mCanvasMatrix = new Matrix();
    public Matrix mCanvasMatrixInvert = new Matrix();
    public RectF mDisplayInitRect = new RectF();
    public RectF mDisplayInsideRect = new RectF();
    public RectF mDisplayRect = new RectF();
    public Matrix mDisplayToBitmapMatrix = new Matrix();
    private MatrixTransition mMatrixTransition;
    private MatrixUpdateListener mMatrixUpdateListener = new MatrixUpdateListener() {
        public void onAnimationEnd() {
        }

        public void onAnimationStart() {
        }

        public void onMatrixUpdate() {
            BitmapGestureParamsHolder.this.performCanvasMatrixChange();
        }
    };
    private float[] mMatrixValues = new float[9];
    private float mMaxWidth;
    public float mMaxWidthScale;
    private ParamsChangeListener mParamsChangeListener;
    private RectF mRectFTemp = new RectF();
    private float mScaleFocusX = 0.0f;
    private float mScaleFocusY = 0.0f;
    private View mTarget;

    public interface ParamsChangeListener {
        void onBitmapMatrixChanged();

        void onCanvasMatrixChange();
    }

    public BitmapGestureParamsHolder(View view, ParamsChangeListener paramsChangeListener) {
        this.mTarget = view;
        this.mMatrixTransition = new MatrixTransition();
        this.mMatrixTransition.setMatrixUpdateListener(this.mMatrixUpdateListener);
        this.mParamsChangeListener = paramsChangeListener;
    }

    private void onBitmapMatrixChanged() {
        if (this.mParamsChangeListener != null) {
            this.mParamsChangeListener.onBitmapMatrixChanged();
        }
    }

    private void onCanvasMatrixChange() {
        if (this.mParamsChangeListener != null) {
            this.mParamsChangeListener.onCanvasMatrixChange();
        }
    }

    private void refreshBitmapDisplayRect() {
        this.mCanvasMatrix.mapRect(this.mBitmapDisplayRect, this.mBitmapDisplayInitRect);
        this.mCanvasMatrix.invert(this.mCanvasMatrixInvert);
        this.mCanvasMatrixInvert.mapRect(this.mDisplayInsideRect, this.mDisplayRect);
        this.mBitmapDisplayInsideRect.set(this.mBitmapDisplayRect);
        this.mBitmapDisplayInsideRect.intersect(this.mDisplayRect);
    }

    private void refreshBitmapInitRect() {
        this.mBitmapToDisplayMatrix.reset();
        this.mBitmapToDisplayMatrix.setRectToRect(this.mBitmapRect, this.mDisplayInitRect, ScaleToFit.CENTER);
        this.mBitmapDisplayInitRect.set(this.mBitmapRect);
        this.mBitmapToDisplayMatrix.mapRect(this.mBitmapDisplayInitRect);
        this.mDisplayToBitmapMatrix.reset();
        this.mDisplayToBitmapMatrix.setRectToRect(this.mBitmapDisplayInitRect, this.mBitmapRect, ScaleToFit.FILL);
    }

    private void resetBitmapMatrix() {
        if (!this.mBitmapRect.isEmpty() && !this.mDisplayInitRect.isEmpty()) {
            refreshBitmapInitRect();
            this.mBitmapDisplayRect.set(this.mBitmapDisplayInitRect);
            this.mDisplayInsideRect.set(this.mDisplayRect);
            this.mBitmapDisplayInsideRect.set(this.mBitmapDisplayRect);
            this.mMaxWidth = this.mBitmapDisplayInitRect.width() * 4.0f;
            this.mMaxWidthScale = this.mBitmapDisplayInitRect.width() * 6.0f;
            onBitmapMatrixChanged();
        }
    }

    private void resolvePadding(RectF rectF) {
        float paddingRight = (float) this.mTarget.getPaddingRight();
        float paddingTop = (float) this.mTarget.getPaddingTop();
        float paddingBottom = (float) this.mTarget.getPaddingBottom();
        rectF.left += (float) this.mTarget.getPaddingLeft();
        rectF.right -= paddingRight;
        rectF.top += paddingTop;
        rectF.bottom -= paddingBottom;
    }

    public float convertDistanceX(float f) {
        return f * (this.mDisplayInsideRect.width() / this.mDisplayRect.width());
    }

    public float convertDistanceY(float f) {
        return f * (this.mDisplayInsideRect.height() / this.mDisplayRect.height());
    }

    public void convertPointToBitmapCoordinate(MotionEvent motionEvent, float[] fArr) {
        fArr[0] = motionEvent.getX();
        fArr[1] = motionEvent.getY();
        convertPointToBitmapCoordinate(fArr);
    }

    public void convertPointToBitmapCoordinate(float[] fArr) {
        convertPointToViewPortCoordinate(fArr);
        this.mDisplayToBitmapMatrix.mapPoints(fArr);
    }

    public void convertPointToViewPortCoordinate(float[] fArr) {
        this.mCanvasMatrixInvert.mapPoints(fArr);
    }

    /* access modifiers changed from: protected */
    public void countAnimMatrixWhenZoomIn(Matrix matrix) {
        float f;
        float height;
        Matrix matrix2 = matrix;
        matrix2.set(this.mCanvasMatrix);
        this.mRectFTemp.set(this.mBitmapDisplayRect);
        RectF rectF = this.mRectFTemp;
        if (rectF.width() > this.mMaxWidth) {
            float width = this.mMaxWidth / rectF.width();
            matrix2.postScale(width, width, this.mScaleFocusX, this.mScaleFocusY);
            matrix2.mapRect(rectF, this.mBitmapDisplayInitRect);
        }
        float width2 = rectF.width();
        float height2 = rectF.height();
        float f2 = rectF.left;
        float f3 = rectF.right;
        float f4 = rectF.top;
        float f5 = rectF.bottom;
        float width3 = this.mDisplayRect.width();
        float height3 = this.mDisplayRect.height();
        float f6 = this.mDisplayRect.left;
        float f7 = this.mDisplayRect.right;
        float f8 = this.mDisplayRect.top;
        float f9 = this.mDisplayRect.bottom;
        float f10 = f2 > f6 ? width2 > width3 ? -(f2 - f6) : (-(f2 - f6)) + ((width3 - width2) * ((this.mBitmapDisplayInitRect.left - this.mDisplayRect.left) / (this.mDisplayRect.width() - this.mBitmapDisplayInitRect.width()))) : f3 < f7 ? width2 > width3 ? f7 - f3 : (f7 - f3) - ((width3 - width2) * (1.0f - ((this.mBitmapDisplayInitRect.left - this.mDisplayRect.left) / (this.mDisplayRect.width() - this.mBitmapDisplayInitRect.width())))) : 0.0f;
        if (f4 > f8) {
            if (height2 > height3) {
                f = -(f4 - f8);
                matrix2.postTranslate(f10, f);
            }
            height = (-(f4 - f8)) + ((height3 - height2) * ((this.mBitmapDisplayInitRect.top - this.mDisplayRect.top) / (this.mDisplayRect.height() - this.mBitmapDisplayInitRect.height())));
        } else if (f5 < f9) {
            height = height2 > height3 ? f9 - f5 : (f9 - f5) - ((height3 - height2) * (1.0f - ((this.mBitmapDisplayInitRect.top - this.mDisplayRect.top) / (this.mDisplayRect.height() - this.mBitmapDisplayInitRect.height()))));
        } else {
            f = 0.0f;
            matrix2.postTranslate(f10, f);
        }
        f = height;
        matrix2.postTranslate(f10, f);
    }

    /* access modifiers changed from: protected */
    public void countAnimMatrixWhenZoomOut(Matrix matrix) {
        matrix.reset();
    }

    public float[] getMatrixValues() {
        this.mCanvasMatrix.getValues(this.mMatrixValues);
        return this.mMatrixValues;
    }

    public void onSizeChanged(int i, int i2, int i3, int i4) {
        this.mDisplayRect.set(0.0f, 0.0f, (float) i, (float) i2);
        this.mDisplayInitRect.set(this.mDisplayRect);
        resolvePadding(this.mDisplayInitRect);
        resetBitmapMatrix();
    }

    public void performCanvasMatrixChange() {
        refreshBitmapDisplayRect();
        onCanvasMatrixChange();
    }

    public void performScale(float f, float f2, float f3) {
        this.mCanvasMatrix.postScale(f, f, f2, f3);
        this.mScaleFocusX = f2;
        this.mScaleFocusY = f3;
        performCanvasMatrixChange();
    }

    public void performTransition(float f, float f2) {
        float width = this.mDisplayRect.width() / 2.0f;
        float height = this.mDisplayRect.height() / 2.0f;
        float centerX = this.mDisplayRect.centerX();
        float centerY = this.mDisplayRect.centerY();
        float f3 = 1.0f;
        float f4 = (f <= 0.0f || this.mBitmapDisplayRect.left <= this.mDisplayRect.left) ? (f >= 0.0f || this.mBitmapDisplayRect.right >= this.mDisplayRect.right) ? 1.0f : (this.mBitmapDisplayRect.right - centerX) / width : (centerX - this.mBitmapDisplayRect.left) / width;
        if (f2 > 0.0f && this.mBitmapDisplayRect.top > this.mDisplayRect.top) {
            f3 = (centerY - this.mBitmapDisplayRect.top) / height;
        } else if (f2 < 0.0f && this.mBitmapDisplayRect.bottom < this.mDisplayRect.bottom) {
            f3 = (this.mBitmapDisplayRect.bottom - centerY) / height;
        }
        this.mCanvasMatrix.postTranslate(f * f4, f2 * f3);
        performCanvasMatrixChange();
    }

    public void resetMatrixWithAnim() {
        this.mCanvasMatrix.getValues(this.mMatrixValues);
        if (this.mMatrixValues[0] <= 1.0f) {
            countAnimMatrixWhenZoomOut(this.mAnimTargetMatrix);
        } else {
            countAnimMatrixWhenZoomIn(this.mAnimTargetMatrix);
        }
        this.mMatrixTransition.animMatrix(this.mCanvasMatrix, this.mAnimTargetMatrix);
    }

    public void setBitmap(Bitmap bitmap) {
        this.mBitmapRect.set(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
        resetBitmapMatrix();
    }
}
