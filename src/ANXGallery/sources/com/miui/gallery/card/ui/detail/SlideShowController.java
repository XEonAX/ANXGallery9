package com.miui.gallery.card.ui.detail;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils;
import com.miui.gallery.card.model.BaseMedia;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.SlideShowView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class SlideShowController {
    /* access modifiers changed from: private */
    public final BlockingQueue<ShowItem> mCacheQueue = new LinkedBlockingQueue(2);
    /* access modifiers changed from: private */
    public final int mDuration;
    private Future mGetFuture;
    /* access modifiers changed from: private */
    public final Handler mHandler = new Handler(new Callback() {
        public boolean handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    ShowItem showItem = message.obj == null ? null : (ShowItem) message.obj;
                    if (showItem != null) {
                        SlideShowController.this.mSlideShowView.next(showItem.getBitmap(), 0);
                        SlideShowController.this.mHandler.sendEmptyMessageDelayed(2, (long) SlideShowController.this.mDuration);
                        break;
                    }
                    break;
                case 2:
                    SlideShowController.this.loadNextBitmap();
                    break;
            }
            return true;
        }
    });
    private Future mLoadFuture;
    /* access modifiers changed from: private */
    public int mLoadIndex;
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    private final List<BaseMedia> mMediaInfos;
    /* access modifiers changed from: private */
    public int mShowIndex;
    /* access modifiers changed from: private */
    public final SlideShowView mSlideShowView;

    private class GetJob implements Job<ShowItem> {
        private GetJob() {
        }

        public ShowItem run(JobContext jobContext) {
            ShowItem showItem = null;
            while (!jobContext.isCancelled() && showItem == null) {
                try {
                    showItem = (ShowItem) SlideShowController.this.mCacheQueue.poll(1000, TimeUnit.MILLISECONDS);
                } catch (InterruptedException e) {
                    Log.i("SlideShowController", "poll interrupted, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
                    e.printStackTrace();
                }
                if (showItem == null) {
                    synchronized (SlideShowController.this.mLock) {
                        if (SlideShowController.this.mLoadIndex >= SlideShowController.this.getCount()) {
                            return null;
                        }
                    }
                }
            }
            Log.i("SlideShowController", "getJob cancelled, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
            if (showItem != null) {
                SlideShowController.this.mShowIndex = showItem.getIndex();
            }
            return showItem;
        }
    }

    private class LoadItem {
        /* access modifiers changed from: private */
        public final int mIndex;
        /* access modifiers changed from: private */
        public final String mUri;

        public LoadItem(String str, int i) {
            this.mUri = str;
            this.mIndex = i;
        }
    }

    private class LoadJob implements Job<Void> {
        private final DisplayImageOptions mDisplayOptions = this.mDisplayOptionsBuilder.build();
        private final Builder mDisplayOptionsBuilder = new Builder().syncLoading(true).considerExifParams(true).resetViewBeforeLoading(false).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565);

        LoadJob() {
        }

        private DisplayImageOptions getDisplayOptions(LoadItem loadItem) {
            return this.mDisplayOptions;
        }

        public Void run(JobContext jobContext) {
            boolean z;
            InterruptedException e;
            while (!jobContext.isCancelled()) {
                LoadItem access$900 = SlideShowController.this.getLoadItem();
                if (access$900 == null) {
                    break;
                }
                Bitmap loadImageSync = ImageLoader.getInstance().loadImageSync(access$900.mUri, getDisplayOptions(access$900));
                if (loadImageSync != null && !loadImageSync.isRecycled()) {
                    ShowItem showItem = new ShowItem(loadImageSync, access$900.mIndex);
                    boolean z2 = false;
                    while (!jobContext.isCancelled() && !z2) {
                        try {
                            z = SlideShowController.this.mCacheQueue.offer(showItem, 1000, TimeUnit.MILLISECONDS);
                            try {
                                if (jobContext.isCancelled() && z) {
                                    Log.d("SlideShowController", "Load cancel,remove from mCacheQueue ");
                                    SlideShowController.this.mCacheQueue.remove(showItem);
                                }
                            } catch (InterruptedException e2) {
                                e = e2;
                                Log.i("SlideShowController", "offer interrupted, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
                                e.printStackTrace();
                                z2 = z;
                            }
                        } catch (InterruptedException e3) {
                            InterruptedException interruptedException = e3;
                            z = z2;
                            e = interruptedException;
                            Log.i("SlideShowController", "offer interrupted, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
                            e.printStackTrace();
                            z2 = z;
                        }
                        z2 = z;
                    }
                    if (!z2) {
                        Log.i("SlideShowController", "not offered, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
                        SlideShowController.this.decreaseLoadIndex();
                    }
                }
            }
            Log.i("SlideShowController", "loadJob cancelled, curSize %d", (Object) Integer.valueOf(SlideShowController.this.mCacheQueue.size()));
            return null;
        }
    }

    public static class ShowItem {
        private final Bitmap mBit;
        private final int mIndex;

        public ShowItem(Bitmap bitmap, int i) {
            this.mBit = bitmap;
            this.mIndex = i;
        }

        public Bitmap getBitmap() {
            return this.mBit;
        }

        public int getIndex() {
            return this.mIndex;
        }
    }

    SlideShowController(SlideShowView slideShowView, int i) {
        this.mSlideShowView = slideShowView;
        this.mSlideShowView.setScaleOnlyMode(true);
        this.mMediaInfos = new ArrayList();
        this.mDuration = i;
    }

    private void cancelGet() {
        if (this.mGetFuture != null) {
            this.mGetFuture.cancel();
            this.mGetFuture = null;
        }
    }

    private void cancelLoad() {
        if (this.mLoadFuture != null) {
            this.mLoadFuture.cancel();
            this.mLoadFuture = null;
        }
    }

    /* access modifiers changed from: private */
    public void decreaseLoadIndex() {
        synchronized (this.mLock) {
            int size = this.mMediaInfos.size();
            if (size > 0) {
                this.mLoadIndex--;
                if (this.mLoadIndex <= 0) {
                    this.mLoadIndex = size - 1;
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public LoadItem getLoadItem() {
        synchronized (this.mLock) {
            if (this.mLoadIndex < 0) {
                this.mLoadIndex = 0;
            }
            while (this.mLoadIndex >= 0 && this.mLoadIndex < this.mMediaInfos.size()) {
                BaseMedia baseMedia = (BaseMedia) this.mMediaInfos.get(this.mLoadIndex);
                if (baseMedia != null) {
                    String uri = baseMedia.getUri();
                    if (!TextUtils.isEmpty(uri)) {
                        if (Scheme.ofUri(uri) == Scheme.UNKNOWN) {
                            uri = Scheme.FILE.wrap(uri);
                        }
                        LoadItem loadItem = new LoadItem(uri, this.mLoadIndex);
                        increaseLoadIndex();
                        return loadItem;
                    }
                }
                increaseLoadIndex();
            }
            return null;
        }
    }

    private void increaseLoadIndex() {
        synchronized (this.mLock) {
            int size = this.mMediaInfos.size();
            if (size > 0) {
                this.mLoadIndex++;
                if (this.mLoadIndex == size) {
                    this.mLoadIndex %= size;
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void loadNextBitmap() {
        nextBitmap(new FutureListener<ShowItem>() {
            public void onFutureDone(Future<ShowItem> future) {
                if (!future.isCancelled()) {
                    ShowItem showItem = (ShowItem) future.get();
                    if (showItem != null) {
                        SlideShowController.this.mHandler.obtainMessage(1, showItem).sendToTarget();
                    }
                }
            }
        });
    }

    private void startLoad() {
        cancelLoad();
        this.mLoadFuture = ThreadManager.getMiscPool().submit(new LoadJob());
    }

    public int getCount() {
        return this.mMediaInfos.size();
    }

    public void nextBitmap(FutureListener<ShowItem> futureListener) {
        cancelGet();
        this.mGetFuture = ThreadManager.getMiscPool().submit(new GetJob(), futureListener);
    }

    public void pause() {
        cancelLoad();
        cancelGet();
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(1);
        this.mSlideShowView.release();
    }

    public void resume() {
        startLoad();
        loadNextBitmap();
    }

    public void updateMedias(List<? extends BaseMedia> list) {
        if (MiscUtil.isValid(list)) {
            boolean z = true;
            if (this.mMediaInfos.isEmpty()) {
                synchronized (this.mLock) {
                    this.mMediaInfos.addAll(list);
                    this.mLoadIndex = 0;
                }
                cancelLoad();
                SlideShowView slideShowView = this.mSlideShowView;
                if (list.size() <= 1) {
                    z = false;
                }
                slideShowView.setSlideAnimEnable(z);
                startLoad();
            } else if (this.mMediaInfos.size() != list.size()) {
                pause();
                synchronized (this.mLock) {
                    this.mMediaInfos.clear();
                    this.mMediaInfos.addAll(list);
                    this.mLoadIndex = 0;
                }
                SlideShowView slideShowView2 = this.mSlideShowView;
                if (list.size() <= 1) {
                    z = false;
                }
                slideShowView2.setSlideAnimEnable(z);
                this.mCacheQueue.clear();
                resume();
            }
        }
    }
}
