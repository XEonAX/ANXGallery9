package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.List;

public class HiddenAlbumsStrategy extends BaseStrategy {
    @SerializedName("non_hidden_path_prefix")
    private List<String> mNonHiddenPathPrefix;
    @SerializedName("patterns")
    private List<String> mPatterns;

    public void doAdditionalProcessing() {
        if (MiscUtil.isValid(this.mPatterns)) {
            ArrayList arrayList = new ArrayList();
            for (String str : this.mPatterns) {
                if (!TextUtils.isEmpty(str)) {
                    arrayList.add(str);
                }
            }
            if (arrayList.size() < this.mPatterns.size()) {
                this.mPatterns.clear();
                this.mPatterns.addAll(arrayList);
            }
        }
        if (MiscUtil.isValid(this.mNonHiddenPathPrefix)) {
            ArrayList arrayList2 = new ArrayList();
            for (String str2 : this.mNonHiddenPathPrefix) {
                if (!TextUtils.isEmpty(str2)) {
                    arrayList2.add(str2);
                }
            }
            if (arrayList2.size() < this.mNonHiddenPathPrefix.size()) {
                this.mNonHiddenPathPrefix.clear();
                this.mNonHiddenPathPrefix.addAll(arrayList2);
            }
        }
    }

    public List<String> getNonHiddenPathPrefix() {
        return this.mNonHiddenPathPrefix;
    }

    public List<String> getPatterns() {
        return this.mPatterns;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("HiddenAlbumsStrategy{mPatterns=");
        sb.append(this.mPatterns);
        sb.append(", mNonHiddenPathPrefix=");
        sb.append(this.mNonHiddenPathPrefix);
        sb.append('}');
        return sb.toString();
    }
}
