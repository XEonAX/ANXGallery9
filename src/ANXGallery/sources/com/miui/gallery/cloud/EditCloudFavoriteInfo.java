package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.data.DBImage;
import org.json.JSONObject;

public class EditCloudFavoriteInfo extends EditCloudBase {
    public EditCloudFavoriteInfo(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestCloudItem requestCloudItem) throws Exception {
        DBImage dBImage = requestCloudItem.dbCloud;
        String updateUrl = CloudUrlProvider.getUrlProvider(dBImage.isShareItem(), dBImage.isVideoType()).getUpdateUrl(account.name, dBImage.getServerId());
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("content", dBImage.toJSONObject());
        return new Builder().setUrl(updateUrl).setMethod(2).setPostData(jSONObject).setRetryTimes(requestCloudItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public int getColumnIndex() {
        return -1;
    }
}
