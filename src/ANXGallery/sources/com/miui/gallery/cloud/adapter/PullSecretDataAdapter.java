package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.SyncOwnerPrivate;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import org.json.JSONException;

public class PullSecretDataAdapter extends AbstractSyncAdapter {
    public PullSecretDataAdapter(Context context) {
        super(context);
    }

    public long getBindingReason() {
        return 2;
    }

    public boolean isAsynchronous() {
        return false;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws JSONException {
        if (!ApplicationHelper.isSecretAlbumFeatureOpen()) {
            SyncLog.w(this.TAG, "the feature of secret album isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        } else if (!Preference.getSyncFetchAllPrivateData() || !Preference.getSyncFetchPrivateVideo()) {
            GallerySyncResult sync = new SyncOwnerPrivate(getContext(), account, galleryExtendedAuthToken).sync();
            if (sync.code == GallerySyncCode.OK) {
                Preference.setSyncFetchAllPrivateData();
                Preference.setSyncFetchPrivateVideo();
            }
            SyncLog.d(this.TAG, "pull result %s", (Object) sync);
            return sync;
        } else {
            SyncLog.w(this.TAG, "has fetched secret data, ignore");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
    }
}
