package com.xiaomi.opensdk.file.model;

public class CommitParameter {
    private String mAwsString;
    private String mFileSHA1;
    private long mFileSize = -1;
    private String mKssString;
    private String mUploadId;

    public CommitParameter() {
    }

    public CommitParameter(String str, String str2, String str3, String str4, long j) {
        this.mKssString = str;
        this.mAwsString = str2;
        this.mUploadId = str3;
        this.mFileSHA1 = str4;
        this.mFileSize = j;
    }

    public String getKssString() {
        return this.mKssString;
    }

    public String getUploadId() {
        return this.mUploadId;
    }
}
