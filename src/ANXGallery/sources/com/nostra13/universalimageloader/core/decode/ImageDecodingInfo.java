package com.nostra13.universalimageloader.core.decode;

import android.annotation.TargetApi;
import android.graphics.BitmapFactory.Options;
import android.graphics.RectF;
import android.os.Build.VERSION;
import com.miui.gallery.util.ReusedBitmapCache;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ExtraInfo;
import com.nostra13.universalimageloader.core.download.ImageDownloader;

public class ImageDecodingInfo {
    private final boolean considerExifParams;
    private final boolean considerFileLength;
    private final Options decodingOptions = new Options();
    private final ImageDownloader downloader;
    private final ExtraInfo extraForDownloader;
    private final long fileLength;
    private final String imageKey;
    private final ImageScaleType imageScaleType;
    private final String imageUri;
    private final ReusedBitmapCache inBitmapCache;
    private final boolean isCacheBigPhoto;
    private final boolean isLoadFromBigPhotoCache;
    private final boolean isRegionDecodeFace;
    private final boolean isSecretImage;
    private final String originalImageUri;
    private final RectF regionDecodeRect;
    private final byte[] secretKey;
    private final ImageSize targetSize;
    private final ViewScaleType viewScaleType;

    public ImageDecodingInfo(String str, String str2, String str3, ImageSize imageSize, ViewScaleType viewScaleType2, ImageDownloader imageDownloader, DisplayImageOptions displayImageOptions) {
        this.imageKey = str;
        this.imageUri = str2;
        this.originalImageUri = str3;
        this.targetSize = imageSize;
        this.imageScaleType = displayImageOptions.getImageScaleType();
        this.viewScaleType = viewScaleType2;
        this.downloader = imageDownloader;
        this.extraForDownloader = displayImageOptions.getExtraForDownloader();
        this.considerExifParams = displayImageOptions.isConsiderExifParams();
        copyOptions(displayImageOptions.getDecodingOptions(), this.decodingOptions);
        this.regionDecodeRect = null;
        this.isRegionDecodeFace = false;
        this.isSecretImage = displayImageOptions.isSecretImage();
        this.secretKey = displayImageOptions.getSecretKey();
        this.inBitmapCache = displayImageOptions.getReusedBitmapCache();
        this.isCacheBigPhoto = displayImageOptions.isCacheBigPhoto();
        this.isLoadFromBigPhotoCache = displayImageOptions.isLoadFromBigPhotoCache();
        this.considerFileLength = displayImageOptions.isConsiderFileLength();
        this.fileLength = displayImageOptions.getFileLength();
    }

    public ImageDecodingInfo(String str, String str2, String str3, ImageSize imageSize, ViewScaleType viewScaleType2, ImageDownloader imageDownloader, DisplayImageOptions displayImageOptions, RectF rectF) {
        this.imageKey = str;
        this.imageUri = str2;
        this.originalImageUri = str3;
        this.targetSize = imageSize;
        this.imageScaleType = displayImageOptions.getImageScaleType();
        this.viewScaleType = viewScaleType2;
        this.downloader = imageDownloader;
        this.extraForDownloader = displayImageOptions.getExtraForDownloader();
        this.considerExifParams = displayImageOptions.isConsiderExifParams();
        copyOptions(displayImageOptions.getDecodingOptions(), this.decodingOptions);
        this.regionDecodeRect = rectF;
        this.isRegionDecodeFace = displayImageOptions.usingRegionDecoderFace();
        this.isSecretImage = displayImageOptions.isSecretImage();
        this.secretKey = displayImageOptions.getSecretKey();
        this.inBitmapCache = displayImageOptions.getReusedBitmapCache();
        this.isCacheBigPhoto = displayImageOptions.isCacheBigPhoto();
        this.isLoadFromBigPhotoCache = displayImageOptions.isLoadFromBigPhotoCache();
        this.considerFileLength = displayImageOptions.isConsiderFileLength();
        this.fileLength = displayImageOptions.getFileLength();
    }

    private void copyOptions(Options options, Options options2) {
        options2.inDensity = options.inDensity;
        options2.inDither = options.inDither;
        options2.inInputShareable = options.inInputShareable;
        options2.inJustDecodeBounds = options.inJustDecodeBounds;
        options2.inPreferredConfig = options.inPreferredConfig;
        options2.inPurgeable = options.inPurgeable;
        options2.inSampleSize = options.inSampleSize;
        options2.inScaled = options.inScaled;
        options2.inScreenDensity = options.inScreenDensity;
        options2.inTargetDensity = options.inTargetDensity;
        options2.inTempStorage = options.inTempStorage;
        if (VERSION.SDK_INT >= 10) {
            copyOptions10(options, options2);
        }
        if (VERSION.SDK_INT >= 11) {
            copyOptions11(options, options2);
        }
    }

    @TargetApi(10)
    private void copyOptions10(Options options, Options options2) {
        options2.inPreferQualityOverSpeed = options.inPreferQualityOverSpeed;
    }

    @TargetApi(11)
    private void copyOptions11(Options options, Options options2) {
        options2.inBitmap = options.inBitmap;
        options2.inMutable = options.inMutable;
    }

    public Options getDecodingOptions() {
        return this.decodingOptions;
    }

    public ImageDownloader getDownloader() {
        return this.downloader;
    }

    public ExtraInfo getExtraForDownloader() {
        return this.extraForDownloader;
    }

    public long getFileLength() {
        return this.fileLength;
    }

    public String getImageKey() {
        return this.imageKey;
    }

    public ImageScaleType getImageScaleType() {
        return this.imageScaleType;
    }

    public String getImageUri() {
        return this.imageUri;
    }

    public ReusedBitmapCache getInBitmapCache() {
        return this.inBitmapCache;
    }

    public RectF getRegionDecodeRect() {
        return this.regionDecodeRect;
    }

    public byte[] getSecretKey() {
        return this.secretKey;
    }

    public ImageSize getTargetSize() {
        return this.targetSize;
    }

    public ViewScaleType getViewScaleType() {
        return this.viewScaleType;
    }

    public boolean isCacheBigPhoto() {
        return this.isCacheBigPhoto;
    }

    public boolean isConsiderFileLength() {
        return this.considerFileLength;
    }

    public boolean isLoadFromBigPhotoCache() {
        return this.isLoadFromBigPhotoCache;
    }

    public boolean isRegionDecodeFace() {
        return this.isRegionDecodeFace;
    }

    public boolean isSecretImage() {
        return this.isSecretImage;
    }

    public boolean shouldConsiderExifParams() {
        return this.considerExifParams;
    }
}
