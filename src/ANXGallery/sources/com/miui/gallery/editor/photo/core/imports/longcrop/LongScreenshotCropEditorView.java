package com.miui.gallery.editor.photo.core.imports.longcrop;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.miui.gallery.R;

public class LongScreenshotCropEditorView extends View implements AnimatorUpdateListener {
    private Callback mAnimatorCallback;
    private LongCropViewAnimatorHelper mAnimatorHelper;
    private Paint mBitmapPaint;
    private Matrix mBitmapToDisplayMatrix;
    private Rect mBmpRect;
    private Drawable mBorder;
    private RectF mBounds;
    private Bitmap mCorner;
    private int mCornerBarWidth;
    private RectF mCropRect;
    private float mCropYFirst;
    private int mDragLineEdge;
    private int mDragState;
    private int mMinHeight;
    private Drawable mOriginalBmp;
    private Paint mPaint;
    private int mPaintColor;
    /* access modifiers changed from: private */
    public Bitmap mPreviewBmp;
    private Bitmap mScissor;
    private Drawable mShadow;
    private ValueAnimator mShowOriginalAnimator;
    private float mShowOriginalBmp;
    /* access modifiers changed from: private */
    public Rect mShowRect;
    private boolean mShowShadow;
    private float mTouchDownY;

    public static class Entry {
        public float mBottomRatio;
        public float mTopRatio;

        public Entry() {
            this(0.0f, 1.0f);
        }

        public Entry(float f, float f2) {
            this.mTopRatio = f;
            this.mBottomRatio = f2;
        }

