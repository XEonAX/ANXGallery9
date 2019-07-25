package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import com.miui.gallery.cloud.HostManager.OwnerAlbum;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import org.json.JSONObject;

public class RenameCloudItem extends RequestOperationBase {
    public RenameCloudItem(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        String renameAlbumUrl = OwnerAlbum.getRenameAlbumUrl(requestCloudItem.dbCloud.getServerId());
        if (ApplicationHelper.isAutoUploadFeatureOpen()) {
            StringBuilder sb = new StringBuilder();
            sb.append(renameAlbumUrl);
            sb.append("/rename");
            renameAlbumUrl = sb.toString();
        }
        return new Builder().setMethod(2).setUrl(renameAlbumUrl).setPostData(new JSONObject().put("content", requestCloudItem.dbCloud.toJSONObject())).setRetryTimes(requestCloudItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (!(requestItemBase instanceof RequestCloudItem)) {
            SyncLog.e(getTag(), "item is not instanceof RequestCloudItem.");
            return GallerySyncCode.NOT_RETRY_ERROR;
        } else if (!((RequestCloudItem) requestItemBase).dbCloud.isShareItem()) {
            return super.onPreRequest(requestItemBase);
        } else {
            SyncLog.e(getTag(), "can't rename share group.");
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK) {
            requestItemBase.otherRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
        ContentValues contentValuesForAll = CloudUtils.getContentValuesForAll(jSONObject);
        CloudUtils.reviseAttributes(contentValuesForAll, requestCloudItem.dbCloud);
        CloudUtils.updateToLocalDBForSync(GalleryCloudUtils.CLOUD_URI, contentValuesForAll, requestCloudItem.dbCloud);
        SyncLog.d(getTag(), "rename group success: %s", (Object) requestCloudItem.dbCloud.getFileName());
    }
}
