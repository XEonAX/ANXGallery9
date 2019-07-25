package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.os.Handler;
import com.miui.gallery.imageloader.GalleryImageLoaderCache;
import com.miui.gallery.imageloader.GalleryImageLoaderCache.IMicroThumbCache;
import com.miui.gallery.imageloader.ImageLoaderSamplingStatHelper;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.FailReason.FailType;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.decode.ImageDecoder;
import com.nostra13.universalimageloader.core.decode.ImageDecodingInfo;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import com.nostra13.universalimageloader.utils.L;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import miui.graphics.BitmapFactory;

final class LoadAndDisplayImageTask implements CopyListener, Runnable {
    /* access modifiers changed from: private */
    public final ImageLoaderConfiguration configuration;
    private final ImageDecoder decoder;
    private final ImageDownloader downloader;
    private final ImageLoaderEngine engine;
    private final Handler handler;
    final ImageAware imageAware;
    private final ImageLoadingInfo imageLoadingInfo;
    final ImageLoadingListener listener;
    private LoadedFrom loadedFrom = LoadedFrom.NETWORK;
    private final String memoryCacheKey;
    private final ImageDownloader networkDeniedDownloader;
    final DisplayImageOptions options;
    final ImageLoadingProgressListener progressListener;
    private final ImageDownloader slowNetworkDownloader;
    private final boolean syncLoading;
    private final ImageSize targetSize;
    final String uri;

    class TaskCancelledException extends Exception {
        TaskCancelledException() {
        }
    }

    public LoadAndDisplayImageTask(ImageLoaderEngine imageLoaderEngine, ImageLoadingInfo imageLoadingInfo2, Handler handler2) {
        this.engine = imageLoaderEngine;
        this.imageLoadingInfo = imageLoadingInfo2;
        this.handler = handler2;
        this.configuration = imageLoaderEngine.configuration;
        this.downloader = this.configuration.downloader;
        this.networkDeniedDownloader = this.configuration.networkDeniedDownloader;
        this.slowNetworkDownloader = this.configuration.slowNetworkDownloader;
        this.decoder = this.configuration.decoder;
        this.uri = imageLoadingInfo2.uri;
        this.memoryCacheKey = imageLoadingInfo2.memoryCacheKey;
        this.imageAware = imageLoadingInfo2.imageAware;
        this.targetSize = imageLoadingInfo2.targetSize;
        this.options = imageLoadingInfo2.options;
        this.listener = imageLoadingInfo2.listener;
        this.progressListener = imageLoadingInfo2.progressListener;
        this.syncLoading = this.options.isSyncLoading();
    }

    private void cacheImageThumbnail(Bitmap bitmap) {
        if (bitmap != null && !bitmap.isRecycled()) {
            L.d("Cache image's thumbnail [%s]", this.memoryCacheKey);
            try {
                this.configuration.thumbnailCache.save(this.memoryCacheKey, bitmap);
            } catch (Exception e) {
                L.e(e);
            }
        }
    }

    private void checkTaskInterrupted() throws TaskCancelledException {
        if (isTaskInterrupted()) {
            throw new TaskCancelledException();
        }
    }

    private void checkTaskNotActual() throws TaskCancelledException {
        checkViewCollected();
        checkViewReused();
    }

    private void checkViewCollected() throws TaskCancelledException {
        if (isViewCollected()) {
            throw new TaskCancelledException();
        }
    }

    private void checkViewReused() throws TaskCancelledException {
        if (isViewReused()) {
            throw new TaskCancelledException();
        }
    }

    private Bitmap decodeImage(String str) throws IOException {
        String str2 = str;
        ImageDecodingInfo imageDecodingInfo = new ImageDecodingInfo(this.memoryCacheKey, str2, this.uri, this.targetSize, this.imageAware.getScaleType(), getDownloader(), this.options, this.imageLoadingInfo.regionDecodeRect);
        Bitmap decode = this.decoder.decode(imageDecodingInfo);
        if (decode == null || this.options.getBlurRadius() <= 0) {
            return decode;
        }
        Bitmap fastBlur = BitmapFactory.fastBlur(decode, this.options.getBlurRadius());
        if (decode != fastBlur) {
            if (this.options.getReusedBitmapCache() != null) {
                this.options.getReusedBitmapCache().put(decode);
            } else {
                decode.recycle();
            }
        }
        return fastBlur;
    }

