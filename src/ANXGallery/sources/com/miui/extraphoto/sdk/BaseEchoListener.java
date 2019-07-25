package com.miui.extraphoto.sdk;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.RemoteException;
import android.provider.MediaStore.Files;
import android.text.TextUtils;
import com.miui.extraphoto.sdk.IEchoListener.Stub;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class BaseEchoListener extends Stub {
    private static final String[] UPDATE_PROJECTION = {"*"};

    /* access modifiers changed from: private */
    public boolean isDeleted(int i) {
        return i == -1 || i == 2 || i == 5;
    }

    /* access modifiers changed from: private */
    public void putValue(Cursor cursor, int i, ContentValues contentValues) {
        switch (cursor.getType(i)) {
            case 1:
                contentValues.put(cursor.getColumnName(i), cursor.getString(i));
                return;
            case 2:
                contentValues.put(cursor.getColumnName(i), Double.valueOf(cursor.getDouble(i)));
                return;
            case 3:
                contentValues.put(cursor.getColumnName(i), cursor.getString(i));
                return;
            case 4:
                contentValues.put(cursor.getColumnName(i), cursor.getBlob(i));
                return;
            default:
                return;
        }
    }

    private String updateDataBase(final String str) {
        return (String) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, UPDATE_PROJECTION, "localFile like ?", new String[]{str}, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
            public String handle(Cursor cursor) {
                boolean z;
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                long j = cursor.getLong(cursor.getColumnIndex("_id"));
                String string = cursor.getString(cursor.getColumnIndex("serverId"));
                if (BaseEchoListener.this.isDeleted(cursor.getInt(cursor.getColumnIndex("localFlag")))) {
                    return null;
                }
                if (TextUtils.isEmpty(string)) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("_size", Long.valueOf(new File(str).length()));
                    SafeDBUtil.safeUpdate(GalleryApp.sGetAndroidContext(), Files.getContentUri("external"), contentValues, "_data=?", new String[]{str});
                    contentValues.clear();
                    contentValues.put("sha1", FileUtils.getSha1(str));
                    contentValues.put("size", Long.valueOf(FileUtils.getFileSize(str)));
                    Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                    Uri uri = Cloud.CLOUD_URI;
                    StringBuilder sb = new StringBuilder();
                    sb.append("_id=");
                    sb.append(j);
                    SafeDBUtil.safeUpdate(sGetAndroidContext, uri, contentValues, sb.toString(), (String[]) null);
                    return str;
                }
                String format = new SimpleDateFormat("'IMG'_yyyyMMdd_HHmmss'_STEREO.jpg'").format(new Date(cursor.getLong(cursor.getColumnIndex("mixedDateTime")) + 10000));
                File file = new File(str);
                File file2 = new File(file.getParentFile(), format);
                String absolutePath = file2.getAbsolutePath();
                if (FileUtils.move(file, file2)) {
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put("_data", absolutePath);
                    contentValues2.put("_size", Long.valueOf(file2.length()));
                    SafeDBUtil.safeUpdate(GalleryApp.sGetAndroidContext(), Files.getContentUri("external"), contentValues2, "_data like ?", new String[]{str});
                    contentValues2.clear();
                    int columnCount = cursor.getColumnCount();
                    for (int i = 0; i < columnCount; i++) {
                        BaseEchoListener.this.putValue(cursor, i, contentValues2);
                    }
                    contentValues2.put("size", Long.valueOf(FileUtils.getFileSize(absolutePath)));
                    contentValues2.put("sha1", FileUtils.getSha1(absolutePath));
                    contentValues2.put("localFlag", Integer.valueOf(8));
                    contentValues2.putNull("_id");
                    contentValues2.putNull("serverId");
                    contentValues2.putNull("groupId");
                    contentValues2.putNull("serverStatus");
                    contentValues2.putNull("serverTag");
                    contentValues2.put("fileName", format);
                    contentValues2.put("title", FileUtils.getFileTitle(format));
                    contentValues2.put("localFile", absolutePath);
                    Uri safeInsert = SafeDBUtil.safeInsert(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, contentValues2);
                    if (safeInsert == null || ContentUris.parseId(safeInsert) <= 0) {
                        z = false;
                    } else {
                        contentValues2.clear();
                        contentValues2.put("localFlag", Integer.valueOf(2));
                        Context sGetAndroidContext2 = GalleryApp.sGetAndroidContext();
                        Uri uri2 = Cloud.CLOUD_URI;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("_id=");
                        sb2.append(j);
                        SafeDBUtil.safeUpdate(sGetAndroidContext2, uri2, contentValues2, sb2.toString(), (String[]) null);
                        z = true;
                    }
                    if (z) {
                        return absolutePath;
                    }
                    Log.d("BaseEchoListener", "insert file fail %s", (Object) absolutePath);
                    MediaFileUtils.deleteFileType(FileType.ORIGINAL, absolutePath);
                    return null;
                }
                Log.d("BaseEchoListener", "server rename file fail %s", (Object) str);
                MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                return null;
            }
        });
    }

    public final void onEchoEnd(String str, String str2, final boolean z) throws RemoteException {
        final String str3 = null;
        if (z) {
            long currentTimeMillis = System.currentTimeMillis();
            if (FileUtils.move(new File(str2), new File(str))) {
                Log.d("BaseEchoListener", "move file cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                long currentTimeMillis2 = System.currentTimeMillis();
                String updateDataBase = updateDataBase(str);
                Log.d("BaseEchoListener", "update dataBase cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis2));
                if (!TextUtils.isEmpty(updateDataBase)) {
                    Log.d("BaseEchoListener", "update db success %s, %s", updateDataBase, str2);
                } else {
                    z = false;
                }
                str3 = updateDataBase;
            } else {
                Log.d("BaseEchoListener", "remove file fail %s, %s", str2, str);
                z = false;
            }
        } else {
            Log.d("BaseEchoListener", "echo file fail %s, %s", str, str2);
        }
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                BaseEchoListener.this.onEnd(str3, z);
            }
        });
    }

    public final void onEchoStart() throws RemoteException {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                BaseEchoListener.this.onStart();
            }
        });
    }

    public abstract void onEnd(String str, boolean z);

    public abstract void onStart();
}
