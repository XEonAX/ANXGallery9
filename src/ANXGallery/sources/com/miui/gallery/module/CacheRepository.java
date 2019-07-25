package com.miui.gallery.module;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.os.Rom;
import java.io.File;
import miui.module.Repository;
import miui.module.appstore.AppStoreRepository;

public class CacheRepository extends Repository {
    private AppStoreRepository mAppStoreRepo = new AppStoreRepository();
    private File mFolder;
    private boolean mLocalOnly;

    public CacheRepository(Context context, boolean z) {
        this.mLocalOnly = z;
        this.mFolder = new File(context.getFilesDir(), "plugins/preloads/");
    }

    public static void clearCache(Context context, String str) {
        if (Rom.IS_MIUI && Rom.IS_ALPHA && context != null && !TextUtils.isEmpty(str)) {
            File file = new File(new File(context.getFilesDir(), "plugins/preloads/"), str);
            FileUtils.deleteFile(file);
            Log.d("CacheRepository", "delete %s", (Object) file.getAbsolutePath());
            File file2 = new File(context.getFilesDir(), "miuisdk/modules/");
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(".apk");
            File file3 = new File(file2, sb.toString());
            FileUtils.deleteFile(file3);
            Log.d("CacheRepository", "delete %s", (Object) file3.getAbsolutePath());
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(".lib");
            File file4 = new File(file2, sb2.toString());
            FileUtils.deleteFile(file4);
            Log.d("CacheRepository", "delete %s", (Object) file4.getAbsolutePath());
        }
    }

    /* access modifiers changed from: 0000 */
    public String cache(String str) {
        if (this.mFolder.exists() || this.mFolder.mkdirs()) {
            File file = new File(this.mFolder, str);
            if (file.exists()) {
                Log.d("CacheRepository", "%s loaded, skip cache", (Object) str);
                return str;
            }
            String fetch = this.mAppStoreRepo.fetch(this.mFolder, str);
            if (fetch == null) {
                Log.d("CacheRepository", "app store repo fetch %s failed", (Object) str);
                return null;
            }
            File file2 = new File(this.mFolder, fetch);
            if (TextUtils.equals(fetch, str) || file2.renameTo(file)) {
                Log.d("CacheRepository", "cache success");
                return str;
            }
            Log.d("CacheRepository", "rename %s -> %s failed", file2, file);
            return null;
        }
        throw new IllegalStateException("create plugin cache folder failed");
    }

    public boolean contains(String str) {
        return new File(this.mFolder, str).exists() || (!this.mLocalOnly && this.mAppStoreRepo.contains(str));
    }

    public String fetch(File file, String str) {
        Log.d("CacheRepository", "fetching %s", (Object) str);
        File file2 = new File(this.mFolder, str);
        if (!file2.exists()) {
            Log.d("CacheRepository", "%s not in cache", (Object) str);
            if (this.mLocalOnly) {
                return null;
            }
            Log.d("CacheRepository", "start to cache %s", (Object) str);
            if (cache(str) == null) {
                return null;
            }
        } else {
            Log.d("CacheRepository", "%s cached", (Object) str);
        }
        if (!FileUtils.copyFile(file2, new File(file, str))) {
            return null;
        }
        Log.d("CacheRepository", "fetch %s success");
        return str;
    }
}