    private boolean delayIfNeed() {
        if (!this.options.shouldDelayBeforeLoading()) {
            return false;
        }
        L.d("Delay %d ms before loading...  [%s]", Integer.valueOf(this.options.getDelayBeforeLoading()), this.memoryCacheKey);
        try {
            Thread.sleep((long) this.options.getDelayBeforeLoading());
            return isTaskNotActual();
        } catch (InterruptedException unused) {
            L.e("Task was interrupted [%s]", this.memoryCacheKey);
            return true;
        }
    }

    private boolean downloadImage() throws IOException {
        InputStream stream = getDownloader().getStream(this.uri, this.options.getExtraForDownloader());
        if (stream == null) {
            L.e("No stream for image [%s]", this.memoryCacheKey);
            return false;
        }
        try {
            return this.configuration.diskCache.save(this.uri, stream, this);
        } finally {
            IoUtils.closeSilently(stream);
        }
    }

    private void fireCancelEvent() {
        L.d("Cancel loading image %s", this.uri);
        if (!this.syncLoading && !isTaskInterrupted()) {
            runTask(new Runnable() {
                public void run() {
                    LoadAndDisplayImageTask.this.listener.onLoadingCancelled(LoadAndDisplayImageTask.this.uri, LoadAndDisplayImageTask.this.imageAware.getWrappedView());
                }
            }, false, this.handler, this.engine);
        }
    }

    private void fireFailEvent(FailType failType, Throwable th) {
        L.e(th, "Loading image failed, fail Type %s, uri %s", failType, this.uri);
        fireFailEventNoLog(failType, th);
    }

    private void fireFailEventNoLog(final FailType failType, final Throwable th) {
        if (!this.syncLoading && !isTaskInterrupted() && !isTaskNotActual()) {
            runTask(new Runnable() {
                public void run() {
                    if (LoadAndDisplayImageTask.this.options.shouldShowImageOnFail()) {
                        LoadAndDisplayImageTask.this.imageAware.setImageDrawable(LoadAndDisplayImageTask.this.options.getImageOnFail(LoadAndDisplayImageTask.this.configuration.resources));
                    }
                    LoadAndDisplayImageTask.this.listener.onLoadingFailed(LoadAndDisplayImageTask.this.uri, LoadAndDisplayImageTask.this.imageAware.getWrappedView(), new FailReason(failType, th));
                }
            }, false, this.handler, this.engine);
        }
    }

    private boolean fireProgressEvent(final int i, final int i2) {
        if (isTaskInterrupted() || isTaskNotActual()) {
            return false;
        }
        if (this.progressListener != null) {
            runTask(new Runnable() {
                public void run() {
                    LoadAndDisplayImageTask.this.progressListener.onProgressUpdate(LoadAndDisplayImageTask.this.uri, LoadAndDisplayImageTask.this.imageAware.getWrappedView(), i, i2);
                }
            }, false, this.handler, this.engine);
        }
        return true;
    }

    private ImageDownloader getDownloader() {
        return this.engine.isNetworkDenied() ? this.networkDeniedDownloader : this.engine.isSlowNetwork() ? this.slowNetworkDownloader : this.downloader;
    }

    private boolean isTaskInterrupted() {
        if (!Thread.interrupted()) {
            return false;
        }
        L.d("Task was interrupted [%s]", this.memoryCacheKey);
        return true;
    }

    private boolean isTaskNotActual() {
        return isViewCollected() || isViewReused();
    }

