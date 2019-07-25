package com.miui.gallery.widget;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.util.AttributeSet;
import android.view.animation.LinearInterpolator;
import android.widget.ProgressBar;

public class CircleProgressBar extends ProgressBar {
    private Path mArcPath;
    private RectF mArcRect;
    private Bitmap mBitmapForSoftLayer;
    private Canvas mCanvasForSoftLayer;
    private Animator mChangeProgressAnimator;
    private int mCurrentLevel;
    private Drawable[] mLevelsBackDrawable;
    private Drawable[] mLevelsForeDrawable;
    private Drawable[] mLevelsMiddleDrawable;
    private Paint mPaint;
    private int mPrevAlpha;
    private int mPrevLevel;
    private OnProgressChangedListener mProgressChangedListener;
    private int[] mProgressLevels;
    private int mRotateVelocity;
    private Drawable mThumb;

    public interface OnProgressChangedListener {
        void onProgressChanged();
    }

    public CircleProgressBar(Context context) {
        this(context, null);
    }

    public CircleProgressBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CircleProgressBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mArcPath = new Path();
        this.mRotateVelocity = 300;
        setIndeterminate(false);
        this.mPaint = new Paint(1);
        this.mPaint.setColor(-16777216);
    }

    private int calcDuration(int i) {
        return (i * 1000) / this.mRotateVelocity;
    }

    private void drawLayer(Canvas canvas, Drawable drawable, Drawable drawable2, Drawable drawable3, float f, int i) {
        Canvas canvas2 = canvas;
        Drawable drawable4 = drawable;
        Drawable drawable5 = drawable2;
        Drawable drawable6 = drawable3;
        int i2 = i;
        if (drawable4 != null) {
            drawable4.setAlpha(i2);
            drawable4.draw(canvas2);
        }
        if (drawable6 != null) {
            if (canvas.isHardwareAccelerated()) {
                Canvas canvas3 = canvas;
                canvas3.saveLayer((float) drawable3.getBounds().left, (float) drawable3.getBounds().top, (float) drawable3.getBounds().right, (float) drawable3.getBounds().bottom, null);
                canvas3.drawArc(this.mArcRect, -90.0f, f * 360.0f, true, this.mPaint);
                drawable6.setAlpha(i2);
                drawable6.draw(canvas2);
                canvas.restore();
            } else {
                if (this.mBitmapForSoftLayer == null) {
                    this.mBitmapForSoftLayer = Bitmap.createBitmap(drawable3.getBounds().width(), drawable3.getBounds().height(), Config.ARGB_8888);
                    this.mCanvasForSoftLayer = new Canvas(this.mBitmapForSoftLayer);
                }
                this.mBitmapForSoftLayer.eraseColor(0);
                this.mCanvasForSoftLayer.save();
                this.mCanvasForSoftLayer.translate((float) (-drawable3.getBounds().left), (float) (-drawable3.getBounds().top));
                this.mCanvasForSoftLayer.drawArc(this.mArcRect, -90.0f, f * 360.0f, true, this.mPaint);
                drawable6.setAlpha(i2);
                drawable6.draw(this.mCanvasForSoftLayer);
                this.mCanvasForSoftLayer.restore();
                canvas2.drawBitmap(this.mBitmapForSoftLayer, (float) drawable3.getBounds().left, (float) drawable3.getBounds().top, null);
            }
        }
        Drawable drawable7 = this.mThumb;
        if (drawable7 != null) {
            canvas.save();
            int width = ((getWidth() - getPaddingLeft()) - getPaddingRight()) / 2;
            int height = ((getHeight() - getPaddingTop()) - getPaddingBottom()) / 2;
            int intrinsicWidth = drawable7.getIntrinsicWidth();
            int intrinsicHeight = drawable7.getIntrinsicHeight();
            canvas2.rotate((((float) getProgress()) * 360.0f) / ((float) getMax()), (float) width, (float) height);
            int i3 = intrinsicWidth / 2;
            int i4 = intrinsicHeight / 2;
            drawable7.setBounds(width - i3, height - i4, width + i3, height + i4);
            drawable7.draw(canvas2);
            canvas.restore();
        }
        if (drawable5 != null) {
            drawable5.setAlpha(i2);
            drawable5.draw(canvas2);
        }
    }

    private Rect getCenterAlignRect(Rect rect, int i, int i2, int i3, int i4) {
        rect.set((i - i3) / 2, (i2 - i4) / 2, (i + i3) / 2, (i2 + i4) / 2);
        return rect;
    }

    private Drawable[] getDrawables(int[] iArr) {
        if (iArr == null) {
            return null;
        }
        Resources resources = getContext().getResources();
        Drawable[] drawableArr = new Drawable[iArr.length];
        for (int i = 0; i < iArr.length; i++) {
            drawableArr[i] = resources.getDrawable(iArr[i]);
        }
        return drawableArr;
    }

    private int getIntrinsicHeight() {
        int intrinsicHeight = getMiddleDrawable(0).getIntrinsicHeight();
        if (this.mLevelsForeDrawable != null) {
            intrinsicHeight = Math.max(intrinsicHeight, this.mLevelsForeDrawable[0].getIntrinsicHeight());
        }
        return this.mLevelsBackDrawable != null ? Math.max(intrinsicHeight, this.mLevelsBackDrawable[0].getIntrinsicHeight()) : intrinsicHeight;
    }

    private int getIntrinsicWidth() {
        int intrinsicWidth = this.mLevelsMiddleDrawable != null ? getMiddleDrawable(0).getIntrinsicWidth() : 0;
        if (this.mLevelsForeDrawable != null) {
            intrinsicWidth = Math.max(intrinsicWidth, this.mLevelsForeDrawable[0].getIntrinsicWidth());
        }
        return this.mLevelsBackDrawable != null ? Math.max(intrinsicWidth, this.mLevelsBackDrawable[0].getIntrinsicWidth()) : intrinsicWidth;
    }

    private void updateDrawableBounds() {
        Drawable[] drawableArr;
        Drawable[] drawableArr2;
        Drawable[] drawableArr3;
        int intrinsicWidth = getIntrinsicWidth();
        int intrinsicHeight = getIntrinsicHeight();
        Rect rect = new Rect();
        if (this.mLevelsBackDrawable != null) {
            for (Drawable drawable : this.mLevelsBackDrawable) {
                drawable.setBounds(getCenterAlignRect(rect, intrinsicWidth, intrinsicHeight, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight()));
            }
        }
        if (this.mLevelsMiddleDrawable != null) {
            for (Drawable drawable2 : this.mLevelsMiddleDrawable) {
                drawable2.setBounds(getCenterAlignRect(rect, intrinsicWidth, intrinsicHeight, drawable2.getIntrinsicWidth(), drawable2.getIntrinsicHeight()));
            }
            Drawable drawable3 = this.mLevelsMiddleDrawable[0];
            this.mArcRect = new RectF((float) (drawable3.getBounds().left - 5), (float) (drawable3.getBounds().top - 5), (float) (drawable3.getBounds().right + 5), (float) (drawable3.getBounds().bottom + 5));
        }
        if (this.mLevelsForeDrawable != null) {
            for (Drawable drawable4 : this.mLevelsForeDrawable) {
                drawable4.setBounds(getCenterAlignRect(rect, intrinsicWidth, intrinsicHeight, drawable4.getIntrinsicWidth(), drawable4.getIntrinsicHeight()));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        int progressLevelCount = getProgressLevelCount();
        for (int i = 0; i < progressLevelCount; i++) {
            if (this.mLevelsBackDrawable != null) {
                this.mLevelsBackDrawable[i].setState(getDrawableState());
            }
            if (this.mLevelsMiddleDrawable != null) {
                this.mLevelsMiddleDrawable[i].setState(getDrawableState());
            }
            if (this.mLevelsForeDrawable != null) {
                this.mLevelsForeDrawable[i].setState(getDrawableState());
            }
        }
        invalidate();
    }

    /* access modifiers changed from: protected */
    public Drawable getBackDrawable(int i) {
        if (this.mLevelsBackDrawable == null) {
            return null;
        }
        return this.mLevelsBackDrawable[i];
    }

    /* access modifiers changed from: protected */
    public int getCurrentLevel() {
        return this.mCurrentLevel;
    }

    /* access modifiers changed from: protected */
    public Drawable getForeDrawable(int i) {
        if (this.mLevelsForeDrawable == null) {
            return null;
        }
        return this.mLevelsForeDrawable[i];
    }

    /* access modifiers changed from: protected */
    public Drawable getMiddleDrawable(int i) {
        if (this.mLevelsMiddleDrawable == null) {
            return null;
        }
        return this.mLevelsMiddleDrawable[i];
    }

    public int getPrevAlpha() {
        return this.mPrevAlpha;
    }

    public int getProgressLevelCount() {
        if (this.mProgressLevels == null) {
            return 1;
        }
        return 1 + this.mProgressLevels.length;
    }

    /* access modifiers changed from: protected */
    public float getRate() {
        return ((float) getProgress()) / ((float) getMax());
    }

    /* access modifiers changed from: protected */
    public synchronized void onDraw(Canvas canvas) {
        drawLayer(canvas, getBackDrawable(this.mCurrentLevel), getForeDrawable(this.mCurrentLevel), getMiddleDrawable(this.mCurrentLevel), getRate(), 255 - this.mPrevAlpha);
        if (this.mPrevAlpha >= 10) {
            drawLayer(canvas, getBackDrawable(this.mPrevLevel), getForeDrawable(this.mPrevLevel), getMiddleDrawable(this.mPrevLevel), getRate(), this.mPrevAlpha);
        }
    }

    /* access modifiers changed from: protected */
    public synchronized void onMeasure(int i, int i2) {
        setMeasuredDimension(getIntrinsicWidth(), getIntrinsicHeight());
    }

    public void setDrawablesForLevels(int[] iArr, int[] iArr2, int[] iArr3) {
        setDrawablesForLevels(getDrawables(iArr), getDrawables(iArr2), getDrawables(iArr3));
        updateDrawableBounds();
    }

    public void setDrawablesForLevels(Drawable[] drawableArr, Drawable[] drawableArr2, Drawable[] drawableArr3) {
        this.mLevelsBackDrawable = drawableArr;
        this.mLevelsMiddleDrawable = drawableArr2;
        this.mLevelsForeDrawable = drawableArr3;
        if (drawableArr != null) {
            for (Drawable mutate : drawableArr) {
                mutate.mutate();
            }
        }
        if (drawableArr2 != null) {
            for (Drawable mutate2 : drawableArr2) {
                mutate2.mutate();
            }
        }
        if (drawableArr3 != null) {
            for (Drawable mutate3 : drawableArr3) {
                mutate3.mutate();
            }
        }
        if (drawableArr2 != null) {
            for (BitmapDrawable bitmapDrawable : drawableArr2) {
                if (bitmapDrawable instanceof BitmapDrawable) {
                    bitmapDrawable.getPaint().setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
                } else if (bitmapDrawable instanceof NinePatchDrawable) {
                    ((NinePatchDrawable) bitmapDrawable).getPaint().setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
                } else {
                    throw new IllegalArgumentException("'middles' must a bitmap or nine patch drawable.");
                }
            }
        }
    }

    public void setOnProgressChangedListener(OnProgressChangedListener onProgressChangedListener) {
        this.mProgressChangedListener = onProgressChangedListener;
    }

    public void setPrevAlpha(int i) {
        this.mPrevAlpha = i;
        invalidate();
    }

    public synchronized void setProgress(int i) {
        int i2;
        super.setProgress(i);
        if (this.mProgressLevels == null) {
            i2 = 0;
        } else {
            i2 = this.mProgressLevels.length;
            int i3 = 0;
            while (true) {
                if (i3 >= i2) {
                    i3 = -1;
                    break;
                } else if (i < this.mProgressLevels[i3]) {
                    break;
                } else {
                    i3++;
                }
            }
            if (i3 != -1) {
                i2 = i3;
            }
        }
        if (i2 != this.mCurrentLevel) {
            this.mPrevLevel = this.mCurrentLevel;
            this.mCurrentLevel = i2;
            setPrevAlpha(255);
            ObjectAnimator ofInt = ObjectAnimator.ofInt(this, "prevAlpha", new int[]{0});
            ofInt.setDuration(300);
            ofInt.setInterpolator(new LinearInterpolator());
            ofInt.start();
        }
        if (this.mProgressChangedListener != null) {
            this.mProgressChangedListener.onProgressChanged();
        }
    }

    public void setProgressByAnimator(int i) {
        setProgressByAnimator(i, null);
    }

    public void setProgressByAnimator(int i, AnimatorListener animatorListener) {
        stopProgressAnimator();
        int abs = Math.abs((int) ((((float) (i - getProgress())) / ((float) getMax())) * 360.0f));
        this.mChangeProgressAnimator = ObjectAnimator.ofInt(this, "progress", new int[]{i});
        this.mChangeProgressAnimator.setDuration((long) calcDuration(abs));
        this.mChangeProgressAnimator.setInterpolator(getInterpolator());
        if (animatorListener != null) {
            this.mChangeProgressAnimator.addListener(animatorListener);
        }
        this.mChangeProgressAnimator.start();
    }

    public void setProgressLevels(int[] iArr) {
        this.mProgressLevels = iArr;
    }

    public void setRotateVelocity(int i) {
        this.mRotateVelocity = i;
    }

    public void setThumb(int i) {
        setThumb(getResources().getDrawable(i));
    }

    public void setThumb(Drawable drawable) {
        this.mThumb = drawable;
    }

    public void stopProgressAnimator() {
        if (this.mChangeProgressAnimator != null && this.mChangeProgressAnimator.isRunning()) {
            this.mChangeProgressAnimator.cancel();
        }
    }
}
