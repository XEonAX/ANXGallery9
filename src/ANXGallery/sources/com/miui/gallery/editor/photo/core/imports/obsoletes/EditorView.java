package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.animation.Animator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import com.miui.gallery.editor.photo.widgets.StrokeImageHelper;

public class EditorView extends View {
    /* access modifiers changed from: private */
    public Bitmap mBitmap;
    /* access modifiers changed from: private */
    public RectF mBitmapBounds;
    /* access modifiers changed from: private */
    public RectF mBitmapDisplayBounds;
    /* access modifiers changed from: private */
    public Matrix mBitmapToCanvas;
    /* access modifiers changed from: private */
    public RectF mCanvasBounds;
    private boolean mDrawBoundLine;
    private EventHandler mEventHandler;
    private Paint mPaint;
    private Plugin mPlugin;
    private Rect mRect;
    private StrokeImageHelper mStrokeImageHelper;

    public static abstract class Plugin {
        /* access modifiers changed from: private */
        public EditorView mEditorView;
        /* access modifiers changed from: private */
        public EventHandler mEventHandler;
        protected ValueAnimator mImageAnimator;
        private PropertyValuesHolder mTransValues;
        private AnimatorUpdateListener mTranslateUpdateListener = new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Plugin.this.getImageMatrix().set((Matrix) Plugin.this.mImageAnimator.getAnimatedValue());
                Plugin.this.invalidate();
            }
        };

        protected interface BoundsFixCallback {
            void onDone();
        }

        private class BoundsFixListener extends OneShotAnimateListener {
            private BoundsFixCallback mCallback;

            public BoundsFixListener(BoundsFixCallback boundsFixCallback) {
                this.mCallback = boundsFixCallback;
            }

            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                this.mCallback.onDone();
            }
        }

        private void ensureStarted() {
            if (this.mEditorView == null) {
                throw new IllegalStateException("Current plugin is not installed.");
            }
        }

        protected static float resolveScale(RectF rectF, RectF rectF2) {
            float width = rectF2.width() > rectF.width() ? rectF2.width() / rectF.width() : 1.0f;
            return rectF2.height() > rectF.height() ? Math.max(width, rectF2.height() / rectF.height()) : width;
        }

        protected static void resolveTranslate(RectF rectF, RectF rectF2, PointF pointF) {
            float f = 0.0f;
            if (!rectF.contains(rectF2)) {
                float f2 = rectF2.top < rectF.top ? rectF2.top - rectF.top : rectF2.bottom > rectF.bottom ? rectF2.bottom - rectF.bottom : 0.0f;
                if (rectF2.left < rectF.left) {
                    f = rectF2.left - rectF.left;
                } else if (rectF2.right > rectF.right) {
                    f = rectF2.right - rectF.right;
                }
                pointF.x = f;
                pointF.y = f2;
                return;
            }
            pointF.x = 0.0f;
            pointF.y = 0.0f;
        }

        /* access modifiers changed from: protected */
        public void config(Canvas canvas) {
        }

        /* access modifiers changed from: protected */
        public boolean draw(Canvas canvas) {
            return false;
        }

        /* access modifiers changed from: protected */
        public void drawOverlay(Canvas canvas) {
        }

        /* access modifiers changed from: protected */
        public void fixImageBounds(RectF rectF, BoundsFixCallback boundsFixCallback) {
            Matrix imageMatrix = getImageMatrix();
            RectF imageBounds = getImageBounds();
            Matrix matrix = new Matrix();
            imageMatrix.invert(matrix);
            RectF rectF2 = new RectF();
            matrix.mapRect(rectF2, rectF);
            if (!imageBounds.contains(rectF2)) {
                Matrix matrix2 = new Matrix(imageMatrix);
                Matrix matrix3 = new Matrix(imageMatrix);
                if (rectF2.width() > imageBounds.width() || rectF2.height() > imageBounds.height()) {
                    float resolveScale = resolveScale(imageBounds, rectF2);
                    matrix3.preScale(resolveScale, resolveScale, rectF2.centerX(), rectF2.centerY());
                }
                matrix3.invert(matrix);
                matrix.mapRect(rectF2, rectF);
                if (!imageBounds.contains(rectF2)) {
                    PointF pointF = new PointF();
                    resolveTranslate(getImageBounds(), rectF2, pointF);
                    matrix3.preTranslate(pointF.x, pointF.y);
                }
                setupImageAnimator(matrix2, matrix3, boundsFixCallback == null ? null : new BoundsFixListener(boundsFixCallback));
                this.mImageAnimator.start();
            } else if (boundsFixCallback != null) {
                boundsFixCallback.onDone();
            }
        }

        /* access modifiers changed from: protected */
        public final RectF getBounds() {
            ensureStarted();
            return this.mEditorView.mCanvasBounds;
        }

        /* access modifiers changed from: protected */
        public final Context getContext() {
            return this.mEditorView.getContext();
        }

        /* access modifiers changed from: protected */
        public final EventHandler getEventHandler() {
            ensureStarted();
            return this.mEventHandler;
        }

        /* access modifiers changed from: protected */
        public final Bitmap getImage() {
            return this.mEditorView.mBitmap;
        }

        /* access modifiers changed from: protected */
        public final RectF getImageBounds() {
            ensureStarted();
            return this.mEditorView.mBitmapBounds;
        }

        /* access modifiers changed from: protected */
        public final RectF getImageDisplayBounds() {
            ensureStarted();
            return this.mEditorView.mBitmapDisplayBounds;
        }

        /* access modifiers changed from: protected */
        public final Matrix getImageMatrix() {
            ensureStarted();
            return this.mEditorView.mBitmapToCanvas;
        }

        /* access modifiers changed from: protected */
        public final void invalidate() {
            ensureStarted();
            this.mEditorView.invalidate();
        }

        /* access modifiers changed from: protected */
        public void onMatrixChanged() {
        }

        /* access modifiers changed from: protected */
        public abstract void onStart();

        /* access modifiers changed from: protected */
        public abstract boolean onTouchEvent(MotionEvent motionEvent);

        /* access modifiers changed from: protected */
        public void setupImageAnimator(Matrix matrix, Matrix matrix2, OneShotAnimateListener oneShotAnimateListener) {
            if (this.mImageAnimator == null) {
                this.mImageAnimator = new ValueAnimator();
                this.mTransValues = PropertyValuesHolder.ofObject("matrix", new TranslateEvaluator(), new Object[]{matrix, matrix2});
                this.mImageAnimator.setObjectValues(new Object[]{this.mTransValues});
                this.mImageAnimator.addUpdateListener(this.mTranslateUpdateListener);
            }
            this.mTransValues.setObjectValues(new Object[]{matrix, matrix2});
            this.mImageAnimator.setDuration(300);
            this.mImageAnimator.setValues(new PropertyValuesHolder[]{this.mTransValues});
            if (oneShotAnimateListener != null) {
                this.mImageAnimator.addListener(oneShotAnimateListener);
            }
        }

        public void start() {
            onStart();
            invalidate();
        }
    }

    public EditorView(Context context) {
        super(context);
        this.mCanvasBounds = new RectF();
        this.mBitmapBounds = new RectF();
        this.mBitmapDisplayBounds = new RectF();
        this.mBitmapToCanvas = new Matrix();
        this.mPlugin = null;
        this.mRect = new Rect();
        this.mPaint = new Paint(7);
        this.mDrawBoundLine = true;
        initialize();
        setBackground(null);
    }

    public EditorView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public EditorView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mCanvasBounds = new RectF();
        this.mBitmapBounds = new RectF();
        this.mBitmapDisplayBounds = new RectF();
        this.mBitmapToCanvas = new Matrix();
        this.mPlugin = null;
        this.mRect = new Rect();
        this.mPaint = new Paint(7);
        this.mDrawBoundLine = true;
        initialize();
        setBackground(null);
    }

    private void initialize() {
        this.mEventHandler = new EventHandler();
        this.mStrokeImageHelper = new StrokeImageHelper(getContext());
    }

    private void notifyMatrixChanged() {
        if (this.mPlugin != null) {
            this.mPlugin.onMatrixChanged();
        }
    }

    private void resetMatrix() {
        this.mBitmapToCanvas.setRectToRect(this.mBitmapBounds, this.mCanvasBounds, ScaleToFit.CENTER);
        this.mBitmapDisplayBounds.set(this.mBitmapBounds);
        this.mBitmapToCanvas.mapRect(this.mBitmapDisplayBounds, this.mBitmapBounds);
        notifyMatrixChanged();
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public void install(Plugin plugin) {
        plugin.mEditorView = this;
        plugin.mEventHandler = this.mEventHandler;
        this.mPlugin = plugin;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int saveCount = canvas.getSaveCount();
        if (this.mPlugin != null) {
            this.mPlugin.config(canvas);
        }
        if ((this.mPlugin == null || !this.mPlugin.draw(canvas)) && this.mBitmap != null) {
            canvas.drawBitmap(this.mBitmap, this.mBitmapToCanvas, this.mPaint);
        }
        if (this.mPlugin != null) {
            this.mPlugin.drawOverlay(canvas);
        }
        if (this.mDrawBoundLine) {
            this.mStrokeImageHelper.draw(canvas, this.mBitmapBounds, this.mBitmapToCanvas);
        }
        canvas.restoreToCount(saveCount);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (MeasureSpec.getMode(i) == Integer.MIN_VALUE && MeasureSpec.getMode(i2) == Integer.MIN_VALUE) {
            int size = MeasureSpec.getSize(i);
            int size2 = MeasureSpec.getSize(i2);
            if (this.mBitmap != null) {
                float f = (float) size;
                float width = f / ((float) this.mBitmap.getWidth());
                float f2 = (float) size2;
                float height = f2 / ((float) this.mBitmap.getHeight());
                if (width > height) {
                    size = (int) ((f * height) / width);
                } else {
                    size2 = (int) ((f2 * width) / height);
                }
            }
            setMeasuredDimension(size, size2);
            return;
        }
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int i3 = paddingLeft + paddingRight;
        if (this.mBitmap != null) {
            i3 += this.mBitmap.getWidth();
        }
        int i4 = paddingTop + paddingBottom;
        if (this.mBitmap != null) {
            i4 += this.mBitmap.getHeight();
        }
        setMeasuredDimension(resolveSizeAndState(Math.max(i3, getSuggestedMinimumWidth()), i, 0), resolveSizeAndState(Math.max(i4, getSuggestedMinimumHeight()), i2, 0));
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (this.mCanvasBounds.isEmpty()) {
            this.mCanvasBounds.left = (float) getPaddingLeft();
            this.mCanvasBounds.top = (float) getPaddingTop();
            this.mCanvasBounds.right = (float) (i - getPaddingRight());
            this.mCanvasBounds.bottom = (float) (i2 - getPaddingBottom());
            resetMatrix();
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return this.mPlugin != null && this.mPlugin.onTouchEvent(motionEvent);
    }

    public void setBitmap(Bitmap bitmap) {
        this.mBitmap = bitmap;
        if (bitmap == null) {
            this.mBitmapBounds.right = 0.0f;
            this.mBitmapBounds.bottom = 0.0f;
        } else {
            this.mBitmapBounds.right = (float) bitmap.getWidth();
            this.mBitmapBounds.bottom = (float) bitmap.getHeight();
        }
        resetMatrix();
        invalidate();
    }

    public void setDrawBoundLine(boolean z) {
        this.mDrawBoundLine = z;
    }
}
