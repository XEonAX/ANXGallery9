package com.miui.gallery.editor.photo.core.imports.frame;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.IPositionChangeData;

public class FrameEditorView extends View {
    private int mBackgroundColor;
    private Paint mBackgroundPaint = new Paint(1);
    private RectF mBackgroundRect = new RectF();
    private Bitmap mBitmap;
    private RectF mBitmapDisplayRect = new RectF();
    private Matrix mBitmapMatrix = new Matrix();
    private Paint mBitmapPaint = new Paint(3);
    private float mBitmapRatio = 1.0f;
    private RectF mBitmapRect = new RectF();
    private float mRatio = 1.0f;
    private float mScaleProgress = 1.0f;
    private RectF mViewRect = new RectF();

    public static class FrameEntry implements Parcelable, IPositionChangeData {
        public static final Creator<FrameEntry> CREATOR = new Creator<FrameEntry>() {
            public FrameEntry createFromParcel(Parcel parcel) {
                return new FrameEntry(parcel);
            }

            public FrameEntry[] newArray(int i) {
                return new FrameEntry[i];
            }
        };
        private RectF mBackgroundRect = new RectF();
        private Matrix mBitmapMatrix = new Matrix();
        private Paint mBitmapPaint = new Paint(3);
        private RectF mBitmapRect = new RectF();
        private float mRatio;
        private float mScaleProgress;

        FrameEntry(float f, float f2) {
            this.mRatio = f;
            this.mScaleProgress = f2;
        }

        FrameEntry(Parcel parcel) {
            this.mRatio = parcel.readFloat();
            this.mScaleProgress = parcel.readFloat();
        }

        /* access modifiers changed from: protected */
        public Bitmap apply(Bitmap bitmap) {
            int i;
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            this.mBitmapRect.set(0.0f, 0.0f, (float) width, (float) height);
            int max = Math.max(width, height);
            if (this.mRatio > 1.0f) {
                i = Math.round(((float) max) / this.mRatio);
            } else {
                i = max;
                max = Math.round(((float) max) * this.mRatio);
            }
            Bitmap createBitmap = Bitmap.createBitmap(max, i, Config.ARGB_8888);
            this.mBackgroundRect.set(0.0f, 0.0f, (float) max, (float) i);
            this.mBitmapMatrix.setRectToRect(this.mBitmapRect, this.mBackgroundRect, ScaleToFit.CENTER);
            this.mBitmapMatrix.postScale(this.mScaleProgress, this.mScaleProgress, this.mBackgroundRect.centerX(), this.mBackgroundRect.centerY());
            Canvas canvas = new Canvas(createBitmap);
            canvas.drawColor(-1);
            canvas.drawBitmap(bitmap, this.mBitmapMatrix, this.mBitmapPaint);
            return createBitmap;
        }

        public int describeContents() {
            return 0;
        }

        public void refreshTargetAreaPosition(RectF rectF, RectF rectF2) {
            int i;
            this.mBitmapRect.set(rectF);
            int max = (int) Math.max(rectF.width(), rectF.height());
            if (this.mRatio > 1.0f) {
                i = Math.round(((float) max) / this.mRatio);
            } else {
                i = max;
                max = Math.round(((float) max) * this.mRatio);
            }
            this.mBackgroundRect.set(0.0f, 0.0f, (float) max, (float) i);
            this.mBitmapMatrix.setRectToRect(this.mBitmapRect, this.mBackgroundRect, ScaleToFit.CENTER);
            this.mBitmapMatrix.postScale(this.mScaleProgress, this.mScaleProgress, this.mBackgroundRect.centerX(), this.mBackgroundRect.centerY());
            this.mBitmapMatrix.mapRect(rectF2);
            rectF.set(this.mBackgroundRect);
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeFloat(this.mRatio);
            parcel.writeFloat(this.mScaleProgress);
        }
    }

    public FrameEditorView(Context context) {
        super(context);
        init();
    }

    public FrameEditorView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public FrameEditorView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mBackgroundColor = getResources().getColor(R.color.photo_editor_window_bg);
        this.mBackgroundPaint.setStyle(Style.FILL);
        this.mBackgroundPaint.setColor(-1);
    }

    private void refreshBackgroundRect() {
        if (this.mRatio >= this.mViewRect.width() / this.mViewRect.height()) {
            this.mBackgroundRect.left = this.mViewRect.left;
            this.mBackgroundRect.right = this.mViewRect.right;
            float width = (this.mViewRect.width() / this.mRatio) / 2.0f;
            this.mBackgroundRect.top = this.mViewRect.centerY() - width;
            this.mBackgroundRect.bottom = this.mViewRect.centerY() + width;
            return;
        }
        this.mBackgroundRect.top = this.mViewRect.top;
        this.mBackgroundRect.bottom = this.mViewRect.bottom;
        float height = (this.mViewRect.height() * this.mRatio) / 2.0f;
        this.mBackgroundRect.left = this.mViewRect.centerX() - height;
        this.mBackgroundRect.right = this.mViewRect.centerX() + height;
    }

    private void refreshBitmapRect() {
        this.mBitmapMatrix.reset();
        this.mBitmapMatrix.setRectToRect(this.mBitmapRect, this.mBackgroundRect, ScaleToFit.CENTER);
        this.mBitmapMatrix.mapRect(this.mBitmapDisplayRect, this.mBitmapRect);
        this.mBitmapMatrix.postScale(this.mScaleProgress, this.mScaleProgress, this.mBitmapDisplayRect.centerX(), this.mBitmapDisplayRect.centerY());
    }

    private void refreshSize() {
        if (!this.mBitmapRect.isEmpty() && !this.mViewRect.isEmpty()) {
            refreshBackgroundRect();
            refreshBitmapRect();
            invalidate();
        }
    }

    public FrameEntry export() {
        return new FrameEntry(this.mRatio, this.mScaleProgress);
    }

    public boolean isEmpty() {
        return Float.compare(this.mRatio, this.mBitmapRatio) == 0 && Float.compare(this.mScaleProgress, 1.0f) == 0;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        canvas.drawColor(this.mBackgroundColor);
        canvas.drawRect(this.mBackgroundRect, this.mBackgroundPaint);
        canvas.drawBitmap(this.mBitmap, this.mBitmapMatrix, this.mBitmapPaint);
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        this.mViewRect.set(0.0f, 0.0f, (float) i, (float) i2);
        refreshSize();
    }

    public void setBitmap(Bitmap bitmap) {
        this.mBitmap = bitmap;
        this.mBitmapRect.set(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
        this.mBitmapRatio = ((float) bitmap.getWidth()) / ((float) bitmap.getHeight());
        refreshSize();
    }

    public void setRatio(float f) {
        this.mRatio = f;
        refreshSize();
    }

    public void setScaleProgress(float f) {
        this.mScaleProgress = 1.0f - ((1.0f - f) * 0.4f);
        refreshBitmapRect();
        invalidate();
    }
}
