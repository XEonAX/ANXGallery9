package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.miui.gallery.Config.BigPhotoConfig;
import com.miui.gallery.Config.TileConfig;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFile;
import com.miui.gallery.util.photoview.BitmapRecycleCallback;
import com.miui.gallery.util.photoview.TileBitProvider;
import com.miui.gallery.util.photoview.TileBitProviderRegion;
import com.miui.gallery.util.photoview.TileReusedBitCache;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import java.util.HashMap;
import java.util.Locale;

public class PhotoPageImageBaseItem extends PhotoPageItem {
    protected static BitmapRecycleCallback sBitmapRecycleCallback;
    protected boolean mIsImageFirstDisplay = true;
    protected volatile boolean mIsSupportRegion = true;
    protected RegionDecoderManager mRegionManager;

    private class ImageDownloadManager extends DownloadManager {
        private ImageDownloadManager() {
            super();
        }

        /* access modifiers changed from: protected */
        public void doOnDownloaded(DownloadType downloadType, String str) {
            super.doOnDownloaded(downloadType, str);
            if (!PhotoPageImageBaseItem.this.isPagerSelected()) {
                return;
            }
            if (CloudImageLoader.getInstance().isOrigin(downloadType)) {
                PhotoPageImageBaseItem.this.mRegionManager.onSelected();
            } else {
                PhotoPageImageBaseItem.this.mRegionManager.onSelected();
            }
        }

        /* access modifiers changed from: protected */
        public void doOnLoaded(DownloadType downloadType, Bitmap bitmap) {
            super.doOnLoaded(downloadType, bitmap);
        }
    }

    protected class RegionDecoderManager implements FutureListener<TileBitProvider> {
        /* access modifiers changed from: private */
        public TileBitProvider mDecoderProvider;
        /* access modifiers changed from: private */
        public String mFileKey;
        private Future mRegionCreateFuture;

        private class RegionCreateJob implements Job<TileBitProvider> {
            private String mLocalPath;
            private byte[] mSecretKey;

            public RegionCreateJob(String str, byte[] bArr) {
                this.mLocalPath = str;
                this.mSecretKey = bArr;
            }

            public TileBitProvider run(JobContext jobContext) {
                if (FileUtils.isFileExist(this.mLocalPath) && !jobContext.isCancelled()) {
                    Options options = new Options();
                    options.inJustDecodeBounds = true;
                    BitmapUtils.safeDecodeBitmap(this.mLocalPath, options, this.mSecretKey);
                    if (!TileConfig.needUseTile(options.outWidth, options.outHeight)) {
                        Log.i("PhotoPageImageBaseItem", "not need use tile [width %d, height %d]", Integer.valueOf(options.outWidth), Integer.valueOf(options.outHeight));
                    } else if (!jobContext.isCancelled()) {
                        TileBitProviderRegion tileBitProviderRegion = new TileBitProviderRegion(this.mLocalPath, this.mSecretKey);
                        if (jobContext.isCancelled()) {
                            tileBitProviderRegion.release();
                            RegionDecoderManager.this.mFileKey = null;
                        } else {
                            RegionDecoderManager.this.mFileKey = RegionDecoderManager.this.genFileKey(this.mLocalPath, FileUtils.getFileSize(this.mLocalPath));
                            return tileBitProviderRegion;
                        }
                    }
                }
                return null;
            }
        }

        private class RegionReleaseJob implements Job<Void> {
            private TileBitProvider mToBeReleasedProvider;

            public RegionReleaseJob(TileBitProvider tileBitProvider) {
                this.mToBeReleasedProvider = tileBitProvider;
            }

            public Void run(JobContext jobContext) {
                this.mToBeReleasedProvider.release();
                Log.i("PhotoPageImageBaseItem", "release region");
                this.mToBeReleasedProvider = null;
                return null;
            }
        }

        protected RegionDecoderManager() {
        }

        private boolean canSupportRegion() {
            return PhotoPageImageBaseItem.this.mIsSupportRegion && PhotoPageImageBaseItem.this.mDataItem != null && FileMimeUtil.isImageFromMimeType(PhotoPageImageBaseItem.this.mDataItem.getMimeType()) && !FileMimeUtil.isGifFromMimeType(PhotoPageImageBaseItem.this.mDataItem.getMimeType());
        }

        /* access modifiers changed from: private */
        public void create() {
            release();
            if (canSupportRegion()) {
                this.mRegionCreateFuture = ThreadManager.getMiscPool().submit(new RegionCreateJob(PhotoPageImageBaseItem.this.mDataItem.getPathDisplayBetter(), PhotoPageImageBaseItem.this.mDataItem.getSecretKey()), this);
            }
        }

        /* access modifiers changed from: private */
        public String genFileKey(String str, long j) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            return String.format(Locale.US, "%s_%d", new Object[]{str, Long.valueOf(j)});
        }

        private boolean isFileChanged() {
            boolean z = true;
            if (PhotoPageImageBaseItem.this.mDataItem == null) {
                return true;
            }
            String pathDisplayBetter = PhotoPageImageBaseItem.this.mDataItem.getPathDisplayBetter();
            long displayBetterFileSize = PhotoPageImageBaseItem.this.mDataItem.getDisplayBetterFileSize();
            if (!TextUtils.isEmpty(pathDisplayBetter) && TextUtils.equals(genFileKey(pathDisplayBetter, displayBetterFileSize), this.mFileKey)) {
                z = false;
            }
            return z;
        }

