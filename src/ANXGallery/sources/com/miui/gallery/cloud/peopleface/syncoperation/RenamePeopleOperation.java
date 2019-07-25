package com.miui.gallery.cloud.peopleface.syncoperation;

import android.accounts.Account;
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
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

public class RenamePeopleOperation extends FaceRequestOperationBase {
    public RenamePeopleOperation(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception {
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        String peopleRenameUrl = PeopleFace.getPeopleRenameUrl(requestFaceItem.face.serverId);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("peopleName", requestFaceItem.face.peopleName));
        if (!TextUtils.isEmpty(requestFaceItem.face.peopleContactJson)) {
            arrayList.add(new BasicNameValuePair("peopleContact", requestFaceItem.face.peopleContactJson));
        }
        return new Builder().setMethod(2).setUrl(peopleRenameUrl).setParams(arrayList).setRetryTimes(requestFaceItem.otherRetryTimes).setNeedReRequest(false).build();
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
        JSONObject optJSONObject = jSONObject.optJSONObject("record");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response record error");
            return;
        }
        RequestFaceItem requestFaceItem = (RequestFaceItem) requestItemBase;
        CloudUtils.updateToLocalDBForSync(FaceDataManager.PEOPLE_FACE_URI, FaceAlbumUtil.getContentValuesForPeopleFace(optJSONObject), requestFaceItem.face._id);
    }
}
