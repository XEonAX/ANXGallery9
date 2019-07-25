package com.miui.gallery.hybrid.hybridclient;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.miui.gallery.util.Log;

public class HybridClientFactory {
    public static HybridClient createHybridClient(Context context, Intent intent) {
        if (context == null || intent == null) {
            return null;
        }
        String action = intent.getAction();
        if ("android.intent.action.VIEW".equals(action)) {
            String queryParameter = intent.getData().getQueryParameter("url");
            if (TextUtils.isEmpty(queryParameter)) {
                queryParameter = intent.getDataString();
            }
            return new GalleryHybridClient(context, queryParameter);
        } else if ("com.miui.gallery.action.VIEW_WEB".equals(action)) {
            return new GalleryHybridClient(context, intent.getStringExtra("url"));
        } else {
            if ("com.miui.gallery.action.VIEW_WEB_DEVICE_ID".equals(action)) {
                return new DeviceIdHybridClient(context, intent.getStringExtra("url"));
            }
            if ("com.miui.gallery.action.VIEW_WEB_LOGIN".equals(action)) {
                return new LoginHybridClient(context, intent.getStringExtra("url"));
            }
            if ("com.miui.gallery.action.VIEW_WEB_OPERATION_STORY".equals(action)) {
                return new OperationHybridClient(context, intent.getStringExtra("url"));
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Not supported action ");
            sb.append(action);
            Log.e("HybridClientFactory", sb.toString());
            return null;
        }
    }
}
