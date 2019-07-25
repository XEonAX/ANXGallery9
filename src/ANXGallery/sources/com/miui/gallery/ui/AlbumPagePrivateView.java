package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.View;

public class AlbumPagePrivateView extends View {
    private Bitmap mBitmap;
    private int mBlueColor;
    private OnPrivateColorChangeListener mColorChangeListener;
    private int mCurrPosition;
    private int mGreenColor;
    private boolean mIsBackgroundGradient;
    private int mRedColor;

    interface OnPrivateColorChangeListener {
        void onColorChange(int i);
    }

    public AlbumPagePrivateView(Context context) {
        super(context);
    }

    public AlbumPagePrivateView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public AlbumPagePrivateView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.save();
        int height = (int) (((float) getHeight()) * 0.08f);
        int height2 = (!this.mIsBackgroundGradient || this.mCurrPosition <= height) ? 255 : (int) ((((float) (this.mCurrPosition - height)) / ((float) (getHeight() - height))) * 90.0f);
        canvas.drawARGB(height2, this.mRedColor, this.mGreenColor, this.mBlueColor);
        if (this.mColorChangeListener != null) {
            this.mColorChangeListener.onColorChange(Color.argb(height2, this.mRedColor, this.mGreenColor, this.mBlueColor));
        }
        if (this.mBitmap != null) {
            float height3 = ((float) (getHeight() - this.mBitmap.getHeight())) * 0.32f;
            if (((float) this.mCurrPosition) > height3) {
                canvas.drawBitmap(this.mBitmap, (float) ((getWidth() - this.mBitmap.getWidth()) / 2), ((float) getHeight()) - (((float) this.mCurrPosition) - height3), null);
            }
        }
        canvas.restore();
    }

    public void setBackgroundColor(int i) {
        this.mRedColor = Color.red(i);
        this.mGreenColor = Color.green(i);
        this.mBlueColor = Color.blue(i);
    }

    public void setBackgroundGradient(boolean z) {
        this.mIsBackgroundGradient = z;
    }

    public void setBackgroundResId(int i) {
        this.mBitmap = BitmapFactory.decodeResource(getResources(), i);
    }

    public void setOnColorChangeListener(OnPrivateColorChangeListener onPrivateColorChangeListener) {
        this.mColorChangeListener = onPrivateColorChangeListener;
    }
}
