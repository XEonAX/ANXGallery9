package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import com.miui.gallery.data.DBImage;
import org.json.JSONObject;

public class EditCloudItemName extends EditCloudBase {
    public EditCloudItemName(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestCloudItem requestCloudItem) throws Exception {
        DBImage dBImage = requestCloudItem.dbCloud;
        String updateUrl = CloudUrlProvider.getUrlProvider(dBImage.isShareItem(), dBImage.isVideoType()).getUpdateUrl(account.name, dBImage.getServerId());
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = dBImage.toJSONObject();
        jSONObject2.put("fileName", dBImage.getFileName());
        jSONObject2.put("title", dBImage.getTitle());
        jSONObject.put("content", jSONObject2);
        return new Builder().setUrl(updateUrl).setMethod(2).setPostData(jSONObject).setRetryTimes(requestCloudItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public int getColumnIndex() {
        return 7;
    }
}
