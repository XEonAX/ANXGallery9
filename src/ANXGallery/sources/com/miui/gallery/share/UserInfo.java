package com.miui.gallery.share;

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

    private String convertUrl(String str) {
        String str2 = this.mMiliaoIconUrl;
        if (str2 == null) {
            return null;
        }
        int lastIndexOf = str2.lastIndexOf(".");
        if (lastIndexOf <= 0) {
            return str2;
        }
        return String.format("%s_%s%s", new Object[]{str2.substring(0, lastIndexOf), str, str2.substring(lastIndexOf)});
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

    public String getMiliaoIconUrl150() {
        return convertUrl("150");
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
