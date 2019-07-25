package com.miui.gallery.search.core.display.icon;

import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.widget.ImageView;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.provider.cache.SearchIconItem;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.search.core.Consumer;
import com.miui.gallery.search.core.context.SearchContext;
import com.miui.gallery.search.core.display.icon.IconLoaderTask.IconLoaderResult;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.face.FaceRegionRectF;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.lang.ref.WeakReference;
import java.util.Objects;

public class IconImageLoader {
    private static final UriMatcher sURIMatcher = new UriMatcher(-1);
    private Cache<String, SearchIconItem> mMemoryCache;

    private static class IconLoaderHolder implements Consumer<IconLoaderResult> {
        private DisplayImageOptions mDisplayImageOptions;
        private ImageSize mImageSize;
        private DownloadType mImageType;
        private IconLoaderResult mLastResult;
        private IconLoaderResult mResult;
        private IconLoaderTask mTask;
        private Uri mUri;
        private WeakReference<ImageView> mViewRef;

        public static IconLoaderHolder getImageHolder(ImageView imageView) {
            Object tag = imageView.getTag(R.id.tag_icon_loader_holder);
            if (tag == null) {
                tag = new IconLoaderHolder();
                imageView.setTag(R.id.tag_icon_loader_holder, tag);
            }
            return (IconLoaderHolder) tag;
        }

        public boolean consume(IconLoaderResult iconLoaderResult) {
            this.mLastResult = this.mResult;
            if (iconLoaderResult == null) {
                this.mResult = null;
                this.mTask = null;
            } else if (iconLoaderResult.isValid() && iconLoaderResult.iconUri.equals(this.mUri)) {
                SearchLog.d("IconImageLoader", "Load task finished for uri %s, result is valid %s", this.mUri, Boolean.valueOf(iconLoaderResult.isValid()));
                this.mResult = iconLoaderResult;
            }
            if (!Objects.equals(this.mLastResult, this.mResult)) {
                displayResult();
            }
            if (this.mTask == null || iconLoaderResult == null || !iconLoaderResult.isFromUnreliableCache()) {
                this.mTask = null;
            } else {
                IconLoaderTask iconLoaderTask = new IconLoaderTask(GalleryApp.sGetAndroidContext(), this.mUri, this, ThreadManager.getMainHandler(), false, true, true);
                this.mTask = iconLoaderTask;
                IconImageLoader.submitTask(this.mTask);
            }
            return true;
        }

        public void displayResult() {
            if (getImageView() == null) {
                return;
            }
            if (this.mResult != null) {
                BindImageHelper.bindImage(this.mResult.localFilePath, this.mResult.downloadUri, this.mImageType, getImageView(), this.mDisplayImageOptions, this.mImageSize, this.mResult.facePositionRect);
            } else {
                ImageLoader.getInstance().displayImage(null, new ImageViewAware(getImageView()), this.mDisplayImageOptions, this.mImageSize, null, null);
            }
        }

        public ImageView getImageView() {
            if (this.mViewRef != null) {
                return (ImageView) this.mViewRef.get();
            }
            return null;
        }

        public String getKey() {
            return IconImageLoader.generateKey(this.mUri, getImageView());
        }

        public IconLoaderTask getTask() {
            return this.mTask;
        }

        public boolean hasRunningTask() {
            return this.mTask != null && !this.mTask.isCancelled();
        }

        public void set(ImageView imageView, Uri uri, DownloadType downloadType, DisplayImageOptions displayImageOptions, ImageSize imageSize) {
            this.mViewRef = new WeakReference<>(imageView);
            this.mUri = uri;
            this.mDisplayImageOptions = displayImageOptions;
            this.mImageSize = imageSize;
            this.mImageType = downloadType;
            this.mResult = null;
        }

        public void setTask(IconLoaderTask iconLoaderTask) {
            this.mTask = iconLoaderTask;
        }
    }

    private static class SingletonHolder {
        static final IconImageLoader INSTANCE = new IconImageLoader();
    }

    static {
        sURIMatcher.addURI("web", null, 1);
    }

    private IconImageLoader() {
        this.mMemoryCache = CacheBuilder.newBuilder().maximumSize(100).recordStats().build();
    }

    private void cancelHolderTask(IconLoaderHolder iconLoaderHolder) {
        IconLoaderTask task = iconLoaderHolder.getTask();
        if (task != null) {
            SearchLog.d("IconImageLoader", "Cancel holder task %s", iconLoaderHolder.getKey());
            if (task.isUseDiskCache()) {
                SearchContext.getInstance().getIconLoaderCacheExecutor().cancel(task);
            } else {
                SearchContext.getInstance().getIconLoaderExecutor().cancel(task);
            }
            task.setCancelled();
            iconLoaderHolder.setTask(null);
        }
    }

