package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.LongSparseArray;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

abstract class DupMedia extends BatchTaskById {
    private int mDupType;

    static class DupOperationData extends BatchOperationData<Long> {
        Map<String, Long> sha1ToKeyMap = null;

        public DupOperationData(Long[] lArr) {
            super(lArr);
            this.sha1ToKeyMap = new HashMap(lArr.length);
        }
    }

    public DupMedia(Context context, ArrayList<Long> arrayList, long[] jArr, int i) {
        super(context, arrayList, jArr);
        this.mDupType = i;
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        int i;
        DupOperationData dupOperationData = (DupOperationData) batchOperationData;
        LongSparseArray longSparseArray = new LongSparseArray(batchOperationData.cursor.getCount());
        batchOperationData.cursor.moveToFirst();
        while (true) {
            if (batchOperationData.cursor.isAfterLast()) {
                break;
            }
            Long l = (Long) dupOperationData.sha1ToKeyMap.get(batchOperationData.cursor.getString(9));
            if (l != null) {
                longSparseArray.put(batchOperationData.cursor.getLong(0), l);
            }
            batchOperationData.cursor.moveToNext();
        }
        if (longSparseArray.size() > 0) {
            long[] jArr = new long[longSparseArray.size()];
            for (int i2 = 0; i2 < jArr.length; i2++) {
                jArr[i2] = longSparseArray.keyAt(i2);
            }
            long[] executeDupItems = executeDupItems(sQLiteDatabase, mediaManager, jArr);
            for (i = 0; i < jArr.length; i++) {
                BatchItemData batchItemData = (BatchItemData) batchOperationData.keyItemDataMap.get(longSparseArray.get(jArr[i]));
                long j = 0;
                if (batchItemData.result < 0) {
                    batchItemData.result = 0;
                }
                long j2 = batchItemData.result;
                if (executeDupItems[i] > 0) {
                    j = 1;
                }
                batchItemData.result = j2 + j;
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract long[] executeDupItems(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long[] jArr);

    /* access modifiers changed from: protected */
    public BatchOperationData<Long> genBatchOperationData(Long[] lArr) {
        return new DupOperationData(lArr);
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0075  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x007e  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x00d4  */
    public Cursor queryCursor(SQLiteDatabase sQLiteDatabase, Long[] lArr) {
        String str;
        Cursor cursor;
        String str2;
        Long[] lArr2 = lArr;
        Cursor cursor2 = null;
        switch (this.mDupType) {
            case 0:
                StringBuilder sb = new StringBuilder();
                try {
                    Cursor query = sQLiteDatabase.query("cloud", new String[]{"_id"}, "attributes & 4 != 0", null, null, null, null);
                    if (query != null) {
                        while (query.moveToNext()) {
                            try {
                                if (!query.isFirst()) {
                                    sb.append(',');
                                }
                                sb.append(query.getLong(0));
                            } catch (Throwable th) {
                                th = th;
                                cursor2 = query;
                                if (cursor2 != null) {
                                }
                                throw th;
                            }
                        }
                    }
                    if (query != null) {
                        query.close();
                    }
                    str = String.format("(%s) AND %s IN (%s)", new Object[]{"(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL", "localGroupId", sb});
                    break;
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor2 != null) {
                        cursor2.close();
                    }
                    throw th;
                }
            case 1:
                String str3 = "cloud";
                try {
                    cursor = sQLiteDatabase.query(true, str3, new String[]{"localGroupId"}, String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", lArr2)}), null, null, null, null, null);
                    if (cursor != null) {
                        try {
                            if (cursor.getCount() <= 1) {
                                if (cursor.moveToFirst()) {
                                    str2 = String.format("(%s) AND %s IN (%s)", new Object[]{"(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL", "localGroupId", Long.valueOf(cursor.getLong(0))});
                                    if (cursor != null) {
                                        cursor.close();
                                    }
                                    str = str2;
                                    break;
                                }
                            } else {
                                Log.e("CloudManager.DupMedia", "Cannot handle dup in album with multiple albums!");
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    }
                    str2 = null;
                    if (cursor != null) {
                    }
                    str = str2;
                } catch (Throwable th4) {
                    th = th4;
                    cursor = null;
                    if (cursor != null) {
                    }
                    throw th;
                }
            case 2:
                str = "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL";
                break;
            default:
                str = null;
                break;
        }
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, String.format(str, new Object[]{TextUtils.join(",", lArr2)}), null, null, null, "sha1 DESC,serverId DESC ");
    }

    /* access modifiers changed from: protected */
    public void verifyBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        super.verifyBatch(sQLiteDatabase, mediaManager, bundle, batchOperationData);
        if (!batchOperationData.isAllInvalid()) {
            DupOperationData dupOperationData = (DupOperationData) batchOperationData;
            dupOperationData.fillResult(-102);
            Cursor cursor = batchOperationData.cursor;
            for (int i = 0; i < cursor.getCount(); i++) {
                cursor.moveToPosition(i);
                long j = cursor.getLong(0);
                BatchItemData batchItemData = (BatchItemData) batchOperationData.keyItemDataMap.get(Long.valueOf(j));
                if (batchItemData != null) {
                    dupOperationData.sha1ToKeyMap.put(cursor.getString(9), Long.valueOf(j));
                    batchItemData.cursorIndex = i;
                    batchItemData.result = verifyBatchItem(cursor);
                }
            }
        }
    }
}
