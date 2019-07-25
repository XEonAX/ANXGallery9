package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.StringBuilderPrinter;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.logger.TimingTracing;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

class DupDelete extends DupMedia {
    private final String TRACE_TAG = String.format("CloudManager.DupDelete{%s}", new Object[]{Long.valueOf(Thread.currentThread().getId())});
    private int mDeleteReason;

    public DupDelete(Context context, ArrayList<Long> arrayList, long[] jArr, int i, int i2) {
        super(context, arrayList, jArr, i);
        this.mDeleteReason = i2;
    }

    /* access modifiers changed from: protected */
    public void executeBatch(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Bundle bundle, BatchOperationData<Long> batchOperationData) {
        try {
            super.executeBatch(sQLiteDatabase, mediaManager, bundle, batchOperationData);
        } finally {
            TimingTracing.addSplit(this.TRACE_TAG, "executeBatch");
        }
    }

    /* access modifiers changed from: protected */
    public long[] executeDupItems(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long[] jArr) {
        return new DeleteOwner(getContext(), getDirtyBulk(), jArr, this.mDeleteReason).run(sQLiteDatabase, mediaManager);
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
            StringBuilder sb = new StringBuilder();
            long stopTracing = TimingTracing.stopTracing(this.TRACE_TAG, new StringBuilderPrinter(sb));
            if (getTotalCount() > 0 && stopTracing > ((long) getTotalCount()) * 100) {
                Log.w("CloudManager.DupDelete", "delete slowly: %s", sb.toString());
                HashMap hashMap = new HashMap();
                hashMap.put("cost", String.valueOf(stopTracing / ((long) getTotalCount())));
                hashMap.put("detail", sb.toString());
                GallerySamplingStatHelper.recordErrorEvent("delete_performance", "CloudManager.DupDelete", hashMap);
            }
            return run;
        } catch (Throwable th) {
            StringBuilder sb2 = new StringBuilder();
            long stopTracing2 = TimingTracing.stopTracing(this.TRACE_TAG, new StringBuilderPrinter(sb2));
            if (getTotalCount() > 0 && stopTracing2 > ((long) getTotalCount()) * 100) {
                Log.w("CloudManager.DupDelete", "delete slowly: %s", sb2.toString());
                HashMap hashMap2 = new HashMap();
                hashMap2.put("cost", String.valueOf(stopTracing2 / ((long) getTotalCount())));
                hashMap2.put("detail", sb2.toString());
                GallerySamplingStatHelper.recordErrorEvent("delete_performance", "CloudManager.DupDelete", hashMap2);
            }
            throw th;
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

    /* access modifiers changed from: protected */
    public long verifyBatchItem(Cursor cursor) {
        if (cursor.getInt(5) == 0) {
            Log.w("CloudManager.DupDelete", "Album can't be deleted here, use DeleteAlbum instead");
            return -100;
        } else if (!ShareMediaManager.isOtherShareMediaId(cursor.getLong(0))) {
            return -1;
        } else {
            Log.w("CloudManager.DupDelete", "Share medias can't be deleted here, use DeleteSharer instead");
            return -100;
        }
    }
}
