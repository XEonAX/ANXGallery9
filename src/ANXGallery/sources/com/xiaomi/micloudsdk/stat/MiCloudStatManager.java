package com.xiaomi.micloudsdk.stat;

public class MiCloudStatManager {
    private IMiCloudStatCallback mCldStatCallback;
    private boolean mEnable;
    private boolean mIsInitialized;

    private static class Holder {
        /* access modifiers changed from: private */
        public static final MiCloudStatManager _instance = new MiCloudStatManager();
    }

    private MiCloudStatManager() {
        this.mEnable = false;
        this.mIsInitialized = false;
    }

    public static MiCloudStatManager getInstance() {
        return Holder._instance;
    }

    public void addHttpEvent(String str, long j, long j2, int i, String str2) {
        if (this.mEnable && this.mIsInitialized && this.mCldStatCallback != null) {
            this.mCldStatCallback.onAddHttpEvent(str, j, j2, i, str2);
        }
    }
}
