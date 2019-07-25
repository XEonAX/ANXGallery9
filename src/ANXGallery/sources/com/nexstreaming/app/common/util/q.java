package com.nexstreaming.app.common.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import android.graphics.Typeface;
import android.text.Layout.Alignment;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.Log;
import com.nexstreaming.nexeditorsdk.nexFont;
import com.nexstreaming.nexeditorsdk.nexOverlayImage.runTimeMakeBitMap;

/* compiled from: utilityTextOverlay */
public class q implements runTimeMakeBitMap {
    private Context a;
    private String b;
    private int c;
    private int d;
    private int e;
    private transient int f;
    private transient int g;
    private transient boolean h;
    private transient StaticLayout i;
    private float j;
    private a k = null;
    private c l = null;
    private b m = null;
    private d n;
    private TextPaint o;

    /* compiled from: utilityTextOverlay */
    private class a {
        /* access modifiers changed from: private */
        public float b;
        /* access modifiers changed from: private */
        public Align c;
        /* access modifiers changed from: private */
        public int d;
        /* access modifiers changed from: private */
        public String e;
        /* access modifiers changed from: private */
        public int f;

        public a(float f2, int i, Align align, String str, int i2) {
            this.b = f2;
            this.d = i;
            this.c = align;
            this.e = str;
            this.f = i2;
        }
    }

    /* compiled from: utilityTextOverlay */
    private class b {
        private boolean b;
        /* access modifiers changed from: private */
        public int c;
        /* access modifiers changed from: private */
        public float d;

        public b(boolean z, int i, float f) {
            this.b = z;
            this.c = i;
            this.d = f;
        }
    }

    /* compiled from: utilityTextOverlay */
    private class c {
        private boolean b;
        /* access modifiers changed from: private */
        public int c;
        /* access modifiers changed from: private */
        public float d;

        public c(boolean z, int i, float f) {
            this.b = z;
            this.c = i;
            this.d = f;
        }
    }

    /* compiled from: utilityTextOverlay */
    private class d {
        private boolean b;
        /* access modifiers changed from: private */
        public int c;
        /* access modifiers changed from: private */
        public float d;
        /* access modifiers changed from: private */
        public float e;
        /* access modifiers changed from: private */
        public float f;

        public d(boolean z, int i, float f2, float f3, float f4) {
            this.b = z;
            this.c = i;
            this.d = f2;
            this.e = f3;
            this.f = f4;
        }
    }

    public q(Context context, String str, int i2, int i3, float f2) {
        this.a = context;
        this.b = str;
        this.d = i2;
        this.e = i3;
        this.j = f2;
    }

