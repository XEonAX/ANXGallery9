package com.nexstreaming.kminternal.kinemaster.mediainfo;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Rect;

/* compiled from: ThumbnailsImpl */
public class i implements h {
    private final Bitmap a;
    private final int b;
    private final int c;
    private final int d;
    private final int[] e;

    i(Bitmap bitmap, int i, int i2, int[] iArr) {
        this.a = bitmap;
        this.b = i;
        this.c = i2;
        this.e = iArr;
        if (bitmap == null) {
            throw new RuntimeException("bm is null");
        } else if (iArr != null) {
            this.d = Math.min(bitmap.getWidth() / this.b, iArr.length);
        } else {
            throw new RuntimeException("thumbnailTime is null");
        }
    }

    private Bitmap b(int i, int i2, boolean z, boolean z2) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < this.d; i5++) {
            int abs = Math.abs(this.e[i5] - i2);
            if (i5 == 0 || abs < i4) {
                i3 = i5;
                i4 = abs;
            }
        }
        Rect rect = new Rect(this.b * i3, 0, (i3 * this.b) + this.b, this.c);
        if (i == 180) {
            Bitmap createBitmap = Bitmap.createBitmap(this.b, this.c, Config.RGB_565);
            Canvas canvas = new Canvas(createBitmap);
            if (z && z2) {
                canvas.scale(-1.0f, -1.0f, (float) (createBitmap.getWidth() / 2), (float) (createBitmap.getHeight() / 2));
            } else if (z) {
                canvas.scale(-1.0f, 1.0f, (float) (createBitmap.getWidth() / 2), (float) (createBitmap.getHeight() / 2));
            } else if (z2) {
                canvas.scale(1.0f, -1.0f, (float) (createBitmap.getWidth() / 2), (float) (createBitmap.getHeight() / 2));
            }
            canvas.drawBitmap(this.a, rect, new Rect(0, 0, this.b, this.c), null);
            return createBitmap;
        } else if (i == 0) {
            Bitmap createBitmap2 = Bitmap.createBitmap(this.b, this.c, Config.RGB_565);
            Canvas canvas2 = new Canvas(createBitmap2);
            if (z && z2) {
                canvas2.scale(-1.0f, -1.0f, (float) (createBitmap2.getWidth() / 2), (float) (createBitmap2.getHeight() / 2));
            } else if (z) {
                canvas2.scale(-1.0f, 1.0f, (float) (createBitmap2.getWidth() / 2), (float) (createBitmap2.getHeight() / 2));
            } else if (z2) {
                canvas2.scale(1.0f, -1.0f, (float) (createBitmap2.getWidth() / 2), (float) (createBitmap2.getHeight() / 2));
            }
            canvas2.rotate(180.0f, (float) (this.b / 2), (float) (this.c / 2));
            canvas2.drawBitmap(this.a, rect, new Rect(0, 0, this.b, this.c), null);
            return createBitmap2;
        } else if (i == 90) {
            Bitmap createBitmap3 = Bitmap.createBitmap(this.c, this.b, Config.RGB_565);
            Canvas canvas3 = new Canvas(createBitmap3);
            if (z && z2) {
                canvas3.scale(-1.0f, -1.0f, (float) (createBitmap3.getWidth() / 2), (float) (createBitmap3.getHeight() / 2));
            } else if (z) {
                canvas3.scale(1.0f, -1.0f, (float) (createBitmap3.getWidth() / 2), (float) (createBitmap3.getHeight() / 2));
            } else if (z2) {
                canvas3.scale(-1.0f, 1.0f, (float) (createBitmap3.getWidth() / 2), (float) (createBitmap3.getHeight() / 2));
            }
            canvas3.rotate(90.0f, 0.0f, 0.0f);
            canvas3.drawBitmap(this.a, rect, new Rect(0, -this.c, this.b, 0), null);
            return createBitmap3;
        } else if (i != 270) {
            return null;
        } else {
            Bitmap createBitmap4 = Bitmap.createBitmap(this.c, this.b, Config.RGB_565);
            Canvas canvas4 = new Canvas(createBitmap4);
            if (z && z2) {
                canvas4.scale(-1.0f, -1.0f, (float) (createBitmap4.getWidth() / 2), (float) (createBitmap4.getHeight() / 2));
            } else if (z) {
                canvas4.scale(1.0f, -1.0f, (float) (createBitmap4.getWidth() / 2), (float) (createBitmap4.getHeight() / 2));
            } else if (z2) {
                canvas4.scale(-1.0f, 1.0f, (float) (createBitmap4.getWidth() / 2), (float) (createBitmap4.getHeight() / 2));
            }
            canvas4.rotate(270.0f, 0.0f, 0.0f);
            canvas4.drawBitmap(this.a, rect, new Rect(-this.b, 0, 0, this.c), null);
            return createBitmap4;
        }
    }

    public Bitmap a(int i, int i2, boolean z, boolean z2) {
        return b(i, i2, z, z2);
    }

    public int[] b() {
        return this.e;
    }
}
