package com.miui.gallery.search.core.source.server;

import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.GalleryStatHelper;
import java.util.HashMap;

class HttpUtils {
    private static GsonBuilder sGsonBuilder = new GsonBuilder();

    public static Gson createGson() {
        return sGsonBuilder.create();
    }

    public static void reportRequestError(ServerSearchRequest serverSearchRequest, ErrorCode errorCode, String str, Object obj) {
        if (errorCode.CODE != ErrorCode.BODY_EMPTY.CODE && errorCode.CODE != ErrorCode.NETWORK_NOT_CONNECTED.CODE) {
            GalleryStatHelper.addHttpEvent(serverSearchRequest.getUrl(), 0, -1, errorCode.CODE, str);
            HashMap hashMap = new HashMap();
            hashMap.put("URL", serverSearchRequest.getUrl());
            hashMap.put("RequestEndTime", String.valueOf(System.currentTimeMillis()));
            if (serverSearchRequest.getParams() != null) {
                HashMap hashMap2 = new HashMap(serverSearchRequest.getParams());
                hashMap2.remove("userId");
                hashMap.put("Params", hashMap2.toString());
            }
            hashMap.put("ErrorCode", String.valueOf(errorCode));
            if (!TextUtils.isEmpty(str)) {
                hashMap.put("ErrorMessage", str);
            }
            if (obj != null) {
                hashMap.put("ResponseData", obj.toString());
            }
            try {
                SearchStatUtils.reportEvent("from_request", "search_request_error", hashMap);
            } catch (Exception e) {
                SearchLog.e("HttpUtils", "Report data is too large? data [%s], e [%s]", hashMap, e);
            }
        }
    }

    public static void reportTimeoutIfNeeded(ServerSearchRequest serverSearchRequest, long j) {
        if (j > 2000) {
            HashMap hashMap = new HashMap();
            hashMap.put("URL", serverSearchRequest.getUrl());
            if (serverSearchRequest.getParams() != null) {
                HashMap hashMap2 = new HashMap(serverSearchRequest.getParams());
                hashMap2.remove("userId");
                hashMap.put("Params", hashMap2.toString());
            }
            hashMap.put("RequestTime", String.valueOf(j));
            hashMap.put("RequestSeconds", String.valueOf((int) (j / 1000)));
            hashMap.put("RequestEndTime", String.valueOf(System.currentTimeMillis()));
            SearchStatUtils.reportEvent("from_request", "search_request_time_usage", hashMap);
        }
    }
}
