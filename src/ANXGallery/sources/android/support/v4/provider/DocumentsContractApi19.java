package android.support.v4.provider;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

class DocumentsContractApi19 {
    private static void closeQuietly(AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                autoCloseable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception unused) {
            }
        }
    }

    public static String getName(Context context, Uri uri) {
        return queryForString(context, uri, "_display_name", null);
    }

    private static String getRawType(Context context, Uri uri) {
        return queryForString(context, uri, "mime_type", null);
    }

    public static boolean isDirectory(Context context, Uri uri) {
        return "vnd.android.document/directory".equals(getRawType(context, uri));
    }

    private static String queryForString(Context context, Uri uri, String str, String str2) {
        Cursor cursor = null;
        try {
            Cursor query = context.getContentResolver().query(uri, new String[]{str}, null, null, null);
            try {
                if (!query.moveToFirst() || query.isNull(0)) {
                    closeQuietly(query);
                    return str2;
                }
                String string = query.getString(0);
                closeQuietly(query);
                return string;
            } catch (Exception e) {
                e = e;
                cursor = query;
                String str3 = "DocumentFile";
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed query: ");
                    sb.append(e);
                    Log.w(str3, sb.toString());
                    closeQuietly(cursor);
                    return str2;
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(cursor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                cursor = query;
                closeQuietly(cursor);
                throw th;
            }
        } catch (Exception e2) {
            e = e2;
            String str32 = "DocumentFile";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str32, sb2.toString());
            closeQuietly(cursor);
            return str2;
        }
    }
}
