package com.miui.gallery.collage.widget;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.support.annotation.Keep;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.collage.ClipType;
import com.miui.gallery.collage.CollageActivity.ReplaceImageListener;
import com.miui.gallery.collage.render.CollageRender;
import com.miui.gallery.collage.render.CollageRender.ImageLocation;
import com.miui.gallery.collage.render.CollageRender.ImageLocationProcessor;
import com.miui.gallery.editor.photo.app.MatrixEvaluator;
import com.miui.gallery.editor.photo.core.imports.obsoletes.RectFEvaluator;
import com.miui.gallery.util.Log;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class CollageLayout extends ViewGroup {
    /* access modifiers changed from: private */
    public boolean mActivating = false;
    /* access modifiers changed from: private */
    public int mActiveIndex = -1;
    private int mActiveLineWidth;
    private int mActiveLineWidthWhite;
    /* access modifiers changed from: private */
    public BitmapExchangeListener mBitmapExchangeListener;
    private Context mContext;
    /* access modifiers changed from: private */
    public ControlPopupWindow mControlPopupWindow;
    private float mDensity;
    /* access modifiers changed from: private */
    public DragImageHolder mDragImageHolder = new DragImageHolder();
    private GestureDetector mGestureDetector;
    private CustomGestureListener mGestureListener = new CustomGestureListener();
    private boolean mIgnoreEdgeMargin = false;
    private ImageLocationProcessor mImageLocationProcessor = new ImageLocationProcessor();
    private float mMargin = 0.0f;
    private Paint mPathPaint = new Paint();
    /* access modifiers changed from: private */
    public PopupListener mPopupListener = new PopupListener();
    /* access modifiers changed from: private */
    public ReplaceImageListener mReplaceImageListener;
    private ScaleGestureDetector mScaleGestureDetector;
    private int mStrokeColor;

    public interface BitmapExchangeListener {
        void onBitmapExchange(Bitmap bitmap, Bitmap bitmap2);
    }

    private class CustomGestureListener implements OnGestureListener, OnScaleGestureListener {
        private CollageImageView mDownView;
        private CollageImageView mDragTargetView;
        private boolean mIsLongPressMode;
        private float mLastX;
        private float mLastY;

        private CustomGestureListener() {
        }

        /* access modifiers changed from: 0000 */
        public void onActionMove(MotionEvent motionEvent) {
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            float f = x - this.mLastX;
            float f2 = y - this.mLastY;
            if (this.mDownView != null && this.mIsLongPressMode) {
                CollageLayout.this.mDragImageHolder.receiveScrollEvent(f, f2);
                this.mDragTargetView = CollageLayout.this.findSingleView(x, y);
                if (this.mDragTargetView == null || this.mDragTargetView == this.mDownView) {
                    CollageLayout.this.mActiveIndex = -1;
                } else {
                    CollageLayout.this.setActive(this.mDragTargetView);
                }
            }
            this.mLastX = x;
            this.mLastY = y;
            CollageLayout.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            this.mDownView = CollageLayout.this.findSingleView(motionEvent.getX(), motionEvent.getY());
            this.mLastX = motionEvent.getX();
            this.mLastY = motionEvent.getY();
            this.mIsLongPressMode = false;
            CollageLayout.this.mActivating = true;
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
            Log.d("CollageLayout", "onLongPress");
            if (this.mDownView != null) {
                CollageLayout.this.dismissControlWindow();
                this.mIsLongPressMode = true;
                motionEvent.getX();
                motionEvent.getY();
                CollageLayout.this.mDragImageHolder.enableDragMode(this.mDownView);
                CollageLayout.this.mActiveIndex = -1;
                this.mDownView.setDrawBitmap(false);
                CollageLayout.this.doVibrator();
                CollageLayout.this.invalidate();
            }
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (this.mDownView != null) {
                this.mDownView.appendScale(scaleGestureDetector.getScaleFactor(), scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
            }
            return true;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            return true;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (this.mDownView != null && !this.mIsLongPressMode) {
                this.mDownView.transition(-f, -f2);
            }
            return false;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            if (this.mDownView == null) {
                CollageLayout.this.mActiveIndex = -1;
                CollageLayout.this.dismissControlWindow();
            } else if (CollageLayout.this.mActiveIndex == CollageLayout.this.indexOfChild(this.mDownView)) {
                CollageLayout.this.mActiveIndex = -1;
                CollageLayout.this.dismissControlWindow();
            } else {
                CollageLayout.this.setActive(this.mDownView);
                CollageLayout.this.getLocationInWindow(new int[2]);
                CollageLayout.this.mControlPopupWindow.showAtLocation(CollageLayout.this, this.mDownView);
                CollageLayout.this.mPopupListener.setCollageSingleView(this.mDownView);
            }
            CollageLayout.this.invalidate();
            return true;
        }

        /* access modifiers changed from: 0000 */
        public void onUp() {
            if (this.mIsLongPressMode) {
                this.mIsLongPressMode = false;
                if (this.mDragTargetView == null || this.mDragTargetView == this.mDownView) {
                    CollageLayout.this.mDragImageHolder.resetBitmapWithAnim();
                } else {
                    CollageLayout.this.mActiveIndex = -1;
                    CollageLayout.this.mDragImageHolder.exchangeBitmapWithAnim(this.mDragTargetView);
                }
            } else if (this.mDownView != null) {
                this.mDownView.resetBitmapLocation();
                CollageLayout.this.mActivating = false;
            }
            CollageLayout.this.invalidate();
        }
    }

    private static class DragBitmapItem {
        /* access modifiers changed from: private */
        public Bitmap mBitmap;
        private Matrix mBitmapMatrix;
        private Paint mBitmapPaint;
        private RectF mBitmapRect;
        private RectF mDisplayOriginRect;
        private RectF mDisplayRect;
        /* access modifiers changed from: private */
        public boolean mMirror;
        private RectF mRectTemp;
        /* access modifiers changed from: private */
        public int mRotateDegree;
        private float mScale;
        /* access modifiers changed from: private */
        public ObjectAnimator mShowAnimator;
        private ObjectAnimator mTransitionAnimator;
        private Matrix mUserMatrix;

        private DragBitmapItem() {
            this.mBitmapRect = new RectF();
            this.mDisplayOriginRect = new RectF();
            this.mDisplayRect = new RectF();
            this.mRectTemp = new RectF();
            this.mBitmapMatrix = new Matrix();
            this.mUserMatrix = new Matrix();
            this.mBitmapPaint = new Paint(3);
            this.mScale = 1.0f;
            this.mRotateDegree = 0;
            this.mMirror = false;
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.scale(this.mScale, this.mScale, this.mDisplayRect.centerX(), this.mDisplayRect.centerY());
            canvas.clipRect(this.mDisplayRect);
            canvas.translate(this.mDisplayRect.left, this.mDisplayRect.top);
            canvas.concat(this.mUserMatrix);
            canvas.translate(-this.mDisplayRect.left, -this.mDisplayRect.top);
            canvas.drawBitmap(this.mBitmap, this.mBitmapMatrix, this.mBitmapPaint);
            canvas.restore();
        }

        /* access modifiers changed from: 0000 */
        public ObjectAnimator getTransitionAnimator(RectF rectF, AnimatorUpdateListener animatorUpdateListener) {
            return getTransitionAnimator(rectF, true, animatorUpdateListener);
        }

        /* access modifiers changed from: 0000 */
        public ObjectAnimator getTransitionAnimator(RectF rectF, boolean z, AnimatorUpdateListener animatorUpdateListener) {
            ObjectAnimator objectAnimator;
            if (z) {
                objectAnimator = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scale", new float[]{this.mScale, 1.0f}), PropertyValuesHolder.ofInt("alpha", new int[]{this.mBitmapPaint.getAlpha(), 255}), PropertyValuesHolder.ofObject("displayRect", new RectFEvaluator(), new Object[]{new RectF(this.mDisplayRect), rectF}), PropertyValuesHolder.ofObject("userMatrix", new MatrixEvaluator(), new Object[]{new Matrix(this.mUserMatrix), new Matrix()})});
            } else {
                objectAnimator = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scale", new float[]{this.mScale, 1.0f}), PropertyValuesHolder.ofInt("alpha", new int[]{this.mBitmapPaint.getAlpha(), 255}), PropertyValuesHolder.ofObject("displayRect", new RectFEvaluator(), new Object[]{new RectF(this.mDisplayRect), rectF})});
            }
            objectAnimator.addUpdateListener(animatorUpdateListener);
            return objectAnimator;
        }

        /* access modifiers changed from: 0000 */
        public void receiveScrollEvent(float f, float f2) {
            this.mDisplayRect.offset(f, f2);
            refreshBitmapMatrix();
        }

        /* access modifiers changed from: 0000 */
        public void refreshBitmapMatrix() {
            CollageRender.initBitmapMatrix(this.mBitmapRect, this.mBitmapMatrix, this.mDisplayRect, this.mMirror, this.mRotateDegree, this.mRectTemp);
        }

        /* access modifiers changed from: 0000 */
        public void release() {
            this.mBitmap = null;
        }

        /* access modifiers changed from: 0000 */
        public void reset(AnimatorUpdateListener animatorUpdateListener, AnimatorListener animatorListener) {
            if (this.mShowAnimator != null) {
                this.mShowAnimator.cancel();
            }
            this.mTransitionAnimator = getTransitionAnimator(this.mDisplayOriginRect, false, animatorUpdateListener);
            this.mTransitionAnimator.setDuration(220);
            this.mTransitionAnimator.setInterpolator(new CubicEaseOutInterpolator());
            this.mTransitionAnimator.addListener(animatorListener);
            this.mTransitionAnimator.start();
        }

        @Keep
        public void setAlpha(int i) {
            this.mBitmapPaint.setAlpha(i);
        }

        /* access modifiers changed from: 0000 */
        public void setCollageImageView(CollageImageView collageImageView) {
            this.mBitmap = collageImageView.getBitmap();
            this.mRotateDegree = collageImageView.getRotateDegree();
            this.mMirror = collageImageView.isMirror();
            this.mBitmapRect.set(0.0f, 0.0f, (float) this.mBitmap.getWidth(), (float) this.mBitmap.getHeight());
            CollageLayout.getCollageImageViewRect(this.mDisplayOriginRect, collageImageView);
            this.mDisplayRect.set(this.mDisplayOriginRect);
            refreshBitmapMatrix();
            collageImageView.getCanvasMatrix(this.mUserMatrix);
            this.mScale = 1.0f;
            this.mBitmapPaint.setAlpha(255);
        }

        @Keep
        public void setDisplayRect(RectF rectF) {
            this.mDisplayRect.set(rectF);
            refreshBitmapMatrix();
        }

        @Keep
        public void setScale(float f) {
            this.mScale = f;
        }

        @Keep
        public void setUserMatrix(Matrix matrix) {
            this.mUserMatrix.set(matrix);
        }

        /* access modifiers changed from: 0000 */
        public void show(AnimatorUpdateListener animatorUpdateListener) {
            this.mShowAnimator = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat("scale", new float[]{this.mScale, 1.1f}), PropertyValuesHolder.ofInt("alpha", new int[]{this.mBitmapPaint.getAlpha(), 200})});
            this.mShowAnimator.setDuration(380);
            this.mShowAnimator.setInterpolator(new CubicEaseInOutInterpolator());
            this.mShowAnimator.addUpdateListener(animatorUpdateListener);
            this.mShowAnimator.start();
        }
    }

    private class DragImageHolder {
        /* access modifiers changed from: private */
        public CollageImageView mDownView;
        /* access modifiers changed from: private */
        public DragBitmapItem mDragBitmapItem;
        private boolean mDragEnable;
        /* access modifiers changed from: private */
        public boolean mExchangeEnable;
        /* access modifiers changed from: private */
        public DragBitmapItem mTargetBitmapItem;
        private AnimatorUpdateListener mUpdateListener;

        private DragImageHolder() {
            this.mDragEnable = false;
            this.mExchangeEnable = false;
            this.mDragBitmapItem = new DragBitmapItem();
            this.mTargetBitmapItem = new DragBitmapItem();
            this.mUpdateListener = new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    CollageLayout.this.invalidate();
                }
            };
        }

        /* access modifiers changed from: 0000 */
        public void disableDragMode() {
            this.mDragEnable = false;
            this.mExchangeEnable = false;
            CollageLayout.this.mActivating = false;
            CollageLayout.this.invalidate();
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas) {
            if (this.mDragEnable) {
                if (this.mExchangeEnable) {
                    this.mTargetBitmapItem.draw(canvas);
                }
                this.mDragBitmapItem.draw(canvas);
            }
        }

        /* access modifiers changed from: 0000 */
        public void enableDragMode(CollageImageView collageImageView) {
            this.mDownView = collageImageView;
            this.mDragBitmapItem.setCollageImageView(collageImageView);
            this.mDragEnable = true;
            this.mExchangeEnable = false;
            this.mDragBitmapItem.show(this.mUpdateListener);
        }

        /* access modifiers changed from: 0000 */
        public void exchangeBitmapWithAnim(final CollageImageView collageImageView) {
            this.mTargetBitmapItem.setCollageImageView(collageImageView);
            RectF rectF = new RectF();
            CollageLayout.getCollageImageViewRect(rectF, this.mDownView);
            ObjectAnimator transitionAnimator = this.mTargetBitmapItem.getTransitionAnimator(rectF, this.mUpdateListener);
            RectF rectF2 = new RectF();
            CollageLayout.getCollageImageViewRect(rectF2, collageImageView);
            ObjectAnimator transitionAnimator2 = this.mDragBitmapItem.getTransitionAnimator(rectF2, this.mUpdateListener);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.setDuration(350);
            animatorSet.setInterpolator(new CubicEaseInOutInterpolator());
            animatorSet.addListener(new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                    onAnimationEnd(animator);
                }

                public void onAnimationEnd(Animator animator) {
                    DragImageHolder.this.mDownView.resetDrawData(DragImageHolder.this.mTargetBitmapItem.mBitmap, DragImageHolder.this.mTargetBitmapItem.mRotateDegree, DragImageHolder.this.mTargetBitmapItem.mMirror);
                    collageImageView.resetDrawData(DragImageHolder.this.mDragBitmapItem.mBitmap, DragImageHolder.this.mDragBitmapItem.mRotateDegree, DragImageHolder.this.mDragBitmapItem.mMirror);
                    if (CollageLayout.this.mBitmapExchangeListener != null) {
                        CollageLayout.this.mBitmapExchangeListener.onBitmapExchange(DragImageHolder.this.mDragBitmapItem.mBitmap, DragImageHolder.this.mTargetBitmapItem.mBitmap);
                    }
                    DragImageHolder.this.mTargetBitmapItem.release();
                    DragImageHolder.this.mDragBitmapItem.release();
                    DragImageHolder.this.disableDragMode();
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                    collageImageView.setDrawBitmap(false);
                    DragImageHolder.this.mExchangeEnable = true;
                }
            });
            animatorSet.playTogether(new Animator[]{transitionAnimator2, transitionAnimator});
            animatorSet.start();
        }

        /* access modifiers changed from: 0000 */
        public void receiveScrollEvent(float f, float f2) {
            this.mDragBitmapItem.receiveScrollEvent(f, f2);
            CollageLayout.this.invalidate();
        }

        /* access modifiers changed from: 0000 */
        public void resetBitmapWithAnim() {
            this.mDragBitmapItem.reset(this.mUpdateListener, new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                    onAnimationEnd(animator);
                }

                public void onAnimationEnd(Animator animator) {
                    DragImageHolder.this.mDownView.setDrawBitmap(true);
                    DragImageHolder.this.mDragBitmapItem.release();
                    DragImageHolder.this.disableDragMode();
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                    if (DragImageHolder.this.mDragBitmapItem.mShowAnimator != null) {
                        DragImageHolder.this.mDragBitmapItem.mShowAnimator.cancel();
                    }
                }
            });
        }
    }

    public static class LayoutParams extends android.view.ViewGroup.LayoutParams {
        ImageLocation mImageLocation;

        public LayoutParams(ClipType clipType, float[] fArr) {
            super(0, 0);
            this.mImageLocation = new ImageLocation(clipType, fArr);
        }

        /* access modifiers changed from: 0000 */
        public boolean contains(float f, float f2) {
            return this.mImageLocation.getPathRegion().contains(Math.round(f), Math.round(f2));
        }
    }

    private class PopupListener implements ControlListener {
        private CollageImageView mCollageImageView;

        private PopupListener() {
        }

        public void onDismiss() {
            CollageLayout.this.mActiveIndex = -1;
            this.mCollageImageView = null;
            CollageLayout.this.invalidate();
        }

        public void onMirror() {
            if (this.mCollageImageView != null) {
                this.mCollageImageView.mirror();
            }
        }

        public void onReplace() {
            if (CollageLayout.this.mReplaceImageListener != null) {
                CollageLayout.this.mReplaceImageListener.onReplace(this.mCollageImageView.getBitmap());
            }
        }

        public void onRotate() {
            if (this.mCollageImageView != null) {
                this.mCollageImageView.rotate();
            }
        }

        /* access modifiers changed from: 0000 */
        public void setCollageSingleView(CollageImageView collageImageView) {
            this.mCollageImageView = collageImageView;
        }
    }

    public CollageLayout(Context context) {
        super(context);
        init(context);
    }

    public CollageLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public CollageLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    /* access modifiers changed from: private */
    public void doVibrator() {
        performHapticFeedback(0);
    }

    /* access modifiers changed from: private */
    public CollageImageView findSingleView(float f, float f2) {
        for (int i = 0; i < getChildCount(); i++) {
            CollageImageView collageImageView = (CollageImageView) getChildAt(i);
            if (((LayoutParams) collageImageView.getLayoutParams()).contains(f, f2)) {
                return collageImageView;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public static void getCollageImageViewRect(RectF rectF, CollageImageView collageImageView) {
        collageImageView.getDisplayRect(rectF);
        rectF.offset((float) collageImageView.getLeft(), (float) collageImageView.getTop());
    }

    private int getLeftPadding() {
        return Math.max(getPaddingLeft(), getPaddingStart());
    }

    private int getRightPadding() {
        return Math.max(getPaddingRight(), getPaddingEnd());
    }

    private void init(Context context) {
        this.mContext = context;
        this.mGestureDetector = new GestureDetector(this.mContext, this.mGestureListener);
        this.mScaleGestureDetector = new ScaleGestureDetector(this.mContext, this.mGestureListener);
        setWillNotDraw(false);
        this.mControlPopupWindow = new ControlPopupWindow(context);
        this.mControlPopupWindow.setControlListener(this.mPopupListener);
        this.mStrokeColor = context.getResources().getColor(R.color.collage_table_text_color_checked);
        this.mActiveLineWidth = context.getResources().getDimensionPixelSize(R.dimen.collage_stroke_line_width);
        this.mActiveLineWidthWhite = context.getResources().getDimensionPixelSize(R.dimen.collage_stroke_line_width_white);
        if (this.mActiveLineWidth % 2 != 0) {
            this.mActiveLineWidth++;
        }
        if (this.mActiveLineWidthWhite % 2 != 0) {
            this.mActiveLineWidthWhite++;
        }
        this.mPathPaint.setStyle(Style.STROKE);
        this.mPathPaint.setStrokeWidth(10.0f);
        this.mDensity = context.getResources().getDisplayMetrics().density;
    }

    private boolean isChildActivating() {
        for (int i = 0; i < getChildCount(); i++) {
            if (((CollageImageView) getChildAt(i)).isActivating()) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: private */
    public void setActive(View view) {
        this.mActiveIndex = indexOfChild(view);
    }

    public void dismissControlWindow() {
        if (this.mControlPopupWindow != null && this.mControlPopupWindow.isShowing()) {
            this.mControlPopupWindow.dismiss();
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mActiveIndex != -1) {
            LayoutParams layoutParams = (LayoutParams) ((CollageImageView) getChildAt(this.mActiveIndex)).getLayoutParams();
            canvas.save();
            canvas.clipPath(layoutParams.mImageLocation.getPathForClip());
            int i = this.mActiveLineWidth;
            this.mPathPaint.setStrokeWidth((float) (this.mActiveLineWidthWhite + i));
            this.mPathPaint.setColor(-1);
            canvas.drawPath(layoutParams.mImageLocation.getPathForClip(), this.mPathPaint);
            this.mPathPaint.setStrokeWidth((float) i);
            this.mPathPaint.setColor(this.mStrokeColor);
            canvas.drawPath(layoutParams.mImageLocation.getPathForClip(), this.mPathPaint);
            canvas.restore();
        }
        this.mDragImageHolder.draw(canvas);
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View view, long j) {
        canvas.save();
        canvas.clipPath(((LayoutParams) view.getLayoutParams()).mImageLocation.getPathForClip());
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas.restore();
        return drawChild;
    }

    public float getMargin() {
        return this.mMargin;
    }

    public boolean isActivating() {
        return this.mActivating || isChildActivating();
    }

    public boolean isIgnoreEdgeMargin() {
        return this.mIgnoreEdgeMargin;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int leftPadding = getLeftPadding();
        int rightPadding = getRightPadding();
        int paddingTop = getPaddingTop();
        int width = (getWidth() - leftPadding) - rightPadding;
        int height = (getHeight() - paddingTop) - getPaddingBottom();
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                this.mImageLocationProcessor.processorImageLocation(layoutParams.mImageLocation, (float) width, (float) height, this.mMargin, this.mIgnoreEdgeMargin);
                childAt.layout(Math.round((float) (layoutParams.mImageLocation.getLeft() + leftPadding)), Math.round((float) (layoutParams.mImageLocation.getTop() + paddingTop)), Math.round((float) (layoutParams.mImageLocation.getRight() + leftPadding)), Math.round((float) (layoutParams.mImageLocation.getBottom() + paddingTop)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        measureChildren(i, i2);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.mScaleGestureDetector.onTouchEvent(motionEvent);
        this.mGestureDetector.onTouchEvent(motionEvent);
        switch (motionEvent.getAction()) {
            case 1:
            case 3:
                this.mGestureListener.onUp();
                break;
            case 2:
                this.mGestureListener.onActionMove(motionEvent);
                break;
        }
        return true;
    }

    public void setBitmapExchangeListener(BitmapExchangeListener bitmapExchangeListener) {
        this.mBitmapExchangeListener = bitmapExchangeListener;
    }

    public void setCollageMargin(float f, boolean z) {
        this.mIgnoreEdgeMargin = z;
        this.mMargin = f * this.mDensity;
        requestLayout();
    }

    public void setMasks(Drawable[] drawableArr) {
        int childCount = getChildCount();
        boolean z = drawableArr != null && drawableArr.length > 0;
        for (int i = 0; i < childCount; i++) {
            CollageImageView collageImageView = (CollageImageView) getChildAt(i);
            if (!z || i >= drawableArr.length) {
                collageImageView.setMask(null);
            } else {
                collageImageView.setMask(drawableArr[i]);
            }
        }
    }

    public void setRadius(float[] fArr) {
        int childCount = getChildCount();
        boolean z = fArr != null && fArr.length > 0;
        for (int i = 0; i < childCount; i++) {
            CollageImageView collageImageView = (CollageImageView) getChildAt(i);
            if (!z || i >= fArr.length) {
                collageImageView.setRadius(0.0f);
            } else {
                collageImageView.setRadius(fArr[i]);
            }
        }
    }

    public void setReplaceImageListener(ReplaceImageListener replaceImageListener) {
        this.mReplaceImageListener = replaceImageListener;
    }
}
