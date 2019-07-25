package com.miui.gallery.cloudcontrol;

import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.net.BaseGalleryRequest;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.preference.GalleryPreferences.UUID;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Encode;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MiscUtil;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudControlRequest extends BaseGalleryRequest {

    public static class Builder {
        private String mDataParam;
        private int mMethod = 1002;
        private String mSyncToken;
        private String mUrl;

        public Builder() {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("appVersion", String.valueOf(MiscUtil.getAppVersionCode()));
                StringBuilder sb = new StringBuilder();
                sb.append("MIUI/");
                sb.append(VERSION.INCREMENTAL);
                jSONObject.put("romVersion", sb.toString());
                String simOperator = MiscUtil.getSimOperator();
                String str = "operator";
                String str2 = null;
                if (TextUtils.isEmpty(simOperator)) {
                    simOperator = null;
                }
                jSONObject.put(str, simOperator);
                jSONObject.put("sdkVersion", String.valueOf(VERSION.SDK_INT));
                if (AccountCache.getAccount() != null) {
                    String deviceId = MiscUtil.getDeviceId();
                    if (deviceId != null) {
                        deviceId = Encode.SHA1Encode(deviceId.getBytes());
                    }
                    str2 = deviceId;
                    if (TextUtils.isEmpty(str2) && !BuildUtil.isPad()) {
                        CloudControlRequest.reportImeiIsNull();
                    }
                }
                String str3 = "rateKey";
                if (TextUtils.isEmpty(str2)) {
                    str2 = UUID.get();
                }
                jSONObject.put(str3, str2);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            this.mDataParam = jSONObject.toString();
        }

        public CloudControlRequest build() {
            return new CloudControlRequest(this);
        }

        public String getDataParam() {
            return this.mDataParam;
        }

        public int getMethod() {
            return this.mMethod;
        }

        public String getSyncToken() {
            return this.mSyncToken;
        }

        public String getUrl() {
            return this.mUrl;
        }

        public Builder setMethod(int i) {
            this.mMethod = i;
            return this;
        }

        public Builder setSyncToken(String str) {
            this.mSyncToken = str;
            return this;
        }

        public Builder setUrl(String str) {
            this.mUrl = str;
            return this;
        }
    }

    private CloudControlRequest(Builder builder) {
        super(builder.getMethod(), builder.getUrl());
        addParam("data", ensureNotNull(builder.getDataParam()));
        addParam("syncToken", ensureNotNull(builder.getSyncToken()));
    }

    private String ensureNotNull(String str) {
        return str != null ? str : "";
    }

    /* access modifiers changed from: private */
    public static void reportImeiIsNull() {
        GallerySamplingStatHelper.recordStringPropertyEvent("cloud_control", "imei_is_null", String.format(Locale.US, "%s_%s", new Object[]{Build.MODEL, VERSION.INCREMENTAL}));
    }

    /* access modifiers changed from: protected */
    public void onRequestSuccess(JSONObject jSONObject) throws Exception {
        try {
            deliverResponse((CloudControlResponse) fromJson(jSONObject.toString(), new TypeToken<CloudControlResponse>() {
            }.getType()));
        } catch (JsonParseException e) {
            e.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), jSONObject);
        } catch (Exception e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), jSONObject);
        }
    }
}
