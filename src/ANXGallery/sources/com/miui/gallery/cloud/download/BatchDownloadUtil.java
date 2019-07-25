package com.miui.gallery.cloud.download;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.preference.ThumbnailPreference;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class BatchDownloadUtil {
    private static final String[] PROJECTION = {"_id", "sha1"};

    public static void cleanDownloadedMark(Context context) {
        cleanDownloadedMark(context, DownloadType.THUMBNAIL_BATCH, false);
        cleanDownloadedMark(context, DownloadType.ORIGIN_BATCH, false);
        cleanDownloadedMark(context, DownloadType.THUMBNAIL_BATCH, true);
        cleanDownloadedMark(context, DownloadType.ORIGIN_BATCH, true);
    }

    public static void cleanDownloadedMark(Context context, DownloadType downloadType, boolean z) {
        String str;
        switch (downloadType) {
            case THUMBNAIL_BATCH:
                str = "thumbnailFile";
                break;
            case ORIGIN_BATCH:
                str = "localFile";
                break;
            default:
                str = null;
                break;
        }
        if (str != null) {
            ContentValues contentValues = new ContentValues();
            contentValues.putNull(str);
            Log.d("BatchDownloadUtil", "clean %s, result %d", str, Integer.valueOf(context.getContentResolver().update(getUri(z), contentValues, String.format(Locale.US, "%s=''", new Object[]{str}), null)));
        }
    }

    private static String getFileSelection(DownloadType downloadType) {
        String str = "";
        switch (downloadType) {
            case THUMBNAIL_BATCH:
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(String.format("(%s is null) AND ", new Object[]{"thumbnailFile"}));
                str = sb.toString();
                break;
            case ORIGIN_BATCH:
                break;
            default:
                return str;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(String.format("(%s is null) ", new Object[]{"localFile"}));
        return sb2.toString();
    }

    private static String getTableName(boolean z) {
        return z ? "shareImage" : "cloud";
    }

    private static Uri getUri(boolean z) {
        return z ? ShareImage.SHARE_URI : Cloud.CLOUD_URI;
    }

    public static List<Uri> queryDownload(Context context, DownloadType downloadType, boolean z, int i) {
        String format;
        LinkedList linkedList = new LinkedList();
        Uri uri = getUri(z);
        if (i > 0) {
            format = String.format(Locale.US, "SELECT_id FROM %s WHERE (localFlag = 0 AND serverStatus = 'custom') AND serverType IN (1,2) AND %s LIMIT %s", new Object[]{getTableName(z), getFileSelection(downloadType), Integer.valueOf(i)});
        } else {
            format = String.format(Locale.US, "(localFlag = 0 AND serverStatus = 'custom') AND serverType IN (1,2) AND %s", new Object[]{getFileSelection(downloadType)});
        }
        String str = format;
        Cursor cursor = null;
        try {
            Cursor cursor2 = context.getContentResolver().query(uri, PROJECTION, str, null, "serverTag DESC");
            if (cursor2 != null) {
                while (cursor2.moveToNext()) {
                    try {
                        if (downloadType != DownloadType.THUMBNAIL_BATCH || !ThumbnailPreference.containsThumbnailKey(cursor2.getString(1))) {
                            linkedList.add(ContentUris.withAppendedId(uri, cursor2.getLong(0)));
                        }
                    } catch (Exception e) {
                        e = e;
                        cursor = cursor2;
                        try {
                            Log.e("BatchDownloadUtil", (Throwable) e);
                            MiscUtil.closeSilently(cursor);
                            return linkedList;
                        } catch (Throwable th) {
                            th = th;
                            cursor2 = cursor;
                            MiscUtil.closeSilently(cursor2);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        MiscUtil.closeSilently(cursor2);
                        throw th;
                    }
                }
            }
            MiscUtil.closeSilently(cursor2);
        } catch (Exception e2) {
            e = e2;
            Log.e("BatchDownloadUtil", (Throwable) e);
            MiscUtil.closeSilently(cursor);
            return linkedList;
        }
        return linkedList;
    }
}
