package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.imageloader.GalleryImageLoaderCache;
import com.miui.gallery.imageloader.GalleryImageLoaderCache.IMicroThumbCache;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.uil.LoadMonitor;
import com.nostra13.universalimageloader.cache.memory.BaseMemoryCache;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.imageaware.NonViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;
import com.nostra13.universalimageloader.utils.ImageSizeUtils;
import com.nostra13.universalimageloader.utils.L;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

public class ImageLoader {
    public static final String TAG = "ImageLoader";
    private static volatile ImageLoader instance;
    private static Initializer sInitializer;
    /* access modifiers changed from: private */
    public ImageLoaderConfiguration configuration;
    private ImageLoadingListener defaultListener = new SimpleImageLoadingListener();
    private ImageLoaderEngine engine;
    private int mPageUsedCount = 0;

    public static abstract class Initializer {
        private ImageLoader mImageLoader;

        /* access modifiers changed from: private */
        public final ImageLoader initialize() {
            long currentTimeMillis = System.currentTimeMillis();
            synchronized (this) {
                if (this.mImageLoader == null) {
                    try {
                        wait();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            Log.d(ImageLoader.TAG, "wait for initialize ImageLoader cost: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            return this.mImageLoader;
        }

        /* access modifiers changed from: protected */
        public abstract ImageLoaderConfiguration getConfig();

        public final void preInitialize() {
            synchronized (this) {
                ImageLoader imageLoader = new ImageLoader();
                imageLoader.init(getConfig());
                this.mImageLoader = imageLoader;
                notifyAll();
            }
        }
    }

    private static class SyncImageLoadingListener extends SimpleImageLoadingListener {
        private Bitmap loadedImage;

        private SyncImageLoadingListener() {
        }

        public Bitmap getLoadedBitmap() {
            return this.loadedImage;
        }

        public void onLoadingComplete(String str, View view, Bitmap bitmap) {
            this.loadedImage = bitmap;
        }
    }

    protected ImageLoader() {
    }

    private void checkConfiguration() {
        if (this.configuration == null) {
            throw new IllegalStateException("ImageLoader must be init with configuration before using");
        }
    }

    private static Handler defineHandler(DisplayImageOptions displayImageOptions) {
        Handler handler = displayImageOptions.getHandler();
        if (displayImageOptions.isSyncLoading()) {
            return null;
        }
        return (handler == null && Looper.myLooper() == Looper.getMainLooper()) ? new Handler() : handler;
    }

    public static ImageLoader getInstance() {
        if (instance == null) {
            synchronized (ImageLoader.class) {
                if (instance == null) {
                    if (sInitializer == null) {
                        instance = new ImageLoader();
                    } else {
                        instance = sInitializer.initialize();
                        sInitializer = null;
                    }
                }
            }
        }
        return instance;
    }

    private static void runTask(Runnable runnable, DisplayImageOptions displayImageOptions) {
        if (displayImageOptions.isSyncLoading() || displayImageOptions.getHandler() == null) {
            runnable.run();
        } else {
            displayImageOptions.getHandler().post(runnable);
        }
    }

    public static void setInitializer(Initializer initializer) {
        sInitializer = initializer;
    }

    public void cancelDisplayTask(ImageView imageView) {
        this.engine.cancelDisplayTaskFor(new ImageViewAware(imageView));
    }

    public void cancelDisplayTask(ImageAware imageAware) {
        this.engine.cancelDisplayTaskFor(imageAware);
    }

    public void clearHardMemoryCache() {
        checkConfiguration();
        MemoryCache memoryCache = this.configuration.memoryCache;
        if (memoryCache instanceof BaseMemoryCache) {
            ((BaseMemoryCache) memoryCache).clear(true);
        } else {
            memoryCache.clear();
        }
        MemoryCache memoryCache2 = this.configuration.subMemoryCache;
        if (memoryCache2 == null) {
            return;
        }
        if (memoryCache2 instanceof BaseMemoryCache) {
            ((BaseMemoryCache) memoryCache2).clear(true);
        } else {
            memoryCache2.clear();
        }
    }

    public ImageAware createImageAware(String str, ImageSize imageSize) {
        if (imageSize == null) {
            imageSize = this.configuration.getMaxImageSize();
        }
        return new NonViewAware(str, imageSize, ViewScaleType.CROP);
    }

    public ImageAware createImageAware(String str, ImageSize imageSize, ViewScaleType viewScaleType) {
        if (imageSize == null) {
            imageSize = this.configuration.getMaxImageSize();
        }
        return new NonViewAware(str, imageSize, viewScaleType);
    }

    public void displayImage(String str, ImageView imageView) {
        displayImage(str, (ImageAware) new ImageViewAware(imageView), (DisplayImageOptions) null, (ImageLoadingListener) null, (ImageLoadingProgressListener) null);
    }

    public void displayImage(String str, ImageView imageView, DisplayImageOptions displayImageOptions) {
        displayImage(str, (ImageAware) new ImageViewAware(imageView), displayImageOptions, (ImageLoadingListener) null, (ImageLoadingProgressListener) null);
    }

    public void displayImage(String str, ImageView imageView, DisplayImageOptions displayImageOptions, ImageSize imageSize, RectF rectF) {
        displayImage(str, new ImageViewAware(imageView), displayImageOptions, imageSize, null, null, rectF);
    }

    public void displayImage(String str, ImageView imageView, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener) {
        displayImage(str, imageView, displayImageOptions, imageLoadingListener, (ImageLoadingProgressListener) null);
    }

    public void displayImage(String str, ImageView imageView, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        displayImage(str, (ImageAware) new ImageViewAware(imageView), displayImageOptions, imageLoadingListener, imageLoadingProgressListener);
    }

    public void displayImage(String str, ImageAware imageAware, DisplayImageOptions displayImageOptions) {
        displayImage(str, imageAware, displayImageOptions, (ImageLoadingListener) null, (ImageLoadingProgressListener) null);
    }

    public void displayImage(String str, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        displayImage(str, imageAware, displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener, null);
    }

    public void displayImage(String str, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageSize imageSize, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener, RectF rectF) {
        Bitmap bitmap;
        final String str2 = str;
        final ImageAware imageAware2 = imageAware;
        checkConfiguration();
        if (imageAware2 != null) {
            final ImageLoadingListener imageLoadingListener2 = imageLoadingListener == null ? this.defaultListener : imageLoadingListener;
            DisplayImageOptions displayImageOptions2 = displayImageOptions == null ? this.configuration.defaultDisplayImageOptions : displayImageOptions;
            if (TextUtils.isEmpty(str)) {
                this.engine.cancelDisplayTaskFor(imageAware2);
                final ImageLoadingListener imageLoadingListener3 = imageLoadingListener2;
                final String str3 = str;
                final ImageAware imageAware3 = imageAware;
                final DisplayImageOptions displayImageOptions3 = displayImageOptions2;
                AnonymousClass1 r0 = new Runnable() {
                    public void run() {
                        imageLoadingListener3.onLoadingStarted(str3, imageAware3.getWrappedView());
                        if (displayImageOptions3.shouldShowImageForEmptyUri()) {
                            imageAware3.setImageDrawable(displayImageOptions3.getImageForEmptyUri(ImageLoader.this.configuration.resources));
                        } else {
                            imageAware3.setImageDrawable(null);
                        }
                        imageLoadingListener3.onLoadingComplete(str3, imageAware3.getWrappedView(), null);
                    }
                };
                runTask(r0, displayImageOptions2);
                return;
            }
            ImageSize defineTargetSizeForView = imageSize == null ? ImageSizeUtils.defineTargetSizeForView(imageAware2, this.configuration.getMaxImageSize()) : imageSize;
            String loadingUriForView = this.engine.getLoadingUriForView(imageAware2);
            String generateKey = MemoryCacheUtils.generateKey(str2, defineTargetSizeForView, rectF, displayImageOptions2);
            this.engine.prepareDisplayTaskFor(imageAware2, generateKey);
            runTask(new Runnable() {
                public void run() {
                    imageLoadingListener2.onLoadingStarted(str2, imageAware2.getWrappedView());
                }
            }, displayImageOptions2);
            Bitmap bitmap2 = null;
            if (displayImageOptions2.isCacheInMemory() || displayImageOptions2.isCacheInSubMemory()) {
                bitmap = this.configuration.memoryCache.get(generateKey);
                if ((bitmap == null || bitmap.isRecycled()) && this.configuration.subMemoryCache != null) {
                    bitmap = this.configuration.subMemoryCache.get(generateKey);
                }
            } else {
                bitmap = null;
            }
            if (bitmap == null || bitmap.isRecycled()) {
                if (displayImageOptions2.isBitmapReused()) {
                    if (this.configuration.memoryCache != null) {
                        this.configuration.memoryCache.remove(loadingUriForView);
                    }
                    if (this.configuration.subMemoryCache != null) {
                        this.configuration.subMemoryCache.remove(loadingUriForView);
                    }
                }
                if (displayImageOptions2.isPreferSyncLoadFromMicroCache() && LoadMonitor.isSyncLoadMicro() && displayImageOptions2.isLoadFromMicroCache()) {
                    IMicroThumbCache microThumbCache = GalleryImageLoaderCache.getInstance().getMicroThumbCache();
                    if (microThumbCache != null) {
                        if (displayImageOptions2.isBitmapReused() && !getInstance().isOnImageLoadingBitmap(displayImageOptions2, imageAware.getBitmap())) {
                            bitmap2 = imageAware.getBitmap();
                        }
                        bitmap = microThumbCache.getCenterCropBitmap(generateKey, bitmap2);
                    } else {
                        L.e(TAG, "The MicroThumbCache is null, should not happen");
                    }
                    if (bitmap != null) {
                        if (displayImageOptions2.isCacheInMemory()) {
                            this.configuration.memoryCache.put(generateKey, bitmap);
                        }
                        if (displayImageOptions2.isCacheInSubMemory() && this.configuration.subMemoryCache != null) {
                            this.configuration.subMemoryCache.put(generateKey, bitmap);
                        }
                    }
                }
            }
            if (LoadMonitor.isSyncLoadThumb() && displayImageOptions2.isSyncLoadFromThumbCache() && (bitmap == null || bitmap.isRecycled())) {
                bitmap = this.configuration.thumbnailCache.getBitmap(generateKey);
                if (bitmap != null) {
                    if (displayImageOptions2.isCacheInMemory()) {
                        this.configuration.memoryCache.put(generateKey, bitmap);
                    }
                    if (displayImageOptions2.isCacheInSubMemory() && this.configuration.subMemoryCache != null) {
                        this.configuration.subMemoryCache.put(generateKey, bitmap);
                    }
                }
            }
            if (bitmap == null || bitmap.isRecycled()) {
                final DisplayImageOptions displayImageOptions4 = displayImageOptions2;
                runTask(new Runnable() {
                    public void run() {
                        if (displayImageOptions4.shouldShowImageOnLoading()) {
                            imageAware2.setImageDrawable(displayImageOptions4.getImageOnLoading(ImageLoader.this.configuration.resources));
                        } else if (displayImageOptions4.isResetViewBeforeLoading()) {
                            imageAware2.setImageDrawable(null);
                        }
                    }
                }, displayImageOptions4);
                ImageLoadingInfo imageLoadingInfo = new ImageLoadingInfo(str, imageAware, defineTargetSizeForView, rectF, generateKey, displayImageOptions4, imageLoadingListener2, imageLoadingProgressListener, this.engine.getLockForUri(str2));
                LoadAndDisplayImageTask loadAndDisplayImageTask = new LoadAndDisplayImageTask(this.engine, imageLoadingInfo, defineHandler(displayImageOptions4));
                if (displayImageOptions4.isSyncLoading()) {
                    loadAndDisplayImageTask.run();
                } else {
                    this.engine.submit(loadAndDisplayImageTask);
                }
            } else {
                DisplayImageOptions displayImageOptions5 = displayImageOptions2;
                ImageLoadingInfo imageLoadingInfo2 = new ImageLoadingInfo(str, imageAware, defineTargetSizeForView, generateKey, displayImageOptions2, imageLoadingListener2, imageLoadingProgressListener, this.engine.getLockForUri(str2));
                if (displayImageOptions5.shouldPostProcess()) {
                    ProcessAndDisplayImageTask processAndDisplayImageTask = new ProcessAndDisplayImageTask(this.engine, bitmap, imageLoadingInfo2, defineHandler(displayImageOptions5));
                    if (displayImageOptions5.isSyncLoading()) {
                        processAndDisplayImageTask.run();
                    } else {
                        this.engine.submit(processAndDisplayImageTask);
                    }
                } else {
                    runTask(new DisplayBitmapTask(bitmap, imageLoadingInfo2, this.engine, LoadedFrom.MEMORY_CACHE), displayImageOptions5);
                }
            }
            return;
        }
        throw new IllegalArgumentException("Wrong arguments were passed to displayImage() method (ImageView reference must not be null)");
    }

    public void displayImage(String str, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener) {
        displayImage(str, imageAware, displayImageOptions, imageLoadingListener, (ImageLoadingProgressListener) null);
    }

    public void displayImage(String str, ImageAware imageAware, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        displayImage(str, imageAware, displayImageOptions, null, imageLoadingListener, imageLoadingProgressListener);
    }

    public MemoryCache getMemoryCache() {
        checkConfiguration();
        return this.configuration.memoryCache;
    }

    public synchronized void init(ImageLoaderConfiguration imageLoaderConfiguration) {
        if (imageLoaderConfiguration == null) {
            throw new IllegalArgumentException("ImageLoader configuration can not be initialized with null");
        } else if (this.configuration == null) {
            L.d("Initialize ImageLoader with configuration", new Object[0]);
            this.engine = new ImageLoaderEngine(imageLoaderConfiguration);
            this.configuration = imageLoaderConfiguration;
        } else {
            L.w("Try to initialize ImageLoader which had already been initialized before. To re-init ImageLoader with new configuration call ImageLoader.destroy() at first.", new Object[0]);
        }
    }

    public boolean isOnImageLoadingBitmap(DisplayImageOptions displayImageOptions, Bitmap bitmap) {
        boolean z = false;
        if (bitmap != null) {
            Drawable imageOnLoading = displayImageOptions.getImageOnLoading(this.configuration.resources);
            if (imageOnLoading != null && (imageOnLoading instanceof BitmapDrawable)) {
                if (bitmap == ((BitmapDrawable) imageOnLoading).getBitmap()) {
                    z = true;
                }
                return z;
            }
        }
        return false;
    }

    public Bitmap loadFromMemoryCache(String str) {
        checkConfiguration();
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        Bitmap bitmap = this.configuration.memoryCache.get(str);
        if (bitmap == null && this.configuration.subMemoryCache != null) {
            bitmap = this.configuration.subMemoryCache.get(str);
        }
        return bitmap;
    }

    public Bitmap loadFromMemoryCache(String str, ImageSize imageSize, RectF rectF, DisplayImageOptions displayImageOptions) {
        checkConfiguration();
        if (TextUtils.isEmpty(str) || imageSize == null) {
            return null;
        }
        return loadFromMemoryCache(MemoryCacheUtils.generateKey(str, imageSize, rectF, displayImageOptions));
    }

    public void loadImage(String str, ImageSize imageSize, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener) {
        loadImage(str, imageSize, displayImageOptions, imageLoadingListener, null);
    }

    public void loadImage(String str, ImageSize imageSize, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener) {
        loadImage(str, imageSize, displayImageOptions, imageLoadingListener, imageLoadingProgressListener, null);
    }

    public void loadImage(String str, ImageSize imageSize, DisplayImageOptions displayImageOptions, ImageLoadingListener imageLoadingListener, ImageLoadingProgressListener imageLoadingProgressListener, RectF rectF) {
        checkConfiguration();
        if (displayImageOptions == null) {
            displayImageOptions = this.configuration.defaultDisplayImageOptions;
        }
        String str2 = str;
        displayImage(str2, createImageAware(str, imageSize), displayImageOptions, imageSize, imageLoadingListener, imageLoadingProgressListener, rectF);
    }

    public void loadImage(String str, ImageLoadingListener imageLoadingListener) {
        loadImage(str, null, null, imageLoadingListener, null);
    }

    public Bitmap loadImageSync(String str) {
        return loadImageSync(str, null, null);
    }

    public Bitmap loadImageSync(String str, DisplayImageOptions displayImageOptions) {
        return loadImageSync(str, null, displayImageOptions);
    }

    public Bitmap loadImageSync(String str, ImageSize imageSize, DisplayImageOptions displayImageOptions) {
        if (displayImageOptions == null) {
            displayImageOptions = this.configuration.defaultDisplayImageOptions;
        }
        DisplayImageOptions build = new Builder().cloneFrom(displayImageOptions).syncLoading(true).build();
        SyncImageLoadingListener syncImageLoadingListener = new SyncImageLoadingListener();
        loadImage(str, imageSize, build, syncImageLoadingListener);
        return syncImageLoadingListener.getLoadedBitmap();
    }

    public void onPagePause() {
        this.mPageUsedCount--;
        if (this.mPageUsedCount <= 0) {
            pause();
            this.mPageUsedCount = 0;
        }
    }

    public void onPageResume() {
        this.mPageUsedCount++;
        resume();
    }

    public void pause() {
        this.engine.pause();
        Log.d(TAG, "paused");
    }

    public void referenceToMemoryCache(String str, Bitmap bitmap) {
        if (bitmap != null) {
            MemoryCache memoryCache = getMemoryCache();
            if (memoryCache instanceof BaseMemoryCache) {
                ((BaseMemoryCache) memoryCache).reference(str, bitmap);
            }
        }
    }

    public void resume() {
        this.engine.resume();
        Log.d(TAG, "resumed");
    }

    public void waitLockForUri(String str, long j, TimeUnit timeUnit) {
        if (str != null) {
            long currentTimeMillis = System.currentTimeMillis();
            ReentrantLock lockForUri = this.engine.getLockForUri(str);
            try {
                if (lockForUri.tryLock(j, timeUnit)) {
                    lockForUri.unlock();
                }
            } catch (Exception unused) {
            }
            StringBuilder sb = new StringBuilder();
            sb.append("waitLockForUri cost:");
            sb.append(System.currentTimeMillis() - currentTimeMillis);
            L.d(sb.toString(), new Object[0]);
        }
    }
}
