package com.miui.gallery.util.uil;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Matrix;
import android.os.SystemClock;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.imageloader.GalleryImageLoaderCache.IMicroThumbCache;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ReusedBitmapCache;
import com.miui.gallery.util.uil.BlobCache.LookupRequest;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import miui.util.Pools;
import miui.util.Pools.Manager;
import miui.util.Pools.SoftReferencePool;

public class MicroThumbCache implements IMicroThumbCache {
    /* access modifiers changed from: private */
    public static final int MICRO_THUMBNAIL_SIZE = ThumbConfig.get().sMicroTargetSize.getWidth();
    private static final int THUMB_CONFIG_ORDINAL = ThumbConfig.getThumbConfig().ordinal();
    private static MicroThumbCache sCache;
    private SoftReferencePool<Bitmap> mBitmapPool;
    private BlobCache mBlobCache;
    private Object mBlobLock = new Object();
    private final File mCacheDir;
    private final int mCacheMaxSize;
    private SoftReferencePool<LookupRequest> mLookupRequestPool;
    private final int mMaxEntries;

    private MicroThumbCache(File file, int i, int i2) {
        Log.d("MicroThumbCache", "MicroThumbCache cache size %d", (Object) Integer.valueOf(i2));
        this.mCacheDir = file;
        this.mMaxEntries = i;
        this.mCacheMaxSize = i2;
    }

    private synchronized void ensureInitialized() throws IOException {
        if (this.mBlobCache == null) {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.mCacheDir != null && !this.mCacheDir.exists()) {
                FileUtils.createFolder(this.mCacheDir, true);
            }
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mCacheDir);
                sb.append("/");
                sb.append("micro_thumbnail_blob");
                BlobCache blobCache = new BlobCache(sb.toString(), this.mMaxEntries, this.mCacheMaxSize, false, 9);
                this.mBlobCache = blobCache;
                this.mLookupRequestPool = Pools.createSoftReferencePool(new Manager<LookupRequest>() {
                    public LookupRequest createInstance() {
                        return new LookupRequest();
                    }
                }, 32);
                this.mBitmapPool = Pools.createSoftReferencePool(new Manager<Bitmap>() {
                    public Bitmap createInstance() {
                        return Bitmap.createBitmap(MicroThumbCache.MICRO_THUMBNAIL_SIZE, MicroThumbCache.MICRO_THUMBNAIL_SIZE, ThumbConfig.getThumbConfig());
                    }
                }, 10);
                Log.d("MicroThumbCache", "init cost %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            } catch (IOException e) {
                Log.w("MicroThumbCache", "cache creation failed, use dummy", e);
                throw e;
            }
        }
    }

    public static MicroThumbCache getInstance() {
        return sCache;
    }

    public static void init(File file, int i, int i2) {
        sCache = new MicroThumbCache(file, i, i2);
    }

    private boolean isCorrectConfig(Bitmap bitmap) {
        return bitmap != null && bitmap.getConfig() == ThumbConfig.getThumbConfig();
    }

    private boolean isCorrectSize(Bitmap bitmap) {
        return bitmap != null && Math.min(bitmap.getWidth(), bitmap.getHeight()) >= MICRO_THUMBNAIL_SIZE;
    }

    private boolean isReusableBitmap(Bitmap bitmap) {
        boolean z = false;
        if (bitmap == null) {
            return false;
        }
        Config config = bitmap.getConfig();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        if (width == MICRO_THUMBNAIL_SIZE && width == height && THUMB_CONFIG_ORDINAL == config.ordinal()) {
            z = true;
        }
        return z;
    }

    public Bitmap getCenterCropBitmap(String str, Bitmap bitmap) {
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        Bitmap bitmap2 = null;
        try {
            ensureInitialized();
            LookupRequest lookupRequest = (LookupRequest) this.mLookupRequestPool.acquire();
            lookupRequest.key = MiscUtil.crc64Long(str.getBytes());
            lookupRequest.length = 0;
            synchronized (this.mBlobLock) {
                try {
                    this.mBlobCache.lookup(lookupRequest);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (lookupRequest.length > 0) {
                ByteBuffer wrap = ByteBuffer.wrap(lookupRequest.buffer, 0, lookupRequest.length);
                if (!isReusableBitmap(bitmap)) {
                    bitmap = (Bitmap) this.mBitmapPool.acquire();
                }
                bitmap2 = bitmap;
                bitmap2.copyPixelsFromBuffer(wrap);
            }
            this.mLookupRequestPool.release(lookupRequest);
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        long elapsedRealtimeNanos2 = SystemClock.elapsedRealtimeNanos() - elapsedRealtimeNanos;
        if (bitmap2 != null) {
            LoadMonitor.record(0, elapsedRealtimeNanos2);
        }
        return bitmap2;
    }

    public boolean save(String str, Bitmap bitmap) throws IOException {
        Bitmap safeCreateBitmap;
        ensureInitialized();
        if (bitmap == null || bitmap.isRecycled()) {
            return false;
        }
        ByteBuffer byteBuffer = null;
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        int min = Math.min(width, height);
        if (min > 0 && min < MICRO_THUMBNAIL_SIZE) {
            float f = ((float) MICRO_THUMBNAIL_SIZE) / ((float) min);
            if (((float) (ReusedBitmapCache.getBytesPerPixel(ThumbConfig.getThumbConfig()) * width * height)) * f * f > 2097152.0f) {
                return false;
            }
            Matrix matrix = new Matrix();
            matrix.postScale(f, f);
            bitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
        }
        Bitmap bitmap2 = bitmap;
        if (isCorrectSize(bitmap2)) {
            int width2 = bitmap2.getWidth();
            int i = (width2 - MICRO_THUMBNAIL_SIZE) / 2;
            int height2 = (bitmap2.getHeight() - MICRO_THUMBNAIL_SIZE) / 2;
            if (isCorrectConfig(bitmap2)) {
                safeCreateBitmap = Bitmap.createBitmap(bitmap2, i, height2, MICRO_THUMBNAIL_SIZE, MICRO_THUMBNAIL_SIZE);
            } else {
                Log.d("MicroThumbCache", "is not correct config %s, %s", str, bitmap2.getConfig());
                safeCreateBitmap = BitmapUtils.safeCreateBitmap(bitmap2, i, height2, MICRO_THUMBNAIL_SIZE, MICRO_THUMBNAIL_SIZE, null, true, ThumbConfig.getThumbConfig());
            }
            bitmap2 = safeCreateBitmap;
            if (isCorrectConfig(bitmap2)) {
                byteBuffer = ByteBuffer.allocate(bitmap2.getByteCount());
                bitmap2.copyPixelsToBuffer(byteBuffer);
            }
        }
        if (byteBuffer != null) {
            synchronized (this.mBlobLock) {
                Log.d("MicroThumbCache", "save data size %d", (Object) Integer.valueOf(bitmap2.getByteCount()));
                this.mBlobCache.insert(MiscUtil.crc64Long(str.getBytes()), byteBuffer.array());
            }
        }
        return true;
    }
}
