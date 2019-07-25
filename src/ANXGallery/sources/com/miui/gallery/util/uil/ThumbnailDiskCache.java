package com.miui.gallery.util.uil;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.os.SystemClock;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class ThumbnailDiskCache implements DiskCache {
    private BlobCache mBlobCache;
    private Object mBlobLock = new Object();
    private final File mCacheDir;
    private final int mCacheMaxSize;
    private final int mMaxEntries;

    public ThumbnailDiskCache(File file, int i, int i2) {
        this.mCacheDir = file;
        this.mMaxEntries = i;
        this.mCacheMaxSize = i2 / 4;
        MicroThumbCache.init(file, i, i2 - this.mCacheMaxSize);
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
                sb.append("thumbnail_blob");
                BlobCache blobCache = new BlobCache(sb.toString(), this.mMaxEntries, this.mCacheMaxSize, false, 9);
                this.mBlobCache = blobCache;
                Log.d("ThumbnailDiskCache", "init cost %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            } catch (IOException e) {
                Log.w("ThumbnailDiskCache", "cache creation failed, use dummy", e);
                throw e;
            }
        }
    }

    public File get(String str) {
        throw new RuntimeException("get File: Stub!");
    }

    public Bitmap getBitmap(String str) {
        Bitmap bitmap;
        byte[] bArr;
        String generateThumbnailKey = MemoryCacheUtils.generateThumbnailKey(str);
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        synchronized (this.mBlobLock) {
            bitmap = null;
            try {
                ensureInitialized();
                bArr = this.mBlobCache.lookup(MiscUtil.crc64Long(generateThumbnailKey.getBytes()));
            } catch (IOException e) {
                e.printStackTrace();
                bArr = null;
            }
        }
        if (bArr != null) {
            bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
        }
        long elapsedRealtimeNanos2 = SystemClock.elapsedRealtimeNanos() - elapsedRealtimeNanos;
        if (bitmap != null) {
            LoadMonitor.record(1, elapsedRealtimeNanos2);
        }
        return bitmap;
    }

    public boolean save(String str, Bitmap bitmap) throws IOException {
        ensureInitialized();
        String generateThumbnailKey = MemoryCacheUtils.generateThumbnailKey(str);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            bitmap.compress(CompressFormat.JPEG, 90, byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            if (byteArray != null) {
                synchronized (this.mBlobLock) {
                    Log.d("ThumbnailDiskCache", "Save data size %d", (Object) Integer.valueOf(byteArray.length));
                    this.mBlobCache.insert(MiscUtil.crc64Long(generateThumbnailKey.getBytes()), byteArray);
                }
            }
            byteArrayOutputStream.close();
            return MicroThumbCache.getInstance().save(str, bitmap);
        } catch (Throwable th) {
            byteArrayOutputStream.close();
            throw th;
        }
    }

    public boolean save(String str, InputStream inputStream, CopyListener copyListener) throws IOException {
        throw new RuntimeException("save: Stub!");
    }
}
