package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.StringUtils;
import java.util.ArrayList;
import java.util.Arrays;

abstract class BatchTaskById extends BatchCursorTask<Long> {
    protected long[] mIds;

    public BatchTaskById(Context context, ArrayList<Long> arrayList, long[] jArr) {
        super(context, arrayList);
        Numbers.ensurePositive(jArr);
        this.mIds = jArr;
    }

    /* access modifiers changed from: protected */
    public void bindBatchCursorIndexes(BatchOperationData<Long> batchOperationData) {
        if (batchOperationData.cursor != null && batchOperationData.cursor.getCount() > 0) {
            Cursor cursor = batchOperationData.cursor;
            for (int i = 0; i < cursor.getCount(); i++) {
                cursor.moveToPosition(i);
                BatchItemData batchItemData = (BatchItemData) batchOperationData.keyItemDataMap.get(Long.valueOf(cursor.getLong(0)));
                if (batchItemData != null) {
                    batchItemData.cursorIndex = i;
                    batchItemData.result = verifyBatchItem(cursor);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public String describeBundle(Bundle bundle) {
        if (bundle == null || !bundle.containsKey("ids")) {
            return null;
        }
        return String.format("%s:[%s]", new Object[]{"ids", StringUtils.join(",", bundle.getLongArray("ids"))});
    }

    /* access modifiers changed from: protected */
    public Bundle getBatchBundle(int i, int i2, Bundle bundle) {
        bundle.putLongArray("ids", Arrays.copyOfRange(this.mIds, i, i2 + i));
        return bundle;
    }

    /* access modifiers changed from: protected */
    public Long[] getBatchExecuteKeys(Bundle bundle) {
        long[] longArray = bundle.getLongArray("ids");
        Long[] lArr = new Long[longArray.length];
        for (int i = 0; i < longArray.length; i++) {
            lArr[i] = Long.valueOf(longArray[i]);
        }
        return lArr;
    }

    /* access modifiers changed from: protected */
    public int getTotalCount() {
        return this.mIds.length;
    }

    /* access modifiers changed from: protected */
    public void verifyBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        super.verifyBatch(sQLiteDatabase, mediaManager, bundle, batchOperationData);
        if (!batchOperationData.isAllInvalid()) {
            batchOperationData.fillResult(-102);
            bindBatchCursorIndexes(batchOperationData);
        }
    }

    /* access modifiers changed from: protected */
    public long verifyBatchItem(Cursor cursor) {
        return -1;
    }
}
