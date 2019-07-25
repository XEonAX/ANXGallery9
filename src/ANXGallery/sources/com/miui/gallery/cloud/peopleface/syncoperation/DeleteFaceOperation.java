package com.miui.gallery.cloud.peopleface.syncoperation;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.HostManager.PeopleFace;
import com.miui.gallery.cloud.RequestItemBase;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.peopleface.FaceAlbumUtil;
import com.miui.gallery.cloud.peopleface.FaceDataManager;
import com.miui.gallery.cloud.peopleface.RequestFaceItem;
import com.miui.gallery.util.SyncLog;
import org.json.JSONObject;

public class DeleteFaceOperation extends FaceRequestOperationBase {
    public DeleteFaceOperation(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        return new Builder().setUrl(PeopleFace.getFaceDeleteUrl(((RequestFaceItem) requestItemBase).face.serverId)).setMethod(2).setRetryTimes(requestItemBase.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (requestItemBase instanceof RequestFaceItem) {
            return super.onPreRequest(requestItemBase);
        }
        SyncLog.e("DeleteFaceOperation", "item is not instanceof RequestFaceItem.");
        return GallerySyncCode.NOT_RETRY_ERROR;
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK && gallerySyncCode != GallerySyncCode.ALBUM_NOT_EXIST) {
            requestItemBase.otherRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        JSONObject optJSONObject = jSONObject.optJSONObject("record");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response record null");
            return;
        }
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        ContentValues contentValuesForPeopleFace = FaceAlbumUtil.getContentValuesForPeopleFace(optJSONObject);
        CloudUtils.updateToPeopleFaceDBForDeleteItem(FaceDataManager.PEOPLE_FACE_URI, contentValuesForPeopleFace, contentValuesForPeopleFace.getAsString("serverId"));
    }
}
