package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.ArrayMap;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

abstract class BatchCursorTask<K> extends BatchTask<K, BatchOperationData<K>> {
    private Context mContext;
    private ArrayList<Long> mDirtyBulk;

    static class BatchItemData {
        int cursorIndex = -1;
        long result = -1;

        BatchItemData() {
        }
    }

    static class BatchOperationData<T> {
        Cursor cursor;
        ArrayMap<T, BatchItemData> keyItemDataMap = new ArrayMap<>(this.keys.length);
        T[] keys;

        BatchOperationData(T[] tArr) {
            this.keys = tArr;
        }

        /* access modifiers changed from: 0000 */
        public void copyResultsTo(long[] jArr) {
            if (this.keyItemDataMap.size() == jArr.length) {
                for (int i = 0; i < this.keys.length; i++) {
                    BatchItemData batchItemData = (BatchItemData) this.keyItemDataMap.get(this.keys[i]);
                    jArr[i] = batchItemData == null ? -102 : batchItemData.result;
                }
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Expect results length to be ");
            sb.append(this.keyItemDataMap.size());
            sb.append(" instead of ");
            sb.append(jArr.length);
            throw new IllegalArgumentException(sb.toString());
        }

        /* access modifiers changed from: 0000 */
        public void fillResult(long j) {
            fillResult(j, false);
        }

        /* access modifiers changed from: 0000 */
        public void fillResult(long j, boolean z) {
            for (BatchItemData batchItemData : this.keyItemDataMap.values()) {
                if (z || batchItemData.result == -1) {
                    batchItemData.result = j;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean isAllInvalid() {
            if (this.keyItemDataMap == null || this.keyItemDataMap.size() <= 0) {
                return true;
            }
            for (BatchItemData batchItemData : this.keyItemDataMap.values()) {
                if (batchItemData.result != -1) {
                    if (batchItemData.result >= 0) {
                    }
                }
                return false;
            }
            return true;
        }

        /* access modifiers changed from: 0000 */
        public void release() {
            MiscUtil.closeSilently(this.cursor);
            this.cursor = null;
        }
    }

    public BatchCursorTask(Context context, ArrayList<Long> arrayList) {
        this.mContext = context;
        this.mDirtyBulk = arrayList;
    }

    /* access modifiers changed from: protected */
    public BatchItemData genBatchItemData() {
        return new BatchItemData();
    }

    /* access modifiers changed from: protected */
    public BatchOperationData<K> genBatchOperationData(K[] kArr) {
        return new BatchOperationData<>(kArr);
    }

    /* access modifiers changed from: protected */
    public int getBatchCount() {
        return 100;
    }

    public Context getContext() {
        return this.mContext;
    }

    public ArrayList<Long> getDirtyBulk() {
        return this.mDirtyBulk;
    }

    /* access modifiers changed from: protected */
    public final void markAsDirty(long j) {
        this.mDirtyBulk.add(Long.valueOf(j));
    }

    /* access modifiers changed from: protected */
    public final void markAsDirty(Collection<Long> collection) {
        this.mDirtyBulk.addAll(collection);
    }

    /* access modifiers changed from: protected */
    public BatchOperationData<K> prepareBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle) {
        Cursor cursor;
        Object[] batchExecuteKeys = getBatchExecuteKeys(bundle);
        BatchOperationData<K> genBatchOperationData = genBatchOperationData(batchExecuteKeys);
        for (Object put : batchExecuteKeys) {
            genBatchOperationData.keyItemDataMap.put(put, genBatchItemData());
        }
        try {
            cursor = queryCursor(sQLiteDatabase, batchExecuteKeys);
        } catch (Exception e) {
            Log.w("CloudManager.BatchCursorTask", (Throwable) e);
            cursor = null;
        }
        genBatchOperationData.cursor = cursor;
        return genBatchOperationData;
    }

    /* access modifiers changed from: protected */
    public abstract Cursor queryCursor(SQLiteDatabase sQLiteDatabase, K[] kArr);

    /* access modifiers changed from: protected */
    public void release() {
        this.mContext = null;
    }

    /* access modifiers changed from: protected */
    public void releaseBatchBundle(Bundle bundle) {
        if (bundle != null) {
            bundle.clear();
        }
    }

    public long[] run(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
        Bundle bundle;
        long[] jArr = new long[getTotalCount()];
        Arrays.fill(jArr, -101);
        Log.d("CloudManager.BatchCursorTask", "%s is running", (Object) toString());
        try {
            Bundle bundle2 = new Bundle();
            int i = 0;
            while (i < getTotalCount()) {
                int min = Math.min(getTotalCount() - i, getBatchCount());
                int i2 = i + min;
                try {
                    bundle = getBatchBundle(i, min, bundle2);
                    long[] runBatch = runBatch(sQLiteDatabase, mediaManager, bundle);
                    if (runBatch.length != min) {
                        Log.e("CloudManager.BatchCursorTask", "%s, Invalid batch result, expecting %d results, but actually is %d", toString(), Integer.valueOf(min), Integer.valueOf(runBatch.length));
                    }
                    int i3 = 0;
                    while (i3 < runBatch.length && i3 < min) {
                        jArr[i + i3] = runBatch[i3];
                        i3++;
                    }
                    releaseBatchBundle(bundle);
                    i = i2;
                    bundle2 = bundle;
                } catch (Throwable th) {
                    th = th;
                    bundle = bundle2;
                    releaseBatchBundle(bundle);
                    throw th;
                }
            }
            Log.d("CloudManager.BatchCursorTask", "%s finish", (Object) toString());
            release();
            return jArr;
        } catch (Throwable th2) {
            Log.d("CloudManager.BatchCursorTask", "%s finish", (Object) toString());
            release();
            throw th2;
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0045  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x005a  */
    public long[] runBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle) {
        Log.d("CloudManager.BatchCursorTask", "%s run batch for bundle %s", toString(), describeBundle(bundle));
        long[] jArr = new long[getBatchExecuteKeys(bundle).length];
        BatchOperationData batchOperationData = null;
        try {
            BatchOperationData prepareBatch = prepareBatch(sQLiteDatabase, mediaManager, bundle);
            try {
                verifyBatch(sQLiteDatabase, mediaManager, bundle, prepareBatch);
                if (!prepareBatch.isAllInvalid()) {
                    executeBatch(sQLiteDatabase, mediaManager, bundle, prepareBatch);
                }
                prepareBatch.copyResultsTo(jArr);
                if (prepareBatch != null) {
                    prepareBatch.release();
                }
            } catch (Exception e) {
                e = e;
                batchOperationData = prepareBatch;
                try {
                    Log.w("CloudManager.BatchCursorTask", (Throwable) e);
                    Arrays.fill(jArr, -101);
                    if (batchOperationData != null) {
                        batchOperationData.release();
                    }
                    Log.d("CloudManager.BatchCursorTask", "%s done run batch for bundle %s", toString(), describeBundle(bundle));
                    return jArr;
                } catch (Throwable th) {
                    th = th;
                    if (batchOperationData != null) {
                        batchOperationData.release();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                batchOperationData = prepareBatch;
                if (batchOperationData != null) {
                }
                throw th;
            }
        } catch (Exception e2) {
            e = e2;
            Log.w("CloudManager.BatchCursorTask", (Throwable) e);
            Arrays.fill(jArr, -101);
            if (batchOperationData != null) {
            }
            Log.d("CloudManager.BatchCursorTask", "%s done run batch for bundle %s", toString(), describeBundle(bundle));
            return jArr;
        }
        Log.d("CloudManager.BatchCursorTask", "%s done run batch for bundle %s", toString(), describeBundle(bundle));
        return jArr;
    }

    /* access modifiers changed from: protected */
    public void verifyBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<K> batchOperationData) {
        if (batchOperationData.cursor == null) {
            Log.d("CloudManager.BatchCursorTask", "cursor for %s is null, abort", (Object) toString());
            batchOperationData.fillResult(-101);
        } else if (batchOperationData.cursor.getCount() <= 0) {
            Log.d("CloudManager.BatchCursorTask", "cursor for %s has nothing, abort", (Object) toString());
            batchOperationData.fillResult(-102);
        } else {
            batchOperationData.fillResult(-1);
        }
    }
}
