package com.miui.gallery.cloudcontrol;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;

public class CloudControlResponse {
    @SerializedName("expairAt")
    private long mExpireAt;
    @SerializedName("modules")
    private ArrayList<FeatureProfile> mFeatureProfiles;
    @SerializedName("syncToken")
    private String mSyncToken;

    public ArrayList<FeatureProfile> getFeatureProfiles() {
        return this.mFeatureProfiles;
    }

    public String getSyncToken() {
        return this.mSyncToken;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CloudControlResponse{mSyncToken='");
        sb.append(this.mSyncToken);
        sb.append('\'');
        sb.append(", mExpireAt=");
        sb.append(this.mExpireAt);
        sb.append(", mFeatureProfiles=");
        sb.append(this.mFeatureProfiles);
        sb.append('}');
        return sb.toString();
    }
}
