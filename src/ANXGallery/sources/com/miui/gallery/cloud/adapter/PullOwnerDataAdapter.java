package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.SyncOwnerAlbum;
import com.miui.gallery.cloud.SyncOwnerAll;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.util.SyncLog;
import org.json.JSONException;

public class PullOwnerDataAdapter extends AbstractSyncAdapter {
    public PullOwnerDataAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 1;
    }

    public boolean isAsynchronous() {
        return false;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws JSONException {
        GallerySyncResult sync = new SyncOwnerAlbum(getContext(), account, galleryExtendedAuthToken).sync();
        if (sync.code != GallerySyncCode.OK) {
            SyncLog.e(this.TAG, "pull owner album error, return %s", sync);
            return sync;
        }
        GallerySyncResult sync2 = new SyncOwnerAll(getContext(), account, galleryExtendedAuthToken).sync();
        if (sync2.code != GallerySyncCode.OK) {
            SyncLog.e(this.TAG, "pull owner cloud error, return %s", sync2);
        }
        return sync2;
    }
}
