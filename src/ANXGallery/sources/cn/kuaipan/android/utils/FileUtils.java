package cn.kuaipan.android.utils;

import android.content.Context;
import android.os.Environment;
import android.util.Log;
import java.io.File;

public class FileUtils {
    private static final File EXTERNAL_STORAGE_ANDROID_DATA_DIRECTORY = new File(new File(Environment.getExternalStorageDirectory(), "Android"), "data");
    private static final Object mSync = new Object();
    private static File sExternalCacheDir;

    public static boolean deleteChildren(File file) {
        if (file == null || !file.exists() || !file.isDirectory()) {
            return true;
        }
        File[] listFiles = file.listFiles();
        if (listFiles == null) {
            return true;
        }
        boolean z = true;
        for (File deletes : listFiles) {
            z = deletes(deletes) && z;
        }
        return z;
    }

    public static boolean deletes(File file) {
        if (file == null || !file.exists()) {
            return true;
        }
        if (file.isDirectory()) {
            deleteChildren(file);
        }
        return file.delete();
    }

    public static File getCacheDir(Context context, String str, boolean z) {
        File cacheDir = getCacheDir(context, z);
        if (cacheDir == null) {
            return null;
        }
        File file = new File(cacheDir, str);
        if (!file.exists()) {
            file.mkdirs();
            if (!file.exists() || !file.isDirectory()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to create cache directory:");
                sb.append(file);
                Log.w("FileUtils", sb.toString());
                return null;
            }
        }
        return file;
    }

    public static File getCacheDir(Context context, boolean z) {
        return getCacheDir(context, z, true);
    }

    public static File getCacheDir(Context context, boolean z, boolean z2) {
        return z ? getExternalCacheDir(context, z2) : context.getCacheDir();
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(5:8|9|10|11|(3:17|18|19)) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:10:0x0025 */
    public static File getExternalCacheDir(Context context, boolean z) {
        synchronized (mSync) {
            if (sExternalCacheDir == null) {
                sExternalCacheDir = getExternalStorageAppCacheDirectory(context.getPackageName());
            }
            if (!sExternalCacheDir.exists()) {
                new File(EXTERNAL_STORAGE_ANDROID_DATA_DIRECTORY, ".nomedia").createNewFile();
                sExternalCacheDir.mkdirs();
                if (z && (!sExternalCacheDir.exists() || !sExternalCacheDir.isDirectory())) {
                    Log.w("FileUtils", "Unable to create external cache directory");
                    return null;
                }
            }
            File file = sExternalCacheDir;
            return file;
        }
    }

    public static File getExternalStorageAppCacheDirectory(String str) {
        return new File(new File(EXTERNAL_STORAGE_ANDROID_DATA_DIRECTORY, str), "cache");
    }
}
