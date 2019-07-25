package com.miui.gallery.util;

import android.content.ComponentName;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.StatFs;
import android.text.TextUtils;
import com.android.internal.storage.StorageInfo;
import com.android.internal.storage.StorageManager;
import com.miui.gallery.base.R;
import com.miui.gallery.util.deprecated.Storage;
import com.miui.xspace.XSpaceHelper;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import miui.os.Environment;

public class StorageUtils {
    public static final String DIRECTORY_SECRET_ALBUM_PATH;
    public static final String KEY_FOR_EMPTY_RELATIVE_PATH = String.valueOf("GallerySDCardRoot".hashCode());
    private static String sPrimaryStoragePath;
    private static String sSecondaryStoragePath;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("MIUI/Gallery/cloud");
        sb.append(File.separator);
        sb.append(".secretAlbum");
        DIRECTORY_SECRET_ALBUM_PATH = sb.toString();
    }

    public static boolean canWrite(Context context, String str) {
        boolean z = false;
        if (context == null || !isAbsolutePath(str)) {
            return false;
        }
        if (!BaseDocumentProviderUtils.needUseDocumentProvider(str) || !BaseDocumentProviderUtils.needRequestExternalSDCardPermission(context)) {
            z = true;
        }
        return z;
    }

    public static boolean canWriteThroughFileSystem(Context context, String str) {
        if (context == null || !isAbsolutePath(str)) {
            return false;
        }
        String volumePath = getVolumePath(context, str);
        if (TextUtils.isEmpty(volumePath)) {
            return false;
        }
        File file = new File(volumePath, ".fe_tmp");
        try {
            BaseMiscUtil.closeSilently(new FileOutputStream(file, true));
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Exception e) {
                    Log.w("StorageUtils", "Failed to delete test file [%s], %s", file.getPath(), e);
                }
            }
            return true;
        } catch (Exception e2) {
            Log.w("StorageUtils", "Cannot write to file volume [%s], %s", volumePath, e2);
            BaseMiscUtil.closeSilently(null);
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Exception e3) {
                    Log.w("StorageUtils", "Failed to delete test file [%s], %s", file.getPath(), e3);
                }
            }
            return false;
        } catch (Throwable th) {
            BaseMiscUtil.closeSilently(null);
            if (file.exists()) {
                try {
                    file.delete();
                } catch (Exception e4) {
                    Log.w("StorageUtils", "Failed to delete test file [%s], %s", file.getPath(), e4);
                }
            }
            throw th;
        }
    }

    public static String ensureCommonRelativePath(String str) {
        if (KEY_FOR_EMPTY_RELATIVE_PATH.equals(str)) {
            return "";
        }
        if (str == null) {
            str = "";
        }
        return str;
    }

    public static String[] getAbsolutePath(Context context, String str) {
        if (isAbsolutePath(str)) {
            return new String[]{str};
        } else if (context == null) {
            return null;
        } else {
            return getPathsInExternalStorage(context, ensureCommonRelativePath(str));
        }
    }

    public static long getAvailableBytes(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return new StatFs(str).getAvailableBytes();
            } catch (Exception e) {
                Log.e("StorageUtils", String.format(Locale.US, "Failed to get available bytes [%s]", new Object[]{e}));
            }
        }
        return 0;
    }

    public static String getCacheDirectory() {
        return getPathInPrimaryStorage("MIUI/Gallery/cloud/.cache");
    }

    public static String getCreativeDirectory() {
        return getSafePathInPriorStorageForUnadapted("DCIM/Creative");
    }

    public static String getFilePathUnder(String str, String str2) {
        if (str == null) {
            return null;
        }
        if (str2 == null) {
            str2 = "";
        }
        return BaseFileUtils.concat(str, str2);
    }

    public static String[] getMicroThumbnailDirectories(Context context) {
        return getPathsInExternalStorage(context, "MIUI/Gallery/cloud/.microthumbnailFile");
    }

    public static String getMicroThumbnailTempDirectory() {
        return getPriorMicroThumbnailDirectory();
    }

    public static List<String> getMountedVolumePaths(Context context) {
        List<StorageInfo> volumes = getVolumes(context);
        ArrayList arrayList = new ArrayList(volumes.size());
        for (StorageInfo storageInfo : volumes) {
            if (storageInfo.isMounted() && !TextUtils.isEmpty(storageInfo.getPath())) {
                arrayList.add(storageInfo.getPath());
            }
        }
        return arrayList;
    }

    public static File getNetworkCacheDirectory() {
        File file = "mounted".equals(Environment.getExternalStorageState()) ? new File(StaticContext.sGetAndroidContext().getExternalCacheDir(), "request") : null;
        return file == null ? new File(StaticContext.sGetAndroidContext().getCacheDir(), "request") : file;
    }

    public static String getOriginTempDirectory() {
        return getSafePathInPriorStorageForUnadapted("MIUI/Gallery/cloud/.cache/.downloadFile");
    }

    public static String getPathForDisplay(Context context, String str) {
        if (context != null && !TextUtils.isEmpty(str)) {
            Iterator it = getVolumes(context).iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                StorageInfo storageInfo = (StorageInfo) it.next();
                if (BaseFileUtils.contains(storageInfo.getPath(), str)) {
                    String description = storageInfo.getDescription();
                    if (storageInfo.isPrimary()) {
                        description = context.getString(R.string.storage_description_primary);
                    } else if (storageInfo.isSd()) {
                        description = context.getString(R.string.storage_description_sdcard);
                    } else if (storageInfo.isXspace()) {
                        description = context.getString(R.string.storage_description_xspace);
                    } else if (storageInfo.isUsb()) {
                        description = context.getString(R.string.storage_description_usb);
                    }
                    if (!TextUtils.isEmpty(description)) {
                        return String.format(Locale.US, "%s%s", new Object[]{description, str.substring(storageInfo.getPath().length())});
                    }
                }
            }
        }
        if (str == null) {
            str = "";
        }
        return str;
    }

    public static String getPathInPrimaryStorage(String str) {
        return getFilePathUnder(getPrimaryStoragePath(), str);
    }

    public static String getPathInPriorStorage(String str) {
        return getFilePathUnder(getPriorStoragePath(), ensureCommonRelativePath(str));
    }

    public static String getPathInSecondaryStorage(String str) {
        return getFilePathUnder(getSecondaryStoragePath(), str);
    }

    public static String[] getPathsInExternalStorage(Context context, String str) {
        if (context == null) {
            return null;
        }
        List mountedVolumePaths = getMountedVolumePaths(context);
        int size = mountedVolumePaths.size();
        String[] strArr = new String[size];
        for (int i = 0; i < size; i++) {
            strArr[i] = getFilePathUnder((String) mountedVolumePaths.get(i), str);
        }
        return strArr;
    }

    public static String getPrimaryStoragePath() {
        if (TextUtils.isEmpty(sPrimaryStoragePath)) {
            sPrimaryStoragePath = Storage.getPrimaryStorageRoot();
        }
        return sPrimaryStoragePath;
    }

    public static String getPriorMicroThumbnailDirectory() {
        return getSafePathInPriorStorage("MIUI/Gallery/cloud/.microthumbnailFile");
    }

    public static String getPriorMicroThumbnailPath(String str) {
        if (str != null && !str.endsWith(".jpg")) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(".jpg");
            str = sb.toString();
        }
        return getFilePathUnder(getPriorMicroThumbnailDirectory(), str);
    }

    public static String getPriorStoragePath() {
        return isUsingSecondaryStorage(StaticContext.sGetAndroidContext()) ? getSecondaryStoragePath() : getPrimaryStoragePath();
    }

    public static String getRelativePath(Context context, String str) {
        if (context == null || TextUtils.isEmpty(str)) {
            return null;
        }
        if (!isAbsolutePath(str)) {
            return str;
        }
        for (String str2 : getMountedVolumePaths(context)) {
            if (BaseFileUtils.contains(str2, str)) {
                if (str2.length() < str.length()) {
                    String substring = str.substring(str2.length());
                    int startsWith = substring.startsWith(File.separator);
                    int length = substring.endsWith(File.separator) ? substring.length() - 1 : substring.length();
                    if (startsWith < length) {
                        return substring.substring(startsWith, length);
                    }
                }
                return KEY_FOR_EMPTY_RELATIVE_PATH;
            }
        }
        return null;
    }

    public static String getSafePathInPriorStorage(String str) {
        return getFilePathUnder(getSafePriorStoragePath(), str);
    }

    public static String getSafePathInPriorStorageForUnadapted(String str) {
        return VERSION.SDK_INT >= 28 ? getPathInPrimaryStorage(str) : getPathInPriorStorage(str);
    }

    public static String getSafePriorStoragePath() {
        Context sGetAndroidContext = StaticContext.sGetAndroidContext();
        if (isUsingSecondaryStorage(sGetAndroidContext) && !BaseDocumentProviderUtils.needRequestExternalSDCardPermission(sGetAndroidContext)) {
            String secondaryStoragePath = getSecondaryStoragePath();
            if (!TextUtils.isEmpty(secondaryStoragePath)) {
                return secondaryStoragePath;
            }
        }
        return getPrimaryStoragePath();
    }

    public static String getSecondaryStoragePath() {
        if (TextUtils.isEmpty(sSecondaryStoragePath)) {
            sSecondaryStoragePath = Storage.getExternalSDCardRoot();
        }
        return sSecondaryStoragePath;
    }

    public static String getThumbnailTempDirectory() {
        return getSafePathInPriorStorageForUnadapted("MIUI/Gallery/cloud/.cache/.downloadThumbnail");
    }

    public static long getTotalBytes(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return new StatFs(str).getTotalBytes();
            } catch (Exception e) {
                Log.e("StorageUtils", String.format(Locale.US, "Failed to get total bytes [%s]", new Object[]{e}));
            }
        }
        return 0;
    }

    public static String getVolumePath(Context context, String str) {
        if (context == null || !isAbsolutePath(str)) {
            return null;
        }
        for (String str2 : getMountedVolumePaths(context)) {
            if (BaseFileUtils.contains(str2, str)) {
                return str2;
            }
        }
        return null;
    }

    static List<StorageInfo> getVolumes(Context context) {
        List<StorageInfo> storageInfos = StorageManager.getInstance().getStorageInfos(context);
        StorageInfo xSpaceStorageInfo = getXSpaceStorageInfo(context);
        if (xSpaceStorageInfo != null) {
            storageInfos.add(xSpaceStorageInfo);
        }
        return storageInfos;
    }

    private static StorageInfo getXSpaceStorageInfo(Context context) {
        if (XSpaceHelper.isXSpaceEnable(context)) {
            File xSpacePath = XSpaceHelper.getXSpacePath();
            if (xSpacePath != null && xSpacePath.exists() && xSpacePath.canRead()) {
                StorageInfo storageInfo = new StorageInfo(xSpacePath.getAbsolutePath());
                storageInfo.setXspace(true);
                storageInfo.setMounted(true);
                return storageInfo;
            }
        }
        return null;
    }

    public static boolean hasExternalSDCard(Context context) {
        for (StorageInfo storageInfo : StorageManager.getInstance().getStorageInfos(context)) {
            if (storageInfo.isMounted() && storageInfo.isSd()) {
                return true;
            }
        }
        return false;
    }

    private static boolean isAbsolutePath(String str) {
        return !TextUtils.isEmpty(str) && str.startsWith(File.separator);
    }

    public static boolean isExternalSDCardPriorStorage() {
        Context sGetAndroidContext = StaticContext.sGetAndroidContext();
        int componentEnabledSetting = sGetAndroidContext.getPackageManager().getComponentEnabledSetting(new ComponentName(sGetAndroidContext, PriorityStorageBroadcastReceiver.class));
        if (componentEnabledSetting == 0) {
            return sGetAndroidContext.getResources().getBoolean(R.bool.priority_storage);
        }
        boolean z = true;
        if (componentEnabledSetting != 1) {
            z = false;
        }
        return z;
    }

    public static boolean isInExternalStorage(Context context, String str) {
        if (!isAbsolutePath(str)) {
            return false;
        }
        for (String contains : getMountedVolumePaths(context)) {
            if (BaseFileUtils.contains(contains, str)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isInPrimaryStorage(String str) {
        return !TextUtils.isEmpty(str) && BaseFileUtils.contains(getPrimaryStoragePath(), str);
    }

    public static boolean isInSecondaryStorage(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        String secondaryStoragePath = getSecondaryStoragePath();
        if (TextUtils.isEmpty(secondaryStoragePath)) {
            return false;
        }
        return BaseFileUtils.contains(secondaryStoragePath, str);
    }

    public static boolean isPrimaryStorageWritable(Context context) {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            return canWriteThroughFileSystem(context, getPrimaryStoragePath());
        }
        return false;
    }

    public static boolean isUsingSecondaryStorage(Context context) {
        return hasExternalSDCard(context) && isExternalSDCardPriorStorage();
    }

    public static void setPriorStorage(boolean z) {
        Context sGetAndroidContext = StaticContext.sGetAndroidContext();
        sGetAndroidContext.getPackageManager().setComponentEnabledSetting(new ComponentName(sGetAndroidContext, PriorityStorageBroadcastReceiver.class), z ? 1 : 2, 1);
    }
}
