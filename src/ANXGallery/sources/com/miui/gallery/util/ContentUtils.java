package com.miui.gallery.util;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;

public class ContentUtils {
    public static String getValidFilePathForContentUri(Context context, Uri uri) {
        if (context == null || uri == null || !"content".equals(uri.getScheme())) {
            return null;
        }
        String lastPathSegment = uri.getLastPathSegment();
        if (isValidFile(context, lastPathSegment)) {
            return lastPathSegment;
        }
        String str = (String) SafeDBUtil.safeQuery(context, uri, new String[]{"_data"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return cursor.getString(0);
            }
        });
        if (!isValidFile(context, str)) {
            str = null;
        }
        return str;
    }

    private static boolean isValidFile(Context context, String str) {
        return FileUtils.isFileExist(str) && StorageUtils.isInExternalStorage(context, str);
    }
}
