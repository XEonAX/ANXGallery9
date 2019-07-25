package com.miui.gallery.provider.cloudmanager;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Log;
import java.util.ArrayList;

class SharerFileHandleTask extends BatchTaskById {
    public SharerFileHandleTask(Context context, ArrayList<Long> arrayList, long[] jArr) {
        super(context, arrayList, jArr);
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        ContentResolver contentResolver = getContext().getContentResolver();
        for (Long longValue : (Long[]) batchOperationData.keys) {
            long longValue2 = longValue.longValue();
            BatchItemData batchItemData = (BatchItemData) batchOperationData.keyItemDataMap.get(Long.valueOf(longValue2));
            if (batchItemData != null && batchItemData.result == -1 && batchItemData.cursorIndex >= 0) {
                batchOperationData.cursor.moveToPosition(batchItemData.cursorIndex);
                batchItemData.result = MediaFileHandleJob.from(contentResolver, batchOperationData.cursor, ShareMediaManager.convertToMediaId(longValue2), 40).run(getContext()) ? 1 : 0;
                Log.d("CloudManager.SharerFileHandleTask", "MediaFileHandleJob result for %d is %s", Long.valueOf(longValue2), batchItemData);
            }
        }
    }

    /* access modifiers changed from: protected */
    public Cursor queryCursor(SQLiteDatabase sQLiteDatabase, Long[] lArr) {
        return getContext().getContentResolver().query(ShareImage.SHARE_URI, CloudManager.PROJECTION, String.format("%s IN (%s)", new Object[]{"_id", TextUtils.join(",", lArr)}), null, null);
    }
}
