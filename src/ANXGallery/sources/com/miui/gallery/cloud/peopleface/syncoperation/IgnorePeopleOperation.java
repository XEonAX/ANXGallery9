package com.miui.gallery.cloud.peopleface.syncoperation;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.text.TextUtils;
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
import org.json.JSONException;
import org.json.JSONObject;

public class IgnorePeopleOperation extends FaceRequestOperationBase {
    public IgnorePeopleOperation(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        return new Builder().setUrl(PeopleFace.getPeopleIgnoreUrl(((RequestFaceItem) requestItemBase).face.serverId)).setMethod(2).setRetryTimes(requestItemBase.createRetryTimes).setNeedReRequest(requestItemBase.needReRequest).build();
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        if (!(requestItemBase instanceof RequestFaceItem)) {
            return GallerySyncCode.NOT_RETRY_ERROR;
        }
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        if (!TextUtils.isEmpty(requestFaceItem.face.serverId)) {
            return super.onPreRequest(requestItemBase);
        }
        try {
            CloudUtils.updateToLocalDBForSync(FaceDataManager.PEOPLE_FACE_URI, (ContentValues) null, requestFaceItem.face._id);
        } catch (JSONException e) {
            e.printStackTrace();
        }
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
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        JSONObject optJSONObject = jSONObject.optJSONObject("record");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response record null");
            return;
        }
        CloudUtils.updateToLocalDBForSync(FaceDataManager.PEOPLE_FACE_URI, FaceAlbumUtil.getContentValuesForPeopleFace(optJSONObject), requestFaceItem.face._id);
    }
}
