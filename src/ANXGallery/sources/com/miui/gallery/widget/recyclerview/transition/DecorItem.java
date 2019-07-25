package com.miui.gallery.widget.recyclerview.transition;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView.ScaleType;
import java.lang.ref.WeakReference;

final class DecorItem {
    int mAnimAlpha;
    private final RectF mAnimFrame;
    Drawable mDrawable;
    int mFromAlpha;
    RectF mFromFrame;
    WeakReference<View> mHost;
    String mLocalPath;
    Matrix mMatrix;
    ScaleType mScaleType;
    private RectF mTemp1;
    private RectF mTemp2;
    int mToAlpha;
    RectF mToFrame;

    /* renamed from: com.miui.gallery.widget.recyclerview.transition.DecorItem$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ScaleType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(8:0|1|2|3|4|5|6|8) */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        static {
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_START.ordinal()] = 1;
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_CENTER.ordinal()] = 2;
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_END.ordinal()] = 3;
            } catch (NoSuchFieldError unused) {
            }
        }
    }

    static final class Builder {
        /* access modifiers changed from: private */
        public Drawable mDrawable;
        /* access modifiers changed from: private */
        public int mFromAlpha = 255;
        /* access modifiers changed from: private */
        public RectF mFromFrame;
        /* access modifiers changed from: private */
        public View mHost;
        /* access modifiers changed from: private */
        public String mLocalPath;
        /* access modifiers changed from: private */
        public ScaleType mScaleType;
        /* access modifiers changed from: private */
        public int mToAlpha;
        /* access modifiers changed from: private */
        public RectF mToFrame;

        public Builder(View view) {
            this.mHost = view;
        }

        public DecorItem build() {
            return new DecorItem(this, null);
        }

        public Builder setDrawable(Drawable drawable) {
            this.mDrawable = drawable;
            return this;
        }

        public Builder setFromAlpha(int i) {
            this.mFromAlpha = i;
            return this;
        }

        public Builder setFromFrame(RectF rectF) {
            this.mFromFrame = rectF;
            return this;
        }

        public Builder setLocalPath(String str) {
            this.mLocalPath = str;
            return this;
        }

        public Builder setScaleType(ScaleType scaleType) {
            this.mScaleType = scaleType;
            return this;
        }

        public Builder setToAlpha(int i) {
            this.mToAlpha = i;
            return this;
        }

        public Builder setToFrame(RectF rectF) {
            this.mToFrame = rectF;
            return this;
        }
    }

    private DecorItem(Builder builder) {
        this.mHost = new WeakReference<>(builder.mHost);
        this.mLocalPath = builder.mLocalPath;
        this.mScaleType = builder.mScaleType;
        this.mFromFrame = builder.mFromFrame;
        this.mToFrame = builder.mToFrame;
        this.mFromAlpha = builder.mFromAlpha;
        this.mToAlpha = builder.mToAlpha;
        this.mMatrix = new Matrix();
        this.mAnimFrame = new RectF();
        updateDrawable(builder.mDrawable);
    }

    /* synthetic */ DecorItem(Builder builder, AnonymousClass1 r2) {
        this(builder);
    }

    private void configureBounds() {
        float f;
        float f2;
        if (this.mDrawable != null) {
            int intrinsicWidth = this.mDrawable.getIntrinsicWidth();
            int intrinsicHeight = this.mDrawable.getIntrinsicHeight();
            int width = (int) this.mAnimFrame.width();
            int height = (int) this.mAnimFrame.height();
            boolean z = (intrinsicWidth < 0 || width == intrinsicWidth) && (intrinsicHeight < 0 || height == intrinsicHeight);
            this.mMatrix.reset();
            if (intrinsicWidth <= 0 || intrinsicHeight <= 0 || ScaleType.FIT_XY == this.mScaleType) {
                this.mDrawable.setBounds(0, 0, width, height);
            } else {
                this.mDrawable.setBounds(0, 0, intrinsicWidth, intrinsicHeight);
                if (ScaleType.MATRIX != this.mScaleType && !z) {
                    if (ScaleType.CENTER == this.mScaleType) {
                        this.mMatrix.setTranslate((float) Math.round(((float) (width - intrinsicWidth)) * 0.5f), (float) Math.round(((float) (height - intrinsicHeight)) * 0.5f));
                    } else {
                        float f3 = 0.0f;
                        if (ScaleType.CENTER_CROP == this.mScaleType) {
                            if (intrinsicWidth * height > width * intrinsicHeight) {
                                float f4 = ((float) height) / ((float) intrinsicHeight);
                                f3 = (((float) width) - (((float) intrinsicWidth) * f4)) * 0.5f;
                                f2 = f4;
                                f = 0.0f;
                            } else {
                                f2 = ((float) width) / ((float) intrinsicWidth);
                                f = (((float) height) - (((float) intrinsicHeight) * f2)) * 0.5f;
                            }
                            this.mMatrix.setScale(f2, f2);
                            this.mMatrix.postTranslate((float) Math.round(f3), (float) Math.round(f));
                        } else if (ScaleType.CENTER_INSIDE == this.mScaleType) {
                            float min = (intrinsicWidth > width || intrinsicHeight > height) ? Math.min(((float) width) / ((float) intrinsicWidth), ((float) height) / ((float) intrinsicHeight)) : 1.0f;
                            float round = (float) Math.round((((float) width) - (((float) intrinsicWidth) * min)) * 0.5f);
                            float round2 = (float) Math.round((((float) height) - (((float) intrinsicHeight) * min)) * 0.5f);
                            this.mMatrix.setScale(min, min);
                            this.mMatrix.postTranslate(round, round2);
                        } else {
                            getTemp1().set(0.0f, 0.0f, (float) intrinsicWidth, (float) intrinsicHeight);
                            getTemp2().set(0.0f, 0.0f, (float) width, (float) height);
                            this.mMatrix.setRectToRect(getTemp1(), getTemp2(), scaleTypeToScaleToFit(this.mScaleType));
                        }
                    }
                }
            }
        }
    }

    private RectF getTemp1() {
        if (this.mTemp1 == null) {
            this.mTemp1 = new RectF();
        }
        return this.mTemp1;
    }

    private RectF getTemp2() {
        if (this.mTemp2 == null) {
            this.mTemp2 = new RectF();
        }
        return this.mTemp2;
    }

    private static ScaleToFit scaleTypeToScaleToFit(ScaleType scaleType) {
        switch (AnonymousClass1.$SwitchMap$android$widget$ImageView$ScaleType[scaleType.ordinal()]) {
            case 1:
                return ScaleToFit.START;
            case 2:
                return ScaleToFit.CENTER;
            case 3:
                return ScaleToFit.END;
            default:
                return ScaleToFit.FILL;
        }
    }

    private void updateAnimFrame(float f) {
        float min = (float) Math.min(1.0d, Math.max(0.0d, (double) f));
        this.mAnimFrame.set(((this.mToFrame.left - this.mFromFrame.left) * min) + this.mFromFrame.left, ((this.mToFrame.top - this.mFromFrame.top) * min) + this.mFromFrame.top, ((this.mToFrame.right - this.mFromFrame.right) * min) + this.mFromFrame.right, ((this.mToFrame.bottom - this.mFromFrame.bottom) * min) + this.mFromFrame.bottom);
        this.mAnimAlpha = (int) (((float) this.mFromAlpha) + (((float) (this.mToAlpha - this.mFromAlpha)) * min));
        configureBounds();
    }

    public void invalidate() {
    }

    /* access modifiers changed from: 0000 */
    public void onDraw(Canvas canvas, float f) {
        if (this.mDrawable != null) {
            updateAnimFrame(f);
            this.mDrawable.setAlpha(this.mAnimAlpha);
            int save = canvas.save();
            canvas.translate(this.mAnimFrame.left, this.mAnimFrame.top);
            canvas.clipRect(0.0f, 0.0f, this.mAnimFrame.width(), this.mAnimFrame.height());
            canvas.concat(this.mMatrix);
            this.mDrawable.draw(canvas);
            canvas.restoreToCount(save);
        }
    }

    public String toString() {
        return String.format("mFromFrame: %s, mToFrame: %s, mFromAlpha: %s, mToAlpha: %s", new Object[]{this.mFromFrame, this.mToFrame, Integer.valueOf(this.mFromAlpha), Integer.valueOf(this.mToAlpha)});
    }

    public void updateDrawable(Drawable drawable) {
        if (this.mDrawable != drawable) {
            this.mDrawable = drawable;
            configureBounds();
            invalidate();
        }
    }
}
