package com.miui.gallery.cloudcontrol.strategies;

import com.google.gson.annotations.SerializedName;

public class FeatureSwitchStrategy extends BaseStrategy {
    @SerializedName("global-secret-video")
    private boolean mIsGlobalSecretVideoSupported = false;

    public static FeatureSwitchStrategy createDefault() {
        return new FeatureSwitchStrategy();
    }

    public boolean isGlobalSecretVideoSupported() {
        return this.mIsGlobalSecretVideoSupported;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("FeatureSwitchStrategy{mIsGlobalSecretVideoSupported=");
        sb.append(this.mIsGlobalSecretVideoSupported);
        sb.append('}');
        return sb.toString();
    }
}
