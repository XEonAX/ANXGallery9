package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.StringUtils;
import java.util.ArrayList;
import java.util.List;

abstract class SubTaskSeparatorTask extends BatchTaskById {

    private static class OperationData extends BatchOperationData<Long> {
        ArrayList<Pair<Integer, ArrayList<Long>>> typeIdsArrays = new ArrayList<>();

        OperationData(Long[] lArr) {
            super(lArr);
        }

        /* access modifiers changed from: 0000 */
        public void putItemToType(long j, int i) {
            String str;
            Pair pair = this.typeIdsArrays.size() <= 0 ? null : (Pair) this.typeIdsArrays.get(this.typeIdsArrays.size() - 1);
            if (pair == null || ((Integer) pair.first).intValue() != i) {
                String str2 = "CloudManager.SubTaskSeparatorTask";
                String str3 = "New type group of [%d] is created! Last group is [%s]";
                Integer valueOf = Integer.valueOf(i);
                if (pair == null) {
                    str = "null";
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append(pair.first);
                    sb.append(", count:");
                    sb.append(((ArrayList) pair.second).size());
                    str = sb.toString();
                }
                Log.d(str2, str3, valueOf, str);
                pair = new Pair(Integer.valueOf(i), new ArrayList());
                this.typeIdsArrays.add(pair);
            }
            ((ArrayList) pair.second).add(Long.valueOf(j));
        }
    }

    public SubTaskSeparatorTask(Context context, ArrayList<Long> arrayList, long[] jArr) {
        super(context, arrayList, jArr);
    }

    private void applyResult(BatchOperationData<Long> batchOperationData, long[] jArr, ArrayList<Long> arrayList) {
        for (int i = 0; i < jArr.length; i++) {
            BatchItemData batchItemData = (BatchItemData) batchOperationData.keyItemDataMap.get(arrayList.get(i));
            if (batchItemData != null) {
                batchItemData.result = jArr[i];
            }
        }
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        OperationData operationData = (OperationData) batchOperationData;
        for (int i = 0; i < operationData.typeIdsArrays.size(); i++) {
            Pair pair = (Pair) operationData.typeIdsArrays.get(i);
            if (pair.second != null && ((ArrayList) pair.second).size() > 0) {
                Log.d("CloudManager.SubTaskSeparatorTask", "[%s] Start execute type %d for ids [%s]", toString(), pair.first, TextUtils.join(",", (Iterable) pair.second));
                long[] executeType = executeType(((Integer) pair.first).intValue(), sQLiteDatabase, mediaManager, batchOperationData, Numbers.toArray((List) pair.second));
                Log.d("CloudManager.SubTaskSeparatorTask", "[%s] Result [%s]", toString(), StringUtils.join(",", executeType));
                applyResult(batchOperationData, executeType, (ArrayList) pair.second);
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract long[] executeType(int i, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, BatchOperationData<Long> batchOperationData, long[] jArr);

    /* access modifiers changed from: protected */
    public BatchOperationData<Long> genBatchOperationData(Long[] lArr) {
        return new OperationData(lArr);
    }

    /* access modifiers changed from: protected */
    public abstract int getItemTaskType(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData, long j);

    /* access modifiers changed from: protected */
    public void verifyBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        BatchOperationData<Long> batchOperationData2 = batchOperationData;
        super.verifyBatch(sQLiteDatabase, mediaManager, bundle, batchOperationData);
        OperationData operationData = (OperationData) batchOperationData2;
        for (Long longValue : (Long[]) operationData.keys) {
            long longValue2 = longValue.longValue();
            BatchItemData batchItemData = (BatchItemData) batchOperationData2.keyItemDataMap.get(Long.valueOf(longValue2));
            if (batchItemData != null) {
                int itemTaskType = getItemTaskType(sQLiteDatabase, mediaManager, bundle, batchOperationData, longValue2);
                if (itemTaskType != -1) {
                    operationData.putItemToType(longValue2, itemTaskType);
                    batchItemData.result = -1;
                }
            }
        }
    }
}
