package com.miui.gallery.util;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Video;
import android.support.media.ExifInterface;
import android.text.TextUtils;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.IOException;
import java.util.Locale;

public class MediaStoreUtils {
    private static final Uri BASE_URI = Files.getContentUri("external");
    private static final String[] PROJECTION = {"_id", "_data", "mime_type"};

    private static void fillByFile(ContentValues contentValues, File file) {
        contentValues.put("_data", file.getAbsolutePath());
        contentValues.put("title", BaseFileUtils.getFileTitle(file.getName()));
        contentValues.put("date_modified", Long.valueOf(file.lastModified() / 1000));
        contentValues.put("_size", Long.valueOf(file.length()));
    }

    private static boolean fillByImage(ContentValues contentValues, String str) {
        Options options = new Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(str, options);
        if (options.outWidth <= 0 || options.outHeight <= 0) {
            Log.w("MediaStoreUtils", "decode image bounds failed");
            return false;
        }
        contentValues.put(nexExportFormat.TAG_FORMAT_WIDTH, Integer.valueOf(options.outWidth));
        contentValues.put(nexExportFormat.TAG_FORMAT_HEIGHT, Integer.valueOf(options.outHeight));
        return true;
    }

    private static void fillByJpeg(ContentValues contentValues, File file) {
        contentValues.put("mime_type", "image/jpeg");
        try {
            ExifInterface exifInterface = new ExifInterface(file.getAbsolutePath());
            double[] latLong = exifInterface.getLatLong();
            if (latLong != null) {
                contentValues.put("latitude", Double.valueOf(latLong[0]));
                contentValues.put("longitude", Double.valueOf(latLong[1]));
            }
            long lastModified = file.lastModified();
            if (lastModified > 0) {
                contentValues.put("datetaken", Long.valueOf(lastModified));
            } else {
                long dateTime = exifInterface.getDateTime();
                if (dateTime != -1) {
                    contentValues.put("datetaken", Long.valueOf(dateTime));
                } else {
                    long gpsDateTime = exifInterface.getGpsDateTime();
                    if (gpsDateTime != -1) {
                        contentValues.put("datetaken", Long.valueOf(gpsDateTime));
                    }
                }
            }
            contentValues.put("orientation", Integer.valueOf(ExifUtil.getRotationDegrees(exifInterface)));
        } catch (IOException e) {
            Log.w("MediaStoreUtils", (Throwable) e);
        }
    }

    public static void fillByMp4(ContentValues contentValues, File file) {
        contentValues.put("mime_type", "video/mp4");
        contentValues.put("duration", Long.valueOf(getVideoDuration(file.getAbsolutePath())));
    }

    private static String[] getBucketIds() {
        String[] pathsInExternalStorage = StorageUtils.getPathsInExternalStorage(StaticContext.sGetAndroidContext(), "DCIM/Camera");
        int length = pathsInExternalStorage.length;
        if (length == 0) {
            return null;
        }
        String[] strArr = new String[length];
        for (int i = 0; i < length; i++) {
            strArr[i] = String.valueOf(BaseFileUtils.getBucketID(pathsInExternalStorage[i]));
        }
        return strArr;
    }

