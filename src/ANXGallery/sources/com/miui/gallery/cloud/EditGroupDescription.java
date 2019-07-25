package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.gallery.cloud.RequestOperationBase.Request;
import com.miui.gallery.cloud.RequestOperationBase.Request.Builder;
import org.json.JSONObject;

public class EditGroupDescription extends EditCloudBase {
    public EditGroupDescription(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public Request buildRequest(Account account, RequestCloudItem requestCloudItem) throws Exception {
        String editGroupUrl = CloudGroupUrlProvider.getUrlProvider(false).getEditGroupUrl(account.name, requestCloudItem.dbCloud.getServerId());
        return new Builder().setUrl(editGroupUrl).setMethod(2).setPostData(new JSONObject().put("content", requestCloudItem.dbCloud.toJSONObject())).setRetryTimes(requestCloudItem.otherRetryTimes).setNeedReRequest(false).build();
    }

    /* access modifiers changed from: protected */
    public int getColumnIndex() {
        return 6;
    }
}