    private boolean isViewCollected() {
        if (!this.imageAware.isCollected()) {
            return false;
        }
        L.d("ImageAware was collected by GC. Task is cancelled. [%s]", this.memoryCacheKey);
        return true;
    }

    private boolean isViewReused() {
        if (!(!this.memoryCacheKey.equals(this.engine.getLoadingUriForView(this.imageAware)))) {
            return false;
        }
        L.d("ImageAware is reused for another image. Task is cancelled. [%s]", this.memoryCacheKey);
        return true;
    }

    private void recordDecodeError(Throwable th) {
        if (!this.options.isCacheBigPhoto()) {
            Map generatorCommonParams = ImageLoaderSamplingStatHelper.generatorCommonParams();
            generatorCommonParams.put("uri", this.uri);
            generatorCommonParams.put("exception", th != null ? th.toString() : "unknow");
            ImageLoaderSamplingStatHelper.recordErrorEvent("pager_decode_bitmap", "pager_photo_decode_error", generatorCommonParams);
        }
    }

    private boolean resizeAndSaveImage(int i, int i2) throws IOException {
        File file = this.configuration.diskCache.get(this.uri);
        if (file == null || !file.exists()) {
            return false;
        }
        ImageDecodingInfo imageDecodingInfo = new ImageDecodingInfo(this.memoryCacheKey, Scheme.FILE.wrap(file.getAbsolutePath()), this.uri, new ImageSize(i, i2), ViewScaleType.FIT_INSIDE, getDownloader(), new Builder().cloneFrom(this.options).imageScaleType(ImageScaleType.IN_SAMPLE_INT).build());
        Bitmap decode = this.decoder.decode(imageDecodingInfo);
        if (!(decode == null || this.configuration.processorForDiskCache == null)) {
            L.d("Process image before cache on disk [%s]", this.memoryCacheKey);
            decode = this.configuration.processorForDiskCache.process(decode);
            if (decode == null) {
                L.e("Bitmap processor for disk cache returned null [%s]", this.memoryCacheKey);
            }
        }
        if (decode == null) {
            return false;
        }
        boolean save = this.configuration.diskCache.save(this.uri, decode);
        decode.recycle();
        return save;
    }

    static void runTask(Runnable runnable, boolean z, Handler handler2, ImageLoaderEngine imageLoaderEngine) {
        if (z) {
            runnable.run();
        } else if (handler2 == null) {
            imageLoaderEngine.fireCallback(runnable);
        } else {
            handler2.post(runnable);
        }
    }

