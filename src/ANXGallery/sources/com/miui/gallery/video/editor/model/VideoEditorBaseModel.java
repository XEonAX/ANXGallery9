package com.miui.gallery.video.editor.model;

public class VideoEditorBaseModel {
    protected int mDownloadState = 19;
    protected boolean mExtra;
    protected String mFileName;
    protected long mID;
    protected String mIconUrl;
    protected boolean mIsTemplate;
    protected String mLabel = "";
    protected String mNameKey;
    protected String mType;
    protected String mUnZipPath;

    public int getDownloadState() {
        return this.mDownloadState;
    }

    public String getFileName() {
        return this.mFileName;
    }

    public String getIconUrl() {
        return this.mIconUrl;
    }

    public long getId() {
        return this.mID;
    }

    public String getLabel() {
        return this.mLabel;
    }

    public boolean isCustom() {
        return "ve_type_custom".equals(this.mType);
    }

    public boolean isDownloadSuccess() {
        return this.mDownloadState == 0;
    }

    public boolean isDownloaded() {
        return this.mDownloadState == 17;
    }

    public boolean isDownloading() {
        return this.mDownloadState == 18;
    }

    public boolean isExtra() {
        return this.mExtra;
    }

    public boolean isLocal() {
        return "ve_type_local".equals(this.mType);
    }

    public boolean isNone() {
        return "ve_type_none".equals(this.mType);
    }

    public boolean isTemplate() {
        return this.mIsTemplate;
    }

    public void setDownloadState(int i) {
        this.mDownloadState = i;
    }

    public void setUnZipPath(String str) {
        this.mUnZipPath = str;
    }
}