    private Bitmap a() {
        d();
        Bitmap createBitmap = Bitmap.createBitmap((int) (((float) this.f) * this.j), (int) (((float) this.e) * this.j), Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        canvas.scale(this.j, this.j);
        canvas.translate((float) c(), (float) c());
        Typeface typeface = nexFont.getTypeface(this.a, this.k.e);
        if (typeface == null) {
            typeface = Typeface.createFromAsset(this.a.getAssets(), this.k.e);
        }
        TextPaint paint = this.i.getPaint();
        paint.setStyle(Style.FILL);
        paint.setTypeface(typeface);
        if (this.k.c == Align.RIGHT) {
            paint.setTextAlign(Align.LEFT);
        }
        if (this.k.f != 1) {
            if (this.k.f == 2) {
                canvas.translate(0.0f, ((((float) this.e) * this.j) - (((float) this.g) * this.j)) / 2.0f);
            } else if (this.k.f == 3) {
                canvas.translate(0.0f, (((float) this.e) * this.j) - (((float) this.g) * this.j));
            }
        }
        if (this.n != null) {
            paint.setMaskFilter(new BlurMaskFilter(this.n.d / this.j, Blur.NORMAL));
            paint.setColor(this.n.c);
            canvas.save();
            canvas.translate(this.n.e, this.n.f);
            this.i.draw(canvas);
            canvas.restore();
        }
        if (this.m != null) {
            paint.setMaskFilter(new BlurMaskFilter(this.m.d / this.j, Blur.OUTER));
            paint.setColor(this.m.c);
            this.i.draw(canvas);
        }
        if (this.k != null) {
            paint.setMaskFilter(null);
            paint.setTextSize(this.k.b);
            paint.setColor(this.k.d);
            this.i.draw(canvas);
        }
        if (this.l != null) {
            paint.setMaskFilter(null);
            this.i.getPaint().setStyle(Style.STROKE);
            paint.setColor(this.l.c);
            paint.setStrokeWidth(this.l.d / this.j);
            this.i.draw(canvas);
        }
        return createBitmap;
    }

    private TextPaint b() {
        if (this.o == null) {
            this.o = new TextPaint();
        } else {
            this.o.reset();
        }
        if (this.k != null) {
            this.o.setTextSize(this.k.b);
            this.o.setColor(this.k.d);
            Typeface typeface = nexFont.getTypeface(this.a, this.k.e);
            if (typeface == null) {
                typeface = Typeface.createFromAsset(this.a.getAssets(), this.k.e);
            }
            this.o.setTypeface(typeface);
        }
        if (this.l != null) {
            this.o.setStrokeWidth(this.l.d / this.j);
        }
        this.o.setAntiAlias(true);
        this.o.setStyle(Style.FILL_AND_STROKE);
        this.o.setTextAlign(Align.LEFT);
        return this.o;
    }

    private int c() {
        float f2 = 0.0f;
        float max = this.n != null ? Math.max(Math.abs(this.n.e), Math.abs(this.n.f)) : 0.0f;
        float a2 = this.m != null ? this.m.d : 0.0f;
        if (this.l != null) {
            f2 = this.l.d;
        }
        return (int) Math.ceil((double) Math.max(f2, Math.max(a2, max)));
    }

    private void d() {
        boolean z;
        if (!this.h || this.i == null) {
            float f2 = 1.0f;
            int c2 = c();
            TextPaint b2 = b();
            this.f = this.d;
            this.g = this.e + 1;
            Alignment alignment = Alignment.ALIGN_CENTER;
            if (this.k.c == Align.CENTER) {
                alignment = Alignment.ALIGN_CENTER;
            } else if (this.k.c == Align.LEFT) {
                alignment = Alignment.ALIGN_NORMAL;
            } else if (this.k.c == Align.RIGHT) {
                alignment = Alignment.ALIGN_OPPOSITE;
            }
            Alignment alignment2 = alignment;
            StaticLayout staticLayout = null;
            Log.d("utilityTextOverlay", String.format("calcDimension(%s, %d %d)", new Object[]{alignment2.toString(), Integer.valueOf(this.g), Integer.valueOf(this.e)}));
            while (true) {
                if (this.g <= this.e) {
                    z = true;
                    break;
                }
                int i2 = c2 * 2;
                float f3 = f2;
                z = true;
                StaticLayout staticLayout2 = new StaticLayout(this.b, 0, this.b.length(), b2, this.d - i2, alignment2, f3, 0.0f, true);
                this.g = Math.max(1, staticLayout2.getHeight()) + i2;
                float textSize = b2.getTextSize();
                if (this.g <= this.e) {
                    staticLayout = staticLayout2;
                    break;
                }
                b2.setTextSize(textSize - 1.0f);
                staticLayout = staticLayout2;
                f2 = 1.0f;
            }
            this.i = staticLayout;
            int i3 = c2 * 2;
            this.f = Math.max(z ? 1 : 0, this.i.getWidth()) + i3;
            this.g = Math.max(z, this.i.getHeight()) + i3;
            this.h = z;
        }
    }

    public void a(float f2, int i2, Align align, String str, int i3) {
        a aVar = new a(f2, i2, align, str, i3);
        this.k = aVar;
    }

    public void a(int i2) {
        this.c = i2;
    }

    public void a(boolean z, int i2, float f2) {
        this.l = new c(z, i2, f2);
    }

    public void a(boolean z, int i2, float f2, float f3, float f4) {
        d dVar = new d(z, i2, f2, f3, f4);
        this.n = dVar;
    }

    public void b(boolean z, int i2, float f2) {
        this.m = new b(z, i2, f2);
    }

    public int getBitmapID() {
        return this.c;
    }

    public boolean isAniMate() {
        return false;
    }

    public Bitmap makeBitmap() {
        return a();
    }
}
