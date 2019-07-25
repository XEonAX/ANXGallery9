package com.miui.gallery.util.deprecated;

import android.os.Build;
import com.android.internal.storage.StorageInfo;
import com.android.internal.storage.StorageManager;
import com.miui.gallery.util.BaseBuildUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import miui.os.Environment;

public class Storage {
    @Deprecated
    public static String[] getAllSdCardAvatarFilePath() {
        return StorageUtils.getPathsInExternalStorage(StaticContext.sGetAndroidContext(), "/MIUI/Gallery/cloud/.avatar");
    }

    @Deprecated
    public static String[] getCloudThumbnailFilePath() {
        return StorageUtils.getPathsInExternalStorage(StaticContext.sGetAndroidContext(), "/MIUI/Gallery/cloud/.thumbnailFile");
    }

    @Deprecated
    public static String[] getCloudThumbnailModifiedTimeMapFilePath() {
        return StorageUtils.getPathsInExternalStorage(StaticContext.sGetAndroidContext(), "/MIUI/Gallery/cloud/.thumbnaillastmodifiedtime");
    }

    public static String[] getCloudWaitUploadFilePath() {
        return StorageUtils.getPathsInExternalStorage(StaticContext.sGetAndroidContext(), "/MIUI/Gallery/cloud/.waitUpload");
    }

    public static String getExternalSDCardRoot() {
        if (BaseBuildUtil.isUUIDSDCard()) {
            for (StorageInfo storageInfo : StorageManager.getInstance().getStorageInfos(StaticContext.sGetAndroidContext())) {
                if (storageInfo.isMounted() && storageInfo.isSd()) {
                    return storageInfo.getPath();
                }
            }
            return null;
        } else if (!isMocha()) {
            return System.getenv("SECONDARY_STORAGE");
        } else {
            try {
                Method method = Environment.class.getMethod("getSecondaryStorageDirectory", new Class[0]);
                if (method != null) {
                    Object invoke = method.invoke(null, new Object[0]);
                    if (invoke instanceof File) {
                        return ((File) invoke).getPath();
                    }
                }
            } catch (NoSuchMethodException e) {
                Log.w("Storage", (Throwable) e);
            } catch (InvocationTargetException e2) {
                Log.w("Storage", (Throwable) e2);
            } catch (IllegalAccessException e3) {
                Log.w("Storage", (Throwable) e3);
            }
            return null;
        }
    }

    @Deprecated
    public static String getMainSDCardCloudThumbnailFilePath() {
        return StorageUtils.getPathInPriorStorage("/MIUI/Gallery/cloud/.thumbnailFile");
    }

    public static String getPrimaryStorageRoot() {
        return Environment.getExternalStorageDirectory().getPath();
    }

    @Deprecated
    private static boolean isMocha() {
        return "mocha".equals(Build.DEVICE);
    }

    public static boolean startsWithFilePath(String[] strArr, String str) {
        String lowerCase = str.toLowerCase();
        for (String lowerCase2 : strArr) {
            if (lowerCase.startsWith(lowerCase2.toLowerCase())) {
                return true;
            }
        }
        return false;
    }
}
