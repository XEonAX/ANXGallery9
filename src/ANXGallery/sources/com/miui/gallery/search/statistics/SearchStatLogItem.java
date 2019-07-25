package com.miui.gallery.search.statistics;

import com.google.gson.annotations.SerializedName;
import java.io.Serializable;
import java.util.Map;

public class SearchStatLogItem implements Serializable {
    @SerializedName("data")
    private Map<String, String> mData;
    @SerializedName("serialId")
    private String mSerialId;
    @SerializedName("timestamp")
    private long mTimeStamp = System.currentTimeMillis();
    @SerializedName("type")
    private String mType;

    public SearchStatLogItem(String str, String str2, Map<String, String> map) {
        this.mSerialId = str;
        this.mType = str2;
        this.mData = map;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("serialId = ");
        sb.append(this.mSerialId);
        sb.append(", timestamp = ");
        sb.append(this.mTimeStamp);
        sb.append(", type = ");
        sb.append(this.mType);
        sb.append(", data = ");
        sb.append(this.mData);
        return sb.toString();
    }
}
