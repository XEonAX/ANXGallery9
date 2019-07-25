package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.AlbumShareOperations;
import com.miui.gallery.cloud.SyncSharerAll;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

public class PullShareAdapter extends AbstractSyncAdapter {
    public PullShareAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 16;
    }

    public boolean isAsynchronous() {
        return true;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception {
        if (!ApplicationHelper.supportShare()) {
            SyncLog.w(this.TAG, "the feature of share album isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        GallerySyncResult sync = new SyncSharerAll(getContext(), account, galleryExtendedAuthToken, bundle).sync();
        SyncLog.d(this.TAG, "pull result %s", (Object) sync);
        AlbumShareOperations.syncAllUserInfoFromNetwork();
        return sync;
    }
}
