package com.nostra13.universalimageloader.core;

import android.content.res.Resources;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import com.miui.gallery.util.ReusedBitmapCache;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.download.ExtraInfo;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;
import java.io.Serializable;

public final class DisplayImageOptions implements Serializable {
    /* access modifiers changed from: private */
    public int blurRadius;
    /* access modifiers changed from: private */
    public final boolean cacheInMemory;
    /* access modifiers changed from: private */
    public boolean cacheInSubMemory;
    /* access modifiers changed from: private */
    public final boolean cacheOnDisk;
    /* access modifiers changed from: private */
    public final boolean cacheThumbnail;
    /* access modifiers changed from: private */
    public final boolean considerExifParams;
    /* access modifiers changed from: private */
    public boolean considerFileLength;
    /* access modifiers changed from: private */
    public final Options decodingOptions;
    /* access modifiers changed from: private */
    public final int delayBeforeLoading;
    /* access modifiers changed from: private */
    public final boolean delayCacheThumbnail;
    /* access modifiers changed from: private */
    public final BitmapDisplayer displayer;
    /* access modifiers changed from: private */
    public final ExtraInfo extraForDownloader;
    /* access modifiers changed from: private */
    public long fileLength;
    /* access modifiers changed from: private */
    public final Handler handler;
    /* access modifiers changed from: private */
    public final Drawable imageForEmptyUri;
    /* access modifiers changed from: private */
    public final Drawable imageOnFail;
    /* access modifiers changed from: private */
    public final Drawable imageOnLoading;
    /* access modifiers changed from: private */
    public final int imageResForEmptyUri;
    /* access modifiers changed from: private */
    public final int imageResOnFail;
    /* access modifiers changed from: private */
    public final int imageResOnLoading;
    /* access modifiers changed from: private */
    public final ImageScaleType imageScaleType;
    /* access modifiers changed from: private */
    public boolean isBitmapReused;
    /* access modifiers changed from: private */
    public boolean isCacheBigPhoto;
    private boolean isHighPriority;
    /* access modifiers changed from: private */
    public boolean isLoadFromBigPhotoCache;
    /* access modifiers changed from: private */
    public boolean isLoadFromMicroCache;
    /* access modifiers changed from: private */
    public boolean isLoadFromThumbnailCache;
    /* access modifiers changed from: private */
    public boolean isLoadOriginScaleThumbnail;
    /* access modifiers changed from: private */
    public boolean isManual;
    /* access modifiers changed from: private */
    public boolean isPreferSyncLoadFromMicroCache;
    /* access modifiers changed from: private */
    public boolean isSecretImage;
    /* access modifiers changed from: private */
    public boolean isSyncLoadFromThumbCache;
    /* access modifiers changed from: private */
    public final boolean isSyncLoading;
    /* access modifiers changed from: private */
    public final BitmapProcessor postProcessor;
    /* access modifiers changed from: private */
    public final BitmapProcessor preProcessor;
    /* access modifiers changed from: private */
    public final boolean resetViewBeforeLoading;
    /* access modifiers changed from: private */
    public ReusedBitmapCache reusedBitmapCache;
    /* access modifiers changed from: private */
    public byte[] secretKey;
    /* access modifiers changed from: private */
    public boolean usingRegionDecoderFace;