    private boolean tryCacheImageOnDisk() throws TaskCancelledException {
        L.d("Cache image on disk [%s]", this.memoryCacheKey);
        try {
            boolean downloadImage = downloadImage();
            if (!downloadImage) {
                return downloadImage;
            }
            int i = this.configuration.maxImageWidthForDiskCache;
            int i2 = this.configuration.maxImageHeightForDiskCache;
            if (i <= 0 && i2 <= 0) {
                return downloadImage;
            }
            L.d("Resize image in disk cache [%s]", this.memoryCacheKey);
            resizeAndSaveImage(i, i2);
            return downloadImage;
        } catch (IOException e) {
            L.e(e);
            return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00ad, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00ae, code lost:
        r0 = r1;
        r1 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00b1, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00b2, code lost:
        r0 = r1;
        r1 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00b5, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00b6, code lost:
        r0 = r1;
        r1 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00b9, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00ba, code lost:
        r0 = r1;
        r1 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00bd, code lost:
        r1 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00c7, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00c8, code lost:
        r9 = r1;
        r1 = null;
        r0 = r9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00d7, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x00d8, code lost:
        r9 = r1;
        r1 = null;
        r0 = r9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00e7, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00e8, code lost:
        r9 = r1;
        r1 = null;
        r0 = r9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x00f7, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x00f8, code lost:
        r9 = r1;
        r1 = null;
        r0 = r9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0103, code lost:
        recordDecodeError(r0);
        com.nostra13.universalimageloader.utils.L.e(r0);
        fireFailEvent(com.nostra13.universalimageloader.core.assist.FailReason.FailType.IO_ERROR, r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x010f, code lost:
        fireFailEventNoLog(com.nostra13.universalimageloader.core.assist.FailReason.FailType.IO_ERROR, r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0115, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0116, code lost:
        throw r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x0117, code lost:
        r1 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x0118, code lost:
        r2 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:?, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:?, code lost:
        return r1;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0103  */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x010f  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0115 A[ExcHandler: TaskCancelledException (r0v1 'e' com.nostra13.universalimageloader.core.LoadAndDisplayImageTask$TaskCancelledException A[CUSTOM_DECLARE]), Splitter:B:1:0x0001] */
    private Bitmap tryLoadBitmap() throws TaskCancelledException {
        Bitmap bitmap;
        Bitmap bitmap2;
        try {
            File file = this.configuration.diskCache.get(this.uri);
            if (file == null || !file.exists() || file.length() <= 0) {
                bitmap2 = null;
            } else {
                L.d("Load image from disk cache [%s]", this.memoryCacheKey);
                this.loadedFrom = LoadedFrom.DISC_CACHE;
                checkTaskNotActual();
                bitmap2 = decodeImage(Scheme.FILE.wrap(file.getAbsolutePath()));
            }
            if (bitmap2 != null) {
                if (bitmap2.getWidth() > 0) {
                    if (bitmap2.getHeight() > 0) {
                        return bitmap2;
                    }
                }
            }
            L.d("Load image from network [%s]", this.memoryCacheKey);
            this.loadedFrom = LoadedFrom.NETWORK;
            String str = this.uri;
            if (this.options.isCacheOnDisk() && tryCacheImageOnDisk()) {
                File file2 = this.configuration.diskCache.get(this.uri);
                if (file2 != null) {
                    str = Scheme.FILE.wrap(file2.getAbsolutePath());
                }
            }
            checkTaskNotActual();
            bitmap = decodeImage(str);
            if (bitmap != null) {
                if (bitmap.getWidth() > 0) {
                    if (bitmap.getHeight() <= 0) {
                    }
                    return bitmap;
                }
            }
            fireFailEvent(FailType.DECODING_ERROR, null);
        } catch (IllegalStateException e) {
            Throwable th = e;
            bitmap = bitmap2;
            e = th;
            recordDecodeError(e);
            fireFailEvent(FailType.NETWORK_DENIED, null);
            return bitmap;
        } catch (TaskCancelledException e2) {
        } catch (FileNotFoundException e3) {
            Throwable e4 = e3;
            if (this.options.isCacheBigPhoto()) {
            }
        } catch (IOException e5) {
            Throwable e6 = e5;
            recordDecodeError(e6);
            L.e(e6);
            fireFailEvent(FailType.IO_ERROR, e6);
            return bitmap2;
        } catch (OutOfMemoryError e7) {
            Throwable e8 = e7;
            recordDecodeError(e8);
            L.e(e8);
            fireFailEvent(FailType.OUT_OF_MEMORY, e8);
            return bitmap2;
        } catch (Exception e9) {
            Throwable e10 = e9;
            recordDecodeError(e10);
            L.e(e10);
            fireFailEvent(FailType.UNKNOWN, e10);
            return bitmap2;
        }
        return bitmap;
    }

    private Bitmap tryLoadThumbnail() throws TaskCancelledException {
        checkTaskNotActual();
        return this.configuration.thumbnailCache.getBitmap(this.memoryCacheKey);
    }

    private boolean waitIfPaused() {
        AtomicBoolean pause = this.engine.getPause();
        if (pause.get()) {
            synchronized (this.engine.getPauseLock()) {
                if (pause.get()) {
                    L.d("ImageLoader is paused. Waiting...  [%s]", this.memoryCacheKey);
                    try {
                        this.engine.getPauseLock().wait();
                        L.d(".. Resume loading [%s]", this.memoryCacheKey);
                    } catch (InterruptedException unused) {
                        L.e("Task was interrupted [%s]", this.memoryCacheKey);
                        return true;
                    }
                }
            }
        }
        return isTaskNotActual();
    }

    /* access modifiers changed from: 0000 */
    public String getLoadingUri() {
        return this.uri;
    }

    public boolean onBytesCopied(int i, int i2) {
        return this.syncLoading || fireProgressEvent(i, i2);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:109:0x023d, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:111:?, code lost:
        fireCancelEvent();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:113:0x0245, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:114:0x0246, code lost:
        r0.unlock();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:115:0x0249, code lost:
        throw r1;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:110:0x023f */
    /* JADX WARNING: Removed duplicated region for block: B:103:0x020f A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:107:0x0239  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0069 A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x008c A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00a7 A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00d5 A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x0124 A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x0159 A[Catch:{ TaskCancelledException -> 0x023f }] */
    /* JADX WARNING: Removed duplicated region for block: B:96:0x01de A[Catch:{ TaskCancelledException -> 0x023f }] */
    public void run() {
        boolean z;
        Bitmap bitmap;
        boolean z2;
        IMicroThumbCache microThumbCache;
        if (this.options.isHighPriority()) {
            Thread.currentThread().setPriority(5);
        } else {
            Thread.currentThread().setPriority(this.configuration.threadPriority);
        }
        if (!waitIfPaused() && !delayIfNeed()) {
            ReentrantLock reentrantLock = this.imageLoadingInfo.loadFromUriLock;
            L.d("Start display image task [%s]", this.memoryCacheKey);
            if (reentrantLock.isLocked()) {
                L.d("Image already is loading. Waiting... [%s]", this.memoryCacheKey);
            }
            reentrantLock.lock();
            checkTaskNotActual();
            if (!this.options.isCacheInMemory()) {
                if (!this.options.isCacheInSubMemory()) {
                    z = false;
                    Bitmap bitmap2 = null;
                    if (!z) {
                        bitmap = this.configuration.memoryCache.get(this.memoryCacheKey);
                        if ((bitmap == null || bitmap.isRecycled()) && this.configuration.subMemoryCache != null) {
                            bitmap = this.configuration.subMemoryCache.get(this.memoryCacheKey);
                        }
                    } else {
                        bitmap = null;
                    }
                    if ((bitmap == null || bitmap.isRecycled()) && this.options.isLoadFromMicroCache()) {
                        microThumbCache = GalleryImageLoaderCache.getInstance().getMicroThumbCache();
                        if (microThumbCache != null) {
                            if (this.options.isBitmapReused() && !ImageLoader.getInstance().isOnImageLoadingBitmap(this.options, this.imageAware.getBitmap())) {
                                bitmap2 = this.imageAware.getBitmap();
                            }
                            bitmap = microThumbCache.getCenterCropBitmap(this.memoryCacheKey, bitmap2);
                        }
                        checkTaskNotActual();
                        checkTaskInterrupted();
                        if (bitmap != null) {
                            if (this.options.isCacheInMemory()) {
                                L.d("Cache image in memory [%s]", this.memoryCacheKey);
                                this.configuration.memoryCache.put(this.memoryCacheKey, bitmap);
                            }
                            if (this.options.isCacheInSubMemory() && this.configuration.subMemoryCache != null) {
                                this.configuration.subMemoryCache.put(this.memoryCacheKey, bitmap);
                            }
                        }
                    }
                    if ((bitmap == null || bitmap.isRecycled()) && this.options.isLoadFromThumbnailCache()) {
                        bitmap = tryLoadThumbnail();
                        checkTaskNotActual();
                        checkTaskInterrupted();
                        if (bitmap != null) {
                            if (this.options.isCacheInMemory()) {
                                L.d("Cache image in memory [%s]", this.memoryCacheKey);
                                this.configuration.memoryCache.put(this.memoryCacheKey, bitmap);
                            }
                            if (this.options.isCacheInSubMemory() && this.configuration.subMemoryCache != null) {
                                this.configuration.subMemoryCache.put(this.memoryCacheKey, bitmap);
                            }
                        }
                    }
                    if (bitmap != null) {
                        Bitmap tryLoadBitmap = tryLoadBitmap();
                        if (tryLoadBitmap == null) {
                            reentrantLock.unlock();
                            return;
                        }
                        checkTaskNotActual();
                        checkTaskInterrupted();
                        if (this.options.shouldPreProcess()) {
                            L.d("PreProcess image before caching in memory [%s]", this.memoryCacheKey);
                            tryLoadBitmap = this.options.getPreProcessor().process(tryLoadBitmap);
                            if (tryLoadBitmap == null) {
                                L.e("Pre-processor returned null [%s]", this.memoryCacheKey);
                            }
                        }
                        if (bitmap != null) {
                            if (this.options.isCacheInMemory()) {
                                L.d("Cache image in memory [%s]", this.memoryCacheKey);
                                this.configuration.memoryCache.put(this.memoryCacheKey, bitmap);
                            }
                            if (this.options.isCacheInSubMemory() && this.configuration.subMemoryCache != null) {
                                this.configuration.subMemoryCache.put(this.memoryCacheKey, bitmap);
                            }
                        }
                        if (this.options.isCacheThumbnail()) {
                            if (this.options.isDelayCacheThumbnail()) {
                                z2 = true;
                                if (bitmap != null && this.options.shouldPostProcess()) {
                                    L.d("PostProcess image before displaying [%s]", this.memoryCacheKey);
                                    bitmap = this.options.getPostProcessor().process(bitmap);
                                    if (bitmap == null) {
                                        L.e("Post-processor returned null [%s]", this.memoryCacheKey);
                                    }
                                }
                                checkTaskNotActual();
                                checkTaskInterrupted();
                                reentrantLock.unlock();
                                runTask(new DisplayBitmapTask(bitmap, this.imageLoadingInfo, this.engine, this.loadedFrom), this.syncLoading, this.handler, this.engine);
                                if (z2) {
                                    cacheImageThumbnail(bitmap);
                                }
                            }
                            cacheImageThumbnail(bitmap);
                        }
                    } else {
                        this.loadedFrom = LoadedFrom.MEMORY_CACHE;
                        L.d("...Get cached bitmap from memory after waiting. [%s]", this.memoryCacheKey);
                    }
                    z2 = false;
                    L.d("PostProcess image before displaying [%s]", this.memoryCacheKey);
                    bitmap = this.options.getPostProcessor().process(bitmap);
                    if (bitmap == null) {
                    }
                    checkTaskNotActual();
                    checkTaskInterrupted();
                    reentrantLock.unlock();
                    runTask(new DisplayBitmapTask(bitmap, this.imageLoadingInfo, this.engine, this.loadedFrom), this.syncLoading, this.handler, this.engine);
                    if (z2) {
                    }
                }
            }
            z = true;
            Bitmap bitmap22 = null;
            if (!z) {
            }
            microThumbCache = GalleryImageLoaderCache.getInstance().getMicroThumbCache();
            if (microThumbCache != null) {
            }
            checkTaskNotActual();
            checkTaskInterrupted();
            if (bitmap != null) {
            }
            bitmap = tryLoadThumbnail();
            checkTaskNotActual();
            checkTaskInterrupted();
            if (bitmap != null) {
            }
            if (bitmap != null) {
            }
            z2 = false;
            L.d("PostProcess image before displaying [%s]", this.memoryCacheKey);
            bitmap = this.options.getPostProcessor().process(bitmap);
            if (bitmap == null) {
            }
            checkTaskNotActual();
            checkTaskInterrupted();
            reentrantLock.unlock();
            runTask(new DisplayBitmapTask(bitmap, this.imageLoadingInfo, this.engine, this.loadedFrom), this.syncLoading, this.handler, this.engine);
            if (z2) {
            }
        }
    }
}
