package com.miui.gallery;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.uil.ImageDecoderSupportRegion;
import com.miui.gallery.util.uil.PhotoReusedBitCache;
import com.miui.gallery.util.uil.ThumbnailDiskCache;
import com.miui.os.Rom;
import com.nostra13.universalimageloader.cache.memory.impl.FIFOLimitedMemoryCache;
import com.nostra13.universalimageloader.cache.memory.impl.LRULimitedMemoryCache;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.QueueProcessingType;
import com.nostra13.universalimageloader.core.download.ExtraInfo;
import java.io.File;

public class Config {

    public static class BigPhotoConfig {
        public static final DisplayImageOptions BIG_PHOTO_DISPLAY_IMAGE_OPTIONS_DEFAULT = new Builder().resetViewBeforeLoading(false).considerExifParams(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(getBitmapConfig()).reusedBitmapCache(PhotoReusedBitCache.getInstance()).cacheBigPhoto(true).build();
        public static final ImageSize BIG_PHOTO_SIZE_DEFAULT = null;

        public static DisplayImageOptions appendBlurOptions(DisplayImageOptions displayImageOptions) {
            return new Builder().cloneFrom(displayImageOptions).bitmapConfig(android.graphics.Bitmap.Config.ARGB_8888).loadFromThumbnailCache(false).cacheThumbnail(false).cacheBigPhoto(false).blurRadius(getBlurRadius()).build();
        }

        public static android.graphics.Bitmap.Config getBitmapConfig() {
            return android.graphics.Bitmap.Config.ARGB_8888;
        }

        private static int getBlurRadius() {
            return 3;
        }

        public static String getCacheDir() {
            return StorageUtils.getCacheDirectory();
        }
    }

    public static class ImageDownload {
        public static boolean requireWLAN(DownloadType downloadType) {
            return downloadType == DownloadType.ORIGIN || downloadType == DownloadType.ORIGIN_BATCH || downloadType == DownloadType.THUMBNAIL_BATCH;
        }
    }

    public static class ImageLoaderConfig {
        public static ImageLoaderConfiguration getConfig(Context context) {
            ThumbnailDiskCache thumbnailDiskCache = new ThumbnailDiskCache(ThumbConfig.getDiskCacheDir(), 15000, 1610612736);
            boolean z = Rom.IS_ALPHA || Rom.IS_DEV;
            ImageLoaderConfiguration.Builder imageDecoder = new ImageLoaderConfiguration.Builder(context).thumbnailCache(thumbnailDiskCache).diskCacheSize(31457280).memoryCache(new LRULimitedMemoryCache(ThumbConfig.get().sImageMemoryCache)).subMemoryCache(new FIFOLimitedMemoryCache(ThumbConfig.get().sImagePreloadMemoryCache)).threadPoolSize(4).threadPriority(4).tasksProcessingOrder(QueueProcessingType.FIFO).imageDecoder(new ImageDecoderSupportRegion(z));
            if (z) {
                imageDecoder.writeDebugLogs();
            }
            return imageDecoder.build();
        }
    }

    public static class SecretAlbumConfig {
        public static long getSupportedSpecialTypeFlags(long j) {
            return j & 0;
        }

        public static boolean isVideoSupported() {
            return !Rom.IS_INTERNATIONAL || CloudControlStrategyHelper.isGlobalSecretVideoSupported();
        }
    }

    public static class ShareAlbumConfig {
        public static long getSupportedSpecialTypeFlags(long j) {
            return j & 0;
        }
    }

    public static class ThumbConfig {
        public static final DisplayImageOptions THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT = new Builder().loadFromThumbnailCache(true).cacheThumbnail(true).loadOriginScaleThumbnail(true).considerExifParams(true).bitmapConfig(android.graphics.Bitmap.Config.RGB_565).build();
        private static ThumbConfig sInstance;
        private static final boolean sUseHighQuality;
        public final DisplayImageOptions MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT;
        public final ImageSize sAlbumHeaderThumbTargetSize;
        public final int sImageMemoryCache;
        public final int sImagePreloadMemoryCache;
        public final ImageSize sMicroHorizontalDocumentTargetSize;
        public final int sMicroPanoColumns = 1;
        public final ImageSize sMicroPanoTargetSize;
        public final ImageSize sMicroRecentTargetSize;
        public final ImageSize sMicroScreenshotTargetSize;
        public final ImageSize sMicroTargetSize;
        public final int sMicroThumbColumnsLand;
        public final int sMicroThumbColumnsPortrait;
        public final int sMicroThumbHorizontalDocumentColumns = 2;
        public final int sMicroThumbRecentColumnsLand;
        public final int sMicroThumbRecentColumnsPortrait;
        public final int sMicroThumbScreenshotColumnsLand;
        public final int sMicroThumbScreenshotColumnsPortrait;
        public final int sPreloadNum;

        static {
            boolean z = false;
            for (String equalsIgnoreCase : new String[]{"cepheus"}) {
                if (equalsIgnoreCase.equalsIgnoreCase(Build.DEVICE)) {
                    z = true;
                }
            }
            sUseHighQuality = z;
        }