    public static class Builder {
        /* access modifiers changed from: private */
        public int blurRadius = -1;
        /* access modifiers changed from: private */
        public boolean cacheInMemory = false;
        /* access modifiers changed from: private */
        public boolean cacheInSubMemory;
        /* access modifiers changed from: private */
        public boolean cacheOnDisk = false;
        /* access modifiers changed from: private */
        public boolean cacheThumbnail = false;
        /* access modifiers changed from: private */
        public boolean considerExifParams = false;
        /* access modifiers changed from: private */
        public boolean considerFileLength;
        /* access modifiers changed from: private */
        public Options decodingOptions = new Options();
        /* access modifiers changed from: private */
        public int delayBeforeLoading = 0;
        /* access modifiers changed from: private */
        public boolean delayCacheThumbnail = false;
        /* access modifiers changed from: private */
        public BitmapDisplayer displayer = DefaultConfigurationFactory.createBitmapDisplayer();
        /* access modifiers changed from: private */
        public ExtraInfo extraForDownloader = null;
        /* access modifiers changed from: private */
        public long fileLength;
        /* access modifiers changed from: private */
        public Handler handler = null;
        /* access modifiers changed from: private */
        public Drawable imageForEmptyUri = null;
        /* access modifiers changed from: private */
        public Drawable imageOnFail = null;
        /* access modifiers changed from: private */
        public Drawable imageOnLoading = null;
        /* access modifiers changed from: private */
        public int imageResForEmptyUri = 0;
        /* access modifiers changed from: private */
        public int imageResOnFail = 0;
        /* access modifiers changed from: private */
        public int imageResOnLoading = 0;
        /* access modifiers changed from: private */
        public ImageScaleType imageScaleType = ImageScaleType.IN_SAMPLE_POWER_OF_2;
        /* access modifiers changed from: private */
        public boolean isBitmapReused;
        /* access modifiers changed from: private */
        public boolean isCacheBigPhoto;
        /* access modifiers changed from: private */
        public boolean isHighPriority = false;
        /* access modifiers changed from: private */
        public boolean isLoadFromBigPhotoCache;
        /* access modifiers changed from: private */
        public boolean isLoadFromMicroCache;
        /* access modifiers changed from: private */
        public boolean isLoadFromThumbnailCache;
        /* access modifiers changed from: private */
        public boolean isLoadOriginScaleThumbnail;
        /* access modifiers changed from: private */
        public boolean isManual;
        /* access modifiers changed from: private */
        public boolean isPreferSyncLoadFromMicroCache = true;
        /* access modifiers changed from: private */
        public boolean isSecretImage;
        /* access modifiers changed from: private */
        public boolean isSyncLoadFromThumbCache;
        /* access modifiers changed from: private */
        public boolean isSyncLoading = false;
        /* access modifiers changed from: private */
        public BitmapProcessor postProcessor = null;
        /* access modifiers changed from: private */
        public BitmapProcessor preProcessor = null;
        /* access modifiers changed from: private */
        public boolean resetViewBeforeLoading = false;
        /* access modifiers changed from: private */
        public ReusedBitmapCache reusedBitmapCache;
        /* access modifiers changed from: private */
        public byte[] secretKey;
        /* access modifiers changed from: private */
        public boolean usingRegionDecoderFace = false;

        public Builder bitmapConfig(Config config) {
            if (config != null) {
                this.decodingOptions.inPreferredConfig = config;
                return this;
            }
            throw new IllegalArgumentException("bitmapConfig can't be null");
        }

        public Builder blurRadius(int i) {
            this.blurRadius = i;
            return this;
        }

        public DisplayImageOptions build() {
            return new DisplayImageOptions(this);
        }

        public Builder cacheBigPhoto(boolean z) {
            this.isCacheBigPhoto = z;
            return this;
        }

        public Builder cacheInMemory(boolean z) {
            this.cacheInMemory = z;
            return this;
        }

        public Builder cacheInSubMemory(boolean z) {
            this.cacheInSubMemory = z;
            return this;
        }

        @Deprecated
        public Builder cacheOnDisc() {
            return cacheOnDisk(true);
        }

        public Builder cacheOnDisk(boolean z) {
            this.cacheOnDisk = z;
            return this;
        }

        public Builder cacheThumbnail(boolean z) {
            this.cacheThumbnail = z;
            return this;
        }