        public Bitmap apply(Bitmap bitmap) {
            if (!isModified()) {
                return bitmap;
            }
            int height = (int) ((((float) bitmap.getHeight()) * this.mTopRatio) + 0.5f);
            Bitmap createBitmap = Bitmap.createBitmap(bitmap.getWidth(), ((int) ((((float) bitmap.getHeight()) * this.mBottomRatio) + 0.5f)) - height, Config.ARGB_8888);
            new Canvas(createBitmap).drawBitmap(bitmap, 0.0f, (float) (-height), null);
            return createBitmap;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Entry)) {
                return false;
            }
            Entry entry = (Entry) obj;
            if (this.mTopRatio == entry.mTopRatio && this.mBottomRatio == entry.mBottomRatio) {
                z = true;
            }
            return z;
        }

        public boolean isModified() {
            return (this.mTopRatio == 0.0f && this.mBottomRatio == 1.0f) ? false : true;
        }
    }

    public LongScreenshotCropEditorView(Context context) {
        this(context, null);
    }

    public LongScreenshotCropEditorView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mBounds = new RectF();
        this.mPaint = new Paint();
        this.mPaintColor = -1;
        this.mShowShadow = true;
        this.mBitmapPaint = new Paint(3);
        this.mBitmapToDisplayMatrix = new Matrix();
        this.mAnimatorCallback = new Callback() {
            public Bitmap getPreBitmap() {
                return LongScreenshotCropEditorView.this.mPreviewBmp;
            }

            public Rect getShowRect() {
                return LongScreenshotCropEditorView.this.mShowRect;
            }

            public void onInvalidate() {
                LongScreenshotCropEditorView.this.invalidate();
            }
        };
        this.mDragLineEdge = getResources().getDimensionPixelSize(R.dimen.longscreenshot_crop_drag_edge);
        this.mCornerBarWidth = getResources().getDimensionPixelSize(R.dimen.longscreenshot_crop_cornor_bar_width);
        this.mMinHeight = getResources().getDimensionPixelSize(R.dimen.longscreenshot_crop_min_height);
        this.mPaint.setStrokeWidth(getResources().getDisplayMetrics().density * 0.7f);
        this.mShowOriginalAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mShowOriginalAnimator.addUpdateListener(this);
        this.mBorder = getResources().getDrawable(R.drawable.long_screenshot_cut_photo_border);
        this.mShadow = getResources().getDrawable(R.drawable.long_screenshot_cut_photo_shadow);
        this.mCorner = BitmapFactory.decodeResource(getResources(), R.drawable.long_screenshot_cut_corner);
        this.mScissor = BitmapFactory.decodeResource(getResources(), R.drawable.long_screenshot_cut_scissor);
    }

    private static void calcFixCenter(int i, int i2, int[] iArr) {
        float f = ((float) iArr[0]) / ((float) i);
        float f2 = ((float) iArr[1]) / ((float) i2);
        if (f > f2) {
            iArr[0] = i;
            iArr[1] = (int) ((((float) iArr[1]) / f) + 0.5f);
            return;
        }
        iArr[0] = (int) ((((float) iArr[0]) / f2) + 0.5f);
        iArr[1] = i2;
    }

    private int detectBeginDragState(float f) {
        if (Math.abs(f - this.mCropRect.top) <= ((float) this.mDragLineEdge)) {
            return 2;
        }
        return Math.abs(f - this.mCropRect.bottom) <= ((float) this.mDragLineEdge) ? 1 : 0;
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas, Rect rect) {
    }

    public Entry export() {
        return new Entry((this.mCropRect.top - ((float) this.mShowRect.top)) / ((float) this.mShowRect.height()), (this.mCropRect.bottom - ((float) this.mShowRect.top)) / ((float) this.mShowRect.height()));
    }

    public boolean isEmpty() {
        return this.mCropRect.contains(new RectF(this.mShowRect));
    }

    public void onAnimationUpdate(ValueAnimator valueAnimator) {
        this.mShowOriginalBmp = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        invalidate();
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x015a, code lost:
        r6 = r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x015b, code lost:
        r11.drawLine(0.0f, r6, (float) getWidth(), r6, r10.mPaint);
        r11.drawBitmap(r10.mScissor, 0.0f, r6 - ((float) (r10.mScissor.getHeight() / 2)), r10.mPaint);
     */
    public void onDraw(Canvas canvas) {
        float f;
        if (this.mPreviewBmp != null) {
            if (this.mAnimatorHelper == null || this.mAnimatorHelper.isAnimatorEnd()) {
                this.mPaint.setColor(this.mPaintColor);
                int i = (int) (this.mShowOriginalBmp * 153.0f);
                if (i > 0 && this.mOriginalBmp != null) {
                    float f2 = this.mDragState == 1 ? (((this.mCropRect.bottom - ((float) this.mShowRect.top)) / ((float) this.mShowRect.height())) * ((float) this.mOriginalBmp.getBounds().height())) - this.mCropRect.bottom : this.mDragState == 2 ? (((this.mCropRect.top - ((float) this.mShowRect.top)) / ((float) this.mShowRect.height())) * ((float) this.mOriginalBmp.getBounds().height())) - this.mCropRect.top : 0.0f;
                    canvas.translate(0.0f, -f2);
                    this.mOriginalBmp.setAlpha(i);
                    this.mOriginalBmp.draw(canvas);
                    canvas.translate(0.0f, f2);
                }
                if (this.mShowShadow) {
                    this.mBorder.draw(canvas);
                    this.mShadow.draw(canvas);
                }
                this.mPaint.setAlpha((int) (this.mShowOriginalBmp * 178.0f));
                switch (this.mDragState) {
                    case 1:
                        canvas.drawRect(0.0f, this.mCropRect.bottom, (float) getWidth(), (float) getHeight(), this.mPaint);
                        break;
                    case 2:
                        canvas.drawRect(0.0f, 0.0f, (float) getWidth(), this.mCropRect.top, this.mPaint);
                        break;
                }
                canvas.drawBitmap(this.mPreviewBmp, this.mBitmapToDisplayMatrix, this.mBitmapPaint);
                canvas.save();
                canvas.clipRect(this.mShowRect);
                drawChild(canvas, this.mShowRect);
                canvas.restore();
                if (this.mShowShadow) {
                    this.mPaint.setAlpha((int) (((1.0f - this.mShowOriginalBmp) * 77.0f) + 127.0f));
                    canvas.drawRect((float) this.mShowRect.left, (float) this.mShowRect.top, (float) this.mShowRect.right, this.mCropRect.top, this.mPaint);
                    canvas.drawRect((float) this.mShowRect.left, this.mCropRect.bottom, (float) this.mShowRect.right, (float) this.mShowRect.bottom, this.mPaint);
                }
                if (i > 0) {
                    this.mPaint.setColor(-1996488705);
                    this.mPaint.setAlpha(i);
                    switch (this.mDragState) {
                        case 1:
                            f = this.mCropRect.bottom;
                            break;
                        case 2:
                            f = this.mCropRect.top;
                            break;
                        default:
                            float f3 = 0.0f;
                            break;
                    }
                }
                canvas.translate((float) (this.mShowRect.left - this.mCornerBarWidth), this.mCropRect.top - ((float) this.mCornerBarWidth));
                canvas.drawBitmap(this.mCorner, 0.0f, 0.0f, null);
                canvas.translate((float) (this.mShowRect.width() + (this.mCornerBarWidth * 2)), 0.0f);
                canvas.scale(-1.0f, 1.0f);
                canvas.drawBitmap(this.mCorner, 0.0f, 0.0f, null);
                canvas.translate(0.0f, this.mCropRect.height() + ((float) (this.mCornerBarWidth * 2)));
                canvas.scale(1.0f, -1.0f);
                canvas.drawBitmap(this.mCorner, 0.0f, 0.0f, null);
                canvas.translate((float) (this.mShowRect.width() + (this.mCornerBarWidth * 2)), 0.0f);
                canvas.scale(-1.0f, 1.0f);
                canvas.drawBitmap(this.mCorner, 0.0f, 0.0f, null);
                return;
            }
            this.mAnimatorHelper.draw(canvas);
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mBounds.set((float) getPaddingLeft(), (float) getPaddingTop(), (float) (i - getPaddingRight()), (float) (i2 - getPaddingBottom()));
        this.mBounds.inset((float) this.mCornerBarWidth, (float) this.mCornerBarWidth);
        refreshBounds();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.mDragState = detectBeginDragState(motionEvent.getY());
                this.mTouchDownY = motionEvent.getY();
                if (this.mDragState == 1) {
                    this.mCropYFirst = this.mCropRect.bottom;
                } else if (this.mDragState == 2) {
                    this.mCropYFirst = this.mCropRect.top;
                }
                if (this.mDragState != 0) {
                    this.mShowOriginalAnimator.start();
                    break;
                }
                break;
            case 1:
            case 3:
                if (this.mDragState != 0) {
                    this.mShowOriginalAnimator.reverse();
                    break;
                }
                break;
            case 2:
                float y = this.mCropYFirst + (motionEvent.getY() - this.mTouchDownY) + 0.5f;
                switch (this.mDragState) {
                    case 1:
                        this.mCropRect.set(this.mCropRect.left, this.mCropRect.top, this.mCropRect.right, Math.max(Math.min(y, (float) this.mShowRect.bottom), this.mCropRect.top + ((float) this.mMinHeight)));
                        break;
                    case 2:
                        this.mCropRect.set(this.mCropRect.left, Math.min(Math.max(y, (float) this.mShowRect.top), this.mCropRect.bottom - ((float) this.mMinHeight)), this.mCropRect.right, this.mCropRect.bottom);
                        break;
                }
                invalidate();
                break;
        }
        return true;
    }

    public void refreshBounds() {
        if (this.mPreviewBmp != null && this.mBounds != null) {
            this.mBmpRect = new Rect(0, 0, this.mPreviewBmp.getWidth(), this.mPreviewBmp.getHeight());
            int[] iArr = {this.mBmpRect.width(), this.mBmpRect.height()};
            calcFixCenter((int) this.mBounds.width(), (int) this.mBounds.height(), iArr);
            int width = ((int) this.mBounds.left) + ((((int) this.mBounds.width()) - iArr[0]) / 2);
            int height = ((int) this.mBounds.top) + ((((int) this.mBounds.height()) - iArr[1]) / 2);
            this.mShowRect = new Rect(width, height, iArr[0] + width, iArr[1] + height);
            this.mCropRect = new RectF(this.mShowRect);
            this.mBitmapToDisplayMatrix.setRectToRect(new RectF(this.mBmpRect), this.mBounds, ScaleToFit.CENTER);
            Rect rect = new Rect();
            this.mBorder.getPadding(rect);
            this.mBorder.setBounds(this.mShowRect.left - rect.left, this.mShowRect.top - rect.top, this.mShowRect.right + rect.right, this.mShowRect.bottom + rect.bottom);
            this.mShadow.getPadding(rect);
            this.mShadow.setBounds(this.mShowRect.left - rect.left, this.mShowRect.top - rect.top, this.mShowRect.right + rect.right, this.mShowRect.bottom + rect.bottom);
            invalidate();
        }
    }

    public void setBitmap(Bitmap bitmap) {
        this.mPreviewBmp = bitmap;
        refreshBounds();
    }

    public void setBounds(RectF rectF) {
        this.mBounds = rectF;
        refreshBounds();
    }

    public void setOriginalBitmap(Bitmap bitmap, float f, float f2) {
        this.mOriginalBmp = new LongBitmapDrawable(bitmap);
        Rect rect = new Rect();
        rect.left = 0;
        rect.right = bitmap.getWidth();
        rect.top = Math.round(((float) bitmap.getHeight()) * f);
        rect.bottom = Math.round(((float) bitmap.getHeight()) * f2);
        this.mOriginalBmp.setBounds(rect);
    }

    public void setPaintColor(int i) {
        this.mPaintColor = i;
    }

    public void setShowShadow(boolean z) {
        this.mShowShadow = z;
    }

    public void startEnterAnimator(int[] iArr) {
        if (this.mAnimatorHelper == null) {
            this.mAnimatorHelper = new LongCropViewAnimatorHelper();
        }
        this.mAnimatorHelper.startEnterAnimation(this.mAnimatorCallback, iArr);
    }
}
