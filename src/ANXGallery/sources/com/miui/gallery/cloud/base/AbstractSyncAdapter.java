package com.miui.gallery.cloud.base;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.AsyncUpDownloadService;
import com.miui.gallery.cloud.AsyncUpDownloadService.SyncLock;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncLog;
import com.miui.os.Rom;

public abstract class AbstractSyncAdapter<T> {
    protected final String TAG = getClass().getSimpleName();
    private final Context mContext;
    private SyncLock mSyncLock;

    public AbstractSyncAdapter(Context context) {
        this.mContext = context;
    }

    private void acquireLock() {
        synchronized (this) {
            if (this.mSyncLock == null) {
                this.mSyncLock = AsyncUpDownloadService.newSyncLock(this.TAG);
            }
            this.mSyncLock.acquire();
        }
    }

    private void releaseLock() {
        synchronized (this) {
            if (this.mSyncLock != null) {
                this.mSyncLock.release();
                this.mSyncLock = null;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.mSyncLock != null) {
            releaseLock();
            IllegalStateException illegalStateException = new IllegalStateException("not call #cleanup");
            if (!Rom.IS_ALPHA) {
                Log.e(this.TAG, (Throwable) illegalStateException);
            } else {
                throw illegalStateException;
            }
        }
        super.finalize();
    }

    public abstract long getBindingReason();

    public Context getContext() {
        return this.mContext;
    }

    public abstract boolean isAsynchronous();

    /* access modifiers changed from: protected */
    public abstract GallerySyncResult<T> onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception;

    public final GallerySyncResult<T> startSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        acquireLock();
        try {
            return onPerformSync(account, bundle, galleryExtendedAuthToken);
        } catch (Exception e) {
            SyncLog.e(this.TAG, (Throwable) e);
            return new Builder().setCode(GallerySyncCode.UNKNOWN).setException(e).build();
        } finally {
            releaseLock();
        }
    }
}
