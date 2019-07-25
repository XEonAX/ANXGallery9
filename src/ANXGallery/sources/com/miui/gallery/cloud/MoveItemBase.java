package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.SyncLog;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.NameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class MoveItemBase extends RequestOperationBase {
    protected String mAlbumId;

    public MoveItemBase(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public abstract void appendAlbumIdParameter(ArrayList<NameValuePair> arrayList) throws IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException;

    /* access modifiers changed from: protected */
    public abstract void appendValues(ContentValues contentValues);

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException, JSONException {
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        DBImage dBImage = requestCloudItem.dbCloud;
        String serverIdByLocalId = !TextUtils.isEmpty(dBImage.getLocalImageId()) ? CloudUtils.getServerIdByLocalId(this.mContext, dBImage.getLocalImageId(), requestCloudItem) : dBImage.getServerId();
        this.mAlbumId = getAlbumId(requestCloudItem);
        requestCloudItem.dbCloud.setRequestAlbumId(this.mAlbumId);
        if (TextUtils.isEmpty(serverIdByLocalId) || TextUtils.isEmpty(this.mAlbumId)) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        appendAlbumIdParameter(arrayList);
        String url = getUrl(CloudUrlProvider.getUrlProvider(requestCloudItem.dbCloud.isShareItem(), requestCloudItem.dbCloud.isVideoType()), account.name, serverIdByLocalId, requestCloudItem);
        if (url == null) {
            return null;
        }
        return new Builder().setMethod(2).setUrl(url).setParams(arrayList).setPostData(new JSONObject().put("content", dBImage.toJSONObject())).setRetryTimes(requestCloudItem.createRetryTimes).setNeedReRequest(requestCloudItem.needReRequest).build();
    }

    /* access modifiers changed from: protected */
    public abstract String getAlbumId(RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public abstract SpaceFullListener getSpaceFullListener();

    /* access modifiers changed from: protected */
    public abstract String getUrl(CloudUrlProvider cloudUrlProvider, String str, String str2, RequestCloudItem requestCloudItem);

    /* access modifiers changed from: protected */
    public abstract void handleSubUbiSchema(JSONObject jSONObject, String str) throws JSONException;

    /* access modifiers changed from: protected */
    public abstract boolean isToShare();

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (requestItemBase instanceof RequestCloudItem) {
            return GallerySyncCode.OK;
        }
        SyncLog.e(getTag(), "item is not instanceof RequestCloudItem.");
        return GallerySyncCode.NOT_RETRY_ERROR;
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK) {
            requestItemBase.createRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        ContentValues contentValues;
        DBImage dBImage = ((RequestCloudItem) requestItemBase).dbCloud;
        if (jSONObject.has("content")) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("content");
            contentValues = CloudUtils.getContentValuesForAll(jSONObject2);
            appendValues(contentValues);
            CloudUtils.updateToLocalDBForSync(GalleryCloudUtils.CLOUD_URI, contentValues, dBImage);
            handleSubUbiSchema(jSONObject2, dBImage.getId());
        } else if (!jSONObject.has("purgeContent") || !jSONObject.has("copyContent")) {
            contentValues = null;
        } else {
            CloudUtils.updateToLocalDBForSync(GalleryCloudUtils.CLOUD_URI, CloudUtils.getContentValuesForAll(jSONObject.getJSONObject("purgeContent")), dBImage.getLocalImageId());
            JSONObject jSONObject3 = jSONObject.getJSONObject("copyContent");
            contentValues = CloudUtils.getContentValuesForAll(jSONObject3, isToShare());
            appendValues(contentValues);
            CloudUtils.updateToLocalDBForSync(dBImage.getBaseUri(), contentValues, dBImage);
            handleSubUbiSchema(jSONObject3, dBImage.getId());
        }
        CloudUtils.renameItemIfNeeded(dBImage, contentValues, !dBImage.isSecretItem());
        if (dBImage.isSecretItem()) {
            ContentValues contentValues2 = new ContentValues();
            SecretAlbumUtils.encryptFiles(dBImage, contentValues2);
            if (contentValues2.size() > 0) {
                CloudUtils.updateToLocalDB(dBImage.getBaseUri(), contentValues2, dBImage);
            }
        }
        SyncLog.d(getTag(), "Move image %s success, group: %s", dBImage.getFileName(), Long.valueOf(dBImage.getGroupId()));
    }
}
