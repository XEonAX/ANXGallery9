package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.SyncOwnerFromLocal;
import com.miui.gallery.cloud.SyncOwnerSubUbiFromLocal;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;

public class PushOwnerDataAdapter extends AbstractSyncAdapter {
    public PushOwnerDataAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 32;
    }

    public boolean isAsynchronous() {
        return false;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception {
        boolean z = bundle.getBoolean("sync_no_delay", false);
        new SyncOwnerFromLocal(getContext(), account, galleryExtendedAuthToken, z).sync();
        new SyncOwnerSubUbiFromLocal(getContext(), account, galleryExtendedAuthToken, z).sync();
        return new Builder().setCode(GallerySyncCode.OK).build();
    }
}
