package com.miui.gallery.cloud;

import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.util.SyncLog;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.sync.SyncAdapterBase;

public class GallerySyncAdapter extends SyncAdapterBase {
    GallerySyncAdapterImpl mImpl;

    public GallerySyncAdapter(Context context, boolean z) {
        super(context, z, "micgallery");
        this.mImpl = null;
        this.mImpl = new GallerySyncAdapterImpl(this.mContext);
    }

    /* access modifiers changed from: protected */
    public void onPerformMiCloudSync(Bundle bundle) throws CloudServerException {
        if (AgreementsUtils.isNetworkingAgreementAccepted()) {
            try {
                this.mImpl.onPerformMiCloudSync(bundle, this.mAccount, this.mSyncResult, new GalleryExtendedAuthToken(this.mExtToken));
            } catch (GalleryMiCloudServerException e) {
                throw ((CloudServerException) e.getCloudServerException());
            }
        } else {
            SyncLog.d("GallerySyncAdapter", "gallery cta can't connect network");
            throw new CloudServerException(-10001, 1000);
        }
    }

    public void onSyncCanceled() {
        SyncLog.d("GallerySyncAdapter", "on sync canceled");
        this.mImpl.onSyncCanceled();
        super.onSyncCanceled();
    }
}
