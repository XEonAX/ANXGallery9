package com.miui.gallery.search.core.source.server;

import android.os.SystemClock;
import android.text.TextUtils;
import com.google.gson.JsonObject;
import com.miui.gallery.cloud.HostManager.Search;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.MiscUtil;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;

public class ServerSearchRequest extends BaseGalleryRequest {
    private boolean mReportError;
    private long mRequestCreateTime;
    private ResponseResult mResponseResult;

    public static class Builder {
        private int mMethod = 1001;
        private String mQueryAppendPath;
        private Map<String, String> mQueryParams;
        private String mQueryPathPrefix = Search.getSearchUrlHost();
        private boolean mReportError = true;
        /* access modifiers changed from: private */
        public ResponseListener mResponseListener;
        /* access modifiers changed from: private */
        public Type mResultDataType = JsonObject.class;
        /* access modifiers changed from: private */
        public boolean mUseCache = false;
        private String mUserId;
        private String mUserPath;

        public static String getDefaultUserPath(String str) {
            if (!TextUtils.isEmpty(str)) {
                return "user";
            }
            return null;
        }

        public Builder addQueryParam(String str, String str2) {
            if (str != null) {
                if (this.mQueryParams == null) {
                    this.mQueryParams = new HashMap();
                }
                this.mQueryParams.put(str, str2);
            }
            return this;
        }

        public Builder addQueryParams(Map<String, String> map) {
            if (map != null) {
                if (this.mQueryParams == null) {
                    this.mQueryParams = new HashMap();
                }
                this.mQueryParams.putAll(map);
            }
            return this;
        }

        public ServerSearchRequest build() {
            return new ServerSearchRequest(this);
        }

        public int getMethod() {
            return this.mMethod;
        }

        public Map<String, String> getQueryParams() {
            return this.mQueryParams;
        }

        public String getQueryPath() {
            StringBuilder sb = new StringBuilder(this.mQueryPathPrefix);
            if (!TextUtils.isEmpty(this.mUserPath)) {
                sb.append("/");
                sb.append(this.mUserPath);
            }
            if (!TextUtils.isEmpty(this.mQueryAppendPath)) {
                sb.append("/");
                sb.append(this.mQueryAppendPath);
            }
            return sb.toString();
        }

        public String getUserId() {
            return this.mUserId;
        }

        public boolean reportError() {
            return this.mReportError;
        }

        public Builder setMethod(int i) {
            this.mMethod = i;
            return this;
        }

        public Builder setQueryAppendPath(String str) {
            this.mQueryAppendPath = str;
            return this;
        }

        public Builder setQueryPathPrefix(String str) {
            this.mQueryPathPrefix = str;
            return this;
        }

        public Builder setReportError(boolean z) {
            this.mReportError = z;
            return this;
        }

        public Builder setResultDataType(Type type) {
            this.mResultDataType = type;
            return this;
        }

        public Builder setUseCache(boolean z) {
            this.mUseCache = z;
            return this;
        }

        public Builder setUserId(String str) {
            this.mUserId = str;
            return this;
        }

        public Builder setUserPath(String str) {
            this.mUserPath = str;
            return this;
        }
    }

    public static class ResponseResult {
        private Object mData;
        private Type mDataType;
        private String mRawData;

        public ResponseResult(Type type) {
            this.mDataType = type;
        }

        public Object getData() {
            return this.mData;
        }

        public String getRawData() {
            return this.mRawData;
        }

        public void setData(String str) {
            if (this.mDataType != null) {
                this.mData = HttpUtils.createGson().fromJson(str, this.mDataType);
            } else {
                this.mData = str;
            }
            this.mRawData = str;
        }
    }

    private ServerSearchRequest(Builder builder) {
        super(builder.getMethod(), builder.getQueryPath());
        if (builder.getUserId() != null) {
            addParam("userId", builder.getUserId());
        }
        addParam("clientVersion", String.valueOf(MiscUtil.getAppVersionCode()));
        addParam("language", Locale.getDefault().toString());
        if (builder.getQueryParams() != null) {
            for (Entry entry : builder.getQueryParams().entrySet()) {
                addParam((String) entry.getKey(), (String) entry.getValue());
            }
        }
        setOnResponseListener(builder.mResponseListener);
        setUseCache(builder.mUseCache);
        this.mReportError = builder.reportError();
        this.mResponseResult = new ResponseResult(builder.mResultDataType);
        this.mRequestCreateTime = SystemClock.elapsedRealtime();
    }

    /* access modifiers changed from: protected */
    public void deliverError(ErrorCode errorCode, String str, Object obj) {
        if (this.mReportError) {
            HttpUtils.reportRequestError(this, errorCode, str, obj);
        }
        super.deliverError(errorCode, str, obj);
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(Object... objArr) {
        super.deliverResponse(objArr);
    }

    public Object getResponseData() {
        return this.mResponseResult.getData();
    }

    public String getResponseRawData() {
        return this.mResponseResult.getRawData();
    }

    public void onRequestError(ErrorCode errorCode, String str, Object obj) {
        deliverError(errorCode, str, obj);
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        super.onRequestSuccess(jSONObject);
        if (this.mRequestCreateTime > 0 && this.mReportError) {
            HttpUtils.reportTimeoutIfNeeded(this, SystemClock.elapsedRealtime() - this.mRequestCreateTime);
        }
        if (jSONObject != null) {
            this.mResponseResult.setData(jSONObject.toString());
            if (this.mResponseResult.getData() != null && (this.mResponseResult.getData() instanceof Cacheable)) {
                setCacheExpires(((Cacheable) this.mResponseResult.getData()).getExpireMills());
                SearchLog.d("ServerSearchRequest", "set expire time %dms for request %s", Long.valueOf(((Cacheable) this.mResponseResult.getData()).getExpireMills()), getUrl());
            }
            deliverResponse(this.mResponseResult.getData());
            return;
        }
        deliverError(ErrorCode.BODY_EMPTY, null, null);
    }
}
