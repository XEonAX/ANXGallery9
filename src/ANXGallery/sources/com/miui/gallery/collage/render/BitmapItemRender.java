package com.miui.gallery.collage.render;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import com.miui.gallery.collage.render.CollageRender.BitmapRenderData;

public class BitmapItemRender {
    private RectF mBitmapBound = new RectF();
    private RectF mBitmapInitBound = new RectF();
    private RectF mBitmapInsideBound = new RectF();
    private Matrix mBitmapMatrix = new Matrix();
    private Matrix mDrawingMatrix = new Matrix();
    private GradientDrawable mGradientDrawable = new GradientDrawable();
    private Paint mPaint = new Paint(3);
    private PorterDuffXfermode mPorterDuffModeIn = new PorterDuffXfermode(Mode.SRC_IN);
    private PorterDuffXfermode mPorterDuffModeOut = new PorterDuffXfermode(Mode.SRC_OUT);
    private Matrix mUserMatrix = new Matrix();

    public BitmapItemRender() {
        this.mGradientDrawable.setColor(-1);
    }

    public void drawBitmapItem(BitmapRenderData bitmapRenderData, RectF rectF, Canvas canvas, float f) {
        if (bitmapRenderData != null && bitmapRenderData.bitmap != null) {
            Bitmap bitmap = bitmapRenderData.bitmap;
            this.mBitmapBound.set(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
            if (bitmapRenderData.transition) {
                CollageRender.initBitmapMatrix(this.mBitmapBound, this.mBitmapMatrix, rectF, bitmapRenderData.mirror, bitmapRenderData.rotate, this.mBitmapInitBound);
                this.mBitmapInsideBound.set(bitmapRenderData.bitmapInsideRect);
                this.mBitmapInsideBound.left = (this.mBitmapInsideBound.left * this.mBitmapInitBound.width()) + this.mBitmapInitBound.left;
                this.mBitmapInsideBound.right = (this.mBitmapInsideBound.right * this.mBitmapInitBound.width()) + this.mBitmapInitBound.left;
                this.mBitmapInsideBound.top = (this.mBitmapInsideBound.top * this.mBitmapInitBound.height()) + this.mBitmapInitBound.top;
                this.mBitmapInsideBound.bottom = (this.mBitmapInsideBound.bottom * this.mBitmapInitBound.height()) + this.mBitmapInitBound.top;
                this.mUserMatrix.reset();
                this.mUserMatrix.setRectToRect(this.mBitmapInsideBound, this.mBitmapInitBound, ScaleToFit.CENTER);
                this.mDrawingMatrix.reset();
                this.mDrawingMatrix.postConcat(this.mBitmapMatrix);
                this.mDrawingMatrix.postConcat(this.mUserMatrix);
                Drawable drawable = bitmapRenderData.maskDrawable;
                float f2 = bitmapRenderData.radius;
                if (drawable != null) {
                    drawable.setBounds(Math.round(rectF.left), Math.round(rectF.top), Math.round(rectF.right), Math.round(rectF.bottom));
                    canvas.saveLayer(rectF, null, 31);
                    drawable.draw(canvas);
                    this.mPaint.setXfermode(this.mPorterDuffModeOut);
                    canvas.drawBitmap(bitmap, this.mDrawingMatrix, this.mPaint);
                    this.mPaint.setXfermode(null);
                    canvas.restore();
                } else if (f2 > 0.0f) {
                    this.mGradientDrawable.setBounds(Math.round(rectF.left), Math.round(rectF.top), Math.round(rectF.right), Math.round(rectF.bottom));
                    this.mGradientDrawable.setCornerRadius(f2 * f);
                    canvas.saveLayer(rectF, null, 31);
                    this.mGradientDrawable.draw(canvas);
                    this.mPaint.setXfermode(this.mPorterDuffModeIn);
                    canvas.drawBitmap(bitmap, this.mDrawingMatrix, this.mPaint);
                    this.mPaint.setXfermode(null);
                    canvas.restore();
                } else {
                    canvas.drawBitmap(bitmap, this.mDrawingMatrix, this.mPaint);
                }
            } else {
                CollageRender.initBitmapMatrix(this.mBitmapBound, this.mBitmapMatrix, rectF, this.mBitmapInitBound);
                canvas.drawBitmap(bitmap, this.mBitmapMatrix, this.mPaint);
            }
        }
    }
}
