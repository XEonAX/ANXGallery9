package com.miui.gallery.adapter;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.text.TextUtils;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class SlideShowAdapter {
    private ImageLoadParams mCacheItem;
    /* access modifiers changed from: private */
    public BlockingQueue<ShowItem> mCacheQueue = new LinkedBlockingQueue(3);
    /* access modifiers changed from: private */
    public BaseDataSet mDataSet;
    private Future mGetFuture;
    private Future mLoadFuture;
    /* access modifiers changed from: private */
    public int mLoadIndex;
    /* access modifiers changed from: private */
    public Object mLock = new Object();
    /* access modifiers changed from: private */
    public int mShowIndex;

    private class GetJob implements Job<ShowItem> {
        private GetJob() {
        }

        public ShowItem run(JobContext jobContext) {
            ShowItem showItem = null;
            while (!jobContext.isCancelled() && showItem == null) {
                try {
                    showItem = (ShowItem) SlideShowAdapter.this.mCacheQueue.poll(1000, TimeUnit.MILLISECONDS);
                } catch (InterruptedException e) {
                    Log.i("SlideShowAdapter", "poll interrupted, curSize %d", (Object) Integer.valueOf(SlideShowAdapter.this.mCacheQueue.size()));
                    e.printStackTrace();
                }
                if (showItem == null) {
                    synchronized (SlideShowAdapter.this.mLock) {
                        if (SlideShowAdapter.this.mLoadIndex >= SlideShowAdapter.this.getCount() && SlideShowAdapter.this.mDataSet != null) {
                            return null;
                        }
                    }
                }
            }
            Log.i("SlideShowAdapter", "getJob cancelled, curSize %d", (Object) Integer.valueOf(SlideShowAdapter.this.mCacheQueue.size()));
            if (showItem != null) {
                SlideShowAdapter.this.mShowIndex = showItem.getIndex();
            }
            return showItem;
        }
    }

    private class LoadItem {
        /* access modifiers changed from: private */
        public int mIndex;
        private byte[] mSecretKey;
        /* access modifiers changed from: private */
        public String mUri;

        public LoadItem(String str, int i, byte[] bArr) {
            this.mUri = str;
            this.mIndex = i;
            this.mSecretKey = bArr;
        }

        public byte[] getSecretKey() {
            return this.mSecretKey;
        }

        public boolean isSecret() {
            return this.mSecretKey != null && this.mSecretKey.length > 0;
        }
    }

    private class LoadJob implements Job<Void> {
        private DisplayImageOptions mDisplayOptions = this.mDisplayOptionsBuilder.build();
        private Builder mDisplayOptionsBuilder = new Builder().syncLoading(true).considerExifParams(true).resetViewBeforeLoading(false).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565);

        LoadJob() {
        }

        private DisplayImageOptions getDisplayOptions(LoadItem loadItem) {
            return loadItem.isSecret() ? this.mDisplayOptionsBuilder.secretKey(loadItem.getSecretKey()).build() : this.mDisplayOptions;
        }

        public Void run(JobContext jobContext) {
            while (!jobContext.isCancelled()) {
                LoadItem access$600 = SlideShowAdapter.this.getLoadItem();
                if (access$600 == null) {
                    break;
                }
                Bitmap loadImageSync = ImageLoader.getInstance().loadImageSync(access$600.mUri, getDisplayOptions(access$600));
                if (loadImageSync != null && !loadImageSync.isRecycled()) {
                    ShowItem showItem = new ShowItem(loadImageSync, access$600.mIndex);
                    boolean z = false;
                    while (!jobContext.isCancelled() && !z) {
                        try {
                            z = SlideShowAdapter.this.mCacheQueue.offer(showItem, 1000, TimeUnit.MILLISECONDS);
                        } catch (InterruptedException e) {
                            Log.i("SlideShowAdapter", "offer interrupted, curSize %d", (Object) Integer.valueOf(SlideShowAdapter.this.mCacheQueue.size()));
                            e.printStackTrace();
                        }
                    }
                    if (!z) {
                        Log.i("SlideShowAdapter", "not offered, curSize %d", (Object) Integer.valueOf(SlideShowAdapter.this.mCacheQueue.size()));
                        synchronized (SlideShowAdapter.this.mLock) {
                            SlideShowAdapter.access$306(SlideShowAdapter.this);
                        }
                    } else {
                        continue;
                    }
                }
            }
            Log.i("SlideShowAdapter", "loadJob cancelled, curSize %d", (Object) Integer.valueOf(SlideShowAdapter.this.mCacheQueue.size()));
            return null;
        }
    }

    public static class ShowItem {
        private Bitmap mBit;
        private int mIndex;

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

        public boolean isValid() {
            return this.mBit != null && !this.mBit.isRecycled();
        }
    }

    public SlideShowAdapter(ImageLoadParams imageLoadParams, int i) {
        this.mCacheItem = imageLoadParams;
        this.mLoadIndex = i;
    }

    static /* synthetic */ int access$306(SlideShowAdapter slideShowAdapter) {
        int i = slideShowAdapter.mLoadIndex - 1;
        slideShowAdapter.mLoadIndex = i;
        return i;
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
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0080, code lost:
        return null;
     */
    public LoadItem getLoadItem() {
        synchronized (this.mLock) {
            if (this.mDataSet != null) {
                while (this.mLoadIndex >= 0 && this.mLoadIndex < this.mDataSet.getCount()) {
                    BaseDataItem item = this.mDataSet.getItem(null, this.mLoadIndex);
                    if (item != null) {
                        String pathDisplayBetter = item.getPathDisplayBetter();
                        if (!TextUtils.isEmpty(pathDisplayBetter)) {
                            if (Scheme.ofUri(pathDisplayBetter) == Scheme.UNKNOWN) {
                                pathDisplayBetter = Scheme.FILE.wrap(pathDisplayBetter);
                            }
                            this.mLoadIndex++;
                            LoadItem loadItem = new LoadItem(pathDisplayBetter, this.mLoadIndex - 1, item.getSecretKey());
                            return loadItem;
                        }
                    }
                    this.mLoadIndex++;
                }
            } else if (this.mCacheItem != null && this.mCacheItem.match(null, this.mLoadIndex)) {
                this.mLoadIndex++;
                LoadItem loadItem2 = new LoadItem(this.mCacheItem.getPath(), this.mLoadIndex - 1, this.mCacheItem.getSecretKey());
                return loadItem2;
            }
        }
    }

    private void startLoad() {
        cancelLoad();
        this.mLoadFuture = ThreadManager.getMiscPool().submit(new LoadJob());
    }

    public void changeDataSet(BaseDataSet baseDataSet, int i) {
        synchronized (this.mLock) {
            this.mDataSet = baseDataSet;
            this.mLoadIndex = i;
        }
        cancelLoad();
        this.mCacheQueue.clear();
        startLoad();
    }

    public BaseDataItem getBaseDataItem(int i) {
        if (this.mDataSet != null) {
            return this.mDataSet.getItem(null, i);
        }
        return null;
    }

    public int getCount() {
        if (this.mDataSet != null) {
            return this.mDataSet.getCount();
        }
        return 0;
    }

    public int getShowIndex() {
        return this.mShowIndex;
    }

    public void nextBitmap(FutureListener<ShowItem> futureListener) {
        cancelGet();
        this.mGetFuture = ThreadManager.getMiscPool().submit(new GetJob(), futureListener);
    }

    public void pause() {
        cancelLoad();
        cancelGet();
    }

    public void resume() {
        startLoad();
    }
}
