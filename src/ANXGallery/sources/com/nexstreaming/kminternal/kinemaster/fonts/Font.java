package com.nexstreaming.kminternal.kinemaster.fonts;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.text.Layout.Alignment;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class Font implements Comparable<Font> {
    /* access modifiers changed from: private */
    public static final b[] k = {new b(" thin", 1), new b(" light", 2), new b(" regular", 3), new b(" medium", 4), new b(" bold", 5), new b(" black", 6), new b(" italic", 100), new b(" condensed", 1000)};
    private final String a;
    private final boolean b;
    private final String c;
    private final File d;
    private transient WeakReference<Bitmap> e;
    private transient WeakReference<Typeface> f;
    private final transient Typeface g;
    private final String h;
    private final String i;
    private a j;

    public static class TypefaceLoadException extends Exception {
        private static final long serialVersionUID = 1;

        public TypefaceLoadException() {
        }

        public TypefaceLoadException(String str) {
            super(str);
        }

        public TypefaceLoadException(String str, Throwable th) {
            super(str, th);
        }

        public TypefaceLoadException(Throwable th) {
            super(th);
        }
    }

    private static class a {
        static final Map<String, a> c = new HashMap();
        final String a;
        final int b;

        private a(String str) {
            b[] c2;
            String trim = str.toLowerCase(Locale.ENGLISH).trim();
            int i = 0;
            while (true) {
                int i2 = i;
                boolean z = false;
                String str2 = trim;
                for (b bVar : Font.k) {
                    if (str2.endsWith(bVar.a)) {
                        str2 = str2.substring(0, str2.length() - bVar.a.length());
                        i2 += bVar.b;
                        z = true;
                    }
                }
                if (!z) {
                    this.a = str2;
                    this.b = i2;
                    return;
                }
                trim = str2;
                i = i2;
            }
        }

        public static a a(String str) {
            a aVar = (a) c.get(str);
            return aVar != null ? aVar : new a(str);
        }
    }

    private static class b {
        final String a;
        final int b;

        private b(String str, int i) {
            this.a = str;
            this.b = i;
        }
    }

    public Font(String str, String str2, Typeface typeface, String str3) {
        this.a = str;
        this.h = str2;
        this.b = typeface != null;
        this.g = typeface;
        this.c = null;
        this.d = null;
        this.i = str3;
    }

    public Font(String str, String str2, File file, String str3) {
        this.a = str;
        this.h = str2;
        this.b = false;
        this.g = null;
        this.c = null;
        this.d = file;
        this.i = str3;
    }

    public Font(String str, String str2, String str3, String str4) {
        this.a = str;
        this.h = str2;
        this.b = str3 != null;
        this.c = str3;
        this.d = null;
        this.g = null;
        this.i = str4;
    }

    private Bitmap d(Context context) {
        TextPaint textPaint = new TextPaint();
        textPaint.setTypeface(a(context, Typeface.DEFAULT));
        textPaint.setAntiAlias(true);
        textPaint.setColor(-1);
        textPaint.setTextSize(60.0f);
        StaticLayout staticLayout = new StaticLayout(TextUtils.ellipsize(this.i, textPaint, (float) 940, TruncateAt.END), textPaint, 940, Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
        Bitmap createBitmap = Bitmap.createBitmap(1000, 100, Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        canvas.save();
        canvas.translate((float) 30, (float) ((100 - staticLayout.getHeight()) / 2));
        staticLayout.draw(canvas);
        canvas.restore();
        return createBitmap;
    }

    private a d() {
        if (this.j == null) {
            this.j = a.a(this.i);
        }
        return this.j;
    }

    /* renamed from: a */
    public int compareTo(Font font) {
        a d2 = d();
        a d3 = font.d();
        int compareTo = d2.a.compareTo(d3.a);
        return compareTo != 0 ? compareTo : d2.b - d3.b;
    }

    public Typeface a(Context context, Typeface typeface) {
        try {
            return b(context);
        } catch (TypefaceLoadException unused) {
            return typeface;
        }
    }

    public String a() {
        return this.a;
    }

    public String a(Context context) {
        return this.i;
    }

    public Typeface b(Context context) throws TypefaceLoadException {
        if (this.f != null) {
            Typeface typeface = (Typeface) this.f.get();
            if (typeface != null) {
                return typeface;
            }
        }
        if (this.b) {
            Typeface createFromAsset = this.g != null ? this.g : Typeface.createFromAsset(context.getAssets(), this.c);
            this.f = new WeakReference<>(createFromAsset);
            return createFromAsset;
        } else if (this.d == null) {
            return null;
        } else {
            try {
                Typeface createFromFile = Typeface.createFromFile(this.d);
                this.f = new WeakReference<>(createFromFile);
                return createFromFile;
            } catch (RuntimeException e2) {
                if (e2.getMessage().contains("native typeface cannot be made")) {
                    throw new TypefaceLoadException((Throwable) e2);
                }
                throw e2;
            }
        }
    }

    public String b() {
        return this.h;
    }

    public Bitmap c(Context context) {
        if (this.e != null) {
            Bitmap bitmap = (Bitmap) this.e.get();
            if (bitmap != null) {
                return bitmap;
            }
        }
        Bitmap d2 = d(context);
        if (d2 == null) {
            return null;
        }
        int[] iArr = new int[(d2.getWidth() * d2.getHeight())];
        d2.getPixels(iArr, 0, d2.getWidth(), 0, 0, d2.getWidth(), d2.getHeight());
        for (int i2 = 0; i2 < iArr.length; i2++) {
            iArr[i2] = iArr[i2] & ((iArr[i2] << 8) | 255);
        }
        Bitmap createBitmap = Bitmap.createBitmap(iArr, d2.getWidth(), d2.getHeight(), Config.ARGB_8888);
        createBitmap.setHasAlpha(true);
        this.e = new WeakReference<>(createBitmap);
        return createBitmap;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[font:");
        sb.append(this.a);
        sb.append(":");
        sb.append(System.identityHashCode(this));
        sb.append("]");
        return sb.toString();
    }
}
