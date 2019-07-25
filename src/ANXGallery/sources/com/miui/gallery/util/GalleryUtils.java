package com.miui.gallery.util;

import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.ContentProvider;
import android.content.ContentProviderClient;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.CursorWrapper;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DecodeUtils.GalleryOptions;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.os.FeatureHelper;
import java.io.Closeable;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Locale;

public class GalleryUtils {
    private static Handler sHandler;
    private static File sInternalCacheDir;

    public interface ConcatConverter<T> {
        String convertToString(T t);
    }

    public interface QueryHandler<T> {
        T handle(Cursor cursor);
    }

    public static void closeStream(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static <T> String concatAll(Collection<T> collection, String str) {
        return concatAll(collection, str, null);
    }

    public static <T> String concatAll(Collection<T> collection, String str, ConcatConverter<T> concatConverter) {
        if (collection == null || collection.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (Object next : collection) {
            if (next != null) {
                String convertToString = concatConverter != null ? concatConverter.convertToString(next) : next.toString();
                if (!TextUtils.isEmpty(convertToString)) {
                    if (sb.length() > 0) {
                        sb.append(str);
                    }
                    sb.append(convertToString);
                }
            }
        }
        return sb.toString();
    }

    public static CompressFormat convertExtensionToCompressFormat(String str) {
        return str.equals("png") ? CompressFormat.PNG : CompressFormat.JPEG;
    }

    public static boolean copyFile(InputStream inputStream, OutputStream outputStream) {
        byte[] bArr = new byte[102400];
        while (true) {
            try {
                int read = inputStream.read(bArr);
                if (read != -1) {
                    outputStream.write(bArr, 0, read);
                } else {
                    outputStream.flush();
                    return true;
                }
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            } finally {
                closeStream(inputStream);
                closeStream(outputStream);
            }
        }
    }

    public static File getInternalCacheDir() {
        if (sInternalCacheDir == null && GalleryApp.sGetAndroidContext() != null) {
            sInternalCacheDir = GalleryApp.sGetAndroidContext().getCacheDir();
        }
        return sInternalCacheDir;
    }

    public static boolean needImpunityDeclaration() {
        return !FeatureHelper.isPad();
    }

    private static void putMixedDateTime(ContentValues contentValues) {
        String asString = contentValues.getAsString("exifGPSDateStamp");
        String asString2 = contentValues.getAsString("exifGPSTimeStamp");
        String asString3 = contentValues.getAsString("exifDateTime");
        Long asLong = contentValues.getAsLong("dateTaken");
        Long asLong2 = contentValues.getAsLong("dateModified");
        contentValues.put("mixedDateTime", Long.valueOf(GalleryTimeUtils.getTakenDateTime(asString, asString2, asString3, asLong != null ? asLong.longValue() : 0, asLong2 != null ? asLong2.longValue() : 0)));
    }

    public static Cursor queryToCursor(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        final ContentProviderClient contentProviderClient;
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (sGetAndroidContext == null) {
            return null;
        }
        try {
            if (GalleryCloudProvider.isCloudUri(uri)) {
                contentProviderClient = GalleryApp.sGetAndroidContext().getContentResolver().acquireContentProviderClient("com.miui.gallery.cloud.provider");
                try {
                    ContentProvider localContentProvider = contentProviderClient.getLocalContentProvider();
                    if (localContentProvider != null) {
                        Cursor query = localContentProvider.query(uri, strArr, str, strArr2, str2);
                        if (query != null) {
                            return new CursorWrapper(query) {
                                public void close() {
                                    super.close();
                                    GalleryUtils.releaseSilently(contentProviderClient);
                                }
                            };
                        }
                        releaseSilently(contentProviderClient);
                        return null;
                    }
                    releaseSilently(contentProviderClient);
                } catch (Exception e) {
                    e = e;
                    releaseSilently(contentProviderClient);
                    e.printStackTrace();
                    return null;
                }
            }
            return sGetAndroidContext.getContentResolver().query(uri, strArr, str, strArr2, str2);
        } catch (Exception e2) {
            e = e2;
            contentProviderClient = null;
            releaseSilently(contentProviderClient);
            e.printStackTrace();
            return null;
        }
    }

    public static void registerReceiver(Context context, BroadcastReceiver broadcastReceiver, String... strArr) {
        ReceiverUtils.registerReceiver(context, broadcastReceiver, strArr);
    }

    /* access modifiers changed from: private */
    public static void releaseSilently(ContentProviderClient contentProviderClient) {
        if (contentProviderClient != null) {
            try {
                contentProviderClient.release();
            } catch (Exception unused) {
            }
        }
    }

    public static void runOnMainThreadPostDelay(Runnable runnable, int i) {
        if (runnable != null) {
            if (sHandler == null) {
                sHandler = new Handler(Looper.getMainLooper());
            }
            sHandler.removeCallbacks(runnable);
            sHandler.postDelayed(runnable, (long) i);
        }
    }

    public static Bitmap safeDecodeFileDescriptor(FileDescriptor fileDescriptor, Rect rect, GalleryOptions galleryOptions) {
        try {
            Bitmap decodeFileDescriptor = BitmapFactory.decodeFileDescriptor(fileDescriptor, rect, galleryOptions);
            closeStream(null);
            return decodeFileDescriptor;
        } catch (OutOfMemoryError e) {
            Log.e("GalleryUtils", "safeDecodeFileDescriptor() failed OOM: ", (Object) e);
        } catch (Exception e2) {
            Log.e("GalleryUtils", "safeDecodeFileDescriptor() failed: ", (Object) e2);
        } catch (Throwable th) {
            closeStream(null);
            throw th;
        }
        closeStream(null);
        return null;
    }

    public static int safeDelete(Uri uri, String str, String[] strArr) {
        try {
            return GalleryApp.sGetAndroidContext().getContentResolver().delete(uri, str, strArr);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static boolean safeExec(String str) {
        try {
            return GalleryDBHelper.getInstance().execSQL(str);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Uri safeInsert(Uri uri, ContentValues contentValues) {
        try {
            return GalleryApp.sGetAndroidContext().getContentResolver().insert(uri, contentValues);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Uri safeInsertImage(Uri uri, ContentValues contentValues) {
        putMixedDateTime(contentValues);
        return safeInsert(uri, contentValues);
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x001d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0023  */
    public static <T> T safeQuery(Uri uri, String[] strArr, String str, String[] strArr2, String str2, QueryHandler<T> queryHandler) {
        Cursor cursor;
        try {
            cursor = queryToCursor(uri, strArr, str, strArr2, str2);
            try {
                T handle = queryHandler.handle(cursor);
                if (cursor != null) {
                    cursor.close();
                }
                return handle;
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    if (cursor != null) {
                        cursor.close();
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
        } catch (Exception e2) {
            e = e2;
            cursor = null;
            e.printStackTrace();
            if (cursor != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x0027  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x002e  */
    public static <T> T safeQuery(String str, String[] strArr, String str2, String[] strArr2, String str3, QueryHandler<T> queryHandler) {
        Cursor cursor;
        try {
            cursor = GalleryDBHelper.getInstance().query(str, strArr, str2, strArr2, null, null, str3, null);
            try {
                T handle = queryHandler.handle(cursor);
                if (cursor != null) {
                    cursor.close();
                }
                return handle;
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    if (cursor != null) {
                        cursor.close();
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
        } catch (Exception e2) {
            e = e2;
            cursor = null;
            e.printStackTrace();
            if (cursor != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public static boolean safeUnregisterReceiver(Context context, BroadcastReceiver broadcastReceiver) {
        return ReceiverUtils.safeUnregisterReceiver(context, broadcastReceiver);
    }

    public static int safeUpdate(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        try {
            return GalleryApp.sGetAndroidContext().getContentResolver().update(uri, contentValues, str, strArr);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static int safeUpdateImage(ContentValues contentValues, DBImage dBImage) {
        putMixedDateTime(contentValues);
        return safeUpdate(dBImage.getBaseUri(), contentValues, String.format(Locale.US, "%s=?", new Object[]{"_id"}), new String[]{dBImage.getId()});
    }

    public static boolean saveBitmapToOutputStream(Bitmap bitmap, CompressFormat compressFormat, OutputStream outputStream) {
        if (bitmap == null) {
            return false;
        }
        try {
            if (!bitmap.compress(compressFormat, 90, outputStream)) {
                return false;
            }
            Utils.closeSilently((Closeable) outputStream);
            return true;
        } finally {
            Utils.closeSilently((Closeable) outputStream);
        }
    }

    public static ProgressDialog showProgressDialog(Context context, int i, int i2, int i3, boolean z) {
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setTitle(i == 0 ? null : context.getResources().getString(i));
        progressDialog.setMessage(i2 == 0 ? null : context.getResources().getString(i2));
        progressDialog.setCancelable(z);
        progressDialog.setCanceledOnTouchOutside(false);
        if (z) {
            progressDialog.setButton(-2, context.getString(17039360), null);
        }
        if (i3 > 1) {
            progressDialog.setMax(i3);
            progressDialog.setProgressStyle(1);
        }
        progressDialog.show();
        return progressDialog;
    }
}
