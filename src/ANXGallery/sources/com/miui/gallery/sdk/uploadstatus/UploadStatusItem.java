package com.miui.gallery.sdk.uploadstatus;

import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.sdk.SyncStatus;

public class UploadStatusItem extends SyncItem {
    private final ItemType mItemType;
    private final String mLocalId;

    public UploadStatusItem(RequestCloudItem requestCloudItem) {
        super(SyncStatus.toSyncStatus(requestCloudItem.getStatus()));
        UriAdapter uriAdapter = SyncProxy.getInstance().getUriAdapter();
        DBImage dBImage = requestCloudItem.dbCloud;
        this.mItemType = uriAdapter.getItemTypeBySdkBaseUri(dBImage.getBaseUri());
        this.mLocalId = dBImage.getId();
    }

    public UploadStatusItem(ItemType itemType, String str) {
        super(SyncStatus.STATUS_NONE);
        this.mItemType = itemType;
        this.mLocalId = str;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof UploadStatusItem)) {
            return false;
        }
        UploadStatusItem uploadStatusItem = (UploadStatusItem) obj;
        if (this.mItemType != uploadStatusItem.mItemType || !TextUtils.equals(this.mLocalId, uploadStatusItem.mLocalId)) {
            z = false;
        }
        return z;
    }

    public ItemType getItemType() {
        return this.mItemType;
    }

    public Uri getUserUri() {
        return SyncProxy.getInstance().getUriAdapter().getUserUri(this.mItemType, this.mLocalId);
    }

    public String toString() {
        return String.format("[mItemType: %s, mLocalId: %s, mStatus: %s]", new Object[]{this.mItemType.toString(), this.mLocalId, this.mStatus.toString()});
    }
}
