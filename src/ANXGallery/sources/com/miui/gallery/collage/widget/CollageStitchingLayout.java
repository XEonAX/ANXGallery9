package com.miui.gallery.collage.widget;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.transition.TransitionManager;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.widget.OverScroller;
import com.miui.gallery.R;
import com.miui.gallery.collage.CollageActivity.ReplaceImageListener;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.core.stitching.StitchingModel;
import com.miui.gallery.collage.render.CollageRender;
import com.miui.gallery.collage.render.CollageRender.BitmapRenderData;
import com.miui.gallery.editor.photo.app.MatrixEvaluator;
import com.miui.gallery.editor.photo.core.imports.obsoletes.RectFEvaluator;
import com.miui.gallery.util.Log;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class CollageStitchingLayout extends ViewGroup {
    private final String PROPERTY_NAME_ALPHA = "property_name_alpha";
    private final String PROPERTY_NAME_MATRIX = "property_name_matrix";
    private final String PROPERTY_NAME_RECT = "property_name_rect";
    private int mActiveLineWidth;
    private int mActiveLineWidthWhite;
    /* access modifiers changed from: private */
    public CollageImageView mActiveView = null;
    private int mBackGroundColor;
    private Paint mBackgroundPaint = new Paint(1);
    private BitmapPositionHolder mBitmapPositionHolder;
    private Bitmap[] mBitmaps;
    private RectF mCanvasRect = new RectF();
    private ControlListener mControlListener = new ControlListener() {
        public void onDismiss() {
        }

        public void onMirror() {
            if (CollageStitchingLayout.this.mActiveView != null) {
                CollageStitchingLayout.this.mActiveView.mirror();
            }
        }

        public void onReplace() {
            if (CollageStitchingLayout.this.mReplaceImageListener != null && CollageStitchingLayout.this.mActiveView != null) {
                CollageStitchingLayout.this.mReplaceImageListener.onReplace(CollageStitchingLayout.this.mActiveView.getBitmap());
                CollageStitchingLayout.this.setActiveView(null);
            }
        }

        public void onRotate() {
        }
    };
    private ControlPopupWindow mControlPopupWindow;
    private Rect mDisplayRect = new Rect();
    private GestureDetector mDragModeDetector;
    /* access modifiers changed from: private */
    public boolean mEnableDragMode = false;
    private GestureDetector mGestureDetector;
    private Map<Bitmap, CollageImageView> mImageViewMap = new HashMap();
    /* access modifiers changed from: private */
    public ItemDragHelper mItemDragHelper;
    /* access modifiers changed from: private */
    public int mMaxScrollY;
    /* access modifiers changed from: private */
    public int mMinScrollY;
    private Path mPath = new Path();
    private Paint mPathPaint = new Paint();
    /* access modifiers changed from: private */
    public RectF mRectF = new RectF();
    /* access modifiers changed from: private */
    public ReplaceImageListener mReplaceImageListener;
    private ValueAnimator mScrollAnimator;
    private AnimatorUpdateListener mScrollAnimatorUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            if (CollageStitchingLayout.this.mScrollSpeed != 0.0f) {
                int access$1100 = CollageStitchingLayout.this.appendScroll(CollageStitchingLayout.this.mScrollSpeed);
                if (access$1100 != 0) {
                    CollageStitchingLayout.this.mItemDragHelper.notifySwipe((float) access$1100);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public float mScrollSpeed = 0.0f;
    /* access modifiers changed from: private */
    public OverScroller mScroller;
    private StitchingModel mStitchingModel;
    private int mStrokeColor;

    public static class BitmapPositionHolder {
        public final int[] bitmapHeights;
        public int bitmapWidth;
        public int height;
        public int horizontalOffset;
        public int verticalOffset;

        public BitmapPositionHolder(int i) {
            this.bitmapHeights = new int[i];
        }
    }

    private class DragGestureListener implements OnGestureListener {
        private DragGestureListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            return false;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            CollageStitchingLayout.this.computeScrollSpeed(motionEvent2.getY() - motionEvent.getY());
            CollageStitchingLayout.this.mItemDragHelper.onScroll(f2);
            return true;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            return false;
        }
    }

    private class GestureListener implements OnGestureListener {
        private GestureListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            CollageStitchingLayout.this.mScroller.abortAnimation();
            CollageStitchingLayout.this.mEnableDragMode = false;
            CollageStitchingLayout.this.mScrollSpeed = 0.0f;
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            CollageStitchingLayout.this.mScroller.fling(CollageStitchingLayout.this.getScrollX(), CollageStitchingLayout.this.getScrollY(), Math.round(-f), Math.round(-f2), CollageStitchingLayout.this.getScrollX(), CollageStitchingLayout.this.getScrollX(), CollageStitchingLayout.this.mMinScrollY, CollageStitchingLayout.this.mMaxScrollY);
            CollageStitchingLayout.this.invalidate();
            return true;
        }

        public void onLongPress(MotionEvent motionEvent) {
            CollageStitchingLayout.this.performHapticFeedback(0);
            CollageStitchingLayout.this.mEnableDragMode = true;
            CollageStitchingLayout.this.notifyZoomOut(motionEvent.getY());
            CollageStitchingLayout.this.startContinueScroll();
            CollageStitchingLayout.this.mItemDragHelper.enableDragMode(CollageStitchingLayout.this.findTargetView(motionEvent.getY()), motionEvent.getY());
            CollageStitchingLayout.this.setActiveView(null);
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            CollageStitchingLayout.this.setActiveView(null);
            CollageStitchingLayout.this.appendScroll(f2);
            return true;
        }

        public void onShowPress(MotionEvent motionEvent) {
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            CollageStitchingLayout.this.setActiveView(CollageStitchingLayout.this.findSingleView(motionEvent.getX(), motionEvent.getY()));
            return true;
        }
    }

    private class ItemDragHelper {
        private AnimatorUpdateListener mAnimatorUpdateListener;
        RectF mClipRect;
        CollageImageView mCollageImageView;
        RectF mCurrentBitmapRect;
        float mCurrentY;
        Bitmap mDragBitmap;
        RectF mDragBitmapRect;
        ValueAnimator mHideAnimator;
        private AnimatorListener mHideListener;
        boolean mInDragMode;
        Matrix mMatrix;
        Paint mPaint;
        ValueAnimator mShowAnimator;
        RectF mViewRect;

        private ItemDragHelper() {
            this.mPaint = new Paint(3);
            this.mDragBitmapRect = new RectF();
            this.mViewRect = new RectF();
            this.mClipRect = new RectF();
            this.mCurrentBitmapRect = new RectF();
            this.mMatrix = new Matrix();
            this.mShowAnimator = null;
            this.mHideAnimator = null;
            this.mInDragMode = false;
            this.mCurrentY = 0.0f;
            this.mHideListener = new AnimatorListener() {
                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    ItemDragHelper.this.mCollageImageView.setVisibility(0);
                    ItemDragHelper.this.mDragBitmap = null;
                    ItemDragHelper.this.mCollageImageView = null;
                    CollageStitchingLayout.this.invalidate();
                }

                public void onAnimationRepeat(Animator animator) {
                }

                public void onAnimationStart(Animator animator) {
                }
            };
            this.mAnimatorUpdateListener = new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ItemDragHelper.this.mPaint.setAlpha(((Integer) valueAnimator.getAnimatedValue("property_name_alpha")).intValue());
                    Object animatedValue = valueAnimator.getAnimatedValue("property_name_matrix");
                    if (animatedValue != null) {
                        ItemDragHelper.this.mMatrix.set((Matrix) animatedValue);
                    }
                    Object animatedValue2 = valueAnimator.getAnimatedValue("property_name_rect");
                    if (animatedValue2 != null) {
                        ItemDragHelper.this.mClipRect.set((RectF) animatedValue2);
                    }
                    CollageStitchingLayout.this.invalidate();
                }
            };
        }

        /* access modifiers changed from: 0000 */
        public void disableDragMode() {
            if (this.mInDragMode && this.mCollageImageView != null) {
                startHideAnimator();
            }
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas) {
            if (this.mInDragMode && this.mDragBitmap != null) {
                canvas.save();
                canvas.translate(0.0f, (float) CollageStitchingLayout.this.getScrollY());
                canvas.clipRect(this.mClipRect);
                canvas.drawBitmap(this.mDragBitmap, this.mMatrix, this.mPaint);
                canvas.restore();
            }
        }

        /* access modifiers changed from: 0000 */
        public void enableDragMode(CollageImageView collageImageView, float f) {
            this.mInDragMode = false;
            if (collageImageView == null) {
                this.mCollageImageView = null;
                this.mDragBitmap = null;
                return;
            }
            this.mDragBitmap = collageImageView.getBitmap();
            if (this.mDragBitmap == null) {
                this.mCollageImageView = null;
                return;
            }
            this.mInDragMode = true;
            this.mCollageImageView = collageImageView;
            this.mDragBitmapRect.set(0.0f, 0.0f, (float) this.mDragBitmap.getWidth(), (float) this.mDragBitmap.getHeight());
            CollageStitchingLayout.this.getChildRect(this.mViewRect, collageImageView);
            CollageStitchingLayout.this.convertCoordinateToParent(this.mViewRect);
            this.mClipRect.set(this.mViewRect);
            CollageRender.initBitmapMatrix(this.mDragBitmapRect, this.mMatrix, this.mViewRect, collageImageView.isMirror(), collageImageView.getRotateDegree(), CollageStitchingLayout.this.mRectF);
            this.mCurrentY = f;
            this.mMatrix.mapRect(this.mCurrentBitmapRect, this.mDragBitmapRect);
            this.mCollageImageView.setVisibility(4);
            startShowAnimator();
        }

        /* access modifiers changed from: 0000 */
        public void notifySwipe(float f) {
            if (this.mInDragMode && this.mCollageImageView != null) {
                Log.d("CollageStitchingLayout", "notifySwipe distance : %f", (Object) Float.valueOf(f));
                if (f > 0.0f) {
                    int indexOfChild = CollageStitchingLayout.this.indexOfChild(this.mCollageImageView);
                    int i = indexOfChild + 1;
                    View childAt = CollageStitchingLayout.this.getChildAt(i);
                    if (childAt != null) {
                        CollageStitchingLayout.this.getChildRect(CollageStitchingLayout.this.mRectF, childAt);
                        CollageStitchingLayout.this.convertCoordinateToParent(CollageStitchingLayout.this.mRectF);
                        if (this.mClipRect.bottom - CollageStitchingLayout.this.mRectF.top >= CollageStitchingLayout.this.mRectF.height() * 0.3f) {
                            CollageStitchingLayout.this.swipeViewIndex(indexOfChild, i);
                        }
                    }
                } else if (f < 0.0f) {
                    int indexOfChild2 = CollageStitchingLayout.this.indexOfChild(this.mCollageImageView);
                    int i2 = indexOfChild2 - 1;
                    View childAt2 = CollageStitchingLayout.this.getChildAt(i2);
                    if (childAt2 != null) {
                        CollageStitchingLayout.this.getChildRect(CollageStitchingLayout.this.mRectF, childAt2);
                        CollageStitchingLayout.this.convertCoordinateToParent(CollageStitchingLayout.this.mRectF);
                        if (CollageStitchingLayout.this.mRectF.bottom - this.mClipRect.top >= CollageStitchingLayout.this.mRectF.height() * 0.3f) {
                            CollageStitchingLayout.this.swipeViewIndex(indexOfChild2, i2);
                        }
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void onScroll(float f) {
            if (this.mInDragMode) {
                this.mCurrentY -= f;
                float f2 = -f;
                this.mMatrix.postTranslate(0.0f, f2);
                this.mMatrix.mapRect(this.mCurrentBitmapRect, this.mDragBitmapRect);
                this.mClipRect.offset(0.0f, f2);
                notifySwipe(f2);
                CollageStitchingLayout.this.invalidate();
            }
        }

        /* access modifiers changed from: 0000 */
        public void startHideAnimator() {
            if (this.mShowAnimator != null) {
                this.mShowAnimator.cancel();
            }
            Matrix matrix = new Matrix();
            CollageStitchingLayout.this.getChildRect(CollageStitchingLayout.this.mRectF, this.mCollageImageView);
            CollageStitchingLayout.this.convertCoordinateToParent(CollageStitchingLayout.this.mRectF);
            CollageRender.initBitmapMatrix(this.mDragBitmapRect, matrix, CollageStitchingLayout.this.mRectF, this.mCollageImageView.isMirror(), this.mCollageImageView.getRotateDegree(), new RectF());
            this.mHideAnimator = ValueAnimator.ofPropertyValuesHolder(new PropertyValuesHolder[]{PropertyValuesHolder.ofInt("property_name_alpha", new int[]{this.mPaint.getAlpha(), 255}), PropertyValuesHolder.ofObject("property_name_matrix", new MatrixEvaluator(), new Object[]{new Matrix(this.mMatrix), matrix}), PropertyValuesHolder.ofObject("property_name_rect", new RectFEvaluator(), new Object[]{new RectF(this.mClipRect), CollageStitchingLayout.this.mRectF})});
            this.mHideAnimator.setDuration(300);
            this.mHideAnimator.addUpdateListener(this.mAnimatorUpdateListener);
            this.mHideAnimator.addListener(this.mHideListener);
            this.mHideAnimator.start();
        }

        /* access modifiers changed from: 0000 */
        public void startShowAnimator() {
            if (this.mShowAnimator != null) {
                this.mShowAnimator.cancel();
            }
            this.mShowAnimator = ValueAnimator.ofPropertyValuesHolder(new PropertyValuesHolder[]{PropertyValuesHolder.ofInt("property_name_alpha", new int[]{255, Math.round(127.5f)})});
            this.mShowAnimator.setDuration(300);
            this.mShowAnimator.addUpdateListener(this.mAnimatorUpdateListener);
            this.mShowAnimator.start();
        }
    }

    private static class LayoutParams extends android.view.ViewGroup.LayoutParams {
        public int bottom;
        public int left;
        public int right;
        public int top;

        public LayoutParams() {
            super(0, 0);
        }

        public void set(int i, int i2, int i3, int i4) {
            this.left = i;
            this.top = i2;
            this.right = i3;
            this.bottom = i4;
        }
    }

    public static class RenderData {
        public BitmapRenderData[] bitmapRenderDatas;
        public StitchingModel stitchingModel;
        public int viewWidth;
    }

    public CollageStitchingLayout(Context context) {
        super(context);
        init();
    }

    public CollageStitchingLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public CollageStitchingLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    /* access modifiers changed from: private */
    public int appendScroll(float f) {
        int scrollY = getScrollY() + Math.round(f);
        if (scrollY > this.mMaxScrollY) {
            scrollY = this.mMaxScrollY;
        } else if (scrollY < this.mMinScrollY) {
            scrollY = this.mMinScrollY;
        }
        int scrollY2 = scrollY - getScrollY();
        if (scrollY2 != 0) {
            scrollTo(getScrollX(), scrollY);
            invalidate();
        }
        return scrollY2;
    }

    /* access modifiers changed from: private */
    public void cancelContinueScroll() {
        if (this.mScrollAnimator != null) {
            this.mScrollAnimator.cancel();
            this.mScrollAnimator = null;
        }
    }

    /* access modifiers changed from: private */
    public void computeScrollSpeed(float f) {
        boolean z = f < 0.0f;
        float abs = Math.abs(f);
        if (abs < 100.0f) {
            this.mScrollSpeed = 0.0f;
            return;
        }
        if (abs > ((float) this.mDisplayRect.height())) {
            abs = (float) this.mDisplayRect.height();
        }
        this.mScrollSpeed = (((abs - 100.0f) * 65.0f) / ((float) (this.mDisplayRect.height() - 100))) + 5.0f;
        if (z) {
            this.mScrollSpeed = -this.mScrollSpeed;
        }
    }

    /* access modifiers changed from: private */
    public void convertCoordinateToParent(RectF rectF) {
        rectF.offset(0.0f, (float) (-getScrollY()));
    }

    private void doZoomInAnimator() {
        ViewPropertyAnimator animate = animate();
        animate.scaleX(1.0f);
        animate.scaleY(1.0f);
        animate.setDuration(300);
        animate.start();
    }

    private void doZoomOutAnimator(float f) {
        setPivotY(f);
        ViewPropertyAnimator animate = animate();
        animate.scaleX(0.6f);
        animate.scaleY(0.6f);
        animate.setDuration(300);
        animate.start();
    }

    /* access modifiers changed from: private */
    public CollageImageView findSingleView(float f, float f2) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            CollageImageView collageImageView = (CollageImageView) getChildAt(i);
            getChildRect(this.mRectF, collageImageView);
            convertCoordinateToParent(this.mRectF);
            if (this.mRectF.contains(f, f2)) {
                return collageImageView;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public CollageImageView findTargetView(float f) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            CollageImageView collageImageView = (CollageImageView) getChildAt(i);
            getChildRect(this.mRectF, collageImageView);
            convertCoordinateToParent(this.mRectF);
            if (f > this.mRectF.top && f <= this.mRectF.bottom) {
                return collageImageView;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void getChildRect(RectF rectF, View view) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        rectF.set((float) layoutParams.left, (float) layoutParams.top, (float) layoutParams.right, (float) layoutParams.bottom);
    }

    private void init() {
        setClipChildren(false);
        this.mGestureDetector = new GestureDetector(getContext(), new GestureListener());
        this.mGestureDetector.setIsLongpressEnabled(true);
        this.mDragModeDetector = new GestureDetector(getContext(), new DragGestureListener());
        this.mDragModeDetector.setIsLongpressEnabled(false);
        this.mItemDragHelper = new ItemDragHelper();
        this.mBackGroundColor = -1;
        this.mBackgroundPaint.setColor(this.mBackGroundColor);
        this.mBackgroundPaint.setStyle(Style.FILL);
        this.mScroller = new OverScroller(getContext());
        this.mStrokeColor = getResources().getColor(R.color.collage_table_text_color_checked);
        this.mActiveLineWidth = getResources().getDimensionPixelSize(R.dimen.collage_stroke_line_width);
        this.mActiveLineWidthWhite = getResources().getDimensionPixelSize(R.dimen.collage_stroke_line_width_white);
        this.mPathPaint.setStyle(Style.STROKE);
        this.mPathPaint.setStrokeWidth((float) this.mActiveLineWidth);
        if (this.mActiveLineWidth % 2 != 0) {
            this.mActiveLineWidth++;
        }
        if (this.mActiveLineWidthWhite % 2 != 0) {
            this.mActiveLineWidthWhite++;
        }
        this.mControlPopupWindow = new ControlPopupWindow(getContext(), false);
        this.mControlPopupWindow.setControlListener(this.mControlListener);
    }

    /* access modifiers changed from: private */
    public void notifyZoomIn(float f) {
        doZoomInAnimator();
    }

    /* access modifiers changed from: private */
    public void notifyZoomOut(float f) {
        doZoomOutAnimator(f);
    }

    private void refreshScrollLimit() {
        this.mMinScrollY = getTop();
        if (getBottom() - getTop() > this.mDisplayRect.height()) {
            this.mMaxScrollY = getBottom() - this.mDisplayRect.height();
        } else {
            this.mMaxScrollY = 0;
        }
    }

    /* access modifiers changed from: private */
    public void scrollToMin() {
        scrollTo(getScrollX(), this.mMinScrollY);
        invalidate();
    }

    /* access modifiers changed from: private */
    public void setActiveView(CollageImageView collageImageView) {
        if (collageImageView == null || collageImageView == this.mActiveView) {
            dismissControlWindow();
            this.mActiveView = null;
        } else {
            this.mActiveView = collageImageView;
            this.mControlPopupWindow.showAtLocation((View) getParent(), this.mActiveView, true);
        }
        invalidate();
    }

    private void setChildMask(Drawable drawable) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            ((CollageImageView) getChildAt(i)).setMask(drawable);
        }
    }

    private void setChildRadius(int i) {
        int childCount = getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            ((CollageImageView) getChildAt(i2)).setRadius((float) i);
        }
    }

    /* access modifiers changed from: private */
    public void startContinueScroll() {
        if (this.mScrollAnimator != null) {
            this.mScrollAnimator.cancel();
        }
        this.mScrollAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mScrollAnimator.setDuration(1000);
        this.mScrollAnimator.setRepeatCount(-1);
        this.mScrollAnimator.addUpdateListener(this.mScrollAnimatorUpdateListener);
        this.mScrollAnimator.start();
    }

    private void swipeArrays(int i, int i2) {
        Bitmap bitmap = this.mBitmaps[i];
        this.mBitmaps[i] = this.mBitmaps[i2];
        this.mBitmaps[i2] = bitmap;
    }

    /* access modifiers changed from: private */
    public void swipeViewIndex(int i, int i2) {
        if (this.mEnableDragMode) {
            int min = Math.min(i, i2);
            int max = Math.max(i, i2);
            TransitionManager.beginDelayedTransition(this);
            swipeArrays(min, max);
            View childAt = getChildAt(min);
            View childAt2 = getChildAt(max);
            removeView(childAt);
            removeView(childAt2);
            addView(childAt2, min);
            addView(childAt, max);
        }
    }

    public void computeScroll() {
        if (this.mScroller.computeScrollOffset()) {
            scrollTo(this.mScroller.getCurrX(), this.mScroller.getCurrY());
            invalidate();
        }
    }

    public void dismissControlWindow() {
        if (this.mControlPopupWindow != null && this.mControlPopupWindow.isShowing()) {
            this.mControlPopupWindow.dismiss();
        }
        if (this.mActiveView != null) {
            this.mActiveView = null;
            invalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        canvas.drawRect(this.mCanvasRect, this.mBackgroundPaint);
        super.dispatchDraw(canvas);
        if (this.mActiveView != null) {
            int scrollY = getScrollY();
            LayoutParams layoutParams = (LayoutParams) this.mActiveView.getLayoutParams();
            this.mRectF.set((float) layoutParams.left, (float) layoutParams.top, (float) layoutParams.right, (float) layoutParams.bottom);
            this.mRectF.offset(0.0f, (float) (-scrollY));
            this.mRectF.intersect((float) this.mDisplayRect.left, (float) this.mDisplayRect.top, (float) this.mDisplayRect.right, (float) this.mDisplayRect.bottom);
            this.mRectF.offset(0.0f, (float) scrollY);
            this.mPath.reset();
            this.mPath.addRect(this.mRectF, Direction.CW);
            canvas.save();
            canvas.clipRect(this.mRectF);
            int i = this.mActiveLineWidth;
            this.mPathPaint.setStrokeWidth((float) (this.mActiveLineWidthWhite + i));
            this.mPathPaint.setColor(-1);
            canvas.drawPath(this.mPath, this.mPathPaint);
            this.mPathPaint.setStrokeWidth((float) i);
            this.mPathPaint.setColor(this.mStrokeColor);
            canvas.drawPath(this.mPath, this.mPathPaint);
            canvas.restore();
        }
        this.mItemDragHelper.draw(canvas);
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View view, long j) {
        return super.drawChild(canvas, view, j);
    }

    public RenderData generateRenderData() {
        RenderData renderData = new RenderData();
        int childCount = getChildCount();
        renderData.bitmapRenderDatas = new BitmapRenderData[childCount];
        for (int i = 0; i < childCount; i++) {
            renderData.bitmapRenderDatas[i] = ((CollageImageView) getChildAt(i)).generateBitmapRenderData();
        }
        renderData.stitchingModel = this.mStitchingModel;
        renderData.viewWidth = getWidth();
        return renderData;
    }

    public void notifyBitmapReplace(Bitmap bitmap, Bitmap bitmap2) {
        int i = 0;
        while (true) {
            if (i >= this.mBitmaps.length) {
                break;
            } else if (this.mBitmaps[i] == bitmap) {
                this.mBitmaps[i] = bitmap2;
                break;
            } else {
                i++;
            }
        }
        CollageImageView collageImageView = (CollageImageView) this.mImageViewMap.get(bitmap);
        collageImageView.setBitmap(bitmap2);
        this.mImageViewMap.remove(bitmap);
        this.mImageViewMap.put(bitmap2, collageImageView);
        requestLayout();
        post(new Runnable() {
            public void run() {
                CollageStitchingLayout.this.scrollToMin();
            }
        });
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        this.mDisplayRect.set(0, 0, i3 - i, ((View) getParent()).getHeight());
        if (this.mBitmapPositionHolder != null) {
            int childCount = getChildCount();
            int i5 = this.mBitmapPositionHolder.bitmapWidth;
            int i6 = this.mBitmapPositionHolder.horizontalOffset;
            int i7 = this.mBitmapPositionHolder.verticalOffset;
            int i8 = i6 > 0 ? i7 + 0 : 0;
            for (int i9 = 0; i9 < childCount; i9++) {
                View childAt = getChildAt(i9);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                int i10 = this.mBitmapPositionHolder.bitmapHeights[i9] + i8;
                int i11 = i5 + i6;
                childAt.layout(i6, i8, i11, i10);
                layoutParams.set(i6, i8, i11, i10);
                i8 = i10 + i7;
            }
            refreshScrollLimit();
            if (this.mItemDragHelper.mCollageImageView != null) {
                getChildRect(this.mRectF, this.mItemDragHelper.mCollageImageView);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int i3;
        int size = MeasureSpec.getSize(i);
        if (this.mStitchingModel == null || this.mBitmapPositionHolder == null) {
            i3 = 0;
        } else {
            this.mStitchingModel.countHeight(size, this.mBitmapPositionHolder, this.mBitmaps);
            i3 = this.mBitmapPositionHolder.height;
        }
        this.mCanvasRect.set(0.0f, 0.0f, (float) size, (float) i3);
        super.onMeasure(MeasureSpec.makeMeasureSpec(size, 1073741824), MeasureSpec.makeMeasureSpec(i3, 1073741824));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0024, code lost:
        r4 = false;
     */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action != 3) {
            switch (action) {
                case 0:
                    this.mGestureDetector.onTouchEvent(motionEvent);
                    this.mDragModeDetector.onTouchEvent(motionEvent);
                    break;
                case 1:
                    break;
                default:
                    this.mGestureDetector.onTouchEvent(motionEvent);
                    if (this.mEnableDragMode) {
                        this.mDragModeDetector.onTouchEvent(motionEvent);
                        break;
                    }
                    break;
            }
        }
        this.mGestureDetector.onTouchEvent(motionEvent);
        this.mDragModeDetector.onTouchEvent(motionEvent);
        boolean z = true;
        if (z && this.mEnableDragMode) {
            post(new Runnable() {
                public void run() {
                    CollageStitchingLayout.this.notifyZoomIn(0.0f);
                    CollageStitchingLayout.this.cancelContinueScroll();
                    CollageStitchingLayout.this.mItemDragHelper.disableDragMode();
                    CollageStitchingLayout.this.mEnableDragMode = false;
                }
            });
        }
        return true;
    }

    public void setBitmaps(Bitmap[] bitmapArr) {
        removeAllViews();
        this.mBitmaps = bitmapArr;
        for (Bitmap bitmap : bitmapArr) {
            CollageImageView collageImageView = new CollageImageView(getContext());
            collageImageView.setBitmap(bitmap);
            collageImageView.setBackgroundColor(this.mBackGroundColor);
            addView(collageImageView, new LayoutParams());
            this.mImageViewMap.put(bitmap, collageImageView);
        }
        this.mBitmapPositionHolder = new BitmapPositionHolder(this.mBitmaps.length);
        requestLayout();
    }

    public void setReplaceImageListener(ReplaceImageListener replaceImageListener) {
        this.mReplaceImageListener = replaceImageListener;
    }

    public void setStitchingModel(StitchingModel stitchingModel) {
        this.mStitchingModel = stitchingModel;
        setChildRadius(stitchingModel.radius);
        if (!TextUtils.isEmpty(stitchingModel.mask)) {
            Resources resources = getResources();
            StringBuilder sb = new StringBuilder();
            sb.append(stitchingModel.relativePath);
            sb.append(File.separator);
            sb.append(stitchingModel.mask);
            setChildMask(CollageUtils.getDrawableByAssets(resources, sb.toString()));
        } else {
            setChildMask(null);
        }
        requestLayout();
        post(new Runnable() {
            public void run() {
                CollageStitchingLayout.this.scrollToMin();
            }
        });
    }
}
