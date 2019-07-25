package com.miui.gallery.util.uil;

import android.graphics.RectF;
import android.net.Uri;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;

public class CloudImageHolder {
    private boolean mDelayRequest;
    private DisplayImageOptions mDisplayImageOptions;
    private CloudImageLoadingListener mImageLoadingListener;
    private CloudImageLoadingProgressListener mImageLoadingProgressListener;
    private ImageSize mImageSize;
    private DownloadType mImageType;
    private boolean mNeedDisplay = true;
    private RectF mRegionDecodeRect;
    private boolean mShowLoadingImage = true;
    private Uri mUri;

    public static CloudImageHolder getImageHolder(ImageAware imageAware) {
        Object tag = imageAware.getTag(R.id.tag_cloud_image_holder);
        if (tag == null) {
            tag = new CloudImageHolder();
            imageAware.setTag(R.id.tag_cloud_image_holder, tag);
        }
        return (CloudImageHolder) tag;
    }

    public DisplayImageOptions getDisplayImageOptions() {
        return this.mDisplayImageOptions;
    }

    public CloudImageLoadingListener getImageLoadingListener() {
        return this.mImageLoadingListener;
    }

    public CloudImageLoadingProgressListener getImageLoadingProgressListener() {
        return this.mImageLoadingProgressListener;
    }

    public ImageSize getImageSize() {
        return this.mImageSize;
    }

    public DownloadType getImageType() {
        return this.mImageType;
    }

    public RectF getRegionDecodeRect() {
        return this.mRegionDecodeRect;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public boolean isDelayRequest() {
        return this.mDelayRequest;
    }

    public boolean isShowLoadingImage() {
        return this.mShowLoadingImage;
    }

    public boolean needDisplay() {
        return this.mNeedDisplay;
    }

    public CloudImageHolder setDelayRequest(boolean z) {
        this.mDelayRequest = z;
        return this;
    }

    public CloudImageHolder setDisplayImageOptions(DisplayImageOptions displayImageOptions) {
        this.mDisplayImageOptions = displayImageOptions;
        return this;
    }

    public CloudImageHolder setImageLoadingListener(CloudImageLoadingListener cloudImageLoadingListener) {
        this.mImageLoadingListener = cloudImageLoadingListener;
        return this;
    }

    public CloudImageHolder setImageLoadingProgressListener(CloudImageLoadingProgressListener cloudImageLoadingProgressListener) {
        this.mImageLoadingProgressListener = cloudImageLoadingProgressListener;
        return this;
    }

    public CloudImageHolder setImageSize(ImageSize imageSize) {
        this.mImageSize = imageSize;
        return this;
    }

    public CloudImageHolder setImageType(DownloadType downloadType) {
        this.mImageType = downloadType;
        return this;
    }

    public CloudImageHolder setNeedDisplay(boolean z) {
        this.mNeedDisplay = z;
        return this;
    }

    public CloudImageHolder setRegionDecodeRect(RectF rectF) {
        this.mRegionDecodeRect = rectF;
        return this;
    }

    public CloudImageHolder setShowLoadingImage(boolean z) {
        this.mShowLoadingImage = z;
        return this;
    }

    public CloudImageHolder setUri(Uri uri) {
        this.mUri = uri;
        return this;
    }
}
