package com.xiaomi.opensdk.file.model;

import java.io.File;

public class UploadContext {
    private boolean isNeedRequestUpload;
    private String mCommitString;
    private String mKssString;
    private final MiCloudFileListener mListener;
    private final File mLocalFile;
    private long mMaxChunkSize;
    private String mSha1;
    private String mUploadID;
    private UploadParameter mUploadParam;

    public UploadContext(File file, MiCloudFileListener miCloudFileListener) {
        this(file, miCloudFileListener, 4194304);
    }

    public UploadContext(File file, MiCloudFileListener miCloudFileListener, long j) {
        this.mLocalFile = file;
        this.mListener = miCloudFileListener;
        this.mMaxChunkSize = j;
    }

    public String getCommitString() {
        return this.mCommitString;
    }

    public String getFilePath() {
        return this.mLocalFile.getAbsolutePath();
    }

    public long getFileSize() {
        return this.mLocalFile.length();
    }

    public String getKssString() {
        return this.mKssString;
    }

    public MiCloudFileListener getListener() {
        return this.mListener;
    }

    public File getLocalFile() {
        return this.mLocalFile;
    }

    public long getMaxChunkSize() {
        return this.mMaxChunkSize;
    }

    public String getSha1() {
        return this.mSha1;
    }

    public String getUploadId() {
        return this.mUploadID;
    }

    public UploadParameter getUploadParam() {
        return this.mUploadParam;
    }

    public boolean isNeedRequestUpload() {
        return this.isNeedRequestUpload;
    }

    public void setCommitString(String str) {
        this.mCommitString = str;
    }

    public void setKssString(String str) {
        this.mKssString = str;
    }

    public void setNeedRequestUpload(boolean z) {
        this.isNeedRequestUpload = z;
    }

    public void setSha1(String str) {
        this.mSha1 = str;
    }

    public void setUploadId(String str) {
        this.mUploadID = str;
    }

    public void setUploadParam(UploadParameter uploadParameter) {
        this.mUploadParam = uploadParameter;
    }
}
