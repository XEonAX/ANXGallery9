package com.miui.gallery.search.core.suggestion;

import android.text.TextUtils;
import java.io.Serializable;

public class RankInfo implements Serializable {
    private String mName;
    private String mOrder;
    private String mStyle;
    private String mTitle;

    public RankInfo(String str, String str2, String str3, String str4) {
        this.mTitle = str;
        this.mName = str2;
        this.mStyle = str3;
        this.mOrder = str4;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null || !(obj instanceof RankInfo)) {
            return false;
        }
        RankInfo rankInfo = (RankInfo) obj;
        if (TextUtils.equals(this.mName, rankInfo.getName()) && TextUtils.equals(this.mOrder, rankInfo.getOrder()) && TextUtils.equals(this.mStyle, rankInfo.getStyle()) && TextUtils.equals(this.mTitle, rankInfo.getTitle())) {
            z = true;
        }
        return z;
    }

    public String getName() {
        return this.mName;
    }

    public String getOrder() {
        return this.mOrder;
    }

    public String getStyle() {
        return this.mStyle;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public String toString() {
        return String.format("RankInfo: [name=%s, order=%s, title=%s, style=%s]", new Object[]{this.mName, this.mOrder, this.mTitle, this.mStyle});
    }
}
