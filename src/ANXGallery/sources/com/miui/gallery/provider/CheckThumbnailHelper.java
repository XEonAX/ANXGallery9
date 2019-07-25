package com.miui.gallery.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import java.util.HashMap;
import java.util.Map;

public class CheckThumbnailHelper {
    private static boolean checkOriginalRecordExist(Context context, String str, Map<String, Long> map) throws Exception {
        Cursor cursor;
        int i;
        String format;
        Map<String, Long> map2 = map;
        String userCommentSha1 = ExifUtil.getUserCommentSha1(str);
        boolean z = false;
        if (TextUtils.isEmpty(userCommentSha1)) {
            return false;
        }
        try {
            ContentResolver contentResolver = context.getContentResolver();
            String lowerCase = FileUtils.getParentFolderPath(StorageUtils.getRelativePath(context, str)).toLowerCase();
            if (DownloadPathHelper.isShareFolderRelativePath(lowerCase)) {
                Cursor query = contentResolver.query(ShareImage.SHARE_URI, new String[]{"_id"}, String.format("%s LIKE '%s'", new Object[]{"sha1", userCommentSha1}), null, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            z = true;
                        }
                    } catch (Throwable th) {
                        th = th;
                        cursor = query;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                }
                cursor = query;
            } else {
                Long l = (Long) map2.get(lowerCase);
                if (l == null) {
                    String str2 = "serverId = %s";
                    if (CloudUtils.getCameraLocalFile().equalsIgnoreCase(lowerCase)) {
                        format = String.format(str2, new Object[]{Long.valueOf(1)});
                    } else if (CloudUtils.getScreenshotsLocalFile().equalsIgnoreCase(lowerCase)) {
                        format = String.format(str2, new Object[]{Long.valueOf(2)});
                    } else {
                        format = String.format("%s LIKE '%s' AND %s AND %s", new Object[]{"localFile", lowerCase, "(serverType=0)", "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))"});
                    }
                    String str3 = format;
                    ContentResolver contentResolver2 = contentResolver;
                    i = 4;
                    Cursor query2 = contentResolver2.query(Cloud.CLOUD_URI, new String[]{"_id"}, str3, null, null);
                    if (query2 != null) {
                        try {
                            if (query2.moveToFirst()) {
                                Long valueOf = Long.valueOf(query2.getLong(0));
                                map2.put(lowerCase, valueOf);
                                l = valueOf;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            cursor = query2;
                            MiscUtil.closeSilently(cursor);
                            throw th;
                        }
                    }
                    MiscUtil.closeSilently(query2);
                    cursor = query2;
                } else {
                    i = 4;
                    cursor = null;
                }
                if (l != null) {
                    try {
                        Uri uri = Cloud.CLOUD_URI;
                        String[] strArr = {"_id"};
                        Object[] objArr = new Object[i];
                        objArr[0] = "localGroupId";
                        objArr[1] = String.valueOf(l);
                        objArr[2] = "sha1";
                        objArr[3] = userCommentSha1;
                        Cursor query3 = contentResolver.query(uri, strArr, String.format("%s=%s AND %s LIKE '%s'", objArr), null, null);
                        if (query3 != null) {
                            try {
                                if (query3.moveToFirst()) {
                                    z = true;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                cursor = query3;
                                MiscUtil.closeSilently(cursor);
                                throw th;
                            }
                        }
                        cursor = query3;
                    } catch (Throwable th4) {
                        th = th4;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                }
            }
            MiscUtil.closeSilently(cursor);
            return z;
        } catch (Throwable th5) {
            th = th5;
            cursor = null;
            MiscUtil.closeSilently(cursor);
            throw th;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x003c, code lost:
        if (checkUserCommentSha1Exist(r9.getPath()) != false) goto L_0x003e;
     */
    public static Cursor checkThumbnail(Context context, String[] strArr, boolean z) {
        int i;
        if (strArr == null) {
            return null;
        }
        long currentTimeMillis = System.currentTimeMillis();
        MatrixCursor matrixCursor = new MatrixCursor(new String[]{"check_thumbnail_result"}, strArr.length);
        HashMap hashMap = new HashMap();
        for (String str : strArr) {
            try {
                Uri parse = Uri.parse(str);
                if (parse != null) {
                    if (z) {
                        if (checkOriginalRecordExist(context, parse.getPath(), hashMap)) {
                        }
                    }
                    i = 0;
                    matrixCursor.addRow(new Integer[]{Integer.valueOf(i)});
                }
            } catch (Exception e) {
                Log.e("CheckThumbnailHelper", "Failed checking file %s\n %s", str, e);
            }
            i = 1;
            matrixCursor.addRow(new Integer[]{Integer.valueOf(i)});
        }
        Log.d("CheckThumbnailHelper", "Checked %d files, cost %ss", Integer.valueOf(strArr.length), String.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return matrixCursor;
    }

    private static boolean checkUserCommentSha1Exist(String str) {
        return !TextUtils.isEmpty(ExifUtil.getUserCommentSha1(str));
    }
}
