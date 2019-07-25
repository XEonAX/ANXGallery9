package com.miui.gallery.cloud.peopleface.syncoperation;

import android.accounts.Account;
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
import java.util.ArrayList;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

public class MergePeopleOperation extends FaceRequestOperationBase {
    public MergePeopleOperation(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        String peopleMergeUrl = PeopleFace.getPeopleMergeUrl();
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("srcPeopleId", requestFaceItem.face.serverId));
        arrayList.add(new BasicNameValuePair("destPeopleId", requestFaceItem.face.groupId));
        return new Builder().setMethod(2).setUrl(peopleMergeUrl).setParams(arrayList).setRetryTimes(requestFaceItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        return !(requestItemBase instanceof RequestFaceItem) ? GallerySyncCode.NOT_RETRY_ERROR : super.onPreRequest(requestItemBase);
    }

    /* access modifiers changed from: protected */
    public void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        if (gallerySyncCode != GallerySyncCode.OK) {
            requestItemBase.otherRetryTimes++;
        }
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception {
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        JSONObject optJSONObject = jSONObject.optJSONObject("record");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response record error");
            return;
        }
        CloudUtils.updateToLocalDBForSync(FaceDataManager.PEOPLE_FACE_URI, FaceAlbumUtil.getContentValuesForPeopleFace(optJSONObject), requestFaceItem.face._id);
    }
}
