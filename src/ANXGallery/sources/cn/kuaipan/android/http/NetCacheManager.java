package cn.kuaipan.android.http;

import android.content.Context;
import android.text.TextUtils;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.utils.FileUtils;
import cn.kuaipan.android.utils.TwoKeyHashMap;
import java.io.File;

public class NetCacheManager {
    private static final TwoKeyHashMap<Boolean, String, NetCacheManager> sCaches = new TwoKeyHashMap<>();
    private final Context mContext;
    private final String mDirName;
    private final boolean mExternal;
    private String mFolderPath;
    private int mLatestId = 0;

    private NetCacheManager(Context context, boolean z, String str) {
        if (context != null) {
            this.mContext = context;
            this.mExternal = z;
            this.mDirName = str;
            final File cacheDir = FileUtils.getCacheDir(context, str, z);
            if (cacheDir != null) {
                this.mFolderPath = cacheDir.getAbsolutePath();
                new Thread() {
                    public void run() {
                        FileUtils.deleteChildren(cacheDir);
                    }
                }.start();
                return;
            }
            return;
        }
        throw new NullPointerException("Context can't be null.");
    }

    public static synchronized NetCacheManager getInstance(Context context, boolean z) {
        NetCacheManager instance;
        synchronized (NetCacheManager.class) {
            instance = getInstance(context, z, null);
        }
        return instance;
    }

    public static synchronized NetCacheManager getInstance(Context context, boolean z, String str) {
        NetCacheManager netCacheManager;
        synchronized (NetCacheManager.class) {
            if (TextUtils.isEmpty(str)) {
                str = "net_cache";
            }
            netCacheManager = (NetCacheManager) sCaches.get(Boolean.valueOf(z), str);
            if (netCacheManager == null) {
                netCacheManager = new NetCacheManager(context, z, str);
                sCaches.put(Boolean.valueOf(z), str, netCacheManager);
            }
        }
        return netCacheManager;
    }

    private File getNextCache() {
        int i;
        synchronized (this) {
            i = this.mLatestId + 1;
            this.mLatestId = i;
        }
        String format = String.format("%08d.tmp", new Object[]{Integer.valueOf(i)});
        File cacheDir = FileUtils.getCacheDir(this.mContext, this.mDirName, this.mExternal);
        if (cacheDir != null) {
            this.mFolderPath = cacheDir.getAbsolutePath();
            return new File(cacheDir, format);
        }
        throw new KscRuntimeException(500004);
    }

    public File assignCache() {
        File nextCache;
        do {
            nextCache = getNextCache();
        } while (nextCache.exists());
        nextCache.deleteOnExit();
        return nextCache;
    }

    public void releaseCache(File file) {
        if (file != null && TextUtils.equals(this.mFolderPath, file.getParent())) {
            file.delete();
        }
    }
}
