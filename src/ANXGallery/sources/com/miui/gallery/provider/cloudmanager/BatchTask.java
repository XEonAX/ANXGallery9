package com.miui.gallery.provider.cloudmanager;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import com.miui.gallery.provider.cache.MediaManager;

abstract class BatchTask<K, D> {
    BatchTask() {
    }

    /* access modifiers changed from: protected */
    public String describeBundle(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        return bundle.toString();
    }

    /* access modifiers changed from: protected */
    public abstract void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, D d);

    /* access modifiers changed from: protected */
    public abstract Bundle getBatchBundle(int i, int i2, Bundle bundle);

    /* access modifiers changed from: protected */
    public abstract int getBatchCount();

    /* access modifiers changed from: protected */
    public abstract K[] getBatchExecuteKeys(Bundle bundle);

    /* access modifiers changed from: protected */
    public abstract int getTotalCount();

    /* access modifiers changed from: protected */
    public abstract void release();

    /* access modifiers changed from: protected */
    public abstract void releaseBatchBundle(Bundle bundle);

    /* access modifiers changed from: protected */
    public abstract long[] runBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle);
}
