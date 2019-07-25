package com.nostra13.universalimageloader.cache.disc.impl.ext;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.impl.ext.DiskLruCache.Editor;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import com.nostra13.universalimageloader.utils.L;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class LruDiskCache implements DiskCache {
    public static final CompressFormat DEFAULT_COMPRESS_FORMAT = CompressFormat.PNG;
    protected int bufferSize = 32768;
    protected DiskLruCache cache;
    protected CompressFormat compressFormat = DEFAULT_COMPRESS_FORMAT;
    protected int compressQuality = 100;
    protected final FileNameGenerator fileNameGenerator;
    private File mCacheDir;
    private int mCacheMaxFileCount;
    private long mCacheMaxSize;
    private File reserveCacheDir;

    public LruDiskCache(File file, File file2, FileNameGenerator fileNameGenerator2, long j, int i) throws IOException {
        if (file == null) {
            throw new IllegalArgumentException("cacheDir argument must be not null");
        } else if (j < 0) {
            throw new IllegalArgumentException("cacheMaxSize argument must be positive number");
        } else if (i < 0) {
            throw new IllegalArgumentException("cacheMaxFileCount argument must be positive number");
        } else if (fileNameGenerator2 != null) {
            if (j == 0) {
                j = Long.MAX_VALUE;
            }
            if (i == 0) {
                i = Integer.MAX_VALUE;
            }
            this.reserveCacheDir = file2;
            this.fileNameGenerator = fileNameGenerator2;
            this.mCacheDir = file;
            this.mCacheMaxSize = j;
            this.mCacheMaxFileCount = i;
        } else {
            throw new IllegalArgumentException("fileNameGenerator argument must be not null");
        }
    }

    private void ensureInitialized() throws IOException {
        if (this.cache == null) {
            synchronized (this) {
                if (this.cache == null) {
                    initCache(this.mCacheDir, this.reserveCacheDir, this.mCacheMaxSize, this.mCacheMaxFileCount);
                }
            }
        }
    }

    private void initCache(File file, File file2, long j, int i) throws IOException {
        try {
            this.cache = DiskLruCache.open(file, 1, 1, j, i);
        } catch (IOException e) {
            L.e(e);
            if (file2 != null) {
                initCache(file2, null, j, i);
            }
            if (this.cache == null) {
                throw e;
            }
        }
    }

    /* JADX WARNING: type inference failed for: r0v0 */
    /* JADX WARNING: type inference failed for: r0v1, types: [com.nostra13.universalimageloader.cache.disc.impl.ext.DiskLruCache$Snapshot] */
    /* JADX WARNING: type inference failed for: r4v2, types: [com.nostra13.universalimageloader.cache.disc.impl.ext.DiskLruCache$Snapshot] */
    /* JADX WARNING: type inference failed for: r0v3 */
    /* JADX WARNING: type inference failed for: r4v4 */
    /* JADX WARNING: type inference failed for: r4v7, types: [com.nostra13.universalimageloader.cache.disc.impl.ext.DiskLruCache$Snapshot] */
    /* JADX WARNING: type inference failed for: r0v4, types: [java.io.File] */
    /* JADX WARNING: type inference failed for: r1v5, types: [java.io.File] */
    /* JADX WARNING: type inference failed for: r0v5 */
    /* JADX WARNING: type inference failed for: r0v6 */
    /* JADX WARNING: type inference failed for: r4v8 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5
  assigns: [?[OBJECT, ARRAY], ?[int, float, boolean, short, byte, char, OBJECT, ARRAY]]
  uses: [java.io.File, ?[int, boolean, OBJECT, ARRAY, byte, short, char], com.nostra13.universalimageloader.cache.disc.impl.ext.DiskLruCache$Snapshot]
  mth insns count: 30
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0032  */
    /* JADX WARNING: Unknown variable types count: 5 */
    public File get(String str) {
        Throwable th;
        ? r0;
        ? r4;
        ? r02 = 0;
        try {
            ensureInitialized();
            ? r42 = this.cache.get(getKey(str));
            if (r42 != 0) {
                try {
                    r02 = r42.getFile(0);
                } catch (IOException e) {
                    e = e;
                    r4 = r42;
                    try {
                        L.e(e);
                        if (r4 != 0) {
                        }
                        return null;
                    } catch (Throwable th2) {
                        Throwable th3 = th2;
                        r0 = r4;
                        th = th3;
                        if (r0 != 0) {
                        }
                        throw th;
                    }
                }
            }
            if (r42 != 0) {
                r42.close();
            }
            return r02;
        } catch (IOException e2) {
            e = e2;
            r4 = 0;
            L.e(e);
            if (r4 != 0) {
                r4.close();
            }
            return null;
        } catch (Throwable th4) {
            th = th4;
            r0 = r02;
            if (r0 != 0) {
                r0.close();
            }
            throw th;
        }
    }

    public Bitmap getBitmap(String str) {
        return null;
    }

    public String getKey(String str) {
        return this.fileNameGenerator.generate(str);
    }

    public boolean save(String str, Bitmap bitmap) throws IOException {
        ensureInitialized();
        Editor edit = this.cache.edit(getKey(str));
        if (edit == null) {
            return false;
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(edit.newOutputStream(0), this.bufferSize);
        try {
            boolean compress = bitmap.compress(this.compressFormat, this.compressQuality, bufferedOutputStream);
            if (compress) {
                edit.commit();
            } else {
                edit.abort();
            }
            return compress;
        } finally {
            IoUtils.closeSilently(bufferedOutputStream);
        }
    }

    public boolean save(String str, InputStream inputStream, CopyListener copyListener) throws IOException {
        ensureInitialized();
        Editor edit = this.cache.edit(getKey(str));
        if (edit == null) {
            return false;
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(edit.newOutputStream(0), this.bufferSize);
        try {
            boolean copyStream = IoUtils.copyStream(inputStream, bufferedOutputStream, copyListener, this.bufferSize);
            IoUtils.closeSilently(bufferedOutputStream);
            if (copyStream) {
                edit.commit();
            } else {
                edit.abort();
            }
            return copyStream;
        } catch (Throwable th) {
            IoUtils.closeSilently(bufferedOutputStream);
            edit.abort();
            throw th;
        }
    }
}
