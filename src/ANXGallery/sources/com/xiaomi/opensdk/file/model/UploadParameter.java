package com.xiaomi.opensdk.file.model;

import org.json.JSONException;
import org.json.JSONObject;

public class UploadParameter {
    private String mKssUploadString;
    private String mUploadId;

    public String getUploadId() {
        return this.mUploadId;
    }

    public void setKssUploadString(String str) {
        this.mKssUploadString = str;
    }

    public void setUploadId(String str) {
        this.mUploadId = str;
    }

    public JSONObject toJsonObject() throws JSONException {
        return new JSONObject(this.mKssUploadString);
    }
}
