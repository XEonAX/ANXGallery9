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
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONObject;

public class MoveFaceOperation extends FaceRequestOperationBase {
    public MoveFaceOperation(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        ArrayList items = requestItemBase.getItems();
        StringBuilder sb = new StringBuilder();
        Iterator it = items.iterator();
        while (it.hasNext()) {
            RequestFaceItem requestFaceItem = (RequestFaceItem) ((RequestItemBase) it.next());
            if (sb.length() > 0) {
                sb.append(",");
            }
            sb.append(requestFaceItem.face.serverId);
        }
        String peopleId = getPeopleId((RequestFaceItem) items.get(0));
        if (TextUtils.isEmpty(peopleId)) {
            SyncLog.e(getTag(), "people id is empty");
            return null;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("destPeopleId", peopleId));
        arrayList.add(new BasicNameValuePair("faceIds", sb.toString()));
        return new Builder().setMethod(2).setUrl(PeopleFace.getFaceMoveUrl()).setParams(arrayList).setRetryTimes(requestItemBase.createRetryTimes).setNeedReRequest(requestItemBase.needReRequest).build();
    }

    public int getLimitCountForOperation() {
        return 10;
    }

    /* access modifiers changed from: protected */
    public String getPeopleId(RequestFaceItem requestFaceItem) {
        return CloudUtils.getStringColumnValue(this.mContext, FaceDataManager.PEOPLE_FACE_URI, "serverId", "_id", requestFaceItem.face.localGroupId);
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        ArrayList items = requestItemBase.getItems();
        if (items != null && !items.isEmpty()) {
            return !(items.get(0) instanceof RequestFaceItem) ? GallerySyncCode.NOT_RETRY_ERROR : super.onPreRequest(requestItemBase);
        }
        SyncLog.e("MoveFaceOperation", "multiRequest items is null.");
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
        JSONArray optJSONArray = jSONObject.optJSONArray("successResults");
        if (optJSONArray == null) {
            SyncLog.e(getTag(), "success result null");
            return;
        }
        for (int i = 0; i < optJSONArray.length(); i++) {
            ContentValues contentValuesForPeopleFace = FaceAlbumUtil.getContentValuesForPeopleFace(optJSONArray.getJSONObject(i).getJSONObject("record"));
            CloudUtils.updateToPeopleFaceDBForSync(FaceDataManager.PEOPLE_FACE_URI, contentValuesForPeopleFace, contentValuesForPeopleFace.getAsString("serverId"));
        }
    }
}
