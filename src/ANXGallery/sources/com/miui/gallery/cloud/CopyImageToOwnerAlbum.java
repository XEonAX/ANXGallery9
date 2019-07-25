package com.miui.gallery.cloud;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.UbiFocusUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CopyImageToOwnerAlbum extends CopyImageBase {
    public CopyImageToOwnerAlbum(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        return CloudUtils.getServerIdByLocalId(this.mContext, requestCloudItem.dbCloud.getLocalGroupId(), requestCloudItem);
    }

    /* access modifiers changed from: protected */
    public String getAlbumIdTagName() {
        return "toAlbumId";
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.CLOUD_URI;
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getOwnerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, boolean z, RequestCloudItem requestCloudItem) {
        boolean z2;
        boolean isSecretAlbum = CloudTableUtils.isSecretAlbum(this.mAlbumId, null);
        if (!z) {
            String groupIdByPhotoLocalId = CloudUtils.getGroupIdByPhotoLocalId(requestCloudItem.dbCloud.getLocalImageId());
            if (TextUtils.isEmpty(groupIdByPhotoLocalId)) {
                return null;
            }
            z2 = CloudTableUtils.isSecretAlbum(groupIdByPhotoLocalId, null);
        } else {
            z2 = false;
        }
        if (!z) {
            if (!isSecretAlbum && !z2) {
                return cloudUrlProvider.getCopyUrl(str, str2);
            }
            if (isSecretAlbum && !z2) {
                return cloudUrlProvider.getHideCopyUrl(str, str2);
            }
            if (!isSecretAlbum && z2) {
                return cloudUrlProvider.getUnhideCopyUrl(str, str2);
            }
            SyncLog.d(getTag(), "getUrl  only support one hide album now");
            return null;
        } else if (!isSecretAlbum && !z2) {
            return cloudUrlProvider.getCopyUrl(str, str2);
        } else {
            SyncLog.d(getTag(), "getUrl  cannot support copy share image to hide album");
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public void handleSubUbiSchema(JSONObject jSONObject, String str) throws JSONException {
        UbiFocusUtils.handleSubUbiImage(jSONObject, false, str);
    }

    /* access modifiers changed from: protected */
    public boolean isToShare() {
        return false;
    }
}