        /* access modifiers changed from: private */
        public void release() {
            if (this.mRegionCreateFuture != null) {
                this.mRegionCreateFuture.cancel();
                this.mRegionCreateFuture = null;
            }
            if (this.mDecoderProvider != null) {
                ThreadManager.getMiscPool().submit(new RegionReleaseJob(this.mDecoderProvider));
                this.mDecoderProvider = null;
            }
            PhotoPageImageBaseItem.this.mPhotoView.releaseTile();
        }

        public void onFutureDone(final Future<TileBitProvider> future) {
            final TileBitProvider tileBitProvider = (TileBitProvider) future.get();
            if (tileBitProvider == null) {
                return;
            }
            if (tileBitProvider.getImageWidth() > 0) {
                PhotoPageImageBaseItem.this.mIsSupportRegion = true;
                PhotoPageImageBaseItem.this.post(new Runnable() {
                    public void run() {
                        if (!PhotoPageImageBaseItem.this.isPagerSelected() || future.isCancelled()) {
                            tileBitProvider.release();
                            return;
                        }
                        Log.i("PhotoPageImageBaseItem", "setup region");
                        RegionDecoderManager.this.mDecoderProvider = tileBitProvider;
                        PhotoPageImageBaseItem.this.mPhotoView.setupTile(tileBitProvider, PhotoPageImageBaseItem.getBitmapRecycleCallback(), PhotoPageImageBaseItem.this.getTrimMemoryCallback());
                    }
                });
                return;
            }
            PhotoPageImageBaseItem.this.mIsSupportRegion = false;
            String originalPath = PhotoPageImageBaseItem.this.mDataItem != null ? PhotoPageImageBaseItem.this.mDataItem.getOriginalPath() : null;
            if (!TextUtils.isEmpty(originalPath)) {
                Log.w("PhotoPageImageBaseItem", "not support region %s", MediaFile.getMimeTypeForFile(originalPath));
                ImageLoader.getInstance().cancelDisplayTask((ImageView) PhotoPageImageBaseItem.this.mPhotoView);
                PhotoPageImageBaseItem.this.post(new Runnable() {
                    public void run() {
                        PhotoPageImageBaseItem.this.displayImage(PhotoPageImageBaseItem.this.mDataItem);
                    }
                });
                HashMap hashMap = new HashMap();
                hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, MediaFile.getMimeTypeForFile(originalPath));
                GallerySamplingStatHelper.recordCountEvent("photo", "photo_not_support_region", hashMap);
            }
        }

        public void onSelected() {
            create();
        }

        public void onUnSelected() {
            release();
        }

        public void resetRegionDecoderIfNeeded() {
            if (isFileChanged()) {
                PhotoPageImageBaseItem.this.post(new Runnable() {
                    public void run() {
                        RegionDecoderManager.this.create();
                    }
                });
            }
        }
    }

    public PhotoPageImageBaseItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: private */
    public static BitmapRecycleCallback getBitmapRecycleCallback() {
        if (sBitmapRecycleCallback == null) {
            sBitmapRecycleCallback = new BitmapRecycleCallback() {
                public void recycle(Bitmap bitmap) {
                    TileReusedBitCache.getInstance().put(bitmap);
                }
            };
        }
        return sBitmapRecycleCallback;
    }

    /* access modifiers changed from: protected */
    public DownloadManager createDownloadManager() {
        return new ImageDownloadManager();
    }

    /* access modifiers changed from: protected */
    public void displayImage(String str, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        this.mPhotoView.setRegionDecodeEnable(false);
        ImageLoader.getInstance().displayImage(str, new ImageViewAware(this.mPhotoView), displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener);
        if (isPagerSelected() && !this.mIsImageFirstDisplay) {
            this.mRegionManager.resetRegionDecoderIfNeeded();
        }
        this.mIsImageFirstDisplay = false;
    }

    /* access modifiers changed from: protected */
    public void doOnSelected(boolean z, boolean z2, boolean z3) {
        super.doOnSelected(z, z2, z3);
        this.mRegionManager.onSelected();
    }

    /* access modifiers changed from: protected */
    public void doOnUnSelected(boolean z) {
        super.doOnUnSelected(z);
        this.mRegionManager.onUnSelected();
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptions(BaseDataItem baseDataItem, boolean z) {
        DisplayImageOptions displayImageOptions = super.getDisplayImageOptions(baseDataItem, z);
        if (!this.mIsSupportRegion) {
            displayImageOptions = new Builder().cloneFrom(displayImageOptions).cacheBigPhoto(false).imageScaleType(ImageScaleType.NONE_SAFE).build();
        }
        return (z || !isMediaInProcessing()) ? displayImageOptions : BigPhotoConfig.appendBlurOptions(displayImageOptions);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        this.mRegionManager.release();
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mRegionManager = new RegionDecoderManager();
    }

    /* access modifiers changed from: protected */
    public void onImageLoadFinish(ErrorCode errorCode) {
        super.onImageLoadFinish(errorCode);
        this.mPhotoView.setRegionDecodeEnable(!isMediaInProcessing());
    }

    public void swapItem(BaseDataItem baseDataItem) {
        if (baseDataItem == null || !baseDataItem.equals(this.mDataItem)) {
            this.mIsImageFirstDisplay = true;
            this.mIsSupportRegion = true;
        }
        super.swapItem(baseDataItem);
    }
}
