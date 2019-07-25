package com.miui.gallery.provider.cache;

import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ParcelableUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.uil.BlobCache;
import java.io.File;

class SearchIconDiskCache {
    private BlobCache mBlobCache;
    private final Object mLock;

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static SearchIconDiskCache INSTANCE = new SearchIconDiskCache(new File(StorageUtils.getCacheDirectory()), 350, 52428800);
    }

    private SearchIconDiskCache(File file, int i, int i2) {
        this.mLock = new Object();
        if (file != null) {
            try {
                if (!file.exists()) {
                    FileUtils.createFolder(file, true);
                }
            } catch (Exception e) {
                Log.e("SearchIconDiskCache", (Throwable) e);
                return;
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append(file);
        sb.append(File.separator);
        sb.append("search_icon_blob");
        BlobCache blobCache = new BlobCache(sb.toString(), i, i2, false, 1);
        this.mBlobCache = blobCache;
    }

    public static SearchIconDiskCache getInstance() {
        return SingletonHolder.INSTANCE;
    }

    /* access modifiers changed from: 0000 */
    public SearchIconItem getIcon(String str) {
        SearchIconItem searchIconItem = null;
        if (str == null) {
            return null;
        }
        synchronized (this.mLock) {
            try {
                if (this.mBlobCache != null) {
                    System.currentTimeMillis();
                    byte[] lookup = this.mBlobCache.lookup(MiscUtil.crc64Long(str.getBytes()));
                    if (lookup != null) {
                        searchIconItem = (SearchIconItem) ParcelableUtil.unmarshall(lookup, SearchIconItem.CREATOR);
                    }
                }
            } catch (Exception e) {
                Log.e("SearchIconDiskCache", (Throwable) e);
            }
        }
        return searchIconItem;
    }

    /* access modifiers changed from: 0000 */
    public boolean putIcon(String str, SearchIconItem searchIconItem) {
        if (str == null || searchIconItem == null) {
            return false;
        }
        synchronized (this.mLock) {
            if (this.mBlobCache != null) {
                try {
                    System.currentTimeMillis();
                    this.mBlobCache.insert(MiscUtil.crc64Long(str.getBytes()), ParcelableUtil.marshall(searchIconItem));
                } catch (Exception e) {
                    Log.e("SearchIconDiskCache", (Throwable) e);
                    return false;
                }
            }
        }
        return true;
    }
}
