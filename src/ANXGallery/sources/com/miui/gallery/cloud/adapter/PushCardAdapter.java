package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.card.SyncCardToServer;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

public class PushCardAdapter extends AbstractSyncAdapter {
    public PushCardAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 64;
    }

    public boolean isAsynchronous() {
        return false;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        if (!ApplicationHelper.isStoryAlbumFeatureOpen()) {
            SyncLog.w(this.TAG, "the feature of story album isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        new SyncCardToServer().sync();
        return new Builder().setCode(GallerySyncCode.OK).build();
    }
}
