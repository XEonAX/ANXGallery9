package com.miui.gallery.provider.cloudmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.deleterecorder.DeleteRecord;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map.Entry;

class DeleteShare extends BatchTaskById {
    private int mDeleteReason;
    private String mUserId = AccountCache.getAccount().name;

    public DeleteShare(Context context, ArrayList<Long> arrayList, long[] jArr, int i) {
        super(context, arrayList, jArr);
        this.mDeleteReason = i;
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        sQLiteDatabase.beginTransaction();
        try {
            ArrayList arrayList = new ArrayList();
            for (Entry entry : batchOperationData.keyItemDataMap.entrySet()) {
                if (((BatchItemData) entry.getValue()).result == -1) {
                    batchOperationData.cursor.moveToPosition(((BatchItemData) entry.getValue()).cursorIndex);
                    if (batchOperationData.cursor.isNull(4)) {
                        Log.d("CloudManager.DeleteShare", "DELETE ITEM: no server id found, update to invalid record: %d", entry.getKey());
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("localFlag", Integer.valueOf(-1));
                        ((BatchItemData) entry.getValue()).result = (long) sQLiteDatabase.update("shareImage", contentValues, "_id = ? ", new String[]{((Long) entry.getKey()).toString()});
                    } else {
                        Log.d("CloudManager.DeleteShare", "DELETE ITEM: server id found, mark delete %d", entry.getKey());
                        ContentValues contentValues2 = new ContentValues();
                        contentValues2.put("localFlag", Integer.valueOf(2));
                        ((BatchItemData) entry.getValue()).result = (long) sQLiteDatabase.update("shareImage", contentValues2, "_id = ? ", new String[]{((Long) entry.getKey()).toString()});
                    }
                    DeleteRecord createDeleteRecord = CloudManager.createDeleteRecord(this.mDeleteReason, batchOperationData.cursor, "CloudManager.DeleteShare");
                    if (createDeleteRecord != null) {
                        arrayList.add(createDeleteRecord);
                    }
                }
            }
            sQLiteDatabase.setTransactionSuccessful();
            if (MiscUtil.isValid(arrayList)) {
                DeleteRecorder.record((Collection<DeleteRecord>) arrayList);
            }
            sQLiteDatabase.endTransaction();
            for (Entry entry2 : batchOperationData.keyItemDataMap.entrySet()) {
                if (((BatchItemData) entry2.getValue()).result > 0) {
                    markAsDirty(ShareMediaManager.convertToMediaId(((Long) entry2.getKey()).longValue()));
                }
            }
        } catch (Exception unused) {
            batchOperationData.fillResult(-110);
            sQLiteDatabase.endTransaction();
        } catch (Throwable th) {
            sQLiteDatabase.endTransaction();
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public Cursor queryCursor(SQLiteDatabase sQLiteDatabase, Long[] lArr) {
        return sQLiteDatabase.query("shareImage", CloudManager.PROJECTION, String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", lArr)}), null, null, null, null);
    }

    /* access modifiers changed from: protected */
    public long verifyBatchItem(Cursor cursor) {
        if (cursor.getInt(5) == 0) {
            Log.w("CloudManager.DeleteShare", "Album can't be deleted here, use DeleteAlbum instead");
            return -100;
        } else if (TextUtils.isEmpty(this.mUserId)) {
            Log.w("CloudManager.DeleteShare", "Account doesn't exist!");
            return -100;
        } else if (TextUtils.isEmpty(cursor.getString(4)) || this.mUserId.equals(cursor.getString(51))) {
            return -1;
        } else {
            Log.w("CloudManager.DeleteShare", "User's deleting other's media item!");
            return -100;
        }
    }
}