    public static Uri getFileMediaUri(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return (Uri) SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), BASE_URI, PROJECTION, String.format("%s='%s'", new Object[]{"_data", str}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Uri>() {
            public Uri handle(Cursor cursor) {
                if (cursor != null && cursor.moveToFirst()) {
                    long j = cursor.getLong(0);
                    String string = cursor.getString(2);
                    if (BaseFileMimeUtil.isImageFromMimeType(string)) {
                        return ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, j);
                    }
                    if (BaseFileMimeUtil.isVideoFromMimeType(string)) {
                        return ContentUris.withAppendedId(Video.Media.EXTERNAL_CONTENT_URI, j);
                    }
                }
                return null;
            }
        });
    }

    public static Uri getLastMediaUri() {
        String[] bucketIds = getBucketIds();
        if (bucketIds == null) {
            return null;
        }
        return (Uri) SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), BASE_URI.buildUpon().appendQueryParameter("limit", "1").build(), PROJECTION, String.format("bucket_id in (%s) AND media_type in (1,3) AND _size > 0", new Object[]{TextUtils.join(",", bucketIds)}), (String[]) null, "datetaken DESC, _id DESC", (QueryHandler<T>) new QueryHandler<Uri>() {
            public Uri handle(Cursor cursor) {
                if (cursor != null && cursor.moveToFirst() && BaseFileUtils.isFileExist(cursor.getString(1))) {
                    long j = cursor.getLong(0);
                    String string = cursor.getString(2);
                    if (BaseFileMimeUtil.isImageFromMimeType(string)) {
                        return ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, j);
                    }
                    if (BaseFileMimeUtil.isVideoFromMimeType(string)) {
                        return ContentUris.withAppendedId(Video.Media.EXTERNAL_CONTENT_URI, j);
                    }
                }
                return null;
            }
        });
    }

    public static String getMediaFilePath(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        Uri parse = Uri.parse(str);
        if (!"media".equals(parse.getAuthority())) {
            return null;
        }
        return (String) SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), parse, new String[]{"_data"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return cursor.getString(0);
            }
        });
    }

    public static long getMediaStoreId(String str) {
        long j = -1;
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        Long l = (Long) SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), BASE_URI, PROJECTION, String.format("%s=%s", new Object[]{"_data", DatabaseUtils.sqlEscapeString(str)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Long>() {
            public Long handle(Cursor cursor) {
                return (cursor == null || !cursor.moveToFirst()) ? Long.valueOf(-1) : Long.valueOf(cursor.getLong(0));
            }
        });
        if (l != null) {
            j = l.longValue();
        }
        return j;
    }

    public static String getMineTypeFromUri(Uri uri) {
        if (uri == null || uri.getPath() == null) {
            return null;
        }
        String path = uri.getPath();
        if (path.contains(Media.EXTERNAL_CONTENT_URI.getPath()) || path.contains(Media.INTERNAL_CONTENT_URI.getPath())) {
            return "image";
        }
        if (path.contains(Video.Media.EXTERNAL_CONTENT_URI.getPath()) || path.contains(Video.Media.INTERNAL_CONTENT_URI.getPath())) {
            return "video";
        }
        return null;
    }

    private static long getVideoDuration(String str) {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            mediaMetadataRetriever.setDataSource(str);
            long parseLong = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
            mediaMetadataRetriever.release();
            return parseLong;
        } catch (IllegalArgumentException e) {
            Log.e("MediaStoreUtils", "IllegalArgumentException when getDuration()", (Object) e);
        } catch (RuntimeException e2) {
            Log.e("MediaStoreUtils", "RuntimeException when getDuration()", (Object) e2);
        } catch (Throwable th) {
            mediaMetadataRetriever.release();
            throw th;
        }
        mediaMetadataRetriever.release();
        return 0;
    }

    public static Uri insert(Context context, File file, int i) {
        if (!file.exists()) {
            return null;
        }
        if (i == 1) {
            ContentValues contentValues = new ContentValues();
            fillByFile(contentValues, file);
            if (fillByImage(contentValues, file.getPath())) {
                fillByJpeg(contentValues, file);
                return submit(context, Media.EXTERNAL_CONTENT_URI, contentValues);
            }
            Log.w("MediaStoreUtils", "fill image bounds failed, skip");
            return null;
        } else if (i == 2) {
            ContentValues contentValues2 = new ContentValues();
            fillByFile(contentValues2, file);
            fillByMp4(contentValues2, file);
            return submit(context, Media.EXTERNAL_CONTENT_URI, contentValues2);
        } else {
            throw new UnsupportedOperationException("not support type");
        }
    }

    public static Uri insert(Context context, String str, int i) {
        if (!TextUtils.isEmpty(str)) {
            return insert(context, new File(str), i);
        }
        throw new IllegalStateException(String.format(Locale.US, "%s is not a valid path", new Object[]{str}));
    }

    public static void sendScannerBroadcast(Context context, String str) {
        context.sendBroadcast(new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE", Uri.fromFile(new File(str))));
    }

    private static Uri submit(Context context, Uri uri, ContentValues contentValues) {
        return SafeDBUtil.safeInsert(context, uri, contentValues);
    }

    private static void submitUpdate(Uri uri, ContentValues contentValues) {
        SafeDBUtil.safeUpdate(StaticContext.sGetAndroidContext(), uri, contentValues, (String) null, (String[]) null);
    }

    public static void update(Uri uri) {
        if (uri == null) {
            Log.w("MediaStoreUtils", "update uri is null");
            return;
        }
        String mediaFilePath = getMediaFilePath(uri.toString());
        if (mediaFilePath == null) {
            Log.w("MediaStoreUtils", "getMediaFilePath is null");
            return;
        }
        File file = new File(mediaFilePath);
        if (!file.exists()) {
            Log.w("MediaStoreUtils", "update file not exist");
            return;
        }
        ContentValues contentValues = new ContentValues();
        fillByFile(contentValues, file);
        fillByImage(contentValues, mediaFilePath);
        submitUpdate(uri, contentValues);
    }

    public static void update(Uri uri, String str) {
        if (uri == null) {
            Log.w("MediaStoreUtils", "update uri is null");
        } else if (str == null) {
            Log.w("MediaStoreUtils", "getMediaFilePath is null");
        } else {
            File file = new File(str);
            if (!file.exists()) {
                Log.w("MediaStoreUtils", "update file not exist");
                return;
            }
            ContentValues contentValues = new ContentValues();
            fillByFile(contentValues, file);
            submitUpdate(uri, contentValues);
        }
    }
}
