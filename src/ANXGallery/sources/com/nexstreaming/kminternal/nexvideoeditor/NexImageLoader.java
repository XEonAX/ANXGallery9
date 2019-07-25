package com.nexstreaming.kminternal.nexvideoeditor;

import android.content.ContentUris;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint.Align;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Images.Thumbnails;
import android.text.Layout.Alignment;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils.TruncateAt;
import android.util.Log;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.kminternal.kinemaster.fonts.Font.TypefaceLoadException;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.WeakHashMap;

public final class NexImageLoader {
    private static final String LOG_TAG = "NexImageLoader";
    private static final int MAX_USERSTRINGS = 3;
    private static final int NXT_ALIGNMASK = 15;
    private static final int NXT_ALIGN_CENTER = 1;
    private static final int NXT_ALIGN_LEFT = 0;
    private static final int NXT_ALIGN_RIGHT = 2;
    private static final int NXT_BLUR_INNER = 2;
    private static final int NXT_BLUR_NORMAL = 0;
    private static final int NXT_BLUR_OUTER = 3;
    private static final int NXT_BLUR_SOLID = 1;
    private static final int NXT_LONGTEXT_CROP_END = 0;
    private static final int NXT_LONGTEXT_ELLIPSIZE_END = 4;
    private static final int NXT_LONGTEXT_ELLIPSIZE_MIDDLE = 3;
    private static final int NXT_LONGTEXT_ELLIPSIZE_START = 2;
    private static final int NXT_LONGTEXT_WRAP = 1;
    private static final int NXT_TEXTFLAG_AUTOSIZE = 1024;
    private static final int NXT_TEXTFLAG_BOLD = 1;
    private static final int NXT_TEXTFLAG_CUTOUT = 2048;
    private static final int NXT_TEXTFLAG_FILL = 4;
    private static final int NXT_TEXTFLAG_ITALIC = 2;
    private static final int NXT_TEXTFLAG_LINEAR = 512;
    private static final int NXT_TEXTFLAG_SHADOW = 256;
    private static final int NXT_TEXTFLAG_STRIKE = 32;
    private static final int NXT_TEXTFLAG_STROKE = 8;
    private static final int NXT_TEXTFLAG_STROKEBACK = 4096;
    private static final int NXT_TEXTFLAG_SUBPIXEL = 128;
    private static final int NXT_TEXTFLAG_UNDERLINE = 16;
    private static final int NXT_VALIGNMASK = 240;
    private static final int NXT_VALIGN_BOTTOM = 32;
    private static final int NXT_VALIGN_CENTER = 16;
    private static final int NXT_VALIGN_TOP = 0;
    private static final String TAG_Overlay = "[Overlay]";
    private static final String TAG_PreviewThemeImage = "[PvwThImage]";
    private static final String TAG_Text = "[Text]";
    private static final String TAG_ThemeImage = "[ThemeImage]";
    private static final String TYPEFACE_ASSET = "asset:";
    private static final String TYPEFACE_FILE = "file:";
    private static final String TYPEFACE_FONTFILE = "fontfile:";
    private static final String TYPEFACE_FONTID = "fontid:";
    private static final String TYPEFACE_SYSTEM = "android:";
    private static final String TYPEFACE_THEME = "theme:";
    private static Map<a, WeakReference<Bitmap>> sBitmapCache = new HashMap();
    private static final Object sBitmapCacheLock = new Object();
    private static int sCleanCacheCount = 0;
    private static WeakHashMap<Bitmap, c> sLoadedBitmapCache = new WeakHashMap<>();
    private AssetManager m_assetManager;
    private a m_effectResourceLoader;
    private int m_jpegMaxHeight;
    private int m_jpegMaxSize;
    private int m_jpegMaxWidth;
    private d m_overlayPathResolver;

    private static class a {
        final String a;
        final int b;
        final int c;
        final int d;
        final Config e;
        final boolean f;

        private a(String str, int i, int i2, int i3, Config config, boolean z) {
            if (str == null) {
                str = "";
            }
            this.a = str;
            this.b = i;
            this.c = i2;
            this.d = i3;
            this.e = config;
            this.f = z;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (obj == null || !(obj instanceof a)) {
                return false;
            }
            if (obj == this) {
                return true;
            }
            a aVar = (a) obj;
            if (this.b == aVar.b && this.c == aVar.c && this.d == aVar.d && this.e == aVar.e && this.a.equals(aVar.a) && this.f == aVar.f) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return this.a.hashCode() + (this.b * 191) + (this.c * 61) + (this.d * 199) + (this.e == null ? 0 : this.e.hashCode());
        }
    }

    public static class b {
        private Bitmap a;
        private int b;
        private int c;
        private int d;

        private b(Bitmap bitmap, int i, int i2) {
            this.b = i;
            this.c = i2;
            this.a = bitmap;
            this.d = 1;
        }

        private b(Bitmap bitmap, int i, int i2, int i3) {
            this.b = i;
            this.c = i2;
            this.a = bitmap;
            this.d = i3;
        }

        public Bitmap a() {
            return this.a;
        }

        public int b() {
            return this.b;
        }

        public int c() {
            return this.c;
        }

        public int d() {
            return this.d;
        }
    }

    public static class c {
        private int a;
        private int b;
        private int c;

        private c(int i, int i2) {
            this.a = i;
            this.b = i2;
            this.c = 1;
        }

        private c(int i, int i2, int i3) {
            this.a = i;
            this.b = i2;
            this.c = i3;
        }

        public int a() {
            return this.a;
        }

        public int b() {
            return this.b;
        }

        public int c() {
            return this.c;
        }
    }

    public static abstract class d {
        public abstract String a(String str);
    }

    public NexImageLoader(Resources resources, a aVar, d dVar, int i, int i2, int i3) {
        if (resources == null) {
            this.m_assetManager = null;
        } else {
            this.m_assetManager = resources.getAssets();
        }
        this.m_effectResourceLoader = aVar;
        this.m_overlayPathResolver = dVar;
        this.m_jpegMaxWidth = i;
        this.m_jpegMaxHeight = i2;
        this.m_jpegMaxSize = i3;
    }

    public static void calcSampleSize(Options options) {
        int i = 1;
        while (i < 8 && ((options.outWidth / i > 1440 && options.outHeight / i > 810) || ((options.outWidth / i) * options.outHeight) / i > 1500000)) {
            i *= 2;
        }
        options.inSampleSize = i;
    }

    public static void calcSampleSize(Options options, int i, int i2, int i3) {
        int i4 = 1;
        while (i4 < 8) {
            if (options.outWidth / i4 <= i || options.outHeight / i4 <= i2) {
                if (((options.outWidth / i4) * options.outHeight) / i4 <= (i3 > 0 ? i3 : 1500000)) {
                    break;
                }
            }
            i4 *= 2;
        }
        options.inSampleSize = i4;
    }