    /* access modifiers changed from: private */
    public static String generateKey(Uri uri, ImageView imageView) {
        return (uri == null || imageView == null) ? "" : uri.buildUpon().appendQueryParameter("imageView", String.valueOf(imageView.hashCode())).build().toString();
    }

    public static IconImageLoader getInstance() {
        return SingletonHolder.INSTANCE;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x003a  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0053  */
    private void internalDisplayImage(Context context, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, boolean z) {
        boolean z2;
        ImageView imageView2 = imageView;
        DisplayImageOptions displayImageOptions2 = displayImageOptions;
        boolean z3 = false;
        if (uri != null) {
            if ("image".equals(uri.getScheme())) {
                z2 = true;
                if (displayImageOptions2 != null && displayImageOptions.shouldShowImageOnLoading()) {
                    imageView.setImageDrawable(displayImageOptions2.getImageOnLoading(imageView.getResources()));
                }
                if (!z3) {
                    ImageLoader.getInstance().displayImage(uri.toString(), new ImageViewAware(imageView), displayImageOptions, imageSize, null, null);
                    return;
                } else if (!z2) {
                    ImageLoader.getInstance().displayImage(null, new ImageViewAware(imageView), displayImageOptions, imageSize, null, null);
                    return;
                } else if (sURIMatcher.match(uri) == 1) {
                    ImageLoader.getInstance().displayImage(uri.getQueryParameter("url"), imageView, displayImageOptions2);
                    return;
                } else {
                    IconLoaderHolder imageHolder = IconLoaderHolder.getImageHolder(imageView);
                    if (!generateKey(uri, imageView).equals(imageHolder.getKey()) || !imageHolder.hasRunningTask()) {
                        cancelHolderTask(imageHolder);
                    } else {
                        imageHolder.displayResult();
                    }
                    imageHolder.set(imageView, uri, downloadType, displayImageOptions, imageSize);
                    SearchIconItem searchIconItem = (SearchIconItem) this.mMemoryCache.getIfPresent(uri.toString());
                    if (searchIconItem != null) {
                        Uri uri2 = null;
                        FaceRegionRectF faceRegionRectF = (searchIconItem.decodeRegionW == null || searchIconItem.decodeRegionH == null || searchIconItem.decodeRegionX == null || searchIconItem.decodeRegionY == null) ? null : new FaceRegionRectF(searchIconItem.decodeRegionX.floatValue(), searchIconItem.decodeRegionY.floatValue(), searchIconItem.decodeRegionX.floatValue() + searchIconItem.decodeRegionW.floatValue(), searchIconItem.decodeRegionY.floatValue() + searchIconItem.decodeRegionH.floatValue(), searchIconItem.decodeRegionOrientation);
                        Uri parse = searchIconItem.iconUri != null ? Uri.parse(searchIconItem.iconUri) : null;
                        String str = searchIconItem.filePath;
                        if (searchIconItem.downloadUri != null) {
                            uri2 = Uri.parse(searchIconItem.downloadUri);
                        }
                        IconLoaderResult iconLoaderResult = new IconLoaderResult(parse, str, uri2, faceRegionRectF, false);
                        imageHolder.consume(iconLoaderResult);
                        return;
                    }
                    IconLoaderTask iconLoaderTask = new IconLoaderTask(context, uri, imageHolder, ThreadManager.getMainHandler(), z, z, false);
                    imageHolder.setTask(iconLoaderTask);
                    submitTask(iconLoaderTask);
                    return;
                }
            } else if (Scheme.ofUri(uri.toString()) != Scheme.UNKNOWN) {
                z3 = true;
            }
        }
        z2 = false;
        imageView.setImageDrawable(displayImageOptions2.getImageOnLoading(imageView.getResources()));
        if (!z3) {
        }
    }

    /* access modifiers changed from: private */
    public static void submitTask(IconLoaderTask iconLoaderTask) {
        if (iconLoaderTask.isUseDiskCache()) {
            SearchContext.getInstance().getIconLoaderCacheExecutor().submit(iconLoaderTask);
        } else {
            SearchContext.getInstance().getIconLoaderExecutor().submit(iconLoaderTask);
        }
    }

    public void displayImage(Context context, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize) {
        internalDisplayImage(context, uri, downloadType, imageView, displayImageOptions, imageSize, false);
    }

    public void displayImageEager(Context context, Uri uri, DownloadType downloadType, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize) {
        internalDisplayImage(context, uri, downloadType, imageView, displayImageOptions, imageSize, true);
    }

    public Cache<String, SearchIconItem> getMemoryCache() {
        return this.mMemoryCache;
    }
}
