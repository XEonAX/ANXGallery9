package com.nexstreaming.app.common.nexasset.assetpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Picture;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.util.Log;
import com.larvalabs.svgandroid.SVGParser;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;

/* compiled from: IconHelper */
public class e {
    public static Bitmap a(Context context, f fVar, int i, int i2) throws IOException {
        return a(context, fVar, fVar.getIconPath(), i, i2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:50:0x00d9  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00fe  */
    private static Bitmap a(Context context, f fVar, String str, int i, int i2) throws IOException {
        Bitmap bitmap;
        Paint paint;
        Canvas canvas;
        PorterDuffXfermode porterDuffXfermode;
        Canvas canvas2;
        Canvas canvas3 = null;
        try {
            InputStream a = AssetPackageReader.a(context, fVar.getPackageURI(), fVar.getAssetPackage().getAssetId()).a(str);
            try {
                if (str.toLowerCase(Locale.ENGLISH).endsWith(".svg")) {
                    Picture b = SVGParser.a(a).b();
                    if (i <= 0 || i2 <= 0) {
                        bitmap = Bitmap.createBitmap(b.getWidth(), b.getHeight(), Config.ARGB_8888);
                        Canvas canvas4 = new Canvas(bitmap);
                        try {
                            b.draw(canvas4);
                            canvas3 = canvas4;
                        } catch (Exception e) {
                            e = e;
                            canvas3 = canvas4;
                            try {
                                Log.e("IconHelper", e.getMessage(), e);
                                a.close();
                                if (fVar.getCategory() == ItemCategory.transition) {
                                }
                                return bitmap;
                            } catch (Throwable th) {
                                th = th;
                                a.close();
                                if (fVar.getCategory() == ItemCategory.transition) {
                                    Paint paint2 = new Paint();
                                    if (canvas3 == null) {
                                        canvas3 = new Canvas(bitmap);
                                    }
                                    Canvas canvas5 = canvas3;
                                    paint2.setColor(-1);
                                    paint2.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
                                    canvas5.drawRect(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight(), paint2);
                                }
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            canvas3 = canvas4;
                            a.close();
                            if (fVar.getCategory() == ItemCategory.transition) {
                            }
                            throw th;
                        }
                    } else {
                        float f = (float) i;
                        int width = (int) ((f / ((float) b.getWidth())) * ((float) b.getHeight()));
                        bitmap = Bitmap.createBitmap(i, width, Config.ARGB_8888);
                        try {
                            canvas2 = new Canvas(bitmap);
                        } catch (Exception e2) {
                            e = e2;
                            Log.e("IconHelper", e.getMessage(), e);
                            a.close();
                            if (fVar.getCategory() == ItemCategory.transition) {
                                paint = new Paint();
                                if (canvas3 == null) {
                                    canvas3 = new Canvas(bitmap);
                                }
                                canvas = canvas3;
                                paint.setColor(-1);
                                porterDuffXfermode = new PorterDuffXfermode(Mode.SRC_IN);
                                paint.setXfermode(porterDuffXfermode);
                                canvas.drawRect(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight(), paint);
                            }
                            return bitmap;
                        }
                        try {
                            canvas2.drawPicture(b, new RectF(0.0f, 0.0f, f, (float) width));
                            canvas3 = canvas2;
                        } catch (Exception e3) {
                            e = e3;
                            canvas3 = canvas2;
                            Log.e("IconHelper", e.getMessage(), e);
                            a.close();
                            if (fVar.getCategory() == ItemCategory.transition) {
                            }
                            return bitmap;
                        } catch (Throwable th3) {
                            th = th3;
                            canvas3 = canvas2;
                            a.close();
                            if (fVar.getCategory() == ItemCategory.transition) {
                            }
                            throw th;
                        }
                    }
                } else {
                    bitmap = BitmapFactory.decodeStream(a).copy(Config.ARGB_8888, true);
                }
                a.close();
                if (fVar.getCategory() == ItemCategory.transition) {
                    paint = new Paint();
                    if (canvas3 == null) {
                        canvas3 = new Canvas(bitmap);
                    }
                    canvas = canvas3;
                    paint.setColor(-1);
                    porterDuffXfermode = new PorterDuffXfermode(Mode.SRC_IN);
                    paint.setXfermode(porterDuffXfermode);
                    canvas.drawRect(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight(), paint);
                }
            } catch (Exception e4) {
                e = e4;
                bitmap = null;
                Log.e("IconHelper", e.getMessage(), e);
                a.close();
                if (fVar.getCategory() == ItemCategory.transition) {
                }
                return bitmap;
            } catch (Throwable th4) {
                th = th4;
                bitmap = null;
                a.close();
                if (fVar.getCategory() == ItemCategory.transition) {
                }
                throw th;
            }
            return bitmap;
        } catch (FileNotFoundException unused) {
            return null;
        }
    }

    public static Bitmap b(Context context, f fVar, int i, int i2) throws IOException {
        return a(context, fVar, fVar.getThumbPath(), i, i2);
    }
}
