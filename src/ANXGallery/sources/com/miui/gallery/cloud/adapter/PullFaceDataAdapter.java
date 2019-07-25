package com.miui.gallery.cloud.adapter;

import android.accounts.Account;
import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.cloud.peopleface.SyncPeopleFaceFromServer;
import com.miui.gallery.settingssync.GallerySettingsSyncHelper;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Preference;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;

public class PullFaceDataAdapter extends AbstractSyncAdapter {
    public PullFaceDataAdapter(Context context) {
        super(context);
    }

    private boolean needResyncFaceDataLaterForBaby() {
        if (Preference.sHaveCheckBabyForNewService(getContext()) || !AIAlbumStatusHelper.isFaceAlbumEnabled()) {
            return false;
        }
        return !FaceDataManager.ifHaveBabyType(getContext());
    }

    private void try2updatePeopleFace2getBaby(Account account, Context context) {
        GalleryCloudSyncTagUtils.setFaceSyncWatermark(account, 0);
        GalleryCloudSyncTagUtils.setFaceSyncToken(account, "");
        SyncLog.d(this.TAG, "reset people face wartemark to 0, zero");
    }

    public long getBindingReason() {
        return 8;
    }

    public boolean isAsynchronous() {
        return true;
    }

    /* access modifiers changed from: protected */
    public GallerySyncResult onPerformSync(Account account, Bundle bundle, GalleryExtendedAuthToken galleryExtendedAuthToken) throws Exception {
        if (ApplicationHelper.isFaceAlbumFeatureOpen()) {
            GallerySettingsSyncHelper.doSync(getContext());
        }
        if (!Preference.sHaveCheckBabyForNewService(getContext())) {
            if (needResyncFaceDataLaterForBaby()) {
                try2updatePeopleFace2getBaby(account, getContext());
            }
            Preference.sSetHaveCheckBabyForNewService(getContext());
        }
        if (!AIAlbumStatusHelper.isFaceAlbumEnabled()) {
            SyncLog.w(this.TAG, "the feature of face isn't enabled");
            return new Builder().setCode(GallerySyncCode.OK).build();
        }
        GallerySyncResult sync = new SyncPeopleFaceFromServer(getContext(), account, galleryExtendedAuthToken).sync();
        SyncLog.d(this.TAG, "pull result %s", (Object) sync);
        return sync;
    }
}
