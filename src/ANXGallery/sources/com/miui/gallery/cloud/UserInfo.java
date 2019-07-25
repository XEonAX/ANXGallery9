package com.miui.gallery.cloud;

import android.text.TextUtils;

public class UserInfo {
    private String mAliasNick;
    private final String mId;
    private String mMiliaoIconUrl;
    private String mMiliaoNick;

    public UserInfo(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.mId = str;
            return;
        }
        throw new IllegalArgumentException("Bad id");
    }

    public String getAliasNick() {
        return this.mAliasNick;
    }

    public String getDisplayName() {
        String readableName = getReadableName();
        return !TextUtils.isEmpty(readableName) ? readableName : this.mId;
    }

    public String getMiliaoIconUrl() {
        return this.mMiliaoIconUrl;
    }

    public String getMiliaoNick() {
        return this.mMiliaoNick;
    }

    public String getReadableName() {
        if (!TextUtils.isEmpty(this.mMiliaoNick)) {
            return this.mMiliaoNick;
        }
        if (!TextUtils.isEmpty(this.mAliasNick)) {
            return this.mAliasNick;
        }
        return null;
    }

    public String getUserId() {
        return this.mId;
    }

    public void setAliasNick(String str) {
        if (str != null) {
            this.mAliasNick = str.trim();
        } else {
            this.mAliasNick = null;
        }
    }

    public void setMiliaoIconUrl(String str) {
        if (str != null) {
            this.mMiliaoIconUrl = str.trim();
        } else {
            this.mMiliaoIconUrl = null;
        }
    }

    public void setMiliaoNick(String str) {
        if (str != null) {
            this.mMiliaoNick = str.trim();
        } else {
            this.mMiliaoNick = null;
        }
    }
}
