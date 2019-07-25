package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GalleryUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudGalleryOwnerRequestor extends CloudGalleryRequestorBase {
    public CloudGalleryOwnerRequestor(Account account, CloudUrlProvider cloudUrlProvider) {
        super(account, cloudUrlProvider);
    }

    /* access modifiers changed from: protected */
    public void connectSubUbi(RequestCloudItem requestCloudItem) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("ubiServerId", requestCloudItem.dbCloud.getServerId());
        GalleryUtils.safeUpdate(GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, contentValues, "ubiLocalId = ? ", new String[]{requestCloudItem.dbCloud.getId()});
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        long groupId = requestCloudItem.dbCloud.getGroupId();
        if (CloudTableUtils.isSystemAlbum(groupId)) {
            return String.valueOf(groupId);
        }
        String serverIdByLocalId = CloudUtils.getServerIdByLocalId(GalleryApp.sGetAndroidContext(), requestCloudItem.dbCloud.getLocalGroupId(), requestCloudItem);
        if (TextUtils.isEmpty(serverIdByLocalId)) {
            return null;
        }
        requestCloudItem.dbCloud.setRequestAlbumId(serverIdByLocalId);
        return serverIdByLocalId;
    }

    /* access modifiers changed from: protected */
    public DBImage getItemByRequestId(String str, RequestCloudItem requestCloudItem) {
        return CloudUtils.getItem(requestCloudItem.dbCloud.getBaseUri(), GalleryApp.sGetAndroidContext(), "serverId", str);
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getOwnerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String parseRequestId(JSONObject jSONObject, RequestCloudItem requestCloudItem) throws JSONException {
        String string = jSONObject.getString("id");
        requestCloudItem.dbCloud.setServerId(string);
        return string;
    }
}
