package com.nexstreaming.kminternal.nexvideoeditor;

import android.graphics.Bitmap;
import android.util.Log;

public class NexImage {
    private final Bitmap a;
    private final int b;
    private final int c;
    private final int d;

    public NexImage(Bitmap bitmap, int i, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("new NexImage(");
        sb.append(bitmap);
        sb.append(",");
        sb.append(i);
        sb.append(",");
        sb.append(i2);
        sb.append(")");
        Log.d("NexImage", sb.toString());
        this.a = bitmap;
        this.b = i;
        this.c = i2;
        this.d = 1;
    }

    public NexImage(Bitmap bitmap, int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder();
        sb.append("new NexImage(");
        sb.append(bitmap);
        sb.append(",");
        sb.append(i);
        sb.append(",");
        sb.append(i2);
        sb.append(",");
        sb.append(i3);
        sb.append(")");
        Log.d("NexImage", sb.toString());
        this.a = bitmap;
        this.b = i;
        this.c = i2;
        this.d = i3;
    }

    public Bitmap getBitmap() {
        return this.a;
    }

    public int getHeight() {
        return this.c;
    }

    public int getLoadedType() {
        return this.d;
    }

    public void getPixels(int[] iArr) {
        if (this.a != null) {
            try {
                this.a.getPixels(iArr, 0, this.b, 0, 0, this.b, this.c);
            } catch (ArrayIndexOutOfBoundsException unused) {
                StringBuilder sb = new StringBuilder();
                sb.append("w=");
                sb.append(this.b);
                sb.append(" h=");
                sb.append(this.c);
                sb.append(" bm=");
                sb.append(this.a.getWidth());
                sb.append("x");
                sb.append(this.a.getHeight());
                sb.append(" pixels=");
                sb.append(iArr == null ? "null" : Integer.valueOf(iArr.length));
                throw new ArrayIndexOutOfBoundsException(sb.toString());
            }
        }
    }

    public void getPixels(int[] iArr, int i, int i2, int i3, int i4, int i5, int i6) {
        int[] iArr2 = iArr;
        int i7 = i;
        int i8 = i2;
        int i9 = i3;
        int i10 = i4;
        int i11 = i5;
        int i12 = i6;
        if (this.a != null) {
            if (i10 + i12 > this.a.getHeight()) {
                StringBuilder sb = new StringBuilder();
                sb.append("getPixels() WARNING: y + height exceeds bitmap height!!; offset=");
                sb.append(i);
                sb.append("; stride=");
                sb.append(i2);
                sb.append("; x,y=");
                sb.append(i3);
                sb.append(",");
                sb.append(i10);
                sb.append("; width,height=");
                sb.append(i11);
                sb.append(",");
                sb.append(i12);
                sb.append("; mWidth,mHeight=");
                sb.append(this.b);
                sb.append(",");
                sb.append(this.c);
                sb.append("; pixels.length=");
                sb.append(iArr2.length);
                sb.append("; mBitmap {width=");
                sb.append(this.a.getWidth());
                sb.append("; height=");
                sb.append(this.a.getHeight());
                sb.append("}");
                Log.d("NexImage", sb.toString());
            } else if (i9 + i11 > this.a.getWidth()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("getPixels() WARNING: y + height exceeds bitmap height!!; offset=");
                sb2.append(i);
                sb2.append("; stride=");
                sb2.append(i2);
                sb2.append("; x,y=");
                sb2.append(i3);
                sb2.append(",");
                sb2.append(i10);
                sb2.append("; width,height=");
                sb2.append(i11);
                sb2.append(",");
                sb2.append(i12);
                sb2.append("; mWidth,mHeight=");
                sb2.append(this.b);
                sb2.append(",");
                sb2.append(this.c);
                sb2.append("; pixels.length=");
                sb2.append(iArr2.length);
                sb2.append("; mBitmap {width=");
                sb2.append(this.a.getWidth());
                sb2.append("; height=");
                sb2.append(this.a.getHeight());
                sb2.append("}");
                Log.d("NexImage", sb2.toString());
            } else {
                this.a.getPixels(iArr, i, i2, i3, i4, i5, i6);
            }
        }
    }

    public int getWidth() {
        return this.b;
    }

    public void recycle() {
        this.a.recycle();
        Log.d("NexImage", "recycle Bitmap from native");
    }
}
