package com.miui.gallery.assistant.manager.request.param;

import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.sdk.download.DownloadType;

public abstract class ImageFeatureRequestParams<T> implements RequestParams<T> {
    protected boolean mAllowedOverMetered;
    protected DownloadType mDownloadType;
    protected MediaFeatureItem mMediaFeatureItem;
    protected boolean mShouldDownloadIfNotExist;

    public ImageFeatureRequestParams(MediaFeatureItem mediaFeatureItem) {
        this.mMediaFeatureItem = mediaFeatureItem;
        this.mShouldDownloadIfNotExist = false;
    }

    public ImageFeatureRequestParams(MediaFeatureItem mediaFeatureItem, boolean z, boolean z2, DownloadType downloadType) {
        this.mMediaFeatureItem = mediaFeatureItem;
        this.mShouldDownloadIfNotExist = z;
        this.mAllowedOverMetered = z2;
        this.mDownloadType = downloadType;
    }

    public DownloadType getDownloadType() {
        return this.mDownloadType;
    }

    public MediaFeatureItem getMediaFeatureItem() {
        return this.mMediaFeatureItem;
    }

    public boolean isAllowedOverMetered() {
        return this.mAllowedOverMetered;
    }

    public boolean isShouldDownloadIfNotExist() {
        return this.mShouldDownloadIfNotExist;
    }
}