        private ThumbConfig() {
            Resources resources = GalleryApp.sGetAndroidContext().getResources();
            int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.micro_thumb_horizontal_spacing);
            int screenWidth = ScreenConfig.getScreenWidth();
            int screenHeight = ScreenConfig.getScreenHeight();
            this.sMicroThumbColumnsPortrait = resources.getInteger(R.integer.thumbnail_columns);
            this.sMicroThumbColumnsLand = resources.getInteger(R.integer.thumbnail_columns_land);
            int min = (Math.min(screenWidth, screenHeight) - (dimensionPixelOffset * (this.sMicroThumbColumnsPortrait - 1))) / Math.min(this.sMicroThumbColumnsPortrait, this.sMicroThumbColumnsLand);
            this.sMicroTargetSize = new ImageSize(min, min);
            this.sMicroRecentTargetSize = new ImageSize(min, min);
            int min2 = Math.min(screenWidth, screenHeight) / resources.getInteger(R.integer.album_page_header_columns);
            double d = (double) min2;
            Double.isNaN(d);
            this.sAlbumHeaderThumbTargetSize = new ImageSize(min2, (int) (d / 1.5d));
            this.sMicroThumbRecentColumnsPortrait = resources.getInteger(R.integer.thumbnail_recent_columns);
            this.sMicroThumbRecentColumnsLand = resources.getInteger(R.integer.thumbnail_recent_columns_land);
            this.sMicroThumbScreenshotColumnsPortrait = resources.getInteger(R.integer.thumbnail_screenshot_columns);
            this.sMicroThumbScreenshotColumnsLand = resources.getInteger(R.integer.thumbnail_screenshot_columns_land);
            this.sMicroScreenshotTargetSize = new ImageSize(resources.getDimensionPixelSize(R.dimen.micro_screenshot_thumbnail_width), resources.getDimensionPixelSize(R.dimen.micro_screenshot_thumbnail_height));
            int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.micro_pano_thumbnail_width);
            int dimensionPixelSize2 = resources.getDimensionPixelSize(R.dimen.micro_pano_thumbnail_height);
            this.sMicroPanoTargetSize = new ImageSize(dimensionPixelSize, dimensionPixelSize2);
            int dimensionPixelSize3 = resources.getDimensionPixelSize(R.dimen.micro_horizontal_document_thumbnail_width);
            if (BuildUtil.isXiaoMi()) {
                dimensionPixelSize3 = Math.min(ScreenConfig.getScreenWidth(), ScreenConfig.getScreenHeight()) / 2;
                dimensionPixelSize2 = (resources.getInteger(R.integer.micro_horizontal_document_item_height_scale) * dimensionPixelSize3) / resources.getInteger(R.integer.micro_horizontal_document_item_width_scale);
            }
            this.sMicroHorizontalDocumentTargetSize = new ImageSize(dimensionPixelSize3, dimensionPixelSize2);
            short configSize = BitmapUtils.getConfigSize(getThumbConfig());
            this.sImageMemoryCache = Math.max(screenWidth * screenHeight * configSize, 5242880);
            this.sImagePreloadMemoryCache = (int) (((float) this.sImageMemoryCache) * 0.6f);
            this.sPreloadNum = Math.max((int) ((((float) this.sImagePreloadMemoryCache) * 0.8f) / ((float) ((min * min) * configSize))), 0);
            Drawable drawable = StaticContext.sGetAndroidContext().getDrawable(R.drawable.image_default_cover);
            Bitmap createBitmap = Bitmap.createBitmap(min, min, android.graphics.Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(createBitmap);
            drawable.setBounds(0, 0, min, min);
            drawable.draw(canvas);
            this.MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT = new Builder().cacheThumbnail(true).cacheInMemory(true).loadFromMicroCache(true).considerExifParams(true).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(getThumbConfig()).showImageOnLoading((Drawable) new BitmapDrawable(StaticContext.sGetAndroidContext().getResources(), createBitmap)).extraForDownloader(new ExtraInfo.Builder().requestThumbnail(true).build()).build();
        }

        public static DisplayImageOptions appendBlurOptions(DisplayImageOptions displayImageOptions) {
            return new Builder().cloneFrom(displayImageOptions).bitmapConfig(android.graphics.Bitmap.Config.ARGB_8888).loadFromThumbnailCache(true).cacheThumbnail(true).cacheInMemory(true).blurRadius(getBlurRadius()).build();
        }

        public static synchronized ThumbConfig get() {
            ThumbConfig thumbConfig;
            synchronized (ThumbConfig.class) {
                if (sInstance == null) {
                    sInstance = new ThumbConfig();
                }
                thumbConfig = sInstance;
            }
            return thumbConfig;
        }

        private static int getBlurRadius() {
            return 3;
        }

        public static File getDiskCacheDir() {
            return new File(StorageUtils.getCacheDirectory());
        }

        public static android.graphics.Bitmap.Config getThumbConfig() {
            return sUseHighQuality ? android.graphics.Bitmap.Config.ARGB_8888 : android.graphics.Bitmap.Config.RGB_565;
        }
    }

    public static class TileConfig {
        private static int sCacheCount = 12;

        public static android.graphics.Bitmap.Config getBitmapConfig() {
            return android.graphics.Bitmap.Config.ARGB_8888;
        }

        public static int getMaxCacheCount() {
            return sCacheCount;
        }

        public static boolean needUseTile(int i, int i2) {
            return ((float) Math.max(i, i2)) > ((float) Math.min(ScreenConfig.getScreenWidth(), ScreenConfig.getScreenHeight())) * 1.0f;
        }
    }
}
