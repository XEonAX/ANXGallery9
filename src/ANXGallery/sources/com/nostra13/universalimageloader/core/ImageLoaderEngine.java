package com.nostra13.universalimageloader.core;

import com.miui.gallery.util.BaseFileMimeUtil;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;

class ImageLoaderEngine {
    private final Map<Integer, String> cacheKeysForImageAwares = Collections.synchronizedMap(new HashMap());
    final ImageLoaderConfiguration configuration;
    private final AtomicBoolean networkDenied = new AtomicBoolean(false);
    private final Object pauseLock = new Object();
    private final AtomicBoolean paused = new AtomicBoolean(false);
    private final AtomicBoolean slowNetwork = new AtomicBoolean(false);
    private Executor taskDistributor;
    /* access modifiers changed from: private */
    public Executor taskExecutor;
    /* access modifiers changed from: private */
    public Executor taskExecutorForCachedImages;
    /* access modifiers changed from: private */
    public Executor taskExecutorForVideo;
    private final Map<String, ReentrantLock> uriLocks = new WeakHashMap();

    ImageLoaderEngine(ImageLoaderConfiguration imageLoaderConfiguration) {
        this.configuration = imageLoaderConfiguration;
        this.taskExecutor = imageLoaderConfiguration.taskExecutor;
        this.taskExecutorForVideo = imageLoaderConfiguration.taskExecutorForVideo;
        this.taskExecutorForCachedImages = imageLoaderConfiguration.taskExecutorForCachedImages;
        this.taskDistributor = DefaultConfigurationFactory.createTaskDistributor();
    }

    private Executor createTaskExecutor() {
        return DefaultConfigurationFactory.createExecutor(this.configuration.threadPoolSize, this.configuration.threadPriority, this.configuration.tasksProcessingType);
    }

    private Executor createTaskExecutorForVideo() {
        return DefaultConfigurationFactory.createExecutor(ImageLoaderConfiguration.getThreadPoolSizeForVideo(this.configuration.threadPoolSize), this.configuration.threadPriority, this.configuration.tasksProcessingType);
    }

    /* access modifiers changed from: private */
    public void initExecutorsIfNeed() {
        if (!this.configuration.customExecutor && ((ExecutorService) this.taskExecutor).isShutdown()) {
            this.taskExecutor = createTaskExecutor();
        }
        if (!this.configuration.customVideoExecutor && ((ExecutorService) this.taskExecutorForVideo).isShutdown()) {
            this.taskExecutorForVideo = createTaskExecutorForVideo();
        }
        if (!this.configuration.customExecutorForCachedImages && ((ExecutorService) this.taskExecutorForCachedImages).isShutdown()) {
            this.taskExecutorForCachedImages = createTaskExecutor();
        }
    }

    /* access modifiers changed from: private */
    public boolean isVideoFile(String str) {
        return BaseFileMimeUtil.isVideoFromMimeType(BaseFileMimeUtil.getMimeType(str));
    }

    /* access modifiers changed from: 0000 */
    public void cancelDisplayTaskFor(ImageAware imageAware) {
        this.cacheKeysForImageAwares.remove(Integer.valueOf(imageAware.getId()));
    }

    /* access modifiers changed from: 0000 */
    public void fireCallback(Runnable runnable) {
        this.taskDistributor.execute(runnable);
    }

    /* access modifiers changed from: 0000 */
    public String getLoadingUriForView(ImageAware imageAware) {
        return (String) this.cacheKeysForImageAwares.get(Integer.valueOf(imageAware.getId()));
    }

    /* access modifiers changed from: 0000 */
    public ReentrantLock getLockForUri(String str) {
        ReentrantLock reentrantLock;
        synchronized (this.uriLocks) {
            reentrantLock = (ReentrantLock) this.uriLocks.get(str);
            if (reentrantLock == null) {
                reentrantLock = new ReentrantLock();
                this.uriLocks.put(str, reentrantLock);
            }
        }
        return reentrantLock;
    }

    /* access modifiers changed from: 0000 */
    public AtomicBoolean getPause() {
        return this.paused;
    }

    /* access modifiers changed from: 0000 */
    public Object getPauseLock() {
        return this.pauseLock;
    }

    /* access modifiers changed from: 0000 */
    public boolean isNetworkDenied() {
        return this.networkDenied.get();
    }

    /* access modifiers changed from: 0000 */
    public boolean isSlowNetwork() {
        return this.slowNetwork.get();
    }

    /* access modifiers changed from: 0000 */
    public void pause() {
        this.paused.set(true);
    }

    /* access modifiers changed from: 0000 */
    public void prepareDisplayTaskFor(ImageAware imageAware, String str) {
        this.cacheKeysForImageAwares.put(Integer.valueOf(imageAware.getId()), str);
    }

    /* access modifiers changed from: 0000 */
    public void resume() {
        this.paused.set(false);
        synchronized (this.pauseLock) {
            this.pauseLock.notifyAll();
        }
    }

    /* access modifiers changed from: 0000 */
    public void submit(final LoadAndDisplayImageTask loadAndDisplayImageTask) {
        this.taskDistributor.execute(new Runnable() {
            public void run() {
                File file = ImageLoaderEngine.this.configuration.diskCache.get(loadAndDisplayImageTask.getLoadingUri());
                boolean z = file != null && file.exists();
                ImageLoaderEngine.this.initExecutorsIfNeed();
                if (z) {
                    ImageLoaderEngine.this.taskExecutorForCachedImages.execute(loadAndDisplayImageTask);
                } else if (ImageLoaderEngine.this.isVideoFile(loadAndDisplayImageTask.getLoadingUri())) {
                    ImageLoaderEngine.this.taskExecutorForVideo.execute(loadAndDisplayImageTask);
                } else {
                    ImageLoaderEngine.this.taskExecutor.execute(loadAndDisplayImageTask);
                }
            }
        });
    }

    /* access modifiers changed from: 0000 */
    public void submit(ProcessAndDisplayImageTask processAndDisplayImageTask) {
        initExecutorsIfNeed();
        this.taskExecutorForCachedImages.execute(processAndDisplayImageTask);
    }
}
