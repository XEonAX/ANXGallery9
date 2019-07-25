package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.SyncLog;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class CopyImageBase extends RequestOperationBase {
    protected String mAlbumId;

    public CopyImageBase(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void appendValues(ContentValues contentValues) {
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        String str;
        boolean z;
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        if (requestCloudItem.dbCloud.getLocalFlag() == 6) {
            str = CloudUtils.getServerIdByLocalId(this.mContext, requestCloudItem.dbCloud.getLocalImageId(), requestCloudItem);
        } else if (requestCloudItem.dbCloud.getLocalFlag() == 9) {
            str = CloudUtils.getShareIdByLocalId(this.mContext, requestCloudItem.dbCloud.getLocalImageId());
            z = true;
            String url = getUrl(CloudUrlProvider.getUrlProvider(z, requestCloudItem.dbCloud.isVideoType()), account.name, str, z, requestCloudItem);
            String valueOf = String.valueOf(requestCloudItem.dbCloud.getServerTag());
            if (!TextUtils.isEmpty(str) || TextUtils.isEmpty(valueOf)) {
                return null;
            }
            JSONObject put = new JSONObject().put("content", requestCloudItem.dbCloud.toJSONObject());
            ArrayList arrayList = new ArrayList();
            arrayList.add(new BasicNameValuePair(nexExportFormat.TAG_FORMAT_TAG, String.valueOf(requestCloudItem.dbCloud.getServerTag())));
            arrayList.add(new BasicNameValuePair(getAlbumIdTagName(), this.mAlbumId));
            if (z) {
                arrayList.add(new BasicNameValuePair("sharedGalleryId", str));
            }
            return new Builder().setMethod(2).setUrl(url).setParams(arrayList).setPostData(put).setRetryTimes(requestCloudItem.createRetryTimes).setNeedReRequest(requestCloudItem.needReRequest).build();
        } else {
            str = null;
        }
        z = false;
        String url2 = getUrl(CloudUrlProvider.getUrlProvider(z, requestCloudItem.dbCloud.isVideoType()), account.name, str, z, requestCloudItem);
        String valueOf2 = String.valueOf(requestCloudItem.dbCloud.getServerTag());
        if (!TextUtils.isEmpty(str)) {
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public abstract String getAlbumId(RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public abstract String getAlbumIdTagName();

    /* access modifiers changed from: protected */
    public abstract Uri getBaseUri();

    /* access modifiers changed from: protected */
    public abstract String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, boolean z, RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public abstract void handleSubUbiSchema(JSONObject jSONObject, String str) throws JSONException;

    /* access modifiers changed from: protected */
    public abstract boolean isToShare();

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (!(requestItemBase instanceof RequestCloudItem)) {
            SyncLog.e(getTag(), "item is not instanceof RequestCloudItem.");
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        SyncLog.d(getTag(), "copy image start: %s", (Object) requestCloudItem.dbCloud.getFileName());
        this.mAlbumId = getAlbumId(requestCloudItem);
        if (TextUtils.isEmpty(this.mAlbumId)) {
            DBImage dBImage = requestCloudItem.dbCloud;
            SyncLog.e(getTag(), "copy image but albumId can't find id[%s], localGroupId[%s]", dBImage.getId(), dBImage.getLocalGroupId());
            DBImage item = CloudUtils.getItem(requestCloudItem.dbCloud.getBaseUri(), this.mContext, "_id", dBImage.getLocalGroupId());
            HashMap hashMap = new HashMap();
            StringBuilder sb = new StringBuilder();
            sb.append(GalleryCloudUtils.getAccountName());
            if (item != null) {
                sb.append("_");
                sb.append(item.getFileName());
                sb.append("_");
                sb.append(item.getLocalFlag());
            }
            hashMap.put("album", sb.toString());
            hashMap.put(nexExportFormat.TAG_FORMAT_PATH, dBImage.getLocalFile());
            hashMap.put("localFlag", String.valueOf(dBImage.getLocalFlag()));
            GallerySamplingStatHelper.recordErrorEvent("Sync", "album_not_find_when_sync_media", hashMap);
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
        requestCloudItem.dbCloud.setRequestAlbumId(this.mAlbumId);
        return getSpaceFullListener().isSpaceFull(requestCloudItem) ? GallerySyncCode.NOT_RETRY_ERROR : super.onPreRequest(requestItemBase);
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK) {
            requestItemBase.createRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        JSONObject optJSONObject = jSONObject.optJSONObject("content");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response content null");
            return;
        }
        ContentValues contentValuesForAll = CloudUtils.getContentValuesForAll(optJSONObject, isToShare());
        appendValues(contentValuesForAll);
        if (CloudUtils.getItem(getBaseUri(), this.mContext, "serverId", contentValuesForAll.getAsString("serverId")) != null) {
            GalleryUtils.safeDelete(getBaseUri(), "_id = ?", new String[]{requestCloudItem.dbCloud.getId()});
            SyncLog.e(getTag(), "item has already exist.");
            return;
        }
        CloudUtils.renameItemIfNeeded(requestCloudItem.dbCloud, contentValuesForAll, true);
        CloudUtils.updateToLocalDBForSync(getBaseUri(), contentValuesForAll, requestCloudItem.dbCloud);
        handleSubUbiSchema(optJSONObject, requestCloudItem.dbCloud.getId());
        String tag = getTag();
        StringBuilder sb = new StringBuilder();
        sb.append("Copy image succeed and end:");
        sb.append(requestCloudItem.dbCloud.getFileName());
        SyncLog.d(tag, sb.toString());
    }
}
