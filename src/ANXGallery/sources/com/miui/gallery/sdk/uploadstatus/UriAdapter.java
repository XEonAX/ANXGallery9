package com.miui.gallery.sdk.uploadstatus;

import android.net.Uri;
import com.miui.gallery.cloud.GalleryCloudUtils;

public abstract class UriAdapter {
    /* access modifiers changed from: 0000 */
    public ItemType getItemTypeBySdkBaseUri(Uri uri) {
        if (GalleryCloudUtils.CLOUD_URI.equals(uri)) {
            return ItemType.OWNER;
        }
        if (GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI.equals(uri)) {
            return ItemType.OWNER_SUB_UBI;
        }
        if (GalleryCloudUtils.SHARE_IMAGE_URI.equals(uri)) {
            return ItemType.SHARER;
        }
        if (GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI.equals(uri)) {
            return ItemType.SHARER_SUB_UBI;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("not supported uri: ");
        sb.append(uri);
        throw new IllegalArgumentException(sb.toString());
    }

    public abstract String getLocalId(Uri uri);

    public abstract Uri getUserUri(ItemType itemType, String str);
}
