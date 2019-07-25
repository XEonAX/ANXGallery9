package com.miui.gallery.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.photosapi.PhotosOemApi;
import com.miui.gallery.photosapi.ProcessingMetadataQuery.ProgressStatus;
import com.miui.gallery.provider.ProcessingMedia.ProcessingMetadata;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class ProcessingMediaManager {
    private static boolean isProcessingTimeout(Cursor cursor, int i) {
        if (i == -1) {
            return false;
        }
        if (System.currentTimeMillis() - cursor.getLong(i) <= 40000) {
            return false;
        }
        Log.w("ProcessingMediaManager", "Media process timeout: [%s]", cursor.getString(cursor.getColumnIndex("media_path")));
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x005c  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0062  */
    public static List<Long> queryProcessingMediaIds() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        ContentResolver contentResolver = sGetAndroidContext.getContentResolver();
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            Cursor cursor2 = contentResolver.query(PhotosOemApi.getQueryProcessingUri(sGetAndroidContext), new String[]{"media_store_id"}, null, null, null);
            if (cursor2 != null) {
                try {
                    int columnIndexOrThrow = cursor2.getColumnIndexOrThrow("media_store_id");
                    int columnIndex = cursor2.getColumnIndex("start_time");
                    while (cursor2.moveToNext()) {
                        if (!isProcessingTimeout(cursor2, columnIndex)) {
                            arrayList.add(Long.valueOf(cursor2.getLong(columnIndexOrThrow)));
                        }
                    }
                } catch (Exception e) {
                    e = e;
                    cursor = cursor2;
                    try {
                        Log.d("ProcessingMediaManager", (Throwable) e);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return arrayList;
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = cursor;
                        if (cursor2 != null) {
                            cursor2.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor2 != null) {
                    }
                    throw th;
                }
            }
            if (cursor2 != null) {
                cursor2.close();
            }
        } catch (Exception e2) {
            e = e2;
            Log.d("ProcessingMediaManager", (Throwable) e);
            if (cursor != null) {
            }
            return arrayList;
        }
        return arrayList;
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x005e  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0064  */
    public static List<String> queryProcessingMediaPaths() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        ContentResolver contentResolver = sGetAndroidContext.getContentResolver();
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            Cursor cursor2 = contentResolver.query(PhotosOemApi.getQueryProcessingUri(sGetAndroidContext), new String[]{"media_path"}, null, null, null);
            if (cursor2 != null) {
                try {
                    int columnIndexOrThrow = cursor2.getColumnIndexOrThrow("media_path");
                    int columnIndex = cursor2.getColumnIndex("start_time");
                    while (cursor2.moveToNext()) {
                        if (!isProcessingTimeout(cursor2, columnIndex)) {
                            String string = cursor2.getString(columnIndexOrThrow);
                            if (!TextUtils.isEmpty(string)) {
                                arrayList.add(string);
                            }
                        }
                    }
                } catch (Exception e) {
                    e = e;
                    cursor = cursor2;
                    try {
                        Log.d("ProcessingMediaManager", (Throwable) e);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return arrayList;
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = cursor;
                        if (cursor2 != null) {
                            cursor2.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor2 != null) {
                    }
                    throw th;
                }
            }
            if (cursor2 != null) {
                cursor2.close();
            }
        } catch (Exception e2) {
            e = e2;
            Log.d("ProcessingMediaManager", (Throwable) e);
            if (cursor != null) {
            }
            return arrayList;
        }
        return arrayList;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x008d  */
    public static List<ProcessingMedia> queryProcessingMedias() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        ContentResolver contentResolver = sGetAndroidContext.getContentResolver();
        Factory factory = new Factory(sGetAndroidContext);
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            Cursor cursor2 = contentResolver.query(PhotosOemApi.getQueryProcessingUri(sGetAndroidContext), null, null, null, null);
            if (cursor2 != null) {
                try {
                    int columnIndexOrThrow = cursor2.getColumnIndexOrThrow("media_store_id");
                    int columnIndexOrThrow2 = cursor2.getColumnIndexOrThrow("media_path");
                    int columnIndexOrThrow3 = cursor2.getColumnIndexOrThrow("progress_status");
                    int columnIndexOrThrow4 = cursor2.getColumnIndexOrThrow("progress_percentage");
                    int columnIndex = cursor2.getColumnIndex("start_time");
                    while (cursor2.moveToNext()) {
                        if (!isProcessingTimeout(cursor2, columnIndex)) {
                            String string = cursor2.getString(columnIndexOrThrow2);
                            long j = cursor2.getLong(columnIndexOrThrow);
                            int i = cursor2.getInt(columnIndexOrThrow3);
                            arrayList.add(factory.build(j, string, 1, new ProcessingMetadata(ProgressStatus.fromIdentifier(i), cursor2.getInt(columnIndexOrThrow4))));
                        }
                    }
                } catch (Exception e) {
                    e = e;
                    cursor = cursor2;
                    try {
                        Log.d("ProcessingMediaManager", (Throwable) e);
                        if (cursor != null) {
                        }
                        return arrayList;
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = cursor;
                        if (cursor2 != null) {
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor2 != null) {
                        cursor2.close();
                    }
                    throw th;
                }
            }
            if (cursor2 != null) {
                cursor2.close();
            }
        } catch (Exception e2) {
            e = e2;
            Log.d("ProcessingMediaManager", (Throwable) e);
            if (cursor != null) {
                cursor.close();
            }
            return arrayList;
        }
        return arrayList;
    }
}
