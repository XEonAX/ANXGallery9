package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.baby.SyncBabyInfoFromLocal;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

public class PushBabyInfoAdapter extends AbstractSyncAdapter {
    public PushBabyInfoAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 256;
    }

    public boolean isAsynchronous() {
        return true;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception {
        if (!ApplicationHelper.isBabyAlbumFeatureOpen()) {
            SyncLog.w(this.TAG, "the feature of baby album isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        new SyncBabyInfoFromLocal(getContext(), account, galleryExtendedAuthToken).sync();
        return new Builder().setCode(GallerySyncCode.OK).build();
    }
}
