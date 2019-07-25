package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.SyncLog;
import org.json.JSONException;
import org.json.JSONObject;

public class EditCloudThumbnailInfo extends EditCloudBase {
    public EditCloudThumbnailInfo(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestCloudItem requestCloudItem) throws Exception {
        DBImage itemByServerID = CloudUtils.getItemByServerID(this.mContext, requestCloudItem.dbCloud.getServerId());
        String editGroupUrl = CloudGroupUrlProvider.getUrlProvider(false).getEditGroupUrl(account.name, itemByServerID.getServerId());
        ThumbnailInfo thumbnailInfo = ((DBCloud) itemByServerID).getThumbnailInfo();
        JSONObject jSONObject = itemByServerID.toJSONObject();
        if (thumbnailInfo != null) {
            long bgImageLocalId = thumbnailInfo.getBgImageLocalId();
            String faceId = thumbnailInfo.getFaceId();
            if (bgImageLocalId != -1) {
                DBImage item = CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, this.mContext, "_id", String.valueOf(bgImageLocalId));
                if (item != null) {
                    if (item.getLocalFlag() == 0) {
                        String serverId = item.getServerId();
                        if (!TextUtils.isEmpty(serverId)) {
                            jSONObject.put("backgroundImageId", serverId);
                        }
                    } else {
                        SyncLog.w(getTag(), "bg image not synced!");
                        return null;
                    }
                }
            }
            if (!TextUtils.isEmpty(faceId)) {
                jSONObject.put("faceId", faceId);
            }
        }
        return new Builder().setUrl(editGroupUrl).setMethod(2).setPostData(new JSONObject().put("content", jSONObject)).setRetryTimes(requestCloudItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public int getColumnIndex() {
        return 66;
    }

    /* access modifiers changed from: protected */
    public void updateDb(ContentValues contentValues, DBImage dBImage) throws JSONException {
        ThumbnailInfo thumbnailInfo = ((DBCloud) dBImage).getThumbnailInfo();
        if (thumbnailInfo != null) {
            long bgImageLocalId = thumbnailInfo.getBgImageLocalId();
            if (bgImageLocalId != -1) {
                CloudUtils.deleteItemInHiddenAlbum(bgImageLocalId);
            }
        }
        contentValues.putNull("thumbnailInfo");
        super.updateDb(contentValues, dBImage);
    }
}
