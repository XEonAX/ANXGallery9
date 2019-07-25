package com.miui.gallery.cloud.base;

import android.text.TextUtils;

public enum SyncType {
    UNKNOW("unknow", false),
    BACKGROUND("auto-background", false),
    NORMAL("auto-foreground", false),
    POWER_FORCE("manual-battery", true),
    GPRS_FORCE("manual-network", true);
    
    private String mIdentifier;
    private boolean mIsForce;

    private SyncType(String str, boolean z) {
        this.mIdentifier = str;
        this.mIsForce = z;
    }

    public static int compare(SyncType syncType, SyncType syncType2) {
        return syncType.ordinal() - syncType2.ordinal();
    }

    public static SyncType fromIdentifier(String str) {
        SyncType[] values;
        if (TextUtils.isEmpty(str)) {
            return UNKNOW;
        }
        for (SyncType syncType : values()) {
            if (TextUtils.equals(syncType.getIdentifier(), str)) {
                return syncType;
            }
        }
        return UNKNOW;
    }

    public String getIdentifier() {
        return this.mIdentifier;
    }

    public boolean isForce() {
        return this.mIsForce;
    }
}
