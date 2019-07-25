package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.peopleface.SyncFaceFromLocal;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.SyncLog;

public class PushFaceDataAdapter extends AbstractSyncAdapter {
    public PushFaceDataAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 128;
    }

    public boolean isAsynchronous() {
        return true;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception {
        if (!AIAlbumStatusHelper.isFaceAlbumEnabled()) {
            SyncLog.w(this.TAG, "the feature of face isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        new SyncFaceFromLocal(getContext(), account, galleryExtendedAuthToken).sync();
        return new Builder().setCode(GallerySyncCode.OK).build();
    }
}
