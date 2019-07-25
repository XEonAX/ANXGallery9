package com.nostra13.universalimageloader.cache.disc.impl;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public abstract class BaseDiskCache implements DiskCache {
    public static final CompressFormat DEFAULT_COMPRESS_FORMAT = CompressFormat.PNG;
    protected int bufferSize = 32768;
    protected final File cacheDir;
    protected CompressFormat compressFormat = DEFAULT_COMPRESS_FORMAT;
    protected int compressQuality = 100;
    protected final FileNameGenerator fileNameGenerator;
    protected final File reserveCacheDir;

    public BaseDiskCache(File file, File file2, FileNameGenerator fileNameGenerator2) {
        if (file == null) {
            throw new IllegalArgumentException("cacheDir argument must be not null");
        } else if (fileNameGenerator2 != null) {
            this.cacheDir = file;
            this.reserveCacheDir = file2;
            this.fileNameGenerator = fileNameGenerator2;
        } else {
            throw new IllegalArgumentException("fileNameGenerator argument must be not null");
        }
    }

    public File get(String str) {
        return getFile(str);
    }

    public Bitmap getBitmap(String str) {
        return null;
    }

    /* access modifiers changed from: protected */
    public File getFile(String str) {
        String generate = this.fileNameGenerator.generate(str);
        File file = this.cacheDir;
        if (!this.cacheDir.exists() && !this.cacheDir.mkdirs() && this.reserveCacheDir != null && (this.reserveCacheDir.exists() || this.reserveCacheDir.mkdirs())) {
            file = this.reserveCacheDir;
        }
        return new File(file, generate);
    }

    public boolean save(String str, Bitmap bitmap) throws IOException {
        File file = getFile(str);
        StringBuilder sb = new StringBuilder();
        sb.append(file.getAbsolutePath());
        sb.append(".tmp");
        File file2 = new File(sb.toString());
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file2), this.bufferSize);
        try {
            boolean compress = bitmap.compress(this.compressFormat, this.compressQuality, bufferedOutputStream);
            IoUtils.closeSilently(bufferedOutputStream);
            if (compress && !file2.renameTo(file)) {
                compress = false;
            }
            if (!compress) {
                file2.delete();
            }
            bitmap.recycle();
            return compress;
        } catch (Throwable th) {
            IoUtils.closeSilently(bufferedOutputStream);
            file2.delete();
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0057  */
    public boolean save(String str, InputStream inputStream, CopyListener copyListener) throws IOException {
        boolean z;
        BufferedOutputStream bufferedOutputStream;
        File file = getFile(str);
        StringBuilder sb = new StringBuilder();
        sb.append(file.getAbsolutePath());
        sb.append(".tmp");
        File file2 = new File(sb.toString());
        try {
            bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file2), this.bufferSize);
            z = IoUtils.copyStream(inputStream, bufferedOutputStream, copyListener, this.bufferSize);
            try {
                IoUtils.closeSilently(bufferedOutputStream);
                if (z && !file2.renameTo(file)) {
                    z = false;
                }
                if (!z) {
                    file2.delete();
                }
                return z;
            } catch (Throwable th) {
                th = th;
                if (z && !file2.renameTo(file)) {
                    z = false;
                }
                if (!z) {
                    file2.delete();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            z = false;
            z = false;
            if (!z) {
            }
            throw th;
        }
    }
}
