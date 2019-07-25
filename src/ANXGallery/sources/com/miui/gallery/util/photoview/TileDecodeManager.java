package com.miui.gallery.util.photoview;

import android.os.Handler;
import android.os.SystemClock;
import android.util.SparseArray;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import java.lang.ref.WeakReference;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class TileDecodeManager {
    /* access modifiers changed from: private */
    public volatile SparseArray<Tile> mCurrentDecodingTiles = new SparseArray<>();
    private Future mDecodeFuture;
    private WeakReference<Handler> mDecodeHandlerRef;
    private WeakReference<TileBitProvider> mDecodeProviderRef;
    /* access modifiers changed from: private */
    public BlockingQueue<Tile> mDecodeQueue = new LinkedBlockingQueue();
    /* access modifiers changed from: private */
    public final Object mLock = new Object();

    private class TileDecodeJob implements Job<Void> {
        private TileDecodeJob() {
        }

        public Void run(JobContext jobContext) {
            while (!jobContext.isCancelled()) {
                try {
                    Tile tile = (Tile) TileDecodeManager.this.mDecodeQueue.poll(2000, TimeUnit.MILLISECONDS);
                    if (tile == null) {
                        continue;
                    } else if (tile.isActive()) {
                        if (jobContext.isCancelled()) {
                            TileDecodeManager.this.mDecodeQueue.clear();
                            return null;
                        }
                        long uptimeMillis = SystemClock.uptimeMillis();
                        int makeTileKey = TileView.makeTileKey(tile.getTileRect());
                        synchronized (TileDecodeManager.this.mLock) {
                            TileDecodeManager.this.mCurrentDecodingTiles.put(makeTileKey, tile);
                        }
                        boolean decode = tile.decode(TileDecodeManager.this.getProvider());
                        Log.d("TileDecodeManager", "decode tile %s costs %d ms.", tile.toString(), Long.valueOf(SystemClock.uptimeMillis() - uptimeMillis));
                        Handler access$500 = TileDecodeManager.this.getHandler();
                        if (access$500 != null) {
                            access$500.obtainMessage(decode ? 1 : 2, tile).sendToTarget();
                        }
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            Log.i("TileDecodeManager", "tile decode job is cancelled %s", (Object) Boolean.valueOf(jobContext.isCancelled()));
            return null;
        }
    }

    public TileDecodeManager(Handler handler, TileBitProvider tileBitProvider) {
        this.mDecodeHandlerRef = new WeakReference<>(handler);
        this.mDecodeProviderRef = new WeakReference<>(tileBitProvider);
    }

    /* access modifiers changed from: private */
    public Handler getHandler() {
        if (this.mDecodeHandlerRef != null) {
            return (Handler) this.mDecodeHandlerRef.get();
        }
        return null;
    }

    /* access modifiers changed from: private */
    public TileBitProvider getProvider() {
        if (this.mDecodeProviderRef != null) {
            return (TileBitProvider) this.mDecodeProviderRef.get();
        }
        return null;
    }

    private void startDecodeEngine() {
        if (this.mDecodeFuture == null) {
            this.mDecodeFuture = ThreadManager.getDecodePool().submit(new TileDecodeJob());
            Log.i("TileDecodeManager", "start decode engine");
        }
    }

    public void cancel() {
        if (this.mDecodeFuture != null) {
            this.mDecodeFuture.cancel();
            Log.i("TileDecodeManager", "cancel decode engine");
        }
        this.mDecodeFuture = null;
        this.mDecodeQueue.clear();
        synchronized (this.mLock) {
            this.mCurrentDecodingTiles.clear();
        }
    }

    public void clear() {
        this.mDecodeQueue.clear();
        Log.i("TileDecodeManager", "clear queue");
    }

    public Tile getDecodingTile(int i) {
        Tile tile;
        synchronized (this.mLock) {
            tile = (Tile) this.mCurrentDecodingTiles.get(i);
        }
        return tile;
    }

    public boolean put(Tile tile) {
        if (tile == null) {
            return false;
        }
        startDecodeEngine();
        return this.mDecodeQueue.offer(tile);
    }

    public void removeDecodingTile(int i) {
        synchronized (this.mLock) {
            this.mCurrentDecodingTiles.remove(i);
        }
    }
}