    private static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[4096];
        while (true) {
            int read = inputStream.read(bArr);
            if (-1 != read) {
                outputStream.write(bArr, 0, read);
            } else {
                return;
            }
        }
    }

    private static Bitmap getThumbnail(Context context, String str) {
        Cursor query = context.getContentResolver().query(Media.EXTERNAL_CONTENT_URI, new String[]{"_id"}, "_data=?", new String[]{str}, null);
        if (query == null || !query.moveToFirst()) {
            query.close();
            return null;
        }
        int i = query.getInt(query.getColumnIndex("_id"));
        query.close();
        return Thumbnails.getThumbnail(context.getContentResolver(), (long) i, 1, null);
    }

    private static int getThumbnailOrientation(Context context, String str) {
        Uri uri;
        Cursor query = context.getContentResolver().query(Media.EXTERNAL_CONTENT_URI, new String[]{"_id"}, "_data=?", new String[]{str}, null);
        if (query == null || !query.moveToFirst()) {
            uri = null;
        } else {
            uri = ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, (long) query.getInt(query.getColumnIndex("_id")));
            query.close();
        }
        Uri uri2 = uri;
        if (uri2 != null) {
            String[] strArr = {"orientation"};
            Cursor query2 = context.getContentResolver().query(uri2, strArr, null, null, null);
            if (query2 != null && query2.moveToFirst()) {
                return query2.getInt(query2.getColumnIndex(strArr[0]));
            }
        }
        return -1;
    }

    public static b loadBitmap(InputStream inputStream, int i, int i2, int i3) {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        Options options = new Options();
        int i4 = 1;
        options.inJustDecodeBounds = true;
        try {
            bufferedInputStream.mark(inputStream.available());
        } catch (IOException e) {
            e.printStackTrace();
        }
        BitmapFactory.decodeStream(bufferedInputStream, null, options);
        try {
            bufferedInputStream.reset();
            options.inJustDecodeBounds = false;
            int i5 = options.outWidth;
            int i6 = options.outHeight;
            while (i4 < 8) {
                if (options.outWidth / i4 <= i || options.outHeight / i4 <= i2) {
                    if (((options.outWidth / i4) * options.outHeight) / i4 <= (i3 > 0 ? i3 : 1500000)) {
                        break;
                    }
                }
                i4 *= 2;
            }
            options.inSampleSize = i4;
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("loadBitmap from stream width=");
            sb.append(options.outWidth);
            sb.append(" height=");
            sb.append(options.outHeight);
            sb.append(" sampleSize=");
            sb.append(i4);
            Log.d(str, sb.toString());
            Bitmap decodeStream = BitmapFactory.decodeStream(bufferedInputStream, null, options);
            try {
                bufferedInputStream.close();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            return decodeStream == null ? new b((Bitmap) null, 0, 0) : new b(decodeStream, i5, i6);
        } catch (IOException e3) {
            throw new RuntimeException("Failed to reset stream", e3);
        }
    }

    public static b loadBitmap(String str, int i, int i2) {
        return loadBitmap(str, i, i2, Integer.MAX_VALUE, 0);
    }

    public static b loadBitmap(String str, int i, int i2, int i3, int i4) {
        return loadBitmap(str, i, i2, i3, null, i4);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00bb, code lost:
        r1 = r0.toLowerCase(java.util.Locale.US);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00c7, code lost:
        if (r1.endsWith(".jpeg") != false) goto L_0x00d4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00cf, code lost:
        if (r1.endsWith(".jpg") == false) goto L_0x00d2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x00d2, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:?, code lost:
        r1 = new android.media.ExifInterface(r0).getAttributeInt("Orientation", 0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00df, code lost:
        r2 = new android.graphics.BitmapFactory.Options();
        r2.inJustDecodeBounds = true;
        android.graphics.BitmapFactory.decodeFile(r0, r2);
        r2.inJustDecodeBounds = false;
        r2.inPreferredConfig = r9;
        r4 = r2.outWidth;
        r5 = r2.outHeight;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00f3, code lost:
        if (r10 < 8) goto L_0x00f5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00fa, code lost:
        if ((r2.outWidth / r10) > r19) goto L_0x00fc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x0101, code lost:
        if ((r2.outHeight / r10) > r20) goto L_0x0118;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x0104, code lost:
        r12 = r20;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x0106, code lost:
        r7 = ((r2.outWidth / r10) * r2.outHeight) / r10;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x010e, code lost:
        if (r21 > 0) goto L_0x0110;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x0110, code lost:
        r14 = r21;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0113, code lost:
        r14 = 1500000;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x0116, code lost:
        if (r7 > r14) goto L_0x0118;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x0118, code lost:
        r10 = r10 * 2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x011b, code lost:
        r2.inSampleSize = r10;
        r7 = LOG_TAG;
        r8 = new java.lang.StringBuilder();
        r8.append("loadBitmap width=");
        r8.append(r2.outWidth);
        r8.append(" height=");
        r8.append(r2.outHeight);
        r8.append(" sampleSize=");
        r8.append(r10);
        r8.append(" name='");
        r8.append(r0);
        r8.append("'");
        android.util.Log.d(r7, r8.toString());
        r0 = android.graphics.BitmapFactory.decodeFile(r0, r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0158, code lost:
        if (r0 == null) goto L_0x015a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x015f, code lost:
        return new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b((android.graphics.Bitmap) null, 0, 0, (com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.AnonymousClass1) null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0165, code lost:
        switch(r1) {
            case 0: goto L_0x0238;
            case 1: goto L_0x0238;
            case 2: goto L_0x01ea;
            case 3: goto L_0x01be;
            case 4: goto L_0x0210;
            case 5: goto L_0x0238;
            case 6: goto L_0x0194;
            case 7: goto L_0x0238;
            case 8: goto L_0x016a;
            default: goto L_0x0168;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x016a, code lost:
        r2 = android.graphics.Bitmap.createBitmap(r0.getHeight(), r0.getWidth(), android.graphics.Bitmap.Config.ARGB_8888);
        r6 = new android.graphics.Canvas(r2);
        r8 = new android.graphics.Matrix();
        r8.setRotate(270.0f);
        r8.postTranslate(0.0f, (float) r0.getWidth());
        r6.drawBitmap(r0, r8, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x0194, code lost:
        r2 = android.graphics.Bitmap.createBitmap(r0.getHeight(), r0.getWidth(), android.graphics.Bitmap.Config.ARGB_8888);
        r6 = new android.graphics.Canvas(r2);
        r8 = new android.graphics.Matrix();
        r8.setRotate(90.0f);
        r8.postTranslate((float) r0.getHeight(), 0.0f);
        r6.drawBitmap(r0, r8, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x01be, code lost:
        r2 = android.graphics.Bitmap.createBitmap(r0.getWidth(), r0.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
        r8 = new android.graphics.Canvas(r2);
        r10 = new android.graphics.Matrix();
        r10.setScale(-1.0f, -1.0f);
        r10.postTranslate((float) r0.getWidth(), (float) r0.getHeight());
        r8.drawBitmap(r0, r10, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x01ea, code lost:
        r10 = new android.graphics.Canvas(android.graphics.Bitmap.createBitmap(r0.getWidth(), r0.getHeight(), android.graphics.Bitmap.Config.ARGB_8888));
        r8 = new android.graphics.Matrix();
        r8.setScale(-1.0f, 1.0f);
        r8.postTranslate((float) r0.getWidth(), 0.0f);
        r10.drawBitmap(r0, r8, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0210, code lost:
        r8 = android.graphics.Bitmap.createBitmap(r0.getWidth(), r0.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
        r10 = new android.graphics.Canvas(r8);
        r12 = new android.graphics.Matrix();
        r12.setScale(1.0f, -1.0f);
        r12.postTranslate(0.0f, (float) r0.getHeight());
        r10.drawBitmap(r0, r12, null);
        r2 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x0238, code lost:
        r2 = r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0239, code lost:
        if (r9 == null) goto L_0x0259;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x0241, code lost:
        r0 = android.graphics.Bitmap.createBitmap(r2.getWidth(), r2.getHeight(), r9);
        new android.graphics.Canvas(r0).drawBitmap(r2, 0.0f, 0.0f, null);
        r2.recycle();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0259, code lost:
        r0 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x025a, code lost:
        switch(r1) {
            case 5: goto L_0x0263;
            case 6: goto L_0x0263;
            case 7: goto L_0x0263;
            case 8: goto L_0x0263;
            default: goto L_0x025d;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x025d, code lost:
        r1 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(r0, r4, r5, (com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.AnonymousClass1) null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0263, code lost:
        r1 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(r0, r5, r4, (com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.AnonymousClass1) null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x0268, code lost:
        sBitmapCache.put(r1, new java.lang.ref.WeakReference(r0));
        sLoadedBitmapCache.put(r0, new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.c(r1.b(), r1.c(), (com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.AnonymousClass1) null));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x0284, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:89:0x0118, code lost:
        continue;
     */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00b8 A[DONT_GENERATE] */
    public static b loadBitmap(String str, int i, int i2, int i3, Config config, int i4) {
        b bVar;
        String str2 = str;
        Config config2 = config;
        int i5 = 1;
        if (i4 == 1) {
            return loadBitmapThumb(str, i, i2, i3, config);
        }
        Log.d(LOG_TAG, "loadBitmap");
        a aVar = new a(str, i, i2, i3, config, false);
        synchronized (sBitmapCacheLock) {
            WeakReference weakReference = (WeakReference) sBitmapCache.get(aVar);
            if (weakReference != null) {
                Bitmap bitmap = (Bitmap) weakReference.get();
                if (bitmap != null) {
                    c cVar = (c) sLoadedBitmapCache.get(bitmap);
                    if (cVar != null) {
                        bVar = new b(bitmap, cVar.a(), cVar.b(), cVar.c());
                        sCleanCacheCount++;
                        if (sCleanCacheCount > 30) {
                            sCleanCacheCount = 0;
                            List<a> list = null;
                            for (Entry entry : sBitmapCache.entrySet()) {
                                if (((WeakReference) entry.getValue()).get() == null) {
                                    if (list == null) {
                                        list = new ArrayList<>();
                                    }
                                    list.add(entry.getKey());
                                }
                            }
                            if (list != null) {
                                for (a remove : list) {
                                    sBitmapCache.remove(remove);
                                }
                            }
                        }
                        if (bVar == null) {
                            return bVar;
                        }
                    }
                }
            }
            bVar = null;
            sCleanCacheCount++;
            if (sCleanCacheCount > 30) {
            }
            if (bVar == null) {
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00af, code lost:
        r1 = getThumbnail(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00bb, code lost:
        if (r1 != null) goto L_0x00c9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00bd, code lost:
        r10 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(null, 0, 0, 0, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x00c8, code lost:
        return r10;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00c9, code lost:
        r0 = getThumbnailOrientation(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00d7, code lost:
        if (r0 == 90) goto L_0x0114;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00db, code lost:
        if (r0 == 180) goto L_0x0103;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00df, code lost:
        if (r0 == 270) goto L_0x00ef;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00e1, code lost:
        r10 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(r1, 1280, 720, 2, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00ef, code lost:
        r16 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(rotateImage(r1, com.nexstreaming.nexeditorsdk.nexClip.kClip_Rotate_270), 720, 1280, 2, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x0103, code lost:
        r10 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(rotateImage(r1, com.nexstreaming.nexeditorsdk.nexClip.kClip_Rotate_180), 1280, 720, 2, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0114, code lost:
        r16 = new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.b(rotateImage(r1, 90), 720, 1280, 2, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x0127, code lost:
        sBitmapCache.put(r1, new java.lang.ref.WeakReference(r1));
        sLoadedBitmapCache.put(r1, new com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.c(r0.b(), r0.c(), r0.d(), null));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x0147, code lost:
        return r0;
     */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x005d  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00ac A[DONT_GENERATE] */
    public static b loadBitmapThumb(String str, int i, int i2, int i3, Config config) {
        b bVar;
        String str2 = str;
        Log.d(LOG_TAG, "loadBitmapThumb");
        a aVar = new a(str, i, i2, i3, config, true);
        synchronized (sBitmapCacheLock) {
            WeakReference weakReference = (WeakReference) sBitmapCache.get(aVar);
            if (weakReference != null) {
                Bitmap bitmap = (Bitmap) weakReference.get();
                if (bitmap != null) {
                    c cVar = (c) sLoadedBitmapCache.get(bitmap);
                    if (cVar != null) {
                        bVar = new b(bitmap, cVar.a(), cVar.b(), cVar.c());
                        sCleanCacheCount++;
                        if (sCleanCacheCount > 30) {
                            sCleanCacheCount = 0;
                            List<a> list = null;
                            for (Entry entry : sBitmapCache.entrySet()) {
                                if (((WeakReference) entry.getValue()).get() == null) {
                                    if (list == null) {
                                        list = new ArrayList<>();
                                    }
                                    list.add(entry.getKey());
                                }
                            }
                            if (list != null) {
                                for (a remove : list) {
                                    sBitmapCache.remove(remove);
                                }
                            }
                        }
                        if (bVar == null) {
                            return bVar;
                        }
                    }
                }
            }
            bVar = null;
            sCleanCacheCount++;
            if (sCleanCacheCount > 30) {
            }
            if (bVar == null) {
            }
        }
    }

    private String pdecode(String str) {
        StringBuilder sb = new StringBuilder(str);
        String str2 = str;
        int i = -1;
        while (true) {
            i = sb.indexOf("%", i + 1);
            if (i == -1) {
                break;
            }
            int i2 = i + 2;
            if (i2 >= sb.length()) {
                break;
            }
            int i3 = i + 1;
            int indexOf = "0123456789ABCDEF".indexOf(str2.charAt(i3));
            int indexOf2 = "0123456789ABCDEF".indexOf(str2.charAt(i2));
            if (!(indexOf == -1 || indexOf2 == -1)) {
                sb.setCharAt(i, (char) ((indexOf << 4) | indexOf2));
                sb.delete(i3, i + 3);
                str2 = sb.toString();
            }
        }
        return sb.toString();
    }

    private static String relativePath(String str, String str2) {
        if (str2.startsWith("..") || str2.contains("/..")) {
            throw new SecurityException("Parent Path References Not Allowed");
        } else if (str.endsWith("/")) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(str2);
            return sb.toString();
        } else {
            int lastIndexOf = str.lastIndexOf(47);
            if (lastIndexOf < 0) {
                return str2;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str.substring(0, lastIndexOf + 1));
            sb2.append(str2);
            return sb2.toString();
        }
    }

    public static Bitmap rotateAndFlipImage(Bitmap bitmap, int i, boolean z, boolean z2) {
        if ((i == 0 && !z && !z2) || bitmap == null) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        matrix.preRotate((float) i, ((float) bitmap.getWidth()) / 2.0f, ((float) bitmap.getHeight()) / 2.0f);
        float f = 1.0f;
        float f2 = z ? -1.0f : 1.0f;
        if (z2) {
            f = -1.0f;
        }
        matrix.preScale(f2, f, ((float) bitmap.getWidth()) / 2.0f, ((float) bitmap.getHeight()) / 2.0f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            return bitmap != createBitmap ? createBitmap : bitmap;
        } catch (OutOfMemoryError e) {
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("rotateImage Error : ");
            sb.append(e);
            Log.e(str, sb.toString());
            return bitmap;
        }
    }

    public static Bitmap rotateImage(Bitmap bitmap, int i) {
        if (i == 0 || bitmap == null) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        matrix.setRotate((float) i, ((float) bitmap.getWidth()) / 2.0f, ((float) bitmap.getHeight()) / 2.0f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            return bitmap != createBitmap ? createBitmap : bitmap;
        } catch (OutOfMemoryError e) {
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("rotateImage Error : ");
            sb.append(e);
            Log.e(str, sb.toString());
            return bitmap;
        }
    }

    public byte[] callbackReadAssetItemFile(String str, String str2) {
        InputStream a2;
        f c2 = com.nexstreaming.app.common.nexasset.assetpackage.c.a().c(str);
        if (c2 == null) {
            String str3 = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Error get assetItem id=");
            sb.append(str);
            Log.d(str3, sb.toString());
            return null;
        }
        try {
            AssetPackageReader a3 = AssetPackageReader.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), c2.getPackageURI(), c2.getAssetPackage().getAssetId());
            String filePath = (str2 == null || str2.length() < 1) ? c2.getFilePath() : relativePath(c2.getFilePath(), str2);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                a2 = a3.a(filePath);
                copy(a2, byteArrayOutputStream);
                a2.close();
                return byteArrayOutputStream.toByteArray();
            } catch (IOException e) {
                Log.d(LOG_TAG, "Error reading file", e);
                return null;
            } catch (Throwable th) {
                a2.close();
                throw th;
            }
        } catch (IOException e2) {
            Log.d(LOG_TAG, "Error making reader", e2);
            return null;
        }
    }

    public NexImage openFile(String str, int i) {
        if (str.startsWith("@solid:") && str.endsWith(".jpg")) {
            int parseLong = (int) Long.parseLong(str.substring(7, 15), 16);
            int[] iArr = new int[576];
            for (int i2 = 0; i2 < iArr.length; i2++) {
                iArr[i2] = parseLong;
            }
            return new NexImage(Bitmap.createBitmap(iArr, 32, 18, Config.ARGB_8888), 32, 18);
        } else if (str.startsWith("@assetItem:")) {
            String substring = str.substring(11);
            if (this.m_effectResourceLoader != null) {
                try {
                    Bitmap a2 = loadBitmap(this.m_effectResourceLoader.b(substring, null), this.m_jpegMaxWidth, this.m_jpegMaxHeight, this.m_jpegMaxSize).a();
                    if (a2 == null) {
                        return null;
                    }
                    String str2 = LOG_TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("@assetItem bitmap width=");
                    sb.append(a2.getWidth());
                    sb.append(" height=");
                    sb.append(a2.getHeight());
                    Log.d(str2, sb.toString());
                    return new NexImage(a2, a2.getWidth() & -2, a2.getHeight() & -2);
                } catch (IOException unused) {
                }
            }
            return null;
        } else {
            try {
                b loadBitmap = loadBitmap(str, this.m_jpegMaxWidth, this.m_jpegMaxHeight, this.m_jpegMaxSize, i);
                Bitmap a3 = loadBitmap.a();
                int d2 = loadBitmap.d();
                if (a3 == null) {
                    return null;
                }
                String str3 = LOG_TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Actual bitmap width=");
                sb2.append(a3.getWidth());
                sb2.append(" height=");
                sb2.append(a3.getHeight());
                sb2.append(", loadedtype=");
                sb2.append(d2);
                Log.d(str3, sb2.toString());
                return new NexImage(a3, a3.getWidth() & -2, a3.getHeight() & -2, d2);
            } catch (Exception unused2) {
                return null;
            }
        }
    }

    public byte[] openThemeFile(String str) {
        String str2;
        int indexOf = str.indexOf(47);
        int i = 0;
        if (indexOf >= 0) {
            str2 = str.substring(0, indexOf);
            str = str.substring(indexOf + 1);
        } else {
            str2 = "";
        }
        if (this.m_effectResourceLoader == null) {
            return null;
        }
        try {
            if (this.m_effectResourceLoader.a(str2, str).exists()) {
                InputStream b2 = this.m_effectResourceLoader.b(str2, str);
                String str3 = LOG_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("get size begin loading bitmap for effect(");
                sb.append(str2);
                sb.append(") : ");
                sb.append(str);
                Log.e(str3, sb.toString());
                int i2 = 0;
                while (true) {
                    int skip = (int) b2.skip(2147483647L);
                    if (skip <= 0) {
                        break;
                    }
                    i2 += skip;
                }
                b2.close();
                InputStream b3 = this.m_effectResourceLoader.b(str2, str);
                String str4 = LOG_TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("get size end loading bitmap for effect(");
                sb2.append(str2);
                sb2.append(") : ");
                sb2.append(str);
                sb2.append(" size=");
                sb2.append(i2);
                Log.e(str4, sb2.toString());
                byte[] bArr = new byte[i2];
                int i3 = i2;
                do {
                    int read = b3.read(bArr, i, i3);
                    if (-1 == read) {
                        break;
                    }
                    i += read;
                    i3 = i2 - i;
                } while (i3 > 0);
                return bArr;
            }
        } catch (IOException e) {
            String str5 = LOG_TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Error loading bitmap for effect(");
            sb3.append(str2);
            sb3.append(") : ");
            sb3.append(str);
            Log.e(str5, sb3.toString());
            e.printStackTrace();
        }
        return null;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:190:0x072a, code lost:
        if (r14 <= r7) goto L_0x072f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:191:0x072c, code lost:
        r13 = r6;
        r14 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:192:0x072f, code lost:
        r13 = r6;
     */
    /* JADX WARNING: Removed duplicated region for block: B:114:0x05db  */
    /* JADX WARNING: Removed duplicated region for block: B:115:0x05df  */
    /* JADX WARNING: Removed duplicated region for block: B:124:0x0606  */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x0633  */
    /* JADX WARNING: Removed duplicated region for block: B:296:0x0a1d  */
    /* JADX WARNING: Removed duplicated region for block: B:298:0x0a2b  */
    /* JADX WARNING: Removed duplicated region for block: B:337:0x0b58  */
    /* JADX WARNING: Removed duplicated region for block: B:339:0x0b66  */
    /* JADX WARNING: Removed duplicated region for block: B:372:0x0c30  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x02a4  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x031c  */
    public NexImage openThemeImage(String str) {
        int i;
        int i2;
        Bitmap bitmap;
        Bitmap bitmap2;
        Bitmap bitmap3;
        String str2;
        Bitmap bitmap4;
        String str3;
        Bitmap bitmap5;
        Typeface typeface;
        int i3;
        boolean z;
        float f;
        int i4;
        Bitmap bitmap6;
        int i5;
        int i6;
        int i7;
        float f2;
        TruncateAt truncateAt;
        Alignment alignment;
        StaticLayout staticLayout;
        int height;
        int i8;
        int i9;
        int i10;
        int i11;
        float f3;
        int i12;
        int i13;
        File file;
        Typeface typeface2;
        float f4;
        int i14;
        int i15;
        int i16;
        String[] strArr;
        String str4;
        String str5 = str;
        if (str5.contains(".force_effect/")) {
            str5 = str5.replace(".force_effect/", "/");
        }
        if (str5.startsWith("[ThemeImage]/@special:") || str5.startsWith("[PvwThImage]/@special:")) {
            return null;
        }
        if (str5.startsWith(TAG_Text)) {
            String substring = str5.substring(TAG_Text.length());
            int indexOf = substring.indexOf(";;");
            String substring2 = substring.substring(indexOf + 2);
            int indexOf2 = substring2.indexOf(27);
            if (indexOf2 > -1) {
                if (this.m_effectResourceLoader != null) {
                    try {
                        typeface = this.m_effectResourceLoader.a(substring2.substring(0, indexOf2));
                    } catch (TypefaceLoadException e) {
                        Log.e(LOG_TAG, "typeface error", e);
                    }
                    substring2 = substring2.substring(indexOf2 + 1);
                }
                typeface = null;
                substring2 = substring2.substring(indexOf2 + 1);
            } else {
                typeface = null;
            }
            if (substring2.length() < 1) {
                substring2 = "Title Text Goes Here";
            }
            String[] strArr2 = {substring2};
            String str6 = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("==== User Text: ");
            sb.append(substring2);
            Log.d(str6, sb.toString());
            String[] split = substring.substring(0, indexOf).split(";");
            HashMap hashMap = new HashMap();
            for (String split2 : split) {
                String[] split3 = split2.split("=");
                if (split3.length < 2) {
                    hashMap.put(split3[0], "");
                } else {
                    hashMap.put(split3[0], split3[1]);
                }
            }
            int parseLong = (int) Long.parseLong((String) hashMap.get("flags"), 16);
            int parseInt = Integer.parseInt((String) hashMap.get("align"));
            int parseInt2 = Integer.parseInt((String) hashMap.get("longtext"));
            int parseInt3 = Integer.parseInt((String) hashMap.get(nexExportFormat.TAG_FORMAT_WIDTH));
            int parseInt4 = Integer.parseInt((String) hashMap.get(nexExportFormat.TAG_FORMAT_HEIGHT));
            int parseLong2 = (int) Long.parseLong((String) hashMap.get("bgcolor"), 16);
            int i17 = parseInt2;
            int parseLong3 = (int) Long.parseLong((String) hashMap.get("fillcolor"), 16);
            int parseLong4 = (int) Long.parseLong((String) hashMap.get("shadowcolor"), 16);
            int parseLong5 = (int) Long.parseLong((String) hashMap.get("strokecolor"), 16);
            int parseLong6 = (int) Long.parseLong((String) hashMap.get("maxlines"), 16);
            float parseFloat = Float.parseFloat((String) hashMap.get("skewx"));
            float parseFloat2 = Float.parseFloat((String) hashMap.get("scalex"));
            float parseFloat3 = Float.parseFloat((String) hashMap.get("size"));
            float parseFloat4 = Float.parseFloat((String) hashMap.get("strokewidth"));
            int i18 = parseLong3;
            float parseFloat5 = Float.parseFloat((String) hashMap.get("spacingmult"));
            float f5 = parseFloat4;
            float parseFloat6 = Float.parseFloat((String) hashMap.get("spacingadd"));
            int i19 = parseLong4;
            float parseFloat7 = Float.parseFloat((String) hashMap.get("shadowradius"));
            float parseFloat8 = Float.parseFloat((String) hashMap.get("textblur"));
            int parseInt5 = Integer.parseInt((String) hashMap.get("blurtype"));
            int parseInt6 = Integer.parseInt((String) hashMap.get("margin"));
            int i20 = parseLong2;
            float parseFloat9 = Float.parseFloat((String) hashMap.get("shadowoffsx"));
            float parseFloat10 = Float.parseFloat((String) hashMap.get("shadowoffsy"));
            int i21 = parseLong6;
            String str7 = (String) hashMap.get("baseid");
            int i22 = parseInt & NXT_VALIGNMASK;
            int i23 = parseInt & 15;
            int i24 = i22;
            float f6 = parseFloat5;
            float f7 = parseFloat6;
            String pdecode = pdecode((String) hashMap.get("text"));
            int i25 = 0;
            while (true) {
                i3 = parseInt6;
                if (i25 >= 3) {
                    break;
                }
                if (i25 < strArr2.length) {
                    String str8 = strArr2[i25];
                    int length = str8.length();
                    String str9 = "";
                    strArr = strArr2;
                    i15 = i23;
                    i16 = parseInt4;
                    int i26 = 0;
                    int i27 = 0;
                    int i28 = length;
                    while (i26 < length) {
                        int i29 = parseInt3;
                        float f8 = parseFloat3;
                        if (str8.charAt(i26) == ' ') {
                            int abs = Math.abs((length / 2) - i26);
                            if (abs < i28) {
                                i27 = i26;
                                i28 = abs;
                            }
                        }
                        i26++;
                        parseInt3 = i29;
                        parseFloat3 = f8;
                    }
                    i14 = parseInt3;
                    f4 = parseFloat3;
                    if (i27 > 0) {
                        int i30 = i27 + 1;
                        if (i30 < length) {
                            str4 = str8.substring(0, i27);
                            str9 = str8.substring(i30);
                            String str10 = str9;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("%");
                            int i31 = i25 + 1;
                            sb2.append(i31);
                            String replace = pdecode.replace(sb2.toString(), str8);
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("%f");
                            sb3.append(i31);
                            String replace2 = replace.replace(sb3.toString(), str4);
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("%b");
                            sb4.append(i31);
                            pdecode = replace2.replace(sb4.toString(), str10);
                            if (str8.length() != 1) {
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("%s");
                                sb5.append(i31);
                                String replace3 = pdecode.replace(sb5.toString(), str8.substring(0, 1));
                                StringBuilder sb6 = new StringBuilder();
                                sb6.append("%!s");
                                sb6.append(i31);
                                String replace4 = replace3.replace(sb6.toString(), "");
                                StringBuilder sb7 = new StringBuilder();
                                sb7.append("%e");
                                sb7.append(i31);
                                String replace5 = replace4.replace(sb7.toString(), "");
                                StringBuilder sb8 = new StringBuilder();
                                sb8.append("%!e");
                                sb8.append(i31);
                                String replace6 = replace5.replace(sb8.toString(), "");
                                StringBuilder sb9 = new StringBuilder();
                                sb9.append("%m");
                                sb9.append(i31);
                                pdecode = replace6.replace(sb9.toString(), "");
                            } else if (str8.length() < 1) {
                                StringBuilder sb10 = new StringBuilder();
                                sb10.append("%s");
                                sb10.append(i31);
                                String replace7 = pdecode.replace(sb10.toString(), "");
                                StringBuilder sb11 = new StringBuilder();
                                sb11.append("%!s");
                                sb11.append(i31);
                                String replace8 = replace7.replace(sb11.toString(), "");
                                StringBuilder sb12 = new StringBuilder();
                                sb12.append("%e");
                                sb12.append(i31);
                                String replace9 = replace8.replace(sb12.toString(), "");
                                StringBuilder sb13 = new StringBuilder();
                                sb13.append("%!e");
                                sb13.append(i31);
                                String replace10 = replace9.replace(sb13.toString(), "");
                                StringBuilder sb14 = new StringBuilder();
                                sb14.append("%m");
                                sb14.append(i31);
                                pdecode = replace10.replace(sb14.toString(), "");
                            } else if (str8.length() > 1) {
                                StringBuilder sb15 = new StringBuilder();
                                sb15.append("%s");
                                sb15.append(i31);
                                String replace11 = pdecode.replace(sb15.toString(), str8.substring(0, 1));
                                StringBuilder sb16 = new StringBuilder();
                                sb16.append("%!s");
                                sb16.append(i31);
                                String replace12 = replace11.replace(sb16.toString(), str8.substring(1, length));
                                StringBuilder sb17 = new StringBuilder();
                                sb17.append("%e");
                                sb17.append(i31);
                                int i32 = length - 1;
                                String replace13 = replace12.replace(sb17.toString(), str8.substring(i32, length));
                                StringBuilder sb18 = new StringBuilder();
                                sb18.append("%!e");
                                sb18.append(i31);
                                String replace14 = replace13.replace(sb18.toString(), str8.substring(0, i32));
                                StringBuilder sb19 = new StringBuilder();
                                sb19.append("%m");
                                sb19.append(i31);
                                pdecode = replace14.replace(sb19.toString(), str8.substring(1, i32));
                            }
                        }
                    }
                    str4 = str8;
                    String str102 = str9;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("%");
                    int i312 = i25 + 1;
                    sb22.append(i312);
                    String replace15 = pdecode.replace(sb22.toString(), str8);
                    StringBuilder sb32 = new StringBuilder();
                    sb32.append("%f");
                    sb32.append(i312);
                    String replace22 = replace15.replace(sb32.toString(), str4);
                    StringBuilder sb42 = new StringBuilder();
                    sb42.append("%b");
                    sb42.append(i312);
                    pdecode = replace22.replace(sb42.toString(), str102);
                    if (str8.length() != 1) {
                    }
                } else {
                    strArr = strArr2;
                    i15 = i23;
                    i14 = parseInt3;
                    i16 = parseInt4;
                    f4 = parseFloat3;
                    StringBuilder sb20 = new StringBuilder();
                    sb20.append("%");
                    int i33 = i25 + 1;
                    sb20.append(i33);
                    String replace16 = pdecode.replace(sb20.toString(), "");
                    StringBuilder sb21 = new StringBuilder();
                    sb21.append("%s");
                    sb21.append(i33);
                    String replace17 = replace16.replace(sb21.toString(), "");
                    StringBuilder sb23 = new StringBuilder();
                    sb23.append("%!s");
                    sb23.append(i33);
                    String replace18 = replace17.replace(sb23.toString(), "");
                    StringBuilder sb24 = new StringBuilder();
                    sb24.append("%e");
                    sb24.append(i33);
                    String replace19 = replace18.replace(sb24.toString(), "");
                    StringBuilder sb25 = new StringBuilder();
                    sb25.append("%!e");
                    sb25.append(i33);
                    String replace20 = replace19.replace(sb25.toString(), "");
                    StringBuilder sb26 = new StringBuilder();
                    sb26.append("%m");
                    sb26.append(i33);
                    pdecode = replace20.replace(sb26.toString(), "");
                }
                i25++;
                parseInt6 = i3;
                strArr2 = strArr;
                parseInt4 = i16;
                i23 = i15;
                parseInt3 = i14;
                parseFloat3 = f4;
            }
            int i34 = i23;
            int i35 = parseInt3;
            int i36 = parseInt4;
            float f9 = parseFloat3;
            boolean matches = pdecode.matches(".*[[\\u0400-\\u052F][\\u2DE0-\\u2DFF][\\uA640-\\uA69F]].*");
            TextPaint textPaint = new TextPaint();
            textPaint.setAntiAlias(true);
            String str11 = (String) hashMap.get("typeface");
            if (typeface != null) {
                textPaint.setTypeface(typeface);
            } else if (matches) {
                int i37 = (parseLong & 1) != 0 ? 1 : 0;
                if ((parseLong & 2) != 0) {
                    i37 |= 2;
                }
                textPaint.setTypeface(Typeface.defaultFromStyle(i37));
            } else if (str11.startsWith(TYPEFACE_SYSTEM)) {
                String substring3 = str11.substring(TYPEFACE_SYSTEM.length());
                int i38 = (parseLong & 1) != 0 ? 1 : 0;
                if ((parseLong & 2) != 0) {
                    i38 |= 2;
                }
                textPaint.setTypeface(Typeface.create(substring3, i38));
            } else if (str11.startsWith(TYPEFACE_FILE)) {
                textPaint.setTypeface(Typeface.createFromFile(str11.substring(TYPEFACE_FILE.length())));
            } else if (str11.startsWith(TYPEFACE_ASSET)) {
                String substring4 = str11.substring(TYPEFACE_ASSET.length());
                if (this.m_assetManager != null) {
                    textPaint.setTypeface(Typeface.createFromAsset(this.m_assetManager, substring4));
                }
            } else if (str11.startsWith(TYPEFACE_THEME)) {
                String substring5 = str11.substring(TYPEFACE_THEME.length());
                if (this.m_effectResourceLoader != null) {
                    try {
                        textPaint.setTypeface(this.m_effectResourceLoader.a(substring5));
                    } catch (TypefaceLoadException e2) {
                        e2.printStackTrace();
                    }
                }
            } else if (str11.startsWith(TYPEFACE_FONTID)) {
                textPaint.setTypeface(com.nexstreaming.kminternal.kinemaster.fonts.c.a().b(str11.substring(TYPEFACE_FONTID.length())));
            } else if (str11.startsWith(TYPEFACE_FONTFILE)) {
                String substring6 = str11.substring(TYPEFACE_FONTFILE.length());
                if (this.m_effectResourceLoader != null) {
                    try {
                        typeface2 = this.m_effectResourceLoader.c(str7, substring6);
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    } catch (TypefaceLoadException e4) {
                        e4.printStackTrace();
                    }
                    if (typeface2 == null) {
                        textPaint.setTypeface(typeface2);
                    } else {
                        Log.d(LOG_TAG, String.format("TYPEFACE NOT FOUND : base_id=%s, font=%s", new Object[]{str7, substring6}));
                    }
                }
                typeface2 = null;
                if (typeface2 == null) {
                }
            } else {
                if (this.m_effectResourceLoader != null) {
                    try {
                        file = this.m_effectResourceLoader.a(str7, str11);
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                    if (file != null) {
                        String str12 = LOG_TAG;
                        StringBuilder sb27 = new StringBuilder();
                        sb27.append("TYPEFACE NOT FOUND : base_id=");
                        sb27.append(str7);
                        Log.i(str12, sb27.toString());
                    } else if (!file.exists()) {
                        String str13 = LOG_TAG;
                        StringBuilder sb28 = new StringBuilder();
                        sb28.append("TYPEFACE FILE DOES NOT EXIST : base_id=");
                        sb28.append(str7);
                        sb28.append("; f=");
                        sb28.append(file);
                        Log.i(str13, sb28.toString());
                    } else {
                        textPaint.setTypeface(Typeface.createFromFile(file));
                    }
                }
                file = null;
                if (file != null) {
                }
            }
            if ((parseLong & 16) != 0) {
                z = true;
                textPaint.setUnderlineText(true);
            } else {
                z = true;
            }
            if ((parseLong & 32) != 0) {
                textPaint.setStrikeThruText(z);
            }
            if ((parseLong & 128) != 0) {
                textPaint.setSubpixelText(z);
            }
            if ((parseLong & 512) != 0) {
                textPaint.setLinearText(z);
            }
            if (((double) parseFloat2) > 0.0d) {
                textPaint.setTextScaleX(parseFloat2);
            }
            if (((double) parseFloat) > 0.0d) {
                textPaint.setTextSkewX(parseFloat);
            }
            float f10 = f9;
            if (((double) f10) > 0.0d) {
                textPaint.setTextSize(f10);
                f = f10;
            } else {
                f = textPaint.getTextSize();
            }
            if ((parseLong & 12) == 0) {
                parseLong |= 4;
            }
            if (i35 > 0) {
                if (i17 != 0) {
                    switch (i17) {
                        case 2:
                            truncateAt = TruncateAt.START;
                            break;
                        case 3:
                            truncateAt = TruncateAt.MIDDLE;
                            break;
                        case 4:
                            truncateAt = TruncateAt.END;
                            break;
                    }
                }
                truncateAt = null;
                Alignment alignment2 = Alignment.ALIGN_NORMAL;
                switch (i34) {
                    case 1:
                        alignment = Alignment.ALIGN_CENTER;
                        break;
                    case 2:
                        alignment = Alignment.ALIGN_OPPOSITE;
                        break;
                    default:
                        alignment = Alignment.ALIGN_NORMAL;
                        break;
                }
                int i39 = i35 > 0 ? i35 : 2048;
                int i40 = i36 > 0 ? i36 : 2048;
                float f11 = f;
                int i41 = i35;
                while (true) {
                    int i42 = i3 * 2;
                    int i43 = i41 - i42;
                    staticLayout = new StaticLayout(pdecode, 0, pdecode.length(), textPaint, i43, alignment, f6, f7, true, truncateAt, i43);
                    i41 = staticLayout.getWidth() + i42;
                    height = staticLayout.getHeight() + i42;
                    if (i41 > i39 || height > i40) {
                        i13 = i21;
                    } else {
                        i13 = i21;
                        if (i13 < 1 || staticLayout.getLineCount() <= i13) {
                            int i44 = i41;
                        }
                    }
                    double d2 = (double) f11;
                    int i45 = i13;
                    double d3 = (double) f;
                    Double.isNaN(d3);
                    if (d2 > d3 / 5.0d && d2 > 6.0d) {
                        f11 -= Math.max(1.0f, f / 12.0f);
                        textPaint.setTextSize(f11);
                        i21 = i45;
                    } else if (i41 <= i39) {
                        i39 = i41;
                    }
                }
                int i442 = i41;
                if ((parseLong & 1024) != 0 || i35 <= 0 || i36 <= 0) {
                    i8 = i442;
                    i10 = 0;
                    i9 = 2048;
                } else {
                    String str14 = LOG_TAG;
                    StringBuilder sb29 = new StringBuilder();
                    sb29.append("VAlign=");
                    int i46 = i24;
                    sb29.append(i46);
                    sb29.append(" originalWidth=");
                    i8 = i35;
                    sb29.append(i8);
                    sb29.append(" originalHeight=");
                    int i47 = i36;
                    sb29.append(i47);
                    sb29.append(" width=");
                    sb29.append(i442);
                    sb29.append(" height=");
                    sb29.append(height);
                    Log.d(str14, sb29.toString());
                    int i48 = i46 != 16 ? i46 != 32 ? 0 : i47 - height : (i47 - height) / 2;
                    i10 = i48;
                    i9 = 2048;
                    height = i47;
                }
                int i49 = i8 > i9 ? 2048 : i8;
                if (height > i9) {
                    i11 = 1;
                    height = 2048;
                } else {
                    i11 = 1;
                }
                if (i49 < i11) {
                    i49 = 1;
                }
                if (height < i11) {
                    height = 1;
                }
                bitmap6 = Bitmap.createBitmap(i49, height, Config.ARGB_8888);
                int width = bitmap6.getWidth() & -2;
                int height2 = bitmap6.getHeight() & -2;
                Canvas canvas = new Canvas(bitmap6);
                canvas.drawColor(i20);
                canvas.save();
                float f12 = (float) i3;
                canvas.translate(f12, f12);
                canvas.translate(0.0f, (float) i10);
                if ((parseLong & 256) != 0 && parseFloat7 > 0.0f) {
                    canvas.save();
                    canvas.translate(parseFloat9, parseFloat10);
                    textPaint.setMaskFilter(new BlurMaskFilter(parseFloat7, Blur.SOLID));
                    textPaint.setStyle(Style.FILL);
                    textPaint.setColor(i19);
                    staticLayout.draw(canvas);
                    textPaint.setMaskFilter(null);
                    canvas.restore();
                }
                if ((parseLong & 4096) != 0) {
                    textPaint.setStyle(Style.STROKE);
                    i12 = parseLong5;
                    textPaint.setColor(i12);
                    f3 = f5;
                    textPaint.setStrokeWidth(f3);
                    staticLayout.draw(canvas);
                } else {
                    i12 = parseLong5;
                    f3 = f5;
                }
                float f13 = parseFloat8;
                if (((double) f13) > 1.0E-5d) {
                    Blur blur = Blur.NORMAL;
                    switch (parseInt5) {
                        case 0:
                            blur = Blur.NORMAL;
                            break;
                        case 1:
                            blur = Blur.SOLID;
                            break;
                        case 2:
                            blur = Blur.INNER;
                            break;
                        case 3:
                            blur = Blur.OUTER;
                            break;
                    }
                    textPaint.setMaskFilter(new BlurMaskFilter(f13, blur));
                }
                if ((parseLong & 4) != 0) {
                    if ((parseLong & 2048) != 0) {
                        textPaint.setXfermode(new PorterDuffXfermode(Mode.DST_IN));
                    }
                    textPaint.setStyle(Style.FILL);
                    textPaint.setColor(i18);
                    staticLayout.draw(canvas);
                    textPaint.setXfermode(null);
                }
                if ((parseLong & 8) != 0) {
                    textPaint.setStyle(Style.STROKE);
                    textPaint.setColor(i12);
                    textPaint.setStrokeWidth(f3);
                    staticLayout.draw(canvas);
                }
                textPaint.setMaskFilter(null);
                canvas.restore();
                i2 = height2;
                i4 = width;
            } else {
                int i50 = parseLong5;
                int i51 = i18;
                float f14 = f5;
                float f15 = parseFloat7;
                int i52 = i20;
                float f16 = parseFloat9;
                float f17 = parseFloat10;
                int i53 = i36;
                int i54 = i35;
                Rect rect = new Rect();
                textPaint.getTextBounds(pdecode, 0, pdecode.length(), rect);
                rect.right += 20;
                int ceil = (int) Math.ceil((double) f15);
                FontMetrics fontMetrics = textPaint.getFontMetrics();
                int max = (int) Math.max((fontMetrics.bottom * 2.0f) - fontMetrics.top, (float) rect.height());
                if (i54 < 1 || i53 < 1) {
                    int i55 = ceil * 2;
                    int max2 = Math.max(rect.width(), rect.right) + i55 + ((int) Math.abs(f16));
                    int abs2 = max + i55 + ((int) Math.abs(f17));
                    i7 = 2048;
                    if (max2 > 2048) {
                        max2 = 2048;
                    }
                    if (abs2 > 2048) {
                        i6 = max2;
                    } else {
                        i6 = max2;
                        i7 = abs2;
                    }
                    i5 = 1;
                } else {
                    i5 = 1;
                    int i56 = i53;
                    i6 = i54;
                    i7 = i56;
                }
                if (i6 < i5) {
                    i6 = 1;
                }
                if (i7 < i5) {
                    i7 = 1;
                }
                switch (i34) {
                    case 1:
                        textPaint.setTextAlign(Align.CENTER);
                        f2 = (float) (i6 / 2);
                        break;
                    case 2:
                        textPaint.setTextAlign(Align.RIGHT);
                        f2 = (float) i6;
                        break;
                    default:
                        textPaint.setTextAlign(Align.LEFT);
                        f2 = 20.0f;
                        break;
                }
                float f18 = (((float) i7) - fontMetrics.ascent) / 2.0f;
                float min = f2 + (((float) ceil) - Math.min(0.0f, f16));
                bitmap6 = Bitmap.createBitmap(i6, i7, Config.ARGB_8888);
                i4 = bitmap6.getWidth() & -2;
                i2 = bitmap6.getHeight() & -2;
                Canvas canvas2 = new Canvas(bitmap6);
                canvas2.drawColor(i52);
                int i57 = parseLong & 4;
                if (i57 != 0) {
                    textPaint.setStyle(Style.FILL);
                    textPaint.setColor(i51);
                    canvas2.drawText(pdecode, min, f18, textPaint);
                }
                if ((parseLong & 8) != 0) {
                    if (!(i57 == 0 || (parseLong & 256) == 0)) {
                        textPaint.setShadowLayer(0.0f, 0.0f, 0.0f, 0);
                    }
                    textPaint.setStyle(Style.STROKE);
                    textPaint.setColor(i50);
                    textPaint.setStrokeWidth(f14);
                    Path path = new Path();
                    textPaint.getTextPath(pdecode, 0, pdecode.length(), min, f18, path);
                    canvas2.drawPath(path, textPaint);
                }
            }
            bitmap = bitmap6;
            i = i4;
        } else {
            if (str5.startsWith(TAG_ThemeImage)) {
                String substring7 = str5.substring(TAG_ThemeImage.length());
                int indexOf3 = substring7.indexOf(47);
                if (indexOf3 >= 0) {
                    str3 = substring7.substring(0, indexOf3);
                    substring7 = substring7.substring(indexOf3 + 1);
                } else {
                    str3 = "";
                }
                String str15 = substring7;
                if (this.m_effectResourceLoader != null) {
                    try {
                        bitmap5 = BitmapFactory.decodeStream(this.m_effectResourceLoader.b(str3, str15));
                    } catch (IOException e6) {
                        String str16 = LOG_TAG;
                        StringBuilder sb30 = new StringBuilder();
                        sb30.append("Error loading bitmap for effect(");
                        sb30.append(str3);
                        sb30.append(") : ");
                        sb30.append(str15);
                        Log.e(str16, sb30.toString());
                        e6.printStackTrace();
                    }
                    if (bitmap5 == null && this.m_assetManager != null) {
                        bitmap5 = BitmapFactory.decodeStream(this.m_assetManager.open(str15));
                    }
                    if (bitmap5 == null) {
                        return new NexImage(bitmap5, bitmap5.getWidth(), bitmap5.getHeight());
                    }
                    String str17 = LOG_TAG;
                    StringBuilder sb31 = new StringBuilder();
                    sb31.append("Bitmap failed to load for effect(");
                    sb31.append(str3);
                    sb31.append(") : ");
                    sb31.append(str15);
                    Log.e(str17, sb31.toString());
                    bitmap = bitmap5;
                }
                bitmap5 = null;
                try {
                    bitmap5 = BitmapFactory.decodeStream(this.m_assetManager.open(str15));
                } catch (IOException e7) {
                    String str18 = LOG_TAG;
                    StringBuilder sb33 = new StringBuilder();
                    sb33.append("Error loading bitmap (general asset mode) for effect(");
                    sb33.append(str3);
                    sb33.append(") : ");
                    sb33.append(str15);
                    Log.e(str18, sb33.toString());
                    e7.printStackTrace();
                    bitmap5 = null;
                }
                if (bitmap5 == null) {
                }
            } else {
                if (str5.startsWith(TAG_Overlay)) {
                    if (this.m_overlayPathResolver == null) {
                        Bitmap createBitmap = Bitmap.createBitmap(8, 8, Config.ARGB_8888);
                        return new NexImage(createBitmap, createBitmap.getWidth(), createBitmap.getHeight());
                    }
                    String a2 = this.m_overlayPathResolver.a(str5.substring(TAG_Overlay.length()));
                    if (a2 == null) {
                        Bitmap createBitmap2 = Bitmap.createBitmap(8, 8, Config.ARGB_8888);
                        return new NexImage(createBitmap2, createBitmap2.getWidth(), createBitmap2.getHeight());
                    }
                    Options options = new Options();
                    options.inJustDecodeBounds = true;
                    BitmapFactory.decodeFile(a2, options);
                    options.inJustDecodeBounds = false;
                    options.inSampleSize = 1;
                    bitmap = BitmapFactory.decodeFile(a2, options);
                    if (bitmap != null) {
                        return new NexImage(bitmap, bitmap.getWidth(), bitmap.getHeight());
                    }
                } else if (str5.startsWith(TAG_PreviewThemeImage)) {
                    String substring8 = str5.substring(TAG_ThemeImage.length());
                    int indexOf4 = substring8.indexOf(47);
                    if (indexOf4 >= 0) {
                        str2 = substring8.substring(0, indexOf4);
                        substring8 = substring8.substring(indexOf4 + 1);
                    } else {
                        str2 = "";
                    }
                    String str19 = substring8;
                    Options options2 = new Options();
                    if (this.m_effectResourceLoader != null) {
                        try {
                            bitmap4 = BitmapFactory.decodeStream(this.m_effectResourceLoader.b(str2, str19), null, options2);
                        } catch (IOException e8) {
                            String str20 = LOG_TAG;
                            StringBuilder sb34 = new StringBuilder();
                            sb34.append("Error loading bitmap for effect(");
                            sb34.append(str2);
                            sb34.append(") : ");
                            sb34.append(str19);
                            Log.e(str20, sb34.toString());
                            e8.printStackTrace();
                        }
                        if (bitmap4 == null && this.m_assetManager != null) {
                            bitmap4 = BitmapFactory.decodeStream(this.m_assetManager.open(str19), null, options2);
                        }
                        bitmap = bitmap4;
                        if (bitmap == null) {
                            return new NexImage(bitmap, bitmap.getWidth(), bitmap.getHeight());
                        }
                        String str21 = LOG_TAG;
                        StringBuilder sb35 = new StringBuilder();
                        sb35.append("Bitmap failed to load for effect(");
                        sb35.append(str2);
                        sb35.append(") : ");
                        sb35.append(str19);
                        Log.e(str21, sb35.toString());
                    }
                    bitmap4 = null;
                    try {
                        bitmap4 = BitmapFactory.decodeStream(this.m_assetManager.open(str19), null, options2);
                        bitmap = bitmap4;
                    } catch (IOException e9) {
                        String str22 = LOG_TAG;
                        StringBuilder sb36 = new StringBuilder();
                        sb36.append("Error loading bitmap (general asset mode) for effect(");
                        sb36.append(str2);
                        sb36.append(") : ");
                        sb36.append(str19);
                        Log.e(str22, sb36.toString());
                        e9.printStackTrace();
                        bitmap = null;
                    }
                    if (bitmap == null) {
                    }
                } else {
                    if (!str5.startsWith(TAG_Overlay)) {
                        i = 0;
                        if (!str5.startsWith("[")) {
                            if (this.m_assetManager != null) {
                                try {
                                    if (str5.compareTo("placeholder1.jpg") != 0) {
                                        if (str5.compareTo("placeholder2.jpg") != 0) {
                                            bitmap3 = BitmapFactory.decodeStream(this.m_assetManager.open(str5));
                                            bitmap2 = bitmap3;
                                            if (bitmap2 != null) {
                                                return new NexImage(bitmap2, bitmap2.getWidth(), bitmap2.getHeight());
                                            }
                                        }
                                    }
                                    bitmap3 = BitmapFactory.decodeStream(this.m_assetManager.open(str5));
                                    bitmap2 = bitmap3;
                                } catch (IOException e10) {
                                    e10.printStackTrace();
                                }
                                if (bitmap2 != null) {
                                }
                            }
                            bitmap2 = null;
                            if (bitmap2 != null) {
                            }
                        } else {
                            bitmap2 = null;
                        }
                    } else if (this.m_overlayPathResolver == null) {
                        Bitmap createBitmap3 = Bitmap.createBitmap(8, 8, Config.ARGB_8888);
                        return new NexImage(createBitmap3, createBitmap3.getWidth(), createBitmap3.getHeight());
                    } else {
                        String a3 = this.m_overlayPathResolver.a(str5.substring(TAG_Overlay.length()));
                        if (a3 == null) {
                            Bitmap createBitmap4 = Bitmap.createBitmap(8, 8, Config.ARGB_8888);
                            return new NexImage(createBitmap4, createBitmap4.getWidth(), createBitmap4.getHeight());
                        }
                        Options options3 = new Options();
                        options3.inJustDecodeBounds = true;
                        BitmapFactory.decodeFile(a3, options3);
                        i = 0;
                        options3.inJustDecodeBounds = false;
                        options3.inSampleSize = 1;
                        bitmap2 = BitmapFactory.decodeFile(a3, options3);
                        if (bitmap2 != null) {
                            return new NexImage(bitmap2, bitmap2.getWidth(), bitmap2.getHeight());
                        }
                    }
                    i2 = 0;
                }
            }
            i2 = 0;
            i = 0;
        }
        if (bitmap == null || i <= 0 || i2 <= 0) {
            return null;
        }
        return new NexImage(bitmap, i, i2);
    }

    public void setResources(Resources resources) {
        if (resources == null) {
            this.m_assetManager = null;
        } else {
            this.m_assetManager = resources.getAssets();
        }
    }
}
