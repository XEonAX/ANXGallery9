package com.xiaomi.opensdk.file.model;

public class RequestUploadParameter {
    private String mAwsString;
    private String mFileMimeType = null;
    private String mFileName;
    private String mFileSHA1;
    private long mFileSize = -1;
    private String mKssString;

    public RequestUploadParameter() {
    }

    public RequestUploadParameter(String str, String str2, String str3, long j, String str4) {
        this.mKssString = str;
        this.mAwsString = str2;
        this.mFileSHA1 = str3;
        this.mFileSize = j;
        this.mFileName = str4;
    }

    public String getFileSHA1() {
        return this.mFileSHA1;
    }

    public String getKssString() {
        return this.mKssString;
    }
}
