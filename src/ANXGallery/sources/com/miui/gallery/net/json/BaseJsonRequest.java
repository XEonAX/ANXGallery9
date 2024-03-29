package com.miui.gallery.net.json;

import android.text.TextUtils;
import com.android.volley.Request;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.google.gson.Gson;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.VolleyRequest;
import com.miui.gallery.util.Encode;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;
import org.keyczar.Keyczar;

public abstract class BaseJsonRequest<T> extends VolleyRequest<JSONObject, T> {
    private Map<String, String> mHeaders;
    private int mMethod = 1;
    private String mUrl = null;

    public BaseJsonRequest(int i, String str) {
        this.mMethod = i;
        this.mUrl = str;
    }

    private String appendUrlParams() {
        if (this.mUrl == null || this.mParams == null || this.mParams.isEmpty()) {
            return this.mUrl;
        }
        StringBuilder sb = new StringBuilder(this.mUrl);
        if (this.mUrl.indexOf(63) > 0) {
            if (!this.mUrl.endsWith("?") && !this.mUrl.endsWith("&")) {
                sb.append("&");
            }
            sb.append(encodeParameters(this.mParams, Keyczar.DEFAULT_ENCODING));
            return sb.toString();
        }
        sb.append("?");
        sb.append(encodeParameters(this.mParams, Keyczar.DEFAULT_ENCODING));
        return sb.toString();
    }

    private String encodeParameters(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Entry entry : map.entrySet()) {
                sb.append(URLEncoder.encode((String) entry.getKey(), str));
                sb.append('=');
                sb.append(URLEncoder.encode((String) entry.getValue(), str));
                sb.append('&');
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Encoding not supported: ");
            sb2.append(str);
            throw new RuntimeException(sb2.toString(), e);
        }
    }

    protected static <T> T fromJson(String str, Type type) {
        return new Gson().fromJson(str, type);
    }

    private String generateCacheKey(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return Encode.SHA1Encode(str.getBytes(Keyczar.DEFAULT_ENCODING));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return str;
    }

    /* access modifiers changed from: protected */
    public final Request<JSONObject> createVolleyRequest(Listener<JSONObject> listener, ErrorListener errorListener) {
        String str = this.mUrl;
        String appendUrlParams = appendUrlParams();
        if (this.mMethod == 0) {
            str = appendUrlParams;
        }
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(this.mMethod, str, listener, errorListener);
        if (this.mParams != null) {
            jsonObjectRequest.setParams(this.mParams);
        }
        if (this.mHeaders != null) {
            jsonObjectRequest.setHeaders(this.mHeaders);
        }
        jsonObjectRequest.setCacheKey(generateCacheKey(appendUrlParams));
        return jsonObjectRequest;
    }

    public final String getUrl() {
        return this.mUrl;
    }

    public void onRequestError(ErrorCode errorCode, String str, Object obj) {
        deliverError(errorCode, str, obj);
    }
}
