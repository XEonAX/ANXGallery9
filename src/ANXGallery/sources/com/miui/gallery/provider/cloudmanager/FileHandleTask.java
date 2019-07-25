package com.miui.gallery.provider.cloudmanager;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.miui.gallery.provider.cache.MediaManager;

class FileHandleTask extends OwnerShareSeparatorTask {
    public FileHandleTask(Context context, long[] jArr) {
        super(context, null, jArr);
    }

    /* access modifiers changed from: protected */
    public long[] executeOwner(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, BatchOperationData<Long> batchOperationData, long[] jArr) {
        return new OwnerFileHandleTask(getContext(), getDirtyBulk(), jArr).run(sQLiteDatabase, mediaManager);
    }

    /* access modifiers changed from: protected */
    public long[] executeSharer(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, BatchOperationData<Long> batchOperationData, long[] jArr) {
        return new SharerFileHandleTask(getContext(), getDirtyBulk(), jArr).run(sQLiteDatabase, mediaManager);
    }
}
