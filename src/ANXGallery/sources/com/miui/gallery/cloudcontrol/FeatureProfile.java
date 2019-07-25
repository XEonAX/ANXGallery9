package com.miui.gallery.cloudcontrol;

import android.text.TextUtils;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.annotations.SerializedName;
import java.lang.reflect.Type;

public class FeatureProfile {
    @SerializedName("name")
    protected String mName;
    @SerializedName("status")
    protected String mStatus;
    @SerializedName("strategy")
    protected String mStrategy;

    public static class Deserializer implements JsonDeserializer<FeatureProfile> {
        public FeatureProfile deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
            FeatureProfile featureProfile = new FeatureProfile();
            JsonObject asJsonObject = jsonElement.getAsJsonObject();
            if (asJsonObject.has("name")) {
                featureProfile.setName(asJsonObject.getAsJsonPrimitive("name").getAsString());
            }
            if (asJsonObject.has("strategy")) {
                JsonElement jsonElement2 = asJsonObject.get("strategy");
                if (jsonElement2.isJsonPrimitive()) {
                    featureProfile.setStrategy(jsonElement2.getAsString());
                } else {
                    featureProfile.setStrategy(jsonElement2.toString());
                }
            }
            if (asJsonObject.has("status")) {
                featureProfile.setStatus(asJsonObject.getAsJsonPrimitive("status").getAsString());
            }
            return featureProfile;
        }
    }

    public enum Status {
        ENABLE("enable"),
        DISABLE("disable"),
        REMOVE("remove"),
        UNAVAILABLE("unavailable");
        
        private String value;

        private Status(String str) {
            this.value = str;
        }

        public static Status fromValue(String str) {
            Status[] values;
            for (Status status : values()) {
                if (status.value.equals(str)) {
                    return status;
                }
            }
            return UNAVAILABLE;
        }

        public String getValue() {
            return this.value;
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FeatureProfile)) {
            return false;
        }
        FeatureProfile featureProfile = (FeatureProfile) obj;
        if (!TextUtils.equals(this.mName, featureProfile.getName()) || !TextUtils.equals(this.mStrategy, featureProfile.getStrategy()) || !TextUtils.equals(this.mStatus, featureProfile.getStatus())) {
            z = false;
        }
        return z;
    }

    public String getName() {
        return this.mName;
    }

    public String getStatus() {
        return this.mStatus;
    }

    public String getStrategy() {
        return this.mStrategy;
    }

    public int hashCode() {
        int hashCode = this.mName != null ? 527 + this.mName.hashCode() : 17;
        if (this.mStatus != null) {
            hashCode = (hashCode * 31) + this.mStatus.hashCode();
        }
        return this.mStrategy != null ? (hashCode * 31) + this.mStrategy.hashCode() : hashCode;
    }

    public void setName(String str) {
        this.mName = str;
    }

    public void setStatus(String str) {
        this.mStatus = str;
    }

    public void setStrategy(String str) {
        this.mStrategy = str;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("FeatureProfile{mName='");
        sb.append(this.mName);
        sb.append('\'');
        sb.append(", mStatus='");
        sb.append(this.mStatus);
        sb.append('\'');
        sb.append(", mStrategy='");
        sb.append(this.mStrategy);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
