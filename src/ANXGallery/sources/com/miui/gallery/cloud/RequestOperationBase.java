package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.SpaceFullHandler.SpaceFullListener;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.util.SyncLog;
import java.util.List;
import java.util.Locale;
import org.apache.http.NameValuePair;
import org.json.JSONObject;

public abstract class RequestOperationBase implements Operation<JSONObject> {
    private String TAG;
    protected Context mContext;

    public static final class Request {
        private final int mMethod;
        private final boolean mNeedReRequest;
        private final List<NameValuePair> mParams;
        private final JSONObject mPostData;
        private final int mRetryTimes;
        private final String mUrl;

        public static final class Builder {
            /* access modifiers changed from: private */
            public int mMethod;
            /* access modifiers changed from: private */
            public boolean mNeedReRequest = false;
            /* access modifiers changed from: private */
            public List<NameValuePair> mParams;
            /* access modifiers changed from: private */
            public JSONObject mPostData;
            /* access modifiers changed from: private */
            public int mRetryTimes;
            /* access modifiers changed from: private */
            public String mUrl;

            public Request build() {
                return new Request(this);
            }

            public Builder setMethod(int i) {
                this.mMethod = i;
                return this;
            }

            public Builder setNeedReRequest(boolean z) {
                this.mNeedReRequest = z;
                return this;
            }

            public Builder setParams(List<NameValuePair> list) {
                this.mParams = list;
                return this;
            }

            public Builder setPostData(JSONObject jSONObject) {
                this.mPostData = jSONObject;
                return this;
            }

            public Builder setRetryTimes(int i) {
                this.mRetryTimes = i;
                return this;
            }

            public Builder setUrl(String str) {
                this.mUrl = str;
                return this;
            }
        }

        private Request(Builder builder) {
            this.mMethod = builder.mMethod;
            this.mUrl = builder.mUrl;
            this.mParams = builder.mParams;
            this.mPostData = builder.mPostData;
            this.mRetryTimes = builder.mRetryTimes;
            this.mNeedReRequest = builder.mNeedReRequest;
        }

        /* access modifiers changed from: private */
        public boolean isValid() {
            return (this.mMethod == 1 || this.mMethod == 2) && !TextUtils.isEmpty(this.mUrl);
        }

        public int getMethod() {
            return this.mMethod;
        }

        public List<NameValuePair> getParams() {
            return this.mParams;
        }

        public JSONObject getPostData() {
            return this.mPostData;
        }

        public int getRetryTimes() {
            return this.mRetryTimes;
        }

        public String getUrl() {
            return this.mUrl;
        }

        public boolean isNeedReRequest() {
            return this.mNeedReRequest;
        }

        public String toString() {
            return String.format(Locale.US, "mMethod %s, mUrl %s", new Object[]{Integer.valueOf(this.mMethod), this.mUrl});
        }
    }

    public RequestOperationBase(Context context) {
        this.mContext = context;
    }

    /* access modifiers changed from: protected */
    public abstract Request buildRequest(Account account, RequestItemBase requestItemBase) throws Exception;

    public int checkState(RequestItemBase requestItemBase) {
        return SyncConditionManager.checkForItem(requestItemBase);
    }

    public final GallerySyncResult<JSONObject> execute(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str, RequestItemBase requestItemBase) throws Exception {
        RequestItemBase requestItemBase2 = requestItemBase;
        long currentTimeMillis = System.currentTimeMillis();
        Builder builder = new Builder();
        if (checkState(requestItemBase2) != 0) {
            SyncLog.e(getTag(), "condition for %s isn't ok", getTag());
            return builder.setCode(GallerySyncCode.CONDITION_INTERRUPTED).build();
        }
        GallerySyncCode onPreRequest = onPreRequest(requestItemBase2);
        if (onPreRequest != GallerySyncCode.OK) {
            SyncLog.e(getTag(), "onPreExecute error %s", onPreRequest);
            return builder.setCode(onPreRequest).build();
        }
        Account account2 = account;
        Request buildRequest = buildRequest(account, requestItemBase2);
        if (buildRequest == null || !buildRequest.isValid()) {
            SyncLog.e(getTag(), "illegal request %s", buildRequest);
            return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
        }
        JSONObject jSONObject = null;
        if (buildRequest.getMethod() == 1) {
            jSONObject = CloudUtils.getFromXiaomi(buildRequest.getUrl(), buildRequest.getParams(), account, galleryExtendedAuthToken, buildRequest.getRetryTimes(), buildRequest.isNeedReRequest());
        }
        if (buildRequest.getMethod() == 2) {
            jSONObject = CloudUtils.postToXiaomi(buildRequest.getUrl(), buildRequest.getParams(), buildRequest.getPostData(), account, galleryExtendedAuthToken, buildRequest.getRetryTimes(), buildRequest.isNeedReRequest());
        }
        if (jSONObject == null) {
            SyncLog.e(getTag(), "response null");
            return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
        }
        GallerySyncResult checkXMResultCode = CheckResult.checkXMResultCode(jSONObject, requestItemBase2, getSpaceFullListener());
        if (checkXMResultCode.code != GallerySyncCode.OK) {
            onRequestError(checkXMResultCode.code, requestItemBase2, jSONObject);
            SyncLog.e(getTag(), "error result %s, retry times %s", checkXMResultCode, Integer.valueOf(requestItemBase2.otherRetryTimes));
            return builder.setCode(checkXMResultCode.code).setData(jSONObject).build();
        }
        JSONObject optJSONObject = jSONObject.optJSONObject("data");
        if (optJSONObject == null) {
            SyncLog.e(getTag(), "response has no data %s", optJSONObject);
            onRequestError(GallerySyncCode.NOT_RETRY_ERROR, requestItemBase2, jSONObject);
            return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
        }
        onRequestSuccess(requestItemBase2, optJSONObject);
        SyncLog.d(getTag(), "execute success, cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return builder.setCode(GallerySyncCode.OK).setData(optJSONObject).build();
    }

    /* access modifiers changed from: protected */
    public SpaceFullListener getSpaceFullListener() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String getTag() {
        if (this.TAG == null) {
            this.TAG = getClass().getSimpleName();
        }
        return this.TAG;
    }

    /* access modifiers changed from: protected */
    public GallerySyncCode onPreRequest(RequestItemBase requestItemBase) {
        return GallerySyncCode.OK;
    }

    /* access modifiers changed from: protected */
    public abstract void onRequestError(GallerySyncCode gallerySyncCode, RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception;

    /* access modifiers changed from: protected */
    public abstract void onRequestSuccess(RequestItemBase requestItemBase, JSONObject jSONObject) throws Exception;
}
