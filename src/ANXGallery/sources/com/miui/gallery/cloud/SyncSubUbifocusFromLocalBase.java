package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;

public abstract class SyncSubUbifocusFromLocalBase extends SyncFromLocalBase {
    private ArrayList<RequestCloudItem> mAutoCreateImageItems;
    private ArrayList<RequestCloudItem> mManualCreateImageItems;
    private boolean mNoDelay;

    public SyncSubUbifocusFromLocalBase(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, boolean z) {
        super(context, account, galleryExtendedAuthToken);
        this.mNoDelay = z;
    }

    /* access modifiers changed from: protected */
    public void handleRequestCloudItemList() throws Exception {
        if (this.mManualCreateImageItems.size() > 0) {
            SyncLog.v("SyncUbifocusFromLocal", "start upload manual create images");
            UpDownloadManager.dispatchList(this.mManualCreateImageItems);
        }
        if (this.mAutoCreateImageItems.size() > 0) {
            SyncLog.v("SyncUbifocusFromLocal", "start upload auto create images");
            UpDownloadManager.dispatchList(this.mAutoCreateImageItems);
        }
    }

    /* access modifiers changed from: protected */
    public void initRequestCloudItemList() {
        this.mManualCreateImageItems = new ArrayList<>();
        this.mAutoCreateImageItems = new ArrayList<>();
    }

    /* access modifiers changed from: protected */
    public void putToRequestCloudItemList(DBItem dBItem) {
        DBImage dBImage = (DBImage) dBItem;
        switch (dBImage.getLocalFlag()) {
            case 7:
                if (dBImage.getServerType() != 1) {
                    SyncLog.e("SyncUbifocusFromLocal", "unsupport local flag=%d serverType=%d", Integer.valueOf(dBImage.getLocalFlag()), Integer.valueOf(dBImage.getServerType()));
                    return;
                }
                this.mAutoCreateImageItems.add(new RequestCloudItem(4, dBImage, this.mNoDelay));
                return;
            case 8:
                if (dBImage.getServerType() != 1) {
                    SyncLog.e("SyncUbifocusFromLocal", "unsupport local flag= %d serverType= %d", Integer.valueOf(dBImage.getLocalFlag()), Integer.valueOf(dBImage.getServerType()));
                    return;
                }
                this.mManualCreateImageItems.add(new RequestCloudItem(5, dBImage, this.mNoDelay));
                return;
            default:
                SyncLog.e("SyncUbifocusFromLocal", "unsupport local flag %d", Integer.valueOf(dBImage.getLocalFlag()));
                return;
        }
    }
}