        public Builder cloneFrom(DisplayImageOptions displayImageOptions) {
            this.imageResOnLoading = displayImageOptions.imageResOnLoading;
            this.imageResForEmptyUri = displayImageOptions.imageResForEmptyUri;
            this.imageResOnFail = displayImageOptions.imageResOnFail;
            this.imageOnLoading = displayImageOptions.imageOnLoading;
            this.imageForEmptyUri = displayImageOptions.imageForEmptyUri;
            this.imageOnFail = displayImageOptions.imageOnFail;
            this.resetViewBeforeLoading = displayImageOptions.resetViewBeforeLoading;
            this.cacheInMemory = displayImageOptions.cacheInMemory;
            this.cacheOnDisk = displayImageOptions.cacheOnDisk;
            this.imageScaleType = displayImageOptions.imageScaleType;
            this.decodingOptions = displayImageOptions.decodingOptions;
            this.delayBeforeLoading = displayImageOptions.delayBeforeLoading;
            this.considerExifParams = displayImageOptions.considerExifParams;
            this.extraForDownloader = displayImageOptions.extraForDownloader;
            this.preProcessor = displayImageOptions.preProcessor;
            this.postProcessor = displayImageOptions.postProcessor;
            this.displayer = displayImageOptions.displayer;
            this.handler = displayImageOptions.handler;
            this.isSyncLoading = displayImageOptions.isSyncLoading;
            this.cacheThumbnail = displayImageOptions.cacheThumbnail;
            this.delayCacheThumbnail = displayImageOptions.delayCacheThumbnail;
            this.usingRegionDecoderFace = displayImageOptions.usingRegionDecoderFace;
            this.isSecretImage = displayImageOptions.isSecretImage;
            this.secretKey = displayImageOptions.secretKey;
            this.isSyncLoadFromThumbCache = displayImageOptions.isSyncLoadFromThumbCache;
            this.reusedBitmapCache = displayImageOptions.reusedBitmapCache;
            this.isLoadFromThumbnailCache = displayImageOptions.isLoadFromThumbnailCache;
            this.isLoadOriginScaleThumbnail = displayImageOptions.isLoadOriginScaleThumbnail;
            this.isLoadFromMicroCache = displayImageOptions.isLoadFromMicroCache;
            this.isCacheBigPhoto = displayImageOptions.isCacheBigPhoto;
            this.isLoadFromBigPhotoCache = displayImageOptions.isLoadFromBigPhotoCache;
            this.isPreferSyncLoadFromMicroCache = displayImageOptions.isPreferSyncLoadFromMicroCache;
            this.considerFileLength = displayImageOptions.considerFileLength;
            this.fileLength = displayImageOptions.fileLength;
            this.blurRadius = displayImageOptions.blurRadius;
            this.cacheInSubMemory = displayImageOptions.cacheInSubMemory;
            this.isBitmapReused = displayImageOptions.isBitmapReused;
            this.isManual = displayImageOptions.isManual;
            return this;
        }

        public Builder considerExifParams(boolean z) {
            this.considerExifParams = z;
            return this;
        }

        public Builder considerFileLength(boolean z) {
            this.considerFileLength = z;
            return this;
        }

        public Builder delayCacheThumbnail(boolean z) {
            this.delayCacheThumbnail = z;
            return this;
        }

        public Builder displayer(BitmapDisplayer bitmapDisplayer) {
            if (bitmapDisplayer != null) {
                this.displayer = bitmapDisplayer;
                return this;
            }
            throw new IllegalArgumentException("displayer can't be null");
        }

        public Builder extraForDownloader(ExtraInfo extraInfo) {
            this.extraForDownloader = extraInfo;
            return this;
        }

        public Builder fileLength(long j) {
            this.considerFileLength = true;
            this.fileLength = j;
            return this;
        }

        public Builder handler(Handler handler2) {
            this.handler = handler2;
            return this;
        }

        public Builder highPriority(boolean z) {
            this.isHighPriority = z;
            return this;
        }

        public Builder imageScaleType(ImageScaleType imageScaleType2) {
            this.imageScaleType = imageScaleType2;
            return this;
        }

        public Builder loadFromBigPhotoCache(boolean z) {
            this.isLoadFromBigPhotoCache = z;
            return this;
        }

        public Builder loadFromMicroCache(boolean z) {
            this.isLoadFromMicroCache = z;
            return this;
        }

        public Builder loadFromThumbnailCache(boolean z) {
            this.isLoadFromThumbnailCache = z;
            return this;
        }

        public Builder loadOriginScaleThumbnail(boolean z) {
            this.isLoadOriginScaleThumbnail = z;
            return this;
        }

        public Builder preferSyncLoadFromMicroCache(boolean z) {
            this.isPreferSyncLoadFromMicroCache = z;
            return this;
        }

