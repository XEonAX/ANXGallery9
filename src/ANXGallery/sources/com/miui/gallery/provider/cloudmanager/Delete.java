package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.logger.TimingTracing;
import java.util.ArrayList;
import java.util.Locale;

class Delete extends OwnerShareSeparatorTask {
    private final String TRACE_TAG = String.format("CloudManager.Delete{%s}", new Object[]{Long.valueOf(Thread.currentThread().getId())});
    private int mDeleteReason;

    public Delete(Context context, ArrayList<Long> arrayList, long[] jArr, int i) {
        super(context, arrayList, jArr);
        this.mDeleteReason = i;
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        try {
            super.executeBatch(sQLiteDatabase, mediaManager, bundle, (BatchOperationData) batchOperationData);
        } finally {
            TimingTracing.addSplit(this.TRACE_TAG, "executeBatch");
        }
    }

    /* access modifiers changed from: protected */
    public long[] executeOwner(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, BatchOperationData<Long> batchOperationData, long[] jArr) {
        return new DeleteOwner(getContext(), getDirtyBulk(), jArr, this.mDeleteReason).run(sQLiteDatabase, mediaManager);
    }

    /* access modifiers changed from: protected */
    public long[] executeSharer(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, BatchOperationData<Long> batchOperationData, long[] jArr) {
        return new DeleteShare(getContext(), getDirtyBulk(), jArr, this.mDeleteReason).run(sQLiteDatabase, mediaManager);
    }

    /* access modifiers changed from: protected */
    public BatchOperationData<Long> prepareBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle) {
        try {
            BatchOperationData<Long> prepareBatch = super.prepareBatch(sQLiteDatabase, mediaManager, bundle);
            return prepareBatch;
        } finally {
            TimingTracing.addSplit(this.TRACE_TAG, "prepareBatch");
        }
    }

    public long[] run(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
        TimingTracing.beginTracing(this.TRACE_TAG, String.format(Locale.US, "count{%s}, reason{%s}", new Object[]{Integer.valueOf(getTotalCount()), Integer.valueOf(this.mDeleteReason)}));
        try {
            long[] run = super.run(sQLiteDatabase, mediaManager);
            return run;
        } finally {
            TimingTracing.stopTracing(this.TRACE_TAG, null);
        }
    }

    /* access modifiers changed from: protected */
    public void verifyBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        try {
            super.verifyBatch(sQLiteDatabase, mediaManager, bundle, batchOperationData);
        } finally {
            TimingTracing.addSplit(this.TRACE_TAG, "verifyBatch");
        }
    }
}
