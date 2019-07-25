package com.miui.gallery.search.widget;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Drawable;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class RoundedCornerRectBitmapDisplayer implements BitmapDisplayer {
    protected final int[] cornerRadius;

    public static class RoundedDrawable extends Drawable {
        protected final BitmapShader bitmapShader;
        protected final int[] cornerRadius;
        protected final RectF mBitmapRect;
        protected final RectF mRect = new RectF();
        protected final Paint paint;
        protected Path path;

        public RoundedDrawable(Bitmap bitmap, int[] iArr) {
            this.cornerRadius = iArr;
            this.bitmapShader = new BitmapShader(bitmap, TileMode.CLAMP, TileMode.CLAMP);
            this.mBitmapRect = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
            this.paint = new Paint();
            this.paint.setAntiAlias(true);
            this.paint.setShader(this.bitmapShader);
            this.paint.setFilterBitmap(true);
            this.paint.setDither(true);
            this.path = createPath();
        }

        private Path createPath() {
            Path path2 = new Path();
            int i = this.cornerRadius[0];
            path2.moveTo(this.mRect.left, this.mRect.top + ((float) i));
            if (i != 0) {
                float f = (float) (i * 2);
                path2.arcTo(new RectF(this.mRect.left, this.mRect.top, this.mRect.left + f, this.mRect.top + f), 180.0f, 90.0f, false);
            }
            int i2 = this.cornerRadius[1];
            path2.lineTo(this.mRect.right - ((float) i2), this.mRect.top);
            if (i2 != 0) {
                float f2 = (float) (i2 * 2);
                path2.arcTo(new RectF(this.mRect.right - f2, this.mRect.top, this.mRect.right, this.mRect.top + f2), 270.0f, 90.0f, false);
            }
            int i3 = this.cornerRadius[2];
            path2.lineTo(this.mRect.right, this.mRect.bottom - ((float) i3));
            if (i3 != 0) {
                float f3 = (float) (i3 * 2);
                path2.arcTo(new RectF(this.mRect.right - f3, this.mRect.bottom - f3, this.mRect.right, this.mRect.bottom), 0.0f, 90.0f, false);
            }
            int i4 = this.cornerRadius[3];
            path2.lineTo(this.mRect.left + ((float) i4), this.mRect.bottom);
            if (i4 != 0) {
                float f4 = (float) (i4 * 2);
                path2.arcTo(new RectF(this.mRect.left, this.mRect.bottom - f4, this.mRect.left + f4, this.mRect.bottom), 90.0f, 90.0f, false);
            }
            path2.lineTo(this.mRect.left, this.mRect.top + ((float) this.cornerRadius[0]));
            return path2;
        }

        public void draw(Canvas canvas) {
            canvas.drawPath(this.path, this.paint);
        }

        public int getOpacity() {
            return -3;
        }

        /* access modifiers changed from: protected */
        public void onBoundsChange(Rect rect) {
            super.onBoundsChange(rect);
            this.mRect.set(0.0f, 0.0f, (float) rect.width(), (float) rect.height());
            this.path = createPath();
            Matrix matrix = new Matrix();
            float width = this.mRect.width() / this.mBitmapRect.width();
            float height = this.mRect.height() / this.mBitmapRect.height();
            float max = Math.max(width, height);
            matrix.setScale(max, max);
            if (width > height) {
                matrix.postTranslate(0.0f, (this.mRect.height() - (this.mBitmapRect.height() * max)) / 2.0f);
            } else if (height > width) {
                matrix.postTranslate((this.mRect.width() - (this.mBitmapRect.width() * max)) / 2.0f, 0.0f);
            }
            this.bitmapShader.setLocalMatrix(matrix);
        }

        public void setAlpha(int i) {
            this.paint.setAlpha(i);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            this.paint.setColorFilter(colorFilter);
        }
    }

    public RoundedCornerRectBitmapDisplayer(int i) {
        this.cornerRadius = new int[4];
        for (int i2 = 0; i2 < 4; i2++) {
            this.cornerRadius[i2] = i;
        }
    }

    public RoundedCornerRectBitmapDisplayer(int[] iArr) {
        if (iArr.length == 4) {
            this.cornerRadius = iArr;
            return;
        }
        throw new IllegalArgumentException("The corner radius array must contains 4 elements");
    }

    public void display(Bitmap bitmap, ImageAware imageAware, LoadedFrom loadedFrom) {
        if (imageAware instanceof ImageViewAware) {
            imageAware.setImageDrawable(new RoundedDrawable(bitmap, this.cornerRadius));
            return;
        }
        throw new IllegalArgumentException("ImageAware should wrap ImageView. ImageViewAware is expected.");
    }
}