        public Builder resetViewBeforeLoading(boolean z) {
            this.resetViewBeforeLoading = z;
            return this;
        }

        public Builder reusedBitmapCache(ReusedBitmapCache reusedBitmapCache2) {
            this.reusedBitmapCache = reusedBitmapCache2;
            return this;
        }

        public Builder secretKey(byte[] bArr) {
            this.isSecretImage = true;
            this.secretKey = bArr;
            return this;
        }

        public Builder setManual(boolean z) {
            this.isManual = z;
            return this;
        }

        public Builder showImageForEmptyUri(int i) {
            this.imageResForEmptyUri = i;
            return this;
        }

        public Builder showImageOnFail(int i) {
            this.imageResOnFail = i;
            return this;
        }

        public Builder showImageOnLoading(int i) {
            this.imageResOnLoading = i;
            return this;
        }

        public Builder showImageOnLoading(Drawable drawable) {
            this.imageOnLoading = drawable;
            return this;
        }

        @Deprecated
        public Builder showStubImage(int i) {
            this.imageResOnLoading = i;
            return this;
        }

        public Builder syncLoadFromThumbCache(boolean z) {
            this.isSyncLoadFromThumbCache = z;
            loadFromThumbnailCache(true);
            return this;
        }

        public Builder syncLoading(boolean z) {
            this.isSyncLoading = z;
            return this;
        }

        public Builder usingRegionDecoderFace(boolean z) {
            this.usingRegionDecoderFace = z;
            return this;
        }
    }

    private DisplayImageOptions(Builder builder) {
        this.imageResOnLoading = builder.imageResOnLoading;
        this.imageResForEmptyUri = builder.imageResForEmptyUri;
        this.imageResOnFail = builder.imageResOnFail;
        this.imageOnLoading = builder.imageOnLoading;
        this.imageForEmptyUri = builder.imageForEmptyUri;
        this.imageOnFail = builder.imageOnFail;
        this.resetViewBeforeLoading = builder.resetViewBeforeLoading;
        this.cacheInMemory = builder.cacheInMemory;
        this.cacheOnDisk = builder.cacheOnDisk;
        this.imageScaleType = builder.imageScaleType;
        this.decodingOptions = builder.decodingOptions;
        this.delayBeforeLoading = builder.delayBeforeLoading;
        this.considerExifParams = builder.considerExifParams;
        this.extraForDownloader = builder.extraForDownloader;
        this.preProcessor = builder.preProcessor;
        this.postProcessor = builder.postProcessor;
        this.displayer = builder.displayer;
        this.handler = builder.handler;
        this.isSyncLoading = builder.isSyncLoading;
        this.cacheThumbnail = builder.cacheThumbnail;
        this.delayCacheThumbnail = builder.delayCacheThumbnail;
        this.usingRegionDecoderFace = builder.usingRegionDecoderFace;
        this.isSecretImage = builder.isSecretImage;
        this.secretKey = builder.secretKey;
        this.isSyncLoadFromThumbCache = builder.isSyncLoadFromThumbCache;
        this.reusedBitmapCache = builder.reusedBitmapCache;
        this.isLoadFromThumbnailCache = builder.isLoadFromThumbnailCache;
        this.isLoadOriginScaleThumbnail = builder.isLoadOriginScaleThumbnail;
        this.isLoadFromMicroCache = builder.isLoadFromMicroCache;
        this.isCacheBigPhoto = builder.isCacheBigPhoto;
        this.isLoadFromBigPhotoCache = builder.isLoadFromBigPhotoCache;
        this.isPreferSyncLoadFromMicroCache = builder.isPreferSyncLoadFromMicroCache;
        this.isHighPriority = builder.isHighPriority;
        this.considerFileLength = builder.considerFileLength;
        this.fileLength = builder.fileLength;
        this.blurRadius = builder.blurRadius;
        this.cacheInSubMemory = builder.cacheInSubMemory;
        this.isBitmapReused = builder.isBitmapReused;
        this.isManual = builder.isManual;
    }

    public static DisplayImageOptions createSimple() {
        return new Builder().build();
    }

    public int getBlurRadius() {
        return this.blurRadius;
    }

