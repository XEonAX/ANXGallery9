package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBShareImage;
import com.miui.gallery.util.GalleryUtils;
import com.xiaomi.opensdk.file.model.CommitParameter;
import com.xiaomi.opensdk.file.model.RequestUploadParameter;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudGallerySharerRequestor extends CloudGalleryRequestorBase {
    public CloudGallerySharerRequestor(Account account, CloudUrlProvider cloudUrlProvider) {
        super(account, cloudUrlProvider);
    }

    /* access modifiers changed from: protected */
    public void connectSubUbi(RequestCloudItem requestCloudItem) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("ubiServerId", ((DBShareImage) requestCloudItem.dbCloud).getShareId());
        GalleryUtils.safeUpdate(GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI, contentValues, "ubiLocalId = ? ", new String[]{requestCloudItem.dbCloud.getId()});
    }

    /* access modifiers changed from: protected */
    public String getAlbumId(RequestCloudItem requestCloudItem) {
        long groupId = requestCloudItem.dbCloud.getGroupId();
        if (CloudTableUtils.isSystemAlbum(groupId)) {
            return String.valueOf(groupId);
        }
        String shareAlbumIdByLocalId = CloudUtils.getShareAlbumIdByLocalId(GalleryApp.sGetAndroidContext(), requestCloudItem);
        if (TextUtils.isEmpty(shareAlbumIdByLocalId)) {
            return null;
        }
        requestCloudItem.dbCloud.setRequestAlbumId(shareAlbumIdByLocalId);
        return shareAlbumIdByLocalId;
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getCommitUploadParams(RequestCloudItem requestCloudItem, CommitParameter commitParameter) throws JSONException {
        Map<String, String> commitUploadParams = super.getCommitUploadParams(requestCloudItem, commitParameter);
        if (commitUploadParams == null) {
            commitUploadParams = new HashMap<>();
        }
        if (requestCloudItem.dbCloud.isSubUbiFocus()) {
            commitUploadParams.put("sharedGalleryId", requestCloudItem.dbCloud.getUbiServerId());
        } else {
            commitUploadParams.put("sharedGalleryId", commitParameter.getUploadId());
        }
        return commitUploadParams;
    }

    /* access modifiers changed from: protected */
    public DBImage getItemByRequestId(String str, RequestCloudItem requestCloudItem) {
        return CloudUtils.getItem(requestCloudItem.dbCloud.getBaseUri(), GalleryApp.sGetAndroidContext(), "shareId", str);
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getRequestDownloadParams(RequestCloudItem requestCloudItem) {
        Map<String, String> requestDownloadParams = super.getRequestDownloadParams(requestCloudItem);
        if (requestDownloadParams == null) {
            requestDownloadParams = new HashMap<>();
        }
        requestDownloadParams.put("sharedGalleryId", requestCloudItem.dbCloud.getRequestId());
        return requestDownloadParams;
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getRequestUploadParams(RequestCloudItem requestCloudItem, RequestUploadParameter requestUploadParameter) throws JSONException {
        Map<String, String> requestUploadParams = super.getRequestUploadParams(requestCloudItem, requestUploadParameter);
        if (requestUploadParams == null) {
            requestUploadParams = new HashMap<>();
        }
        if (requestCloudItem.dbCloud.isSubUbiFocus()) {
            requestUploadParams.put("sharedGalleryId", requestCloudItem.dbCloud.getUbiServerId());
        } else {
            requestUploadParams.put("sharedAlbumId", getAlbumId(requestCloudItem));
        }
        return requestUploadParams;
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return SpaceFullHandler.getSharerSpaceFullListener();
    }

    /* access modifiers changed from: protected */
    public String parseRequestId(JSONObject jSONObject, RequestCloudItem requestCloudItem) throws JSONException {
        String string = jSONObject.getString("shareId");
        requestCloudItem.dbCloud.setShareId(string);
        return string;
    }

    /* access modifiers changed from: protected */
    public void putAlbumIdInValues(RequestCloudItem requestCloudItem, JSONObject jSONObject, ContentValues contentValues) {
        if (!TextUtils.isEmpty(requestCloudItem.dbCloud.getShareAlbumId())) {
            contentValues.put("albumId", requestCloudItem.dbCloud.getShareAlbumId());
        }
    }
}
