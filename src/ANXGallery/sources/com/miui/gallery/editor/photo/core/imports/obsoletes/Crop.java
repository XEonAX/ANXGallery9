package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PointF;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.Keep;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.compat.interpolator.PathInterpolatorCompat;
import com.miui.gallery.editor.photo.core.imports.obsoletes.EditorView.Plugin;
import com.miui.gallery.editor.photo.core.imports.obsoletes.TranslateDetector.OnTranslateListener;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableMatrix;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import java.util.ArrayList;

public class Crop extends Plugin {
    private float mAdjustDegree;
    private AnimatorSet mAnimatorSet;
    /* access modifiers changed from: private */
    public AspectRatio mAspectRatio = AspectRatio.RATIO_NONE;
    private Rect mBgBounds = new Rect();
    private Rect mBgPadding = new Rect();
    /* access modifiers changed from: private */
    public BoundsFixCallback mBoundsFixCallback = new BoundsFixCallback() {
        public void onDone() {
            Crop.this.postCropFinish();
        }
    };
    private ValueAnimator mCanvasAnimator;
    private Rect mClipBounds = new Rect();
    /* access modifiers changed from: private */
    public RectF mCropArea = new RectF();
    /* access modifiers changed from: private */
    public boolean mCropAreaChanged = false;
    private Drawable mCropWindow;
    private Runnable mEditFinished = new Runnable() {
        public void run() {
            Crop.this.animCropAreaChanged(null);
        }
    };
    /* access modifiers changed from: private */
    public EventState mEventState = EventState.IDLE;
    private boolean mFirstIn = true;
    /* access modifiers changed from: private */
    public Matrix mGlobalMatrix = new Matrix();
    private int mGuideLineAlpha;
    private ObjectAnimator mGuideLineAnimator;
    private Runnable mGuideLineFinished = new Runnable() {
        public void run() {
            Crop.this.animGuideLine(false);
            if (Crop.this.mOnCropChangedListener != null) {
                Crop.this.mOnCropChangedListener.changeRotationState(true);
            }
        }
    };
    private GuideLine mGuideLineMode = GuideLine.CROP;
    private float mGuideLineSize;
    private float mInitialDegree;
    private Matrix mInitialMatrix;
    /* access modifiers changed from: private */
    public RectF mInvertArea = new RectF();
    /* access modifiers changed from: private */
    public Matrix mInvertMatrix = new Matrix();
    private int mMaskColor;
    private int mMaskColorAlpha;
    private ObjectAnimator mMaskColorAnimator;
    private Matrix mMatrix = new Matrix();
    /* access modifiers changed from: private */
    public int mMsgCropFinish;
    private int mMsgGuideLineFinish;
    /* access modifiers changed from: private */
    public PointF mOffset = new PointF();
    /* access modifiers changed from: private */
    public OnCropChangedListener mOnCropChangedListener;
    private Paint mPaint = new Paint();
    private AnimatorListener mPerformCropFinish = new AnimatorListener() {
        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationEnd(Animator animator) {
            Crop.this.performCropFinished();
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
            Crop.this.getEventHandler().removeMessages(Crop.this.mMsgCropFinish);
        }
    };
    private RectF mRect = new RectF();
    private ResizeDetector mResizeDetector;
    /* access modifiers changed from: private */
    public float mResizeEdgeSlop;
    /* access modifiers changed from: private */
    public int mRotateDegree;
    private AnimatorListener mRotateListener = new AnimatorListener() {
        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationEnd(Animator animator) {
            Crop.this.getImageMatrix().postConcat(Crop.this.mGlobalMatrix);
            Crop.this.mRotateDegree = Crop.this.mRotateDegree - 90;
            Crop.this.mGlobalMatrix.mapRect(Crop.this.mCropArea);
            Crop.this.mGlobalMatrix.reset();
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
        }
    };
    private AnimatorUpdateListener mRotateUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            float centerX = Crop.this.mCropArea.centerX();
            float centerY = Crop.this.mCropArea.centerY();
            float floatValue = ((Float) valueAnimator.getAnimatedValue("scale")).floatValue();
            Crop.this.mGlobalMatrix.setRotate(((Float) valueAnimator.getAnimatedValue("rotate")).floatValue(), centerX, centerY);
            Crop.this.mGlobalMatrix.postScale(floatValue, floatValue, centerX, centerY);
            Crop.this.invalidate();
        }
    };
    private PropertyValuesHolder mRotateValues;
    private ScaleGestureDetector mScaleGestureDetector;
    private PropertyValuesHolder mScaleValues;
    /* access modifiers changed from: private */
    public boolean mStartGuideLine = true;
    private RectF mTouchBounds = new RectF();
    private TranslateDetector mTranslateDetector;
    private Matrix mUnmodifiedMatrix = new Matrix();
    /* access modifiers changed from: private */
    public ValueAnimator mWindowAnimator;
    private AnimatorUpdateListener mWindowUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            Crop.this.mCropArea.set((RectF) Crop.this.mWindowAnimator.getAnimatedValue());
            Crop.this.invalidate();
        }
    };
    private PropertyValuesHolder mWindowValues;
    private PorterDuffXfermode mXferModeClear = new PorterDuffXfermode(Mode.CLEAR);

    public static class AspectRatio {
        /* access modifiers changed from: private */
        public static final AspectRatio RATIO_NONE = new AspectRatio(0.0f, 0.0f);
        /* access modifiers changed from: private */
        public float mHeight;
        /* access modifiers changed from: private */
        public float mWidth;

        AspectRatio(float f, float f2) {
            this.mWidth = f;
            this.mHeight = f2;
        }

        public float getHeight(float f) {
            return (f / this.mWidth) * this.mHeight;
        }

        public float getWidth(float f) {
            return (f / this.mHeight) * this.mWidth;
        }
    }

    private enum EventState {
        IDLE,
        RESIZE,
        SCALE,
        TRANSLATE,
        ANIMATOR,
        ROTATION,
        SKIP
    }

    private enum GuideLine {
        PREVIEW(0),
        CROP(3),
        ROTATE(9);
        
        int mCount;

        private GuideLine(int i) {
            this.mCount = i;
        }
    }

    public interface OnCropChangedListener {
        void changeRotationState(boolean z);

        void onChanged();
    }

    public static class ParcelableCropEntry extends CropEntry implements Parcelable {
        public static final Creator<ParcelableCropEntry> CREATOR = new Creator<ParcelableCropEntry>() {
            public ParcelableCropEntry createFromParcel(Parcel parcel) {
                return new ParcelableCropEntry(parcel);
            }

            public ParcelableCropEntry[] newArray(int i) {
                return new ParcelableCropEntry[i];
            }
        };

        ParcelableCropEntry(RectF rectF, RectF rectF2, Matrix matrix, float f) {
            super(rectF, rectF2, matrix, f);
        }

        protected ParcelableCropEntry(Parcel parcel) {
            this.mSampleSize = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
            this.mCropArea = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
            this.mMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSampleSize, i);
            parcel.writeParcelable(this.mCropArea, i);
            parcel.writeParcelable(this.mMatrix, i);
        }
    }

    private class ResizeDetector {
        private RectF mPreEdit;
        private int mResizeEdge;
        private PointF mResizeStart;

        private ResizeDetector() {
            this.mResizeEdge = 0;
            this.mResizeStart = new PointF();
            this.mPreEdit = new RectF();
        }

        private int calculateMinSize() {
            return Math.max((int) (Crop.this.getImageMatrix().mapRadius(Crop.this.calculateMinPixels()) + 0.5f), 200);
        }

        private float checkOtherBoundOffset(int i, float f, RectF rectF) {
            if ((i & 1) != 0) {
                float f2 = Crop.this.mCropArea.left - rectF.left;
                if (f2 <= 0.0f) {
                    return f;
                }
                if (f <= f2) {
                    f2 = f;
                }
                float f3 = f - f2;
                RectF access$900 = Crop.this.mCropArea;
                access$900.left -= f2;
                Crop.this.getImageMatrix().postTranslate(-f2, 0.0f);
                return f3;
            } else if ((i & 16) != 0) {
                float f4 = Crop.this.mCropArea.top - rectF.top;
                if (f4 <= 0.0f) {
                    return f;
                }
                if (f <= f4) {
                    f4 = f;
                }
                float f5 = f - f4;
                RectF access$9002 = Crop.this.mCropArea;
                access$9002.top -= f4;
                Crop.this.getImageMatrix().postTranslate(0.0f, -f4);
                return f5;
            } else if ((i & 256) != 0) {
                float f6 = rectF.right - Crop.this.mCropArea.right;
                if (f6 <= 0.0f) {
                    return f;
                }
                if (f <= f6) {
                    f6 = f;
                }
                float f7 = f - f6;
                RectF access$9003 = Crop.this.mCropArea;
                access$9003.right += f6;
                Crop.this.getImageMatrix().postTranslate(f6, 0.0f);
                return f7;
            } else if ((i & 4096) == 0) {
                return f;
            } else {
                float f8 = rectF.bottom - Crop.this.mCropArea.bottom;
                if (f8 <= 0.0f) {
                    return f;
                }
                if (f <= f8) {
                    f8 = f;
                }
                float f9 = f - f8;
                RectF access$9004 = Crop.this.mCropArea;
                access$9004.bottom += f8;
                Crop.this.getImageMatrix().postTranslate(0.0f, f8);
                return f9;
            }
        }

        private float constraint(float f, float f2) {
            float f3 = f2 + f;
            if (f * f3 < 0.0f) {
                return 0.0f;
            }
            return f3;
        }

        private void fixImageBounds(RectF rectF) {
            Matrix imageMatrix = Crop.this.getImageMatrix();
            RectF imageBounds = Crop.this.getImageBounds();
            Matrix matrix = new Matrix();
            imageMatrix.invert(matrix);
            RectF rectF2 = new RectF();
            matrix.mapRect(rectF2, rectF);
            if (!imageBounds.contains(rectF2)) {
                Matrix matrix2 = new Matrix(imageMatrix);
                if (rectF2.width() > imageBounds.width() || rectF2.height() > imageBounds.height()) {
                    float resolveScale = Plugin.resolveScale(imageBounds, rectF2);
                    matrix2.preScale(resolveScale, resolveScale, rectF2.centerX(), rectF2.centerY());
                }
                matrix2.invert(matrix);
                matrix.mapRect(rectF2, rectF);
                if (!imageBounds.contains(rectF2)) {
                    PointF pointF = new PointF();
                    Plugin.resolveTranslate(Crop.this.getImageBounds(), rectF2, pointF);
                    matrix2.preTranslate(pointF.x, pointF.y);
                }
                imageMatrix.set(matrix2);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:102:0x037f  */
        /* JADX WARNING: Removed duplicated region for block: B:103:0x03cd  */
        /* JADX WARNING: Removed duplicated region for block: B:65:0x022b A[RETURN] */
        /* JADX WARNING: Removed duplicated region for block: B:66:0x022c  */
        private float[] getImageCropBound(RectF rectF) {
            RectF rectF2;
            boolean z;
            int i;
            RectF rectF3;
            int i2;
            char c;
            RectF rectF4 = rectF;
            RectF imageBounds = Crop.this.getImageBounds();
            RectF rectF5 = new RectF(rectF4);
            CropCalculateUtils.doRound(rectF5);
            float[] fArr = new float[2];
            float[] fArr2 = new float[2];
            float[] fArr3 = new float[2];
            float[] fArr4 = new float[2];
            Crop.this.getImageMatrix().mapPoints(fArr, new float[]{imageBounds.left, imageBounds.top});
            Crop.this.getImageMatrix().mapPoints(fArr2, new float[]{imageBounds.right, imageBounds.top});
            Crop.this.getImageMatrix().mapPoints(fArr3, new float[]{imageBounds.left, imageBounds.bottom});
            Crop.this.getImageMatrix().mapPoints(fArr4, new float[]{imageBounds.right, imageBounds.bottom});
            CropCalculateUtils.doRound(fArr);
            CropCalculateUtils.doRound(fArr2);
            CropCalculateUtils.doRound(fArr4);
            CropCalculateUtils.doRound(fArr3);
            ArrayList arrayList = new ArrayList();
            arrayList.add(fArr);
            arrayList.add(fArr2);
            arrayList.add(fArr4);
            arrayList.add(fArr3);
            RectF rectF6 = new RectF(Crop.this.mCropArea);
            CropCalculateUtils.doRound(rectF6);
            float[] fArr5 = {rectF6.left, rectF6.top};
            float[] fArr6 = {rectF6.left, rectF6.bottom};
            float[] fArr7 = {rectF6.right, rectF6.top};
            float[] fArr8 = {rectF6.right, rectF6.bottom};
            float[] fArr9 = new float[2];
            if (!rectF5.contains(rectF6)) {
                Log.d("Crop", "not in bound");
                if ((this.mResizeEdge & 16) != 0) {
                    fArr9[1] = rectF4.top;
                } else if ((this.mResizeEdge & 4096) != 0) {
                    fArr9[1] = rectF4.bottom;
                }
                if ((this.mResizeEdge & 1) != 0) {
                    fArr9[0] = rectF4.left;
                } else if ((this.mResizeEdge & 256) != 0) {
                    fArr9[0] = rectF4.right;
                }
                return fArr9;
            }
            boolean z2 = Crop.this.mAspectRatio == AspectRatio.RATIO_NONE;
            if (Integer.bitCount(this.mResizeEdge) > 1) {
                if ((this.mResizeEdge & 16) == 0 || (this.mResizeEdge & 1) == 0) {
                    if ((this.mResizeEdge & 16) == 0 || (this.mResizeEdge & 256) == 0) {
                        rectF2 = rectF6;
                        if ((this.mResizeEdge & 4096) == 0 || (this.mResizeEdge & 1) == 0) {
                            if (!((this.mResizeEdge & 4096) == 0 || (this.mResizeEdge & 256) == 0 || (z2 && (fArr4[0] <= fArr8[0] || fArr4[1] <= fArr8[1])))) {
                                float[] rectIntersection = CropCalculateUtils.getRectIntersection(arrayList, fArr5, fArr8);
                                float[] rectIntersection2 = CropCalculateUtils.getRectIntersection(arrayList, fArr5, fArr7);
                                float[] rectIntersection3 = CropCalculateUtils.getRectIntersection(arrayList, fArr5, fArr6);
                                fArr9[0] = Math.min(rectIntersection[0], rectIntersection2[0]);
                                fArr9[1] = Math.min(rectIntersection[1], rectIntersection3[1]);
                            }
                            z = false;
                            if (!z) {
                                return fArr9;
                            }
                            if (z2) {
                                if ((this.mResizeEdge & 16) != 0) {
                                    if (CropCalculateUtils.isParallel(fArr, fArr3, fArr5, fArr6)) {
                                        i2 = 1;
                                        fArr9[1] = rectF5.top;
                                    } else {
                                        i2 = 1;
                                    }
                                    fArr9[i2] = Math.max(CropCalculateUtils.getRectIntersection(arrayList, fArr6, fArr5)[i2], CropCalculateUtils.getRectIntersection(arrayList, fArr8, fArr7)[i2]);
                                } else {
                                    i2 = 1;
                                    if ((this.mResizeEdge & 4096) != 0) {
                                        if (CropCalculateUtils.isParallel(fArr, fArr3, fArr5, fArr6)) {
                                            fArr9[1] = rectF5.bottom;
                                        }
                                        fArr9[1] = Math.min(CropCalculateUtils.getRectIntersection(arrayList, fArr5, fArr6)[1], CropCalculateUtils.getRectIntersection(arrayList, fArr7, fArr8)[1]);
                                    }
                                }
                                if ((this.mResizeEdge & i2) != 0) {
                                    if (CropCalculateUtils.isParallel(fArr, fArr3, fArr5, fArr6)) {
                                        c = 0;
                                        fArr9[0] = rectF5.left;
                                    } else {
                                        c = 0;
                                    }
                                    fArr9[c] = Math.max(CropCalculateUtils.getRectIntersection(arrayList, fArr7, fArr5)[c], CropCalculateUtils.getRectIntersection(arrayList, fArr8, fArr6)[c]);
                                } else if ((this.mResizeEdge & 256) != 0) {
                                    if (CropCalculateUtils.isParallel(fArr, fArr3, fArr5, fArr6)) {
                                        fArr9[0] = rectF5.right;
                                    }
                                    fArr9[0] = Math.min(CropCalculateUtils.getRectIntersection(arrayList, fArr5, fArr7)[0], CropCalculateUtils.getRectIntersection(arrayList, fArr6, fArr8)[0]);
                                }
                            } else {
                                if ((this.mResizeEdge & 16) != 0) {
                                    rectF3 = rectF2;
                                    float[] fArr10 = {(rectF3.left + rectF3.right) / 2.0f, rectF3.bottom};
                                    fArr9[1] = Math.max(rectF3.bottom - (((rectF3.height() * 2.0f) / rectF3.width()) * Math.min(fArr10[0] - CropCalculateUtils.getRectIntersection(arrayList, fArr10, fArr6)[0], CropCalculateUtils.getRectIntersection(arrayList, fArr10, fArr8)[0] - fArr10[0])), Math.max(CropCalculateUtils.getRectIntersection(arrayList, fArr10, fArr5)[1], CropCalculateUtils.getRectIntersection(arrayList, fArr10, fArr7)[1]));
                                } else {
                                    rectF3 = rectF2;
                                    if ((this.mResizeEdge & 4096) != 0) {
                                        float[] fArr11 = {(rectF3.left + rectF3.right) / 2.0f, rectF3.top};
                                        float[] rectIntersection4 = CropCalculateUtils.getRectIntersection(arrayList, fArr11, fArr6);
                                        float[] rectIntersection5 = CropCalculateUtils.getRectIntersection(arrayList, fArr11, fArr8);
                                        float[] rectIntersection6 = CropCalculateUtils.getRectIntersection(arrayList, fArr11, fArr5);
                                        float[] rectIntersection7 = CropCalculateUtils.getRectIntersection(arrayList, fArr11, fArr7);
                                        i = 1;
                                        fArr9[1] = Math.min(rectF3.top + (((rectF3.height() * 2.0f) / rectF3.width()) * Math.min(fArr11[0] - rectIntersection6[0], rectIntersection7[0] - fArr11[0])), Math.min(rectIntersection4[1], rectIntersection5[1]));
                                        if ((this.mResizeEdge & i) == 0) {
                                            float[] fArr12 = new float[2];
                                            fArr12[0] = rectF3.right;
                                            fArr12[i] = (rectF3.top + rectF3.bottom) / 2.0f;
                                            fArr9[0] = Math.max(rectF3.right - (((rectF3.width() * 2.0f) / rectF3.height()) * Math.min(fArr12[i] - CropCalculateUtils.getRectIntersection(arrayList, fArr12, fArr7)[i], CropCalculateUtils.getRectIntersection(arrayList, fArr12, fArr8)[i] - fArr12[i])), Math.max(CropCalculateUtils.getRectIntersection(arrayList, fArr12, fArr5)[0], CropCalculateUtils.getRectIntersection(arrayList, fArr12, fArr6)[0]));
                                        } else if ((this.mResizeEdge & 256) != 0) {
                                            float[] fArr13 = {rectF3.left, (rectF3.top + rectF3.bottom) / 2.0f};
                                            fArr9[0] = Math.min(rectF3.left + (((rectF3.width() * 2.0f) / rectF3.height()) * Math.min(fArr13[1] - CropCalculateUtils.getRectIntersection(arrayList, fArr13, fArr5)[1], CropCalculateUtils.getRectIntersection(arrayList, fArr13, fArr6)[1] - fArr13[1])), Math.min(CropCalculateUtils.getRectIntersection(arrayList, fArr13, fArr7)[0], CropCalculateUtils.getRectIntersection(arrayList, fArr13, fArr8)[0]));
                                        }
                                    }
                                }
                                i = 1;
                                if ((this.mResizeEdge & i) == 0) {
                                }
                            }
                            return fArr9;
                        }
                        if (!z2 || (fArr3[0] < fArr6[0] && fArr3[1] > fArr6[1])) {
                            float[] rectIntersection8 = CropCalculateUtils.getRectIntersection(arrayList, fArr7, fArr6);
                            float[] rectIntersection9 = CropCalculateUtils.getRectIntersection(arrayList, fArr7, fArr5);
                            float[] rectIntersection10 = CropCalculateUtils.getRectIntersection(arrayList, fArr7, fArr8);
                            fArr9[0] = Math.max(rectIntersection8[0], rectIntersection9[0]);
                            fArr9[1] = Math.min(rectIntersection8[1], rectIntersection10[1]);
                        }
                        z = false;
                        if (!z) {
                        }
                    } else if (!z2 || (fArr2[0] > fArr7[0] && fArr2[1] < fArr7[1])) {
                        float[] rectIntersection11 = CropCalculateUtils.getRectIntersection(arrayList, fArr6, fArr7);
                        float[] rectIntersection12 = CropCalculateUtils.getRectIntersection(arrayList, fArr6, fArr8);
                        float[] rectIntersection13 = CropCalculateUtils.getRectIntersection(arrayList, fArr6, fArr5);
                        rectF2 = rectF6;
                        fArr9[0] = Math.min(rectIntersection11[0], rectIntersection12[0]);
                        fArr9[1] = Math.max(rectIntersection11[1], rectIntersection13[1]);
                    }
                } else if (!z2 || (fArr[0] < fArr5[0] && fArr[1] < fArr5[1])) {
                    float[] rectIntersection14 = CropCalculateUtils.getRectIntersection(arrayList, fArr8, fArr5);
                    float[] rectIntersection15 = CropCalculateUtils.getRectIntersection(arrayList, fArr8, fArr6);
                    float[] rectIntersection16 = CropCalculateUtils.getRectIntersection(arrayList, fArr8, fArr7);
                    fArr9[0] = Math.max(rectIntersection14[0], rectIntersection15[0]);
                    fArr9[1] = Math.max(rectIntersection14[1], rectIntersection16[1]);
                    rectF2 = rectF6;
                }
                z = true;
                if (!z) {
                }
            }
            rectF2 = rectF6;
            z = false;
            if (!z) {
            }
        }

        private PointF onFixedResize(float f, float f2) {
            return Integer.bitCount(this.mResizeEdge) == 1 ? onFixedResizeEdge(f, f2) : onFixedResizeVertex(f, f2);
        }

        /* JADX WARNING: Removed duplicated region for block: B:100:0x0340  */
        /* JADX WARNING: Removed duplicated region for block: B:68:0x0282  */
        /* JADX WARNING: Removed duplicated region for block: B:69:0x02ab  */
        /* JADX WARNING: Removed duplicated region for block: B:72:0x02cc  */
        /* JADX WARNING: Removed duplicated region for block: B:79:0x02f5  */
        /* JADX WARNING: Removed duplicated region for block: B:86:0x0313  */
        /* JADX WARNING: Removed duplicated region for block: B:91:0x031f  */
        /* JADX WARNING: Removed duplicated region for block: B:92:0x0322  */
        /* JADX WARNING: Removed duplicated region for block: B:95:0x0328  */
        /* JADX WARNING: Removed duplicated region for block: B:96:0x032b  */
        /* JADX WARNING: Removed duplicated region for block: B:99:0x0332  */
        private PointF onFixedResizeEdge(float f, float f2) {
            float f3;
            float f4;
            float f5;
            float f6;
            float min;
            float f7;
            float f8;
            float f9;
            float f10;
            float f11;
            float f12;
            float constraint;
            float f13 = f;
            float f14 = f2;
            int calculateMinSize = calculateMinSize();
            RectF bounds = Crop.this.getBounds();
            RectF rectF = new RectF();
            RectF imageBounds = Crop.this.getImageBounds();
            Crop.this.getImageMatrix().mapRect(rectF, imageBounds);
            Crop.this.getImageMatrix().invert(Crop.this.mInvertMatrix);
            Crop.this.mInvertMatrix.mapRect(Crop.this.mInvertArea, Crop.this.mCropArea);
            Crop.this.mOffset.set(f13, f14);
            float[] fArr = new float[4];
            Crop.this.mInvertMatrix.mapPoints(fArr, new float[]{Crop.this.mCropArea.left, Crop.this.mCropArea.top, Crop.this.mCropArea.right, Crop.this.mCropArea.bottom});
            float[] imageCropBound = getImageCropBound(rectF);
            if (this.mResizeEdge == 1 || this.mResizeEdge == 256) {
                if (this.mResizeEdge == 1) {
                    f13 *= -1.0f;
                    if (f13 >= 0.0f) {
                        f4 = Crop.this.mCropArea.left - bounds.left;
                        f3 = Crop.this.mCropArea.left - imageCropBound[0];
                        if (f13 > 0.0f) {
                            f6 = Crop.this.mCropArea.top - bounds.top;
                            f5 = bounds.bottom - Crop.this.mCropArea.bottom;
                            f4 = Math.min(Crop.this.mAspectRatio.getWidth(Math.min(f5, f6)), f4);
                        } else {
                            f6 = constraint(Crop.this.mCropArea.bottom - Crop.this.mCropArea.top, (float) (-calculateMinSize)) / 2.0f;
                            f5 = f6;
                        }
                        min = Math.min(f13, f3);
                        if (min > f4) {
                            float width = 1.0f - ((min - f4) / imageBounds.width());
                            Crop.this.getImageMatrix().preScale(width, width, this.mResizeEdge == 1 ? fArr[2] : fArr[0], (fArr[1] + fArr[3]) / 2.0f);
                        }
                        if (Math.abs(min) > f4) {
                            min = ((float) (min > 0.0f ? 1 : -1)) * f4;
                        }
                        float height = Crop.this.mAspectRatio.getHeight(Math.abs(min));
                        f7 = height / 2.0f;
                        if (f7 > f6 && f7 <= f5) {
                            f6 = f7;
                            f5 = f6;
                        } else if (f6 < f5) {
                            f5 = height - f6;
                        } else {
                            f6 = height - f5;
                        }
                        if (min < 0.0f) {
                            f5 *= -1.0f;
                        } else {
                            f6 *= -1.0f;
                        }
                        if (this.mResizeEdge == 1) {
                            min *= -1.0f;
                            RectF access$900 = Crop.this.mCropArea;
                            access$900.left += min;
                        } else {
                            RectF access$9002 = Crop.this.mCropArea;
                            access$9002.right += min;
                        }
                        RectF access$9003 = Crop.this.mCropArea;
                        access$9003.top += f6;
                        RectF access$9004 = Crop.this.mCropArea;
                        access$9004.bottom += f5;
                        Crop.this.mOffset.x = min;
                    } else {
                        f4 = constraint(Crop.this.mCropArea.right - Crop.this.mCropArea.left, (float) (-calculateMinSize));
                    }
                } else if (f13 >= 0.0f) {
                    f4 = bounds.right - Crop.this.mCropArea.right;
                    f3 = imageCropBound[0] - Crop.this.mCropArea.right;
                    if (f13 > 0.0f) {
                    }
                    min = Math.min(f13, f3);
                    if (min > f4) {
                    }
                    if (Math.abs(min) > f4) {
                    }
                    float height2 = Crop.this.mAspectRatio.getHeight(Math.abs(min));
                    f7 = height2 / 2.0f;
                    if (f7 > f6) {
                    }
                    if (f6 < f5) {
                    }
                    if (min < 0.0f) {
                    }
                    if (this.mResizeEdge == 1) {
                    }
                    RectF access$90032 = Crop.this.mCropArea;
                    access$90032.top += f6;
                    RectF access$90042 = Crop.this.mCropArea;
                    access$90042.bottom += f5;
                    Crop.this.mOffset.x = min;
                } else {
                    f4 = constraint(Crop.this.mCropArea.right - Crop.this.mCropArea.left, (float) (-calculateMinSize));
                }
                f3 = 0.0f;
                if (f13 > 0.0f) {
                }
                min = Math.min(f13, f3);
                if (min > f4) {
                }
                if (Math.abs(min) > f4) {
                }
                float height22 = Crop.this.mAspectRatio.getHeight(Math.abs(min));
                f7 = height22 / 2.0f;
                if (f7 > f6) {
                }
                if (f6 < f5) {
                }
                if (min < 0.0f) {
                }
                if (this.mResizeEdge == 1) {
                }
                RectF access$900322 = Crop.this.mCropArea;
                access$900322.top += f6;
                RectF access$900422 = Crop.this.mCropArea;
                access$900422.bottom += f5;
                Crop.this.mOffset.x = min;
            } else if (this.mResizeEdge == 16 || this.mResizeEdge == 4096) {
                if (this.mResizeEdge == 16) {
                    f10 = f14 * -1.0f;
                    if (f10 > 0.0f) {
                        f9 = Crop.this.mCropArea.top - bounds.top;
                        f8 = Crop.this.mCropArea.top - imageCropBound[1];
                    } else {
                        f9 = constraint(Crop.this.mCropArea.bottom - Crop.this.mCropArea.top, (float) (-calculateMinSize));
                        f8 = 0.0f;
                    }
                } else {
                    if (f14 > 0.0f) {
                        constraint = bounds.bottom - Crop.this.mCropArea.bottom;
                        f8 = imageCropBound[1] - Crop.this.mCropArea.bottom;
                    } else {
                        constraint = constraint(Crop.this.mCropArea.bottom - Crop.this.mCropArea.top, (float) (-calculateMinSize));
                        f8 = 0.0f;
                    }
                    float f15 = f14;
                    f9 = constraint;
                    f10 = f15;
                }
                if (f10 > 0.0f) {
                    f12 = Crop.this.mCropArea.left - bounds.left;
                    f11 = bounds.right - Crop.this.mCropArea.right;
                    f9 = Math.min(Crop.this.mAspectRatio.getHeight(Math.min(f12, f11)), f9);
                } else {
                    f12 = constraint(Crop.this.mCropArea.right - Crop.this.mCropArea.left, (float) (-calculateMinSize)) / 2.0f;
                    f11 = f12;
                }
                float min2 = Math.min(f10, f8);
                if (min2 > f9) {
                    float height3 = 1.0f - ((min2 - f9) / imageBounds.height());
                    Crop.this.getImageMatrix().preScale(height3, height3, (fArr[0] + fArr[2]) / 2.0f, this.mResizeEdge == 16 ? fArr[3] : fArr[1]);
                }
                if (Math.abs(min2) > f9) {
                    min2 = ((float) (min2 > 0.0f ? 1 : -1)) * f9;
                }
                float width2 = Crop.this.mAspectRatio.getWidth(Math.abs(min2));
                float f16 = width2 / 2.0f;
                if (f16 <= f12 && f16 <= f11) {
                    f12 = f16;
                    f11 = f12;
                } else if (f12 < f11) {
                    f11 = width2 - f12;
                } else {
                    f12 = width2 - f11;
                }
                if (min2 < 0.0f) {
                    f11 *= -1.0f;
                } else {
                    f12 *= -1.0f;
                }
                if (this.mResizeEdge == 16) {
                    min2 *= -1.0f;
                    RectF access$9005 = Crop.this.mCropArea;
                    access$9005.top += min2;
                } else {
                    RectF access$9006 = Crop.this.mCropArea;
                    access$9006.bottom += min2;
                }
                RectF access$9007 = Crop.this.mCropArea;
                access$9007.left += f12;
                RectF access$9008 = Crop.this.mCropArea;
                access$9008.right += f11;
                Crop.this.mOffset.y = min2;
            }
            return Crop.this.mOffset;
        }

        private PointF onFixedResizeVertex(float f, float f2) {
            float f3;
            float f4;
            float f5;
            float f6;
            int calculateMinSize = calculateMinSize();
            RectF bounds = Crop.this.getBounds();
            RectF rectF = new RectF();
            RectF imageBounds = Crop.this.getImageBounds();
            Crop.this.getImageMatrix().mapRect(rectF, imageBounds);
            Crop.this.getImageMatrix().invert(Crop.this.mInvertMatrix);
            Crop.this.mInvertMatrix.mapRect(Crop.this.mInvertArea, Crop.this.mCropArea);
            Crop.this.mOffset.set(f, f2);
            if ((this.mResizeEdge & 16) != 0) {
                f2 *= -1.0f;
            }
            if ((this.mResizeEdge & 1) != 0) {
                f *= -1.0f;
            }
            float sqrt = (float) Math.sqrt((double) ((Crop.this.mAspectRatio.mWidth * Crop.this.mAspectRatio.mWidth) + (Crop.this.mAspectRatio.mHeight * Crop.this.mAspectRatio.mHeight)));
            float access$600 = Crop.this.mAspectRatio.mWidth / sqrt;
            float access$700 = Crop.this.mAspectRatio.mHeight / sqrt;
            float f7 = (f * access$600) + (f2 * access$700);
            float f8 = access$600 * f7;
            float f9 = f7 * access$700;
            Crop.this.mInvertMatrix.mapPoints(new float[4], new float[]{Crop.this.mCropArea.left, Crop.this.mCropArea.top, Crop.this.mCropArea.right, Crop.this.mCropArea.bottom});
            float[] imageCropBound = getImageCropBound(rectF);
            if (f8 <= 0.0f) {
                f4 = constraint(Crop.this.mCropArea.right - Crop.this.mCropArea.left, (float) (-calculateMinSize));
                f3 = 0.0f;
            } else if ((this.mResizeEdge & 1) != 0) {
                f4 = Crop.this.mCropArea.left - bounds.left;
                f3 = Crop.this.mCropArea.left - imageCropBound[0];
            } else {
                f4 = bounds.right - Crop.this.mCropArea.right;
                f3 = imageCropBound[0] - Crop.this.mCropArea.right;
            }
            if (f9 <= 0.0f) {
                f6 = constraint(Crop.this.mCropArea.bottom - Crop.this.mCropArea.top, (float) (-calculateMinSize));
                f5 = 0.0f;
            } else if ((this.mResizeEdge & 16) != 0) {
                f6 = Crop.this.mCropArea.top - bounds.top;
                f5 = Crop.this.mCropArea.top - imageCropBound[1];
            } else {
                f6 = bounds.bottom - Crop.this.mCropArea.bottom;
                f5 = imageCropBound[1] - Crop.this.mCropArea.bottom;
            }
            if (f8 > f3) {
                f9 = Crop.this.mAspectRatio.getHeight(f3);
                f8 = f3;
            }
            if (f9 > f5) {
                f8 = Crop.this.mAspectRatio.getWidth(f5);
                f9 = f5;
            }
            if (f8 > f4 || f9 > f6) {
                float f10 = f8 - f4;
                float f11 = f9 - f6;
                float width = f10 / imageBounds.width() > f11 / imageBounds.height() ? 1.0f - (f10 / imageBounds.width()) : 1.0f - (f11 / imageBounds.height());
                Crop.this.getImageMatrix().preScale(width, width, (this.mResizeEdge & 1) != 0 ? Crop.this.mInvertArea.right : Crop.this.mInvertArea.left, (this.mResizeEdge & 16) != 0 ? Crop.this.mInvertArea.bottom : Crop.this.mInvertArea.top);
            }
            int i = -1;
            if (Math.abs(f8) > f4) {
                f8 = f4 * ((float) (f8 > 0.0f ? 1 : -1));
                f9 = (f8 / Crop.this.mAspectRatio.mWidth) * Crop.this.mAspectRatio.mHeight;
            }
            if (Math.abs(f9) > f6) {
                if (f9 > 0.0f) {
                    i = 1;
                }
                f9 = ((float) i) * f6;
                f8 = (f9 / Crop.this.mAspectRatio.mHeight) * Crop.this.mAspectRatio.mWidth;
            }
            if ((this.mResizeEdge & 16) != 0) {
                f9 *= -1.0f;
                RectF access$900 = Crop.this.mCropArea;
                access$900.top += f9;
            } else if ((this.mResizeEdge & 4096) != 0) {
                RectF access$9002 = Crop.this.mCropArea;
                access$9002.bottom += f9;
            }
            if ((this.mResizeEdge & 1) != 0) {
                f8 *= -1.0f;
                RectF access$9003 = Crop.this.mCropArea;
                access$9003.left += f8;
            } else if ((this.mResizeEdge & 256) != 0) {
                RectF access$9004 = Crop.this.mCropArea;
                access$9004.right += f8;
            }
            Crop.this.mOffset.x = f8;
            Crop.this.mOffset.y = f9;
            return Crop.this.mOffset;
        }

        /* JADX WARNING: Removed duplicated region for block: B:127:0x0348  */
        /* JADX WARNING: Removed duplicated region for block: B:129:0x0358  */
        private PointF onFreeResize(float f, float f2) {
            boolean z;
            float f3;
            float f4;
            int i;
            boolean z2;
            int i2;
            boolean z3;
            int i3;
            boolean z4;
            int i4;
            boolean z5;
            int i5;
            boolean z6;
            int i6;
            boolean z7;
            int i7;
            RectF bounds = Crop.this.getBounds();
            RectF imageBounds = Crop.this.getImageBounds();
            int calculateMinSize = calculateMinSize();
            RectF rectF = new RectF();
            Crop.this.getImageMatrix().mapRect(rectF, imageBounds);
            Crop.this.getImageMatrix().invert(Crop.this.mInvertMatrix);
            Crop.this.mInvertMatrix.mapRect(Crop.this.mInvertArea, Crop.this.mCropArea);
            float[] fArr = new float[4];
            Crop.this.mInvertMatrix.mapPoints(fArr, new float[]{Crop.this.mCropArea.left, Crop.this.mCropArea.top, Crop.this.mCropArea.right, Crop.this.mCropArea.bottom});
            float[] imageCropBound = getImageCropBound(rectF);
            if ((this.mResizeEdge & 1) == 0 || (this.mResizeEdge & 16) == 0) {
                if ((this.mResizeEdge & 1) == 0 || (this.mResizeEdge & 4096) == 0) {
                    if ((this.mResizeEdge & 256) == 0 || (this.mResizeEdge & 16) == 0) {
                        if ((this.mResizeEdge & 256) != 0 && (this.mResizeEdge & 4096) != 0 && f >= 0.0f && f2 >= 0.0f) {
                            float f5 = imageCropBound[0] - Crop.this.mCropArea.right;
                            f4 = f > f5 ? f5 : f;
                            float f6 = imageCropBound[1] - Crop.this.mCropArea.bottom;
                            f3 = f2 > f6 ? f6 : f2;
                            if (bounds.bottom > Crop.this.mCropArea.bottom || f6 == 0.0f) {
                                if (bounds.right <= Crop.this.mCropArea.right && f5 != 0.0f) {
                                    float abs = Math.abs(f4);
                                    if (abs > 0.0f) {
                                        i = 1;
                                        z2 = true;
                                    } else {
                                        i = 1;
                                        z2 = false;
                                    }
                                    float checkOtherBoundOffset = 1.0f - (checkOtherBoundOffset(i, abs, bounds) / imageBounds.width());
                                    Crop.this.getImageMatrix().preScale(checkOtherBoundOffset, checkOtherBoundOffset, fArr[0], fArr[i]);
                                    if (z) {
                                        Crop.this.mOffset.set(0.0f, 0.0f);
                                        return Crop.this.mOffset;
                                    }
                                    if ((this.mResizeEdge & 1) != 0) {
                                        float f7 = imageCropBound[0] - Crop.this.mCropArea.left;
                                        float f8 = bounds.left - Crop.this.mCropArea.left;
                                        float constraint = constraint(Crop.this.mCropArea.right - Crop.this.mCropArea.left, (float) (-calculateMinSize));
                                        if (f4 < f7) {
                                            f4 = f7;
                                        }
                                        if (f4 < f8) {
                                            float checkOtherBoundOffset2 = checkOtherBoundOffset(256, f8 - f4, bounds);
                                            if (checkOtherBoundOffset2 > 0.0f) {
                                                float width = 1.0f - (checkOtherBoundOffset2 / imageBounds.width());
                                                Crop.this.getImageMatrix().preScale(width, width, fArr[2], (fArr[1] + fArr[3]) / 2.0f);
                                                RectF access$900 = Crop.this.mCropArea;
                                                float f9 = 1.0f - width;
                                                access$900.top += (Crop.this.mCropArea.height() * f9) / 2.0f;
                                                RectF access$9002 = Crop.this.mCropArea;
                                                access$9002.bottom -= (f9 * Crop.this.mCropArea.height()) / 2.0f;
                                            }
                                            f4 = f8;
                                        } else if (f4 > constraint) {
                                            f4 = constraint;
                                        }
                                        RectF access$9003 = Crop.this.mCropArea;
                                        access$9003.left += f4;
                                    } else if ((this.mResizeEdge & 256) != 0) {
                                        float f10 = imageCropBound[0] - Crop.this.mCropArea.right;
                                        float f11 = bounds.right - Crop.this.mCropArea.right;
                                        float constraint2 = constraint(Crop.this.mCropArea.left - Crop.this.mCropArea.right, (float) calculateMinSize);
                                        if (f4 > f10) {
                                            f4 = f10;
                                        }
                                        if (f4 > f11) {
                                            float checkOtherBoundOffset3 = checkOtherBoundOffset(1, f4 - f11, bounds);
                                            if (checkOtherBoundOffset3 > 0.0f) {
                                                float width2 = 1.0f - (checkOtherBoundOffset3 / imageBounds.width());
                                                Crop.this.getImageMatrix().preScale(width2, width2, fArr[0], (fArr[1] + fArr[3]) / 2.0f);
                                                RectF access$9004 = Crop.this.mCropArea;
                                                float f12 = 1.0f - width2;
                                                access$9004.top += (Crop.this.mCropArea.height() * f12) / 2.0f;
                                                RectF access$9005 = Crop.this.mCropArea;
                                                access$9005.bottom -= (f12 * Crop.this.mCropArea.height()) / 2.0f;
                                            }
                                            f4 = f11;
                                        } else if (f4 < constraint2) {
                                            f4 = constraint2;
                                        }
                                        RectF access$9006 = Crop.this.mCropArea;
                                        access$9006.right += f4;
                                    }
                                    if ((this.mResizeEdge & 16) != 0) {
                                        float f13 = imageCropBound[1] - Crop.this.mCropArea.top;
                                        float f14 = bounds.top - Crop.this.mCropArea.top;
                                        float constraint3 = constraint(Crop.this.mCropArea.bottom - Crop.this.mCropArea.top, (float) (-calculateMinSize));
                                        if (f3 < f13) {
                                            f3 = f13;
                                        }
                                        if (f3 < f14) {
                                            float checkOtherBoundOffset4 = checkOtherBoundOffset(4096, f14 - f3, bounds);
                                            if (checkOtherBoundOffset4 > 0.0f) {
                                                float height = 1.0f - (checkOtherBoundOffset4 / imageBounds.height());
                                                Crop.this.getImageMatrix().preScale(height, height, (fArr[0] + fArr[2]) / 2.0f, fArr[3]);
                                                RectF access$9007 = Crop.this.mCropArea;
                                                float f15 = 1.0f - height;
                                                access$9007.left += (Crop.this.mCropArea.width() * f15) / 2.0f;
                                                RectF access$9008 = Crop.this.mCropArea;
                                                access$9008.right -= (f15 * Crop.this.mCropArea.width()) / 2.0f;
                                            }
                                            f3 = f14;
                                        } else if (f3 > constraint3) {
                                            f3 = constraint3;
                                        }
                                        RectF access$9009 = Crop.this.mCropArea;
                                        access$9009.top += f3;
                                    } else if ((this.mResizeEdge & 4096) != 0) {
                                        float f16 = imageCropBound[1] - Crop.this.mCropArea.bottom;
                                        float f17 = bounds.bottom - Crop.this.mCropArea.bottom;
                                        float constraint4 = constraint(Crop.this.mCropArea.top - Crop.this.mCropArea.bottom, (float) calculateMinSize);
                                        if (f3 > f16) {
                                            f3 = f16;
                                        }
                                        if (f3 > f17) {
                                            float checkOtherBoundOffset5 = checkOtherBoundOffset(16, f3 - f17, bounds);
                                            if (checkOtherBoundOffset5 > 0.0f) {
                                                float height2 = 1.0f - (checkOtherBoundOffset5 / imageBounds.height());
                                                Crop.this.getImageMatrix().preScale(height2, height2, (fArr[0] + fArr[2]) / 2.0f, fArr[1]);
                                                RectF access$90010 = Crop.this.mCropArea;
                                                float f18 = 1.0f - height2;
                                                access$90010.left += (Crop.this.mCropArea.width() * f18) / 2.0f;
                                                RectF access$90011 = Crop.this.mCropArea;
                                                access$90011.right -= (f18 * Crop.this.mCropArea.width()) / 2.0f;
                                            }
                                            f3 = f17;
                                        } else if (f3 < constraint4) {
                                            f3 = constraint4;
                                        }
                                        RectF access$90012 = Crop.this.mCropArea;
                                        access$90012.bottom += f3;
                                    }
                                    Crop.this.mOffset.set(f4, f3);
                                    return Crop.this.mOffset;
                                }
                                z = false;
                                if (z) {
                                }
                            } else {
                                float abs2 = Math.abs(f3);
                                if (abs2 > 0.0f) {
                                    i2 = 16;
                                    z3 = true;
                                } else {
                                    i2 = 16;
                                    z3 = false;
                                }
                                float checkOtherBoundOffset6 = 1.0f - (checkOtherBoundOffset(i2, abs2, bounds) / imageBounds.height());
                                Crop.this.getImageMatrix().preScale(checkOtherBoundOffset6, checkOtherBoundOffset6, fArr[0], fArr[1]);
                                if (z) {
                                }
                            }
                        }
                    } else if (f >= 0.0f && f2 <= 0.0f) {
                        float f19 = imageCropBound[0] - Crop.this.mCropArea.right;
                        f4 = f > f19 ? f19 : f;
                        float f20 = imageCropBound[1] - Crop.this.mCropArea.top;
                        f3 = f2 < f20 ? f20 : f2;
                        if (bounds.top >= Crop.this.mCropArea.top) {
                            float abs3 = Math.abs(f3);
                            if (abs3 > 0.0f) {
                                i4 = 4096;
                                z5 = true;
                            } else {
                                i4 = 4096;
                                z5 = false;
                            }
                            float checkOtherBoundOffset7 = 1.0f - (checkOtherBoundOffset(i4, abs3, bounds) / imageBounds.height());
                            Crop.this.getImageMatrix().preScale(checkOtherBoundOffset7, checkOtherBoundOffset7, fArr[0], fArr[3]);
                        } else {
                            if (bounds.right <= Crop.this.mCropArea.right) {
                                float abs4 = Math.abs(f4);
                                if (abs4 > 0.0f) {
                                    i3 = 1;
                                    z4 = true;
                                } else {
                                    i3 = 1;
                                    z4 = false;
                                }
                                float checkOtherBoundOffset8 = 1.0f - (checkOtherBoundOffset(i3, abs4, bounds) / imageBounds.width());
                                Crop.this.getImageMatrix().preScale(checkOtherBoundOffset8, checkOtherBoundOffset8, fArr[0], fArr[3]);
                            }
                            z = false;
                        }
                        if (z) {
                        }
                    }
                } else if (f <= 0.0f && f2 >= 0.0f) {
                    float f21 = imageCropBound[0] - Crop.this.mCropArea.left;
                    f4 = f < f21 ? f21 : f;
                    float f22 = imageCropBound[1] - Crop.this.mCropArea.bottom;
                    f3 = f2 > f22 ? f22 : f2;
                    if (bounds.bottom <= Crop.this.mCropArea.bottom) {
                        float abs5 = Math.abs(f3);
                        if (abs5 > 0.0f) {
                            i6 = 16;
                            z7 = true;
                        } else {
                            i6 = 16;
                            z7 = false;
                        }
                        float checkOtherBoundOffset9 = 1.0f - (checkOtherBoundOffset(i6, abs5, bounds) / imageBounds.height());
                        Crop.this.getImageMatrix().preScale(checkOtherBoundOffset9, checkOtherBoundOffset9, fArr[2], fArr[1]);
                    } else {
                        if (bounds.left >= Crop.this.mCropArea.left) {
                            float abs6 = Math.abs(f4);
                            if (abs6 > 0.0f) {
                                i5 = 256;
                                z6 = true;
                            } else {
                                i5 = 256;
                                z6 = false;
                            }
                            float checkOtherBoundOffset10 = 1.0f - (checkOtherBoundOffset(i5, abs6, bounds) / imageBounds.width());
                            Crop.this.getImageMatrix().preScale(checkOtherBoundOffset10, checkOtherBoundOffset10, fArr[2], fArr[1]);
                        }
                        z = false;
                    }
                    if (z) {
                    }
                }
            } else if (f <= 0.0f && f2 <= 0.0f) {
                float f23 = imageCropBound[0] - Crop.this.mCropArea.left;
                f4 = f < f23 ? f23 : f;
                float f24 = imageCropBound[1] - Crop.this.mCropArea.top;
                f3 = f2 < f24 ? f24 : f2;
                if (bounds.top >= Crop.this.mCropArea.top) {
                    float abs7 = Math.abs(f3);
                    boolean z8 = abs7 > 0.0f;
                    float checkOtherBoundOffset11 = 1.0f - (checkOtherBoundOffset(4096, abs7, bounds) / imageBounds.height());
                    Crop.this.getImageMatrix().preScale(checkOtherBoundOffset11, checkOtherBoundOffset11, fArr[2], fArr[3]);
                    z = z8;
                } else {
                    if (bounds.left >= Crop.this.mCropArea.left) {
                        float abs8 = Math.abs(f4);
                        if (abs8 > 0.0f) {
                            i7 = 256;
                            z = true;
                        } else {
                            i7 = 256;
                            z = false;
                        }
                        float checkOtherBoundOffset12 = 1.0f - (checkOtherBoundOffset(i7, abs8, bounds) / imageBounds.width());
                        Crop.this.getImageMatrix().preScale(checkOtherBoundOffset12, checkOtherBoundOffset12, fArr[2], fArr[3]);
                    }
                    z = false;
                }
                if (z) {
                }
            }
            f4 = f;
            f3 = f2;
            z = false;
            if (z) {
            }
        }

        private void resolveResizeEdge(float f, float f2) {
            float min = Math.min(Crop.this.mResizeEdgeSlop, Crop.this.mCropArea.height() / 3.0f);
            float min2 = Math.min(Crop.this.mResizeEdgeSlop, Crop.this.mCropArea.width() / 3.0f);
            if (f2 > Crop.this.mCropArea.top - Crop.this.mResizeEdgeSlop && f2 < Crop.this.mCropArea.bottom + Crop.this.mResizeEdgeSlop) {
                if (f > Crop.this.mCropArea.left - Crop.this.mResizeEdgeSlop && f < Crop.this.mCropArea.left + min2) {
                    this.mResizeEdge |= 1;
                } else if (f > Crop.this.mCropArea.right - min2 && f < Crop.this.mCropArea.right + Crop.this.mResizeEdgeSlop) {
                    this.mResizeEdge |= 256;
                }
            }
            if (f > Crop.this.mCropArea.left - Crop.this.mResizeEdgeSlop && f < Crop.this.mCropArea.right + Crop.this.mResizeEdgeSlop) {
                if (f2 > Crop.this.mCropArea.top - Crop.this.mResizeEdgeSlop && f2 < Crop.this.mCropArea.top + min) {
                    this.mResizeEdge |= 16;
                } else if (f2 > Crop.this.mCropArea.bottom - min && f2 < Crop.this.mCropArea.bottom + Crop.this.mResizeEdgeSlop) {
                    this.mResizeEdge |= 4096;
                }
            }
        }

        /* access modifiers changed from: protected */
        public boolean onTouchEvent(MotionEvent motionEvent) {
            boolean z = false;
            if (motionEvent.getAction() == 0) {
                resolveResizeEdge(motionEvent.getX(), motionEvent.getY());
                if (this.mResizeEdge == 0) {
                    return false;
                }
                Crop.this.mEventState = EventState.RESIZE;
                Crop.this.mCropAreaChanged = true;
                this.mResizeStart.set(motionEvent.getX(), motionEvent.getY());
                Crop.this.postCropProceed();
                return true;
            } else if (Crop.this.mEventState != EventState.RESIZE) {
                return false;
            } else {
                if (motionEvent.getAction() == 2) {
                    if (motionEvent.getActionIndex() != 0) {
                        return false;
                    }
                    float x = motionEvent.getX() - this.mResizeStart.x;
                    float y = motionEvent.getY() - this.mResizeStart.y;
                    this.mPreEdit.set(Crop.this.mCropArea);
                    if (Crop.this.mAspectRatio == AspectRatio.RATIO_NONE) {
                        z = true;
                    }
                    PointF onFreeResize = z ? onFreeResize(x, y) : onFixedResize(x, y);
                    this.mResizeStart.x += onFreeResize.x;
                    this.mResizeStart.y += onFreeResize.y;
                    fixImageBounds(Crop.this.mCropArea);
                    Crop.this.invalidate();
                } else if (motionEvent.getAction() == 1 || motionEvent.getAction() == 3 || (motionEvent.getActionMasked() == 6 && motionEvent.getActionIndex() == 0)) {
                    this.mResizeEdge = 0;
                    Crop.this.mEventState = EventState.SKIP;
                    Crop.this.postCropFinish();
                    Crop.this.endManualRotate();
                }
                return true;
            }
        }
    }

    private class ScaleListener implements OnScaleGestureListener {
        private ScaleListener() {
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            Crop.this.mEventState = EventState.SCALE;
            float scaleFactor = scaleGestureDetector.getScaleFactor();
            float mapRadius = Crop.this.getImageMatrix().mapRadius(Crop.this.calculateMinPixels());
            float min = Math.min(Crop.this.mCropArea.width(), Crop.this.mCropArea.height());
            if (scaleFactor * mapRadius > min) {
                scaleFactor = min / mapRadius;
            }
            Crop.this.getImageMatrix().postScale(scaleFactor, scaleFactor, scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
            if (Crop.this.mOnCropChangedListener != null) {
                Crop.this.mOnCropChangedListener.onChanged();
            }
            Crop.this.invalidate();
            return true;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            Crop.this.preTransform();
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            Crop.this.fixImageBounds(Crop.this.mCropArea, Crop.this.mBoundsFixCallback);
            Crop.this.endManualRotate();
        }
    }

    private class TranslateListener implements OnTranslateListener {
        private TranslateListener() {
        }

        public void onTranslate(float f, float f2) {
            Crop.this.getImageMatrix().postTranslate(f, f2);
            Crop.this.invalidate();
        }

        public boolean onTranslateBegin() {
            if (Crop.this.mEventState == EventState.IDLE) {
                Crop.this.mEventState = EventState.TRANSLATE;
                Crop.this.preTransform();
                return true;
            } else if (Crop.this.mEventState != EventState.SCALE) {
                return false;
            } else {
                Crop.this.preTransform();
                return true;
            }
        }

        public void onTranslateEnd() {
            Crop.this.fixImageBounds(Crop.this.mCropArea, Crop.this.mBoundsFixCallback);
            Crop.this.mEventState = EventState.IDLE;
        }
    }

    public Crop(Context context) {
        this.mCropWindow = context.getResources().getDrawable(R.drawable.crop_window);
        this.mCropWindow.getPadding(this.mBgPadding);
        this.mMaskColor = context.getResources().getColor(R.color.crop_view_mask_color);
        this.mMaskColorAlpha = 229;
        this.mGuideLineSize = context.getResources().getDimension(R.dimen.guide_line_size);
        this.mResizeEdgeSlop = context.getResources().getDimension(R.dimen.crop_menu_bound_touch_width);
        this.mTranslateDetector = new TranslateDetector(new TranslateListener());
        this.mScaleGestureDetector = new ScaleGestureDetector(context, new ScaleListener());
        this.mResizeDetector = new ResizeDetector();
    }

    /* access modifiers changed from: private */
    public void animCropAreaChanged(OneShotAnimateListener oneShotAnimateListener) {
        Matrix matrix = new Matrix(getImageMatrix());
        Matrix matrix2 = new Matrix(getImageMatrix());
        RectF rectF = new RectF(this.mCropArea);
        RectF rectF2 = new RectF();
        this.mMatrix.setRectToRect(this.mCropArea, getBounds(), ScaleToFit.CENTER);
        this.mMatrix.mapRect(rectF2, this.mCropArea);
        matrix2.postConcat(this.mMatrix);
        setupImageAnimator(matrix, matrix2, null);
        setupWindowAnimator(rectF, rectF2, null);
        setupAnimatorSet(this.mImageAnimator, this.mWindowAnimator, oneShotAnimateListener);
        this.mAnimatorSet.start();
    }

    /* access modifiers changed from: private */
    public void animGuideLine(boolean z) {
        if (this.mGuideLineAnimator != null && this.mGuideLineAnimator.isRunning()) {
            this.mGuideLineAnimator.cancel();
        }
        if (z) {
            if (this.mGuideLineAlpha < 255) {
                this.mGuideLineAnimator = ObjectAnimator.ofInt(this, "guideLineAlpha", new int[]{this.mGuideLineAlpha, 255});
            }
        } else if (this.mGuideLineAlpha > 0) {
            this.mGuideLineAnimator = ObjectAnimator.ofInt(this, "guideLineAlpha", new int[]{this.mGuideLineAlpha, 0});
            this.mGuideLineAnimator.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                    Crop.this.mStartGuideLine = false;
                }

                public void onAnimationEnd(Animator animator) {
                    Crop.this.mStartGuideLine = false;
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                }
            });
        }
        if (this.mGuideLineAnimator != null) {
            this.mGuideLineAnimator.setDuration(300);
            this.mGuideLineAnimator.start();
        }
    }

    private Animator animRotate(float f, long j, OneShotAnimateListener oneShotAnimateListener) {
        if (this.mCanvasAnimator == null) {
            this.mCanvasAnimator = new ValueAnimator();
            this.mRotateValues = PropertyValuesHolder.ofFloat("rotate", new float[]{0.0f, 0.0f});
            this.mScaleValues = PropertyValuesHolder.ofFloat("scale", new float[]{0.0f, 0.0f});
            this.mCanvasAnimator.addUpdateListener(this.mRotateUpdateListener);
            this.mCanvasAnimator.addListener(this.mRotateListener);
        }
        this.mCanvasAnimator.setDuration(j);
        this.mRotateValues.setFloatValues(new float[]{0.0f, -90.0f});
        this.mScaleValues.setFloatValues(new float[]{1.0f, f});
        this.mCanvasAnimator.setValues(new PropertyValuesHolder[]{this.mRotateValues, this.mScaleValues});
        if (oneShotAnimateListener != null) {
            this.mCanvasAnimator.addListener(oneShotAnimateListener);
        }
        return this.mCanvasAnimator;
    }

    private void animTouchMaskColor(boolean z) {
        if (this.mMaskColorAnimator != null && this.mMaskColorAnimator.isRunning()) {
            this.mMaskColorAnimator.cancel();
        }
        if (z) {
            this.mMaskColorAnimator = ObjectAnimator.ofInt(this, "maskColorAlpha", new int[]{229, BaiduSceneResult.BANK_CARD});
        } else {
            this.mMaskColorAnimator = ObjectAnimator.ofInt(this, "maskColorAlpha", new int[]{BaiduSceneResult.BANK_CARD, 229});
        }
        this.mMaskColorAnimator.setDuration(300);
        this.mMaskColorAnimator.start();
    }

    /* access modifiers changed from: private */
    public float calculateMinPixels() {
        return Math.max(32.0f, Math.max(getImageBounds().height(), getImageBounds().width()) / 10.0f);
    }

    /* access modifiers changed from: private */
    public void doMirror() {
        Matrix matrix = new Matrix(getImageMatrix());
        matrix.postScale(-1.0f, 1.0f, this.mCropArea.centerX(), this.mCropArea.centerY());
        getImageMatrix().set(matrix);
        invalidate();
    }

    /* access modifiers changed from: private */
    public void doRotate() {
        this.mMatrix.setRotate(-90.0f, this.mCropArea.centerX(), this.mCropArea.centerY());
        this.mMatrix.mapRect(this.mRect, this.mCropArea);
        animRotate(Math.min(getBounds().width() / this.mRect.width(), getBounds().height() / this.mRect.height()), 100, null).start();
    }

    private void drawGuideLines(Canvas canvas) {
        if (this.mGuideLineMode.mCount != 0) {
            this.mPaint.reset();
            this.mPaint.setStrokeWidth(this.mGuideLineSize);
            this.mPaint.setColor(-1);
            this.mPaint.setAlpha(this.mGuideLineAlpha);
            this.mPaint.setStyle(Style.STROKE);
            float f = (this.mCropArea.right - this.mCropArea.left) / ((float) this.mGuideLineMode.mCount);
            float f2 = (this.mCropArea.bottom - this.mCropArea.top) / ((float) this.mGuideLineMode.mCount);
            for (int i = 1; i < this.mGuideLineMode.mCount; i++) {
                float f3 = (float) i;
                float f4 = f2 * f3;
                Canvas canvas2 = canvas;
                canvas2.drawLine(this.mCropArea.left, this.mCropArea.top + f4, this.mCropArea.right, this.mCropArea.top + f4, this.mPaint);
                float f5 = f3 * f;
                canvas2.drawLine(this.mCropArea.left + f5, this.mCropArea.top, this.mCropArea.left + f5, this.mCropArea.bottom, this.mPaint);
            }
        }
    }

    /* access modifiers changed from: private */
    public void endManualRotate() {
        this.mInitialDegree = 0.0f;
        this.mInitialMatrix = null;
    }

    /* access modifiers changed from: private */
    public void performCropFinished() {
        this.mCropAreaChanged = false;
    }

    /* access modifiers changed from: private */
    public void postCropFinish() {
        if (this.mCropAreaChanged) {
            getEventHandler().sendEmptyMessageDelayed(this.mMsgCropFinish, 1000);
            if (this.mOnCropChangedListener != null) {
                this.mOnCropChangedListener.onChanged();
            }
        }
    }

    /* access modifiers changed from: private */
    public void postCropProceed() {
        if (this.mCropAreaChanged) {
            getEventHandler().removeMessages(this.mMsgCropFinish);
        }
    }

    private void postGuideLineFinish() {
        getEventHandler().removeMessages(this.mMsgGuideLineFinish);
        getEventHandler().sendEmptyMessageDelayed(this.mMsgGuideLineFinish, 1300);
    }

    /* access modifiers changed from: private */
    public void preTransform() {
        postCropProceed();
        if (this.mImageAnimator != null && this.mImageAnimator.isStarted()) {
            this.mImageAnimator.cancel();
        }
    }

    private void setupAnimatorSet(Animator animator, Animator animator2, OneShotAnimateListener oneShotAnimateListener) {
        if (this.mAnimatorSet == null) {
            this.mAnimatorSet = new AnimatorSet();
            this.mAnimatorSet.playTogether(new Animator[]{animator, animator2});
            this.mAnimatorSet.addListener(this.mPerformCropFinish);
        }
        this.mAnimatorSet.setDuration(300);
        if (oneShotAnimateListener != null) {
            this.mAnimatorSet.addListener(oneShotAnimateListener);
        }
    }

    private void setupWindowAnimator(RectF rectF, RectF rectF2, OneShotAnimateListener oneShotAnimateListener) {
        if (this.mWindowAnimator == null) {
            this.mWindowAnimator = new ValueAnimator();
            this.mWindowValues = PropertyValuesHolder.ofObject("window", new RectFEvaluator(), new Object[]{rectF, rectF2});
            this.mWindowAnimator.addUpdateListener(this.mWindowUpdateListener);
        }
        this.mWindowAnimator.setDuration(300);
        this.mWindowValues.setObjectValues(new Object[]{rectF, rectF2});
        this.mWindowAnimator.setValues(new PropertyValuesHolder[]{this.mWindowValues});
        if (oneShotAnimateListener != null) {
            this.mWindowAnimator.addListener(oneShotAnimateListener);
        }
    }

    private void startGuideLine() {
        getEventHandler().removeMessages(this.mMsgGuideLineFinish);
        this.mStartGuideLine = true;
        animGuideLine(true);
    }

    public void beginAutoRotate() {
        this.mEventState = EventState.ROTATION;
        this.mInitialDegree = this.mAdjustDegree;
        this.mInitialMatrix = new Matrix(this.mUnmodifiedMatrix);
        this.mGuideLineMode = GuideLine.CROP;
        this.mMaskColorAlpha = 229;
        startGuideLine();
        invalidate();
    }

    public void beginRotate() {
        this.mEventState = EventState.ROTATION;
        this.mInitialDegree = this.mAdjustDegree;
        this.mInitialMatrix = new Matrix(getImageMatrix());
        this.mGuideLineMode = GuideLine.ROTATE;
        this.mMaskColorAlpha = BaiduSceneResult.BANK_CARD;
        startGuideLine();
        invalidate();
    }

    /* access modifiers changed from: protected */
    public void config(Canvas canvas) {
        super.config(canvas);
        canvas.concat(this.mGlobalMatrix);
    }

    /* access modifiers changed from: protected */
    public void drawOverlay(Canvas canvas) {
        if (this.mMaskColorAlpha != 229 || this.mStartGuideLine) {
            drawGuideLines(canvas);
        }
        this.mBgBounds.set(Math.round(this.mCropArea.left - ((float) this.mBgPadding.left)), Math.round(this.mCropArea.top - ((float) this.mBgPadding.top)), Math.round(this.mCropArea.right + ((float) this.mBgPadding.right)), Math.round(this.mCropArea.bottom + ((float) this.mBgPadding.bottom)));
        this.mCropWindow.setBounds(this.mBgBounds);
        this.mCropWindow.draw(canvas);
        getImageMatrix().mapRect(getImageDisplayBounds(), getImageBounds());
        this.mGlobalMatrix.mapRect(getImageDisplayBounds());
        float f = getImageDisplayBounds().top;
        float f2 = f > 0.0f ? 0.0f : f;
        canvas.getClipBounds(this.mClipBounds);
        this.mPaint.setColor(this.mMaskColor);
        this.mPaint.setAlpha(this.mMaskColorAlpha);
        this.mPaint.setStyle(Style.FILL);
        canvas.drawRect(0.0f, f2, (float) this.mClipBounds.right, (float) this.mBgBounds.top, this.mPaint);
        canvas.drawRect(0.0f, (float) this.mBgBounds.top, (float) this.mBgBounds.left, (float) this.mBgBounds.bottom, this.mPaint);
        canvas.drawRect((float) this.mBgBounds.right, (float) this.mBgBounds.top, (float) this.mClipBounds.right, (float) this.mBgBounds.bottom, this.mPaint);
        canvas.drawRect(0.0f, (float) this.mBgBounds.bottom, (float) this.mClipBounds.right, (float) this.mClipBounds.bottom, this.mPaint);
    }

    public ParcelableCropEntry export() {
        if (this.mCropAreaChanged) {
            getEventHandler().removeMessages(this.mMsgCropFinish);
            this.mCropAreaChanged = false;
        }
        return new ParcelableCropEntry(getImageBounds(), this.mCropArea, getImageMatrix(), this.mAdjustDegree + ((float) this.mRotateDegree));
    }

    public void finishRotate() {
        this.mMaskColorAlpha = 229;
        invalidate();
        postGuideLineFinish();
        this.mEventState = EventState.IDLE;
    }

    public RectF getCroppedSize() {
        return this.mCropArea;
    }

    public RectF getSampleSize() {
        RectF rectF = new RectF(getImageBounds());
        getImageMatrix().mapRect(rectF);
        return rectF;
    }

    public void mirror() {
        if (this.mCropAreaChanged) {
            if (this.mAnimatorSet == null || !this.mAnimatorSet.isStarted()) {
                animCropAreaChanged(new OneShotAnimateListener() {
                    public void onAnimationEnd(Animator animator) {
                        super.onAnimationEnd(animator);
                        Crop.this.doMirror();
                    }
                });
            }
        } else if (this.mImageAnimator == null || !this.mImageAnimator.isStarted()) {
            doMirror();
        }
    }

    /* access modifiers changed from: protected */
    public void onMatrixChanged() {
        super.onMatrixChanged();
        getImageMatrix().mapRect(this.mCropArea, getImageBounds());
        this.mUnmodifiedMatrix.set(getImageMatrix());
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        this.mMsgCropFinish = getEventHandler().register(this.mEditFinished);
        this.mMsgGuideLineFinish = getEventHandler().register(this.mGuideLineFinished);
        if (this.mFirstIn) {
            reset();
            this.mFirstIn = false;
        }
    }

    /* access modifiers changed from: protected */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (this.mEventState == EventState.ROTATION) {
            return true;
        }
        if (actionMasked == 0) {
            if (this.mTouchBounds.contains(motionEvent.getX(), motionEvent.getY())) {
                this.mEventState = EventState.IDLE;
            } else if (this.mEventState != EventState.SKIP) {
                if (this.mEventState != EventState.IDLE) {
                    return false;
                }
                this.mEventState = EventState.SKIP;
            }
        } else if (this.mEventState == EventState.SKIP && this.mTouchBounds.contains(motionEvent.getX(), motionEvent.getY())) {
            this.mEventState = EventState.IDLE;
            motionEvent.setAction(0);
        }
        if (this.mEventState != EventState.SKIP) {
            if (actionMasked == 0) {
                startGuideLine();
                animTouchMaskColor(true);
                this.mGuideLineMode = GuideLine.CROP;
                if (this.mOnCropChangedListener != null) {
                    this.mOnCropChangedListener.changeRotationState(false);
                }
            } else if (actionMasked == 3 || actionMasked == 1) {
                animTouchMaskColor(false);
                postGuideLineFinish();
            }
        }
        switch (this.mEventState) {
            case ANIMATOR:
            case SKIP:
                break;
            case TRANSLATE:
                this.mScaleGestureDetector.onTouchEvent(motionEvent);
                this.mTranslateDetector.onTouchEvent(motionEvent);
                break;
            case SCALE:
                this.mScaleGestureDetector.onTouchEvent(motionEvent);
                this.mTranslateDetector.onTouchEvent(motionEvent);
                break;
            case RESIZE:
                this.mResizeDetector.onTouchEvent(motionEvent);
                break;
            case IDLE:
                this.mResizeDetector.onTouchEvent(motionEvent);
                this.mScaleGestureDetector.onTouchEvent(motionEvent);
                this.mTranslateDetector.onTouchEvent(motionEvent);
                break;
            default:
                return false;
        }
        return true;
    }

    public void reset() {
        getImageMatrix().mapRect(this.mCropArea, getImageBounds());
        this.mUnmodifiedMatrix.set(getImageMatrix());
        this.mTouchBounds.set(getBounds());
        this.mAdjustDegree = 0.0f;
        this.mRotateDegree = 0;
        this.mAspectRatio = AspectRatio.RATIO_NONE;
    }

    public void rotate() {
        if (this.mCropAreaChanged) {
            if (this.mAnimatorSet == null || !this.mAnimatorSet.isStarted()) {
                animCropAreaChanged(new OneShotAnimateListener() {
                    public void onAnimationEnd(Animator animator) {
                        super.onAnimationEnd(animator);
                        Crop.this.doRotate();
                    }
                });
            }
        } else if (this.mCanvasAnimator == null || !this.mCanvasAnimator.isStarted()) {
            doRotate();
        }
    }

    public void setFixedAspectRatio(int i, int i2) {
        if (this.mAspectRatio.mWidth != ((float) i) || this.mAspectRatio.mHeight != ((float) i2)) {
            if (i == 0 && i2 == 0) {
                this.mAspectRatio = AspectRatio.RATIO_NONE;
                return;
            }
            if (i == -1 && i2 == -1) {
                i = getImage().getWidth();
                i2 = getImage().getHeight();
            } else if (i == -2 && i2 == -2) {
                i = ScreenUtils.getScreenWidth();
                i2 = ScreenUtils.getFullScreenHeight((Activity) getContext());
            }
            if (this.mWindowAnimator != null && this.mWindowAnimator.isStarted()) {
                this.mWindowAnimator.end();
            }
            if (this.mImageAnimator != null && this.mImageAnimator.isStarted()) {
                this.mImageAnimator.end();
            }
            if (this.mCanvasAnimator != null && this.mCanvasAnimator.isStarted()) {
                this.mCanvasAnimator.end();
            }
            if (this.mAnimatorSet != null && this.mAnimatorSet.isStarted()) {
                this.mAnimatorSet.end();
            }
            this.mAspectRatio = new AspectRatio((float) i, (float) i2);
            float width = this.mCropArea.width() / this.mCropArea.height();
            float access$600 = this.mAspectRatio.mWidth / this.mAspectRatio.mHeight;
            if (Math.abs(width - access$600) > Float.MIN_NORMAL) {
                getEventHandler().removeMessages(this.mMsgCropFinish);
                RectF rectF = new RectF(this.mCropArea);
                if (width > access$600) {
                    float width2 = ((rectF.width() / access$600) - rectF.height()) / 2.0f;
                    rectF.top -= width2;
                    rectF.bottom += width2;
                } else {
                    float height = ((access$600 * rectF.height()) - rectF.width()) / 2.0f;
                    rectF.left -= height;
                    rectF.right += height;
                }
                this.mMatrix.setRectToRect(rectF, getBounds(), ScaleToFit.CENTER);
                this.mMatrix.mapRect(rectF);
                Matrix matrix = new Matrix(getImageMatrix());
                Matrix matrix2 = new Matrix(getImageMatrix());
                getImageMatrix().invert(this.mInvertMatrix);
                this.mInvertMatrix.mapRect(this.mInvertArea, rectF);
                float resolveScale = resolveScale(getImageBounds(), this.mInvertArea);
                matrix2.preScale(resolveScale, resolveScale, this.mInvertArea.centerX(), this.mInvertArea.centerY());
                matrix2.invert(this.mInvertMatrix);
                this.mInvertMatrix.mapRect(this.mInvertArea, rectF);
                resolveTranslate(getImageBounds(), this.mInvertArea, this.mOffset);
                matrix2.preTranslate(this.mOffset.x, this.mOffset.y);
                this.mCropAreaChanged = true;
                setupWindowAnimator(new RectF(this.mCropArea), rectF, null);
                setupImageAnimator(matrix, matrix2, null);
                setupAnimatorSet(this.mImageAnimator, this.mWindowAnimator, null);
                this.mAnimatorSet.start();
            }
        }
    }

    @Keep
    public void setGuideLineAlpha(int i) {
        this.mGuideLineAlpha = i;
        invalidate();
    }

    @Keep
    public void setMaskColorAlpha(int i) {
        this.mMaskColorAlpha = i;
        invalidate();
    }

    public void setOnCropChangedListener(OnCropChangedListener onCropChangedListener) {
        this.mOnCropChangedListener = onCropChangedListener;
    }

    public void setRotateDegree(float f) {
        if (!this.mCropAreaChanged) {
            if (this.mInitialMatrix == null) {
                beginRotate();
            }
            Matrix imageMatrix = getImageMatrix();
            imageMatrix.set(this.mInitialMatrix);
            RectF imageBounds = getImageBounds();
            imageMatrix.postRotate(f - this.mInitialDegree, this.mCropArea.centerX(), this.mCropArea.centerY());
            this.mAdjustDegree = f;
            imageMatrix.invert(this.mInvertMatrix);
            this.mInvertMatrix.mapRect(this.mInvertArea, this.mCropArea);
            float f2 = 1.0f;
            if (this.mInvertArea.left < 0.0f) {
                f2 = Math.max(1.0f, (this.mInvertArea.width() / 2.0f) / this.mInvertArea.centerX());
            }
            if (this.mInvertArea.right > imageBounds.right) {
                f2 = Math.max(f2, (this.mInvertArea.width() / 2.0f) / (imageBounds.right - this.mInvertArea.centerX()));
            }
            if (this.mInvertArea.top < 0.0f) {
                f2 = Math.max(f2, (this.mInvertArea.height() / 2.0f) / this.mInvertArea.centerY());
            }
            if (this.mInvertArea.bottom > imageBounds.bottom) {
                f2 = Math.max(f2, (this.mInvertArea.height() / 2.0f) / (imageBounds.bottom - this.mInvertArea.centerY()));
            }
            imageMatrix.preScale(f2, f2, this.mInvertArea.centerX(), this.mInvertArea.centerY());
            invalidate();
        }
    }

    public void setRotateDegreeWithAnimation(float f) {
        if (!this.mCropAreaChanged && this.mEventState != EventState.ROTATION) {
            beginAutoRotate();
            Matrix matrix = new Matrix(this.mInitialMatrix);
            Matrix matrix2 = new Matrix(this.mInitialMatrix);
            RectF imageBounds = getImageBounds();
            matrix2.postRotate(f - this.mInitialDegree, this.mCropArea.centerX(), this.mCropArea.centerY());
            this.mAdjustDegree = f;
            matrix2.invert(this.mInvertMatrix);
            this.mInvertMatrix.mapRect(this.mInvertArea, this.mCropArea);
            float max = this.mInvertArea.left < 0.0f ? Math.max(1.0f, (this.mInvertArea.width() / 2.0f) / this.mInvertArea.centerX()) : 1.0f;
            if (this.mInvertArea.right > imageBounds.right) {
                max = Math.max(max, (this.mInvertArea.width() / 2.0f) / (imageBounds.right - this.mInvertArea.centerX()));
            }
            if (this.mInvertArea.top < 0.0f) {
                max = Math.max(max, (this.mInvertArea.height() / 2.0f) / this.mInvertArea.centerY());
            }
            if (this.mInvertArea.bottom > imageBounds.bottom) {
                max = Math.max(max, (this.mInvertArea.height() / 2.0f) / (imageBounds.bottom - this.mInvertArea.centerY()));
            }
            matrix2.preScale(max, max, this.mInvertArea.centerX(), this.mInvertArea.centerY());
            setupImageAnimator(matrix, matrix2, new OneShotAnimateListener() {
                public void onAnimationCancel(Animator animator) {
                    super.onAnimationCancel(animator);
                    Crop.this.finishRotate();
                }

                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    Crop.this.finishRotate();
                }
            });
            this.mImageAnimator.setDuration(400);
            this.mImageAnimator.setInterpolator(PathInterpolatorCompat.getPathInterpolator(0.6f, 0.1f, 0.35f, 1.0f));
            this.mImageAnimator.start();
        }
    }
}