    public Options getDecodingOptions() {
        return this.decodingOptions;
    }

    public int getDelayBeforeLoading() {
        return this.delayBeforeLoading;
    }

    public BitmapDisplayer getDisplayer() {
        return this.displayer;
    }

    public ExtraInfo getExtraForDownloader() {
        return this.extraForDownloader;
    }

    public long getFileLength() {
        return this.fileLength;
    }

    public Handler getHandler() {
        return this.handler;
    }

    public Drawable getImageForEmptyUri(Resources resources) {
        return this.imageResForEmptyUri != 0 ? resources.getDrawable(this.imageResForEmptyUri) : this.imageForEmptyUri;
    }

    public Drawable getImageOnFail(Resources resources) {
        return this.imageResOnFail != 0 ? resources.getDrawable(this.imageResOnFail) : this.imageOnFail;
    }

    public Drawable getImageOnLoading(Resources resources) {
        return this.imageResOnLoading != 0 ? resources.getDrawable(this.imageResOnLoading) : this.imageOnLoading;
    }

    public ImageScaleType getImageScaleType() {
        return this.imageScaleType;
    }

    public BitmapProcessor getPostProcessor() {
        return this.postProcessor;
    }

    public BitmapProcessor getPreProcessor() {
        return this.preProcessor;
    }

    public ReusedBitmapCache getReusedBitmapCache() {
        return this.reusedBitmapCache;
    }

    public byte[] getSecretKey() {
        return this.secretKey;
    }

    public boolean isBitmapReused() {
        return this.isBitmapReused;
    }

    public boolean isCacheBigPhoto() {
        return this.isCacheBigPhoto;
    }

    public boolean isCacheInMemory() {
        return this.cacheInMemory;
    }

    public boolean isCacheInSubMemory() {
        return this.cacheInSubMemory;
    }

    public boolean isCacheOnDisk() {
        return this.cacheOnDisk;
    }

    public boolean isCacheThumbnail() {
        return this.cacheThumbnail;
    }

    public boolean isConsiderExifParams() {
        return this.considerExifParams;
    }

    public boolean isConsiderFileLength() {
        return this.considerFileLength;
    }

    public boolean isDelayCacheThumbnail() {
        return this.delayCacheThumbnail;
    }

    public boolean isHighPriority() {
        return this.isHighPriority;
    }

    public boolean isLoadFromBigPhotoCache() {
        return this.isLoadFromBigPhotoCache;
    }

    public boolean isLoadFromMicroCache() {
        return this.isLoadFromMicroCache;
    }

    public boolean isLoadFromThumbnailCache() {
        return this.isLoadFromThumbnailCache;
    }

    public boolean isLoadOriginScaleThumbnail() {
        return this.isLoadOriginScaleThumbnail;
    }

    public boolean isManual() {
        return this.isManual;
    }

    public boolean isPreferSyncLoadFromMicroCache() {
        return this.isPreferSyncLoadFromMicroCache;
    }

    public boolean isResetViewBeforeLoading() {
        return this.resetViewBeforeLoading;
    }

    public boolean isSecretImage() {
        return this.isSecretImage;
    }

    public boolean isSyncLoadFromThumbCache() {
        return this.isSyncLoadFromThumbCache;
    }

    /* access modifiers changed from: 0000 */
    public boolean isSyncLoading() {
        return this.isSyncLoading;
    }

    public boolean shouldDelayBeforeLoading() {
        return this.delayBeforeLoading > 0;
    }

    public boolean shouldPostProcess() {
        return this.postProcessor != null;
    }

    public boolean shouldPreProcess() {
        return this.preProcessor != null;
    }

    public boolean shouldShowImageForEmptyUri() {
        return (this.imageForEmptyUri == null && this.imageResForEmptyUri == 0) ? false : true;
    }

    public boolean shouldShowImageOnFail() {
        return (this.imageOnFail == null && this.imageResOnFail == 0) ? false : true;
    }

    public boolean shouldShowImageOnLoading() {
        return (this.imageOnLoading == null && this.imageResOnLoading == 0) ? false : true;
    }

    public boolean usingRegionDecoderFace() {
        return this.usingRegionDecoderFace;
    }
}
