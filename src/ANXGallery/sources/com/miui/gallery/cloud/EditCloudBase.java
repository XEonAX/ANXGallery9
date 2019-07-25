package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.Utils;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class EditCloudBase extends RequestOperationBase {
    public EditCloudBase(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public abstract Request buildRequest(Account account, RequestCloudItem requestCloudItem) throws Exception;

    /* access modifiers changed from: protected */
    public final Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        return buildRequest(account, (RequestCloudItem) requestItemBase);
    }

    /* access modifiers changed from: protected */
    public abstract int getColumnIndex();

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (!(requestItemBase instanceof RequestCloudItem)) {
            SyncLog.e("EditCloudBase", "item is not instanceof RequestCloudItem.");
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
        DBImage dBImage = ((RequestCloudItem) requestItemBase).dbCloud;
        if (dBImage.getLocalFlag() != 0 || TextUtils.isEmpty(dBImage.getRequestId())) {
            SyncLog.d("EditCloudBase", "item has not been synced yet");
            return GallerySyncCode.NOT_RETRY_ERROR;
        } else if (!dBImage.isShareItem()) {
            return super.onPreRequest(requestItemBase);
        } else {
            SyncLog.e("EditCloudBase", "share item can't be edit");
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
        DBImage dBImage = ((RequestCloudItem) requestItemBase).dbCloud;
        updateDb(CloudUtils.getContentValuesForAll(jSONObject), CloudUtils.getItemByServerID(this.mContext, dBImage.getServerId()));
        SyncLog.d("EditCloudBase", "edit success %s", (Object) dBImage.getFileName());
    }

    /* access modifiers changed from: protected */
    public void updateDb(ContentValues contentValues, DBImage dBImage) throws JSONException {
        contentValues.put("editedColumns", Utils.ensureNotNull(dBImage.getEditedColumns()).replace(GalleryCloudUtils.transformToEditedColumnsElement(getColumnIndex()), ""));
        CloudUtils.updateToLocalDB(GalleryCloudUtils.CLOUD_URI, contentValues, dBImage);
    }
}
