package com.miui.gallery.util;

import android.content.ComponentName;
import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.provider.MediaStore.Files;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.LocalUbifocus;
import com.miui.gallery.data.LocalUbifocus.SubFile;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class MediaFileUtils {
    private static ComponentName sMediaComponent;

    public enum FileType {
        NONE,
        NORMAL,
        ORIGINAL,
        THUMBNAIL,
        MICRO_THUMBNAIL,
        UBI_SUB_FILE,
        FOLDER,
        TEMP
    }

    private static int deleteFile(int i, File... fileArr) {
        if (fileArr == null || fileArr.length <= 0) {
            return 0;
        }
        if ((i & 2) > 0) {
            for (File file : fileArr) {
                if (file != null) {
                    String absolutePath = file.getAbsolutePath();
                    if (LocalUbifocus.isUbifocusImage(absolutePath)) {
                        for (SubFile subFile : LocalUbifocus.getUbifocusSubFiles(absolutePath)) {
                            if (!subFile.getFilePath().equals(absolutePath)) {
                                if (deleteFileType(FileType.UBI_SUB_FILE, subFile.getFilePath()) <= 0) {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Delete ubi sub file failed ");
                                    sb.append(subFile.getFilePath());
                                    Log.e("MediaFileUtils", sb.toString());
                                }
                            }
                        }
                    }
                    File imageRelativeDngFile = FileUtils.getImageRelativeDngFile(absolutePath);
                    if (imageRelativeDngFile != null) {
                        if (deleteFile(0, imageRelativeDngFile) <= 0) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Delete dng file failed ");
                            sb2.append(imageRelativeDngFile.getAbsolutePath());
                            Log.e("MediaFileUtils", sb2.toString());
                        }
                    }
                }
            }
        }
        return (i & 1) > 0 ? deleteFileFromMediaProvider(fileArr) : deleteFile(fileArr);
    }

    public static int deleteFile(File... fileArr) {
        int i = 0;
        for (File file : fileArr) {
            if (file != null) {
                i = !file.exists() ? i + 1 : i + (FileUtils.deleteFile(file) ? 1 : 0);
            }
        }
        return i;
    }

    private static int deleteFileFromMediaProvider(File... fileArr) {
        int i;
        int i2 = 0;
        if (fileArr == null || fileArr.length <= 0) {
            return 0;
        }
        if (fileArr.length <= 100) {
            i = deleteFileFromMediaProviderBatch(fileArr);
        } else {
            int i3 = 0;
            while (i2 < fileArr.length) {
                int min = Math.min(fileArr.length - i2, 100);
                int i4 = i2 + min;
                Log.d("MediaFileUtils", "Execute from %d to %d, total %d", Integer.valueOf(i2), Integer.valueOf(i4), Integer.valueOf(min));
                i3 += deleteFileFromMediaProviderBatch((File[]) Arrays.copyOfRange(fileArr, i2, i4));
                Log.d("MediaFileUtils", "Done execute from %d to %d, total %d", Integer.valueOf(i2), Integer.valueOf(i4), Integer.valueOf(min));
                i2 = i4;
            }
            i = i3;
        }
        return i;
    }

    private static int deleteFileFromMediaProviderBatch(File... fileArr) {
        int i;
        File[] fileArr2 = fileArr;
        Log.d("MediaFileUtils", "Start batch deleting %s files from media provider", (Object) Integer.valueOf(fileArr2.length));
        ArrayList arrayList = new ArrayList();
        int deleteFile = deleteFile(fileArr);
        Uri contentUri = Files.getContentUri("external");
        StringBuilder sb = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        int i2 = 0;
        boolean z = true;
        for (File file : fileArr2) {
            if (file != null && !file.exists()) {
                i2++;
                if (file.isDirectory()) {
                    arrayList.add(ContentProviderOperation.newDelete(contentUri).withSelection(String.format("%s LIKE '%s%'", new Object[]{"_data", file.getAbsolutePath()}), null).build());
                    sb2.append("directory:[");
                    sb2.append(file.getAbsolutePath());
                    sb2.append("],");
                } else {
                    if (z) {
                        z = false;
                    } else {
                        sb.append(",");
                    }
                    sb.append("'");
                    sb.append(file.getAbsolutePath());
                    sb.append("'");
                    sb2.append(file.getAbsolutePath());
                    sb2.append(",");
                }
            }
        }
        if (sb.length() > 0) {
            sb.insert(0, "_data IN (").append(")");
            arrayList.add(ContentProviderOperation.newDelete(contentUri).withSelection(sb.toString(), null).build());
        }
        if (arrayList.size() > 0) {
            try {
                Log.d("MediaFileUtils", "Start deleting %s", (Object) sb2.toString());
                ContentProviderResult[] applyBatch = GalleryApp.sGetAndroidContext().getContentResolver().applyBatch("media", arrayList);
                int i3 = 0;
                i = 0;
                while (i3 < applyBatch.length) {
                    try {
                        ContentProviderResult contentProviderResult = applyBatch[i3];
                        if (contentProviderResult.count.intValue() <= 0) {
                            Log.w("MediaFileUtils", "No rows affected while executing operation [%s]", arrayList.get(i3));
                        } else {
                            i += contentProviderResult.count.intValue();
                        }
                        i3++;
                    } catch (Exception e) {
                        e = e;
                        Log.e("MediaFileUtils", "delete from provider error %s, %s", fileArr2, e);
                        HashMap hashMap = new HashMap(2);
                        hashMap.put("deleteFileCount", String.valueOf(fileArr2.length));
                        hashMap.put("errorMsg", e.getMessage());
                        GallerySamplingStatHelper.recordErrorEvent("file_handle", "error_execute_media_provider", hashMap);
                        Log.d("MediaFileUtils", "Done deleting %s files from provider, deleted %s files, check delete result %s\nOperation count %s,  affected %s rows", Integer.valueOf(fileArr2.length), Integer.valueOf(deleteFile), Integer.valueOf(i2), Integer.valueOf(arrayList.size()), Integer.valueOf(i));
                        return i;
                    }
                }
            } catch (Exception e2) {
                e = e2;
                i = 0;
                Log.e("MediaFileUtils", "delete from provider error %s, %s", fileArr2, e);
                HashMap hashMap2 = new HashMap(2);
                hashMap2.put("deleteFileCount", String.valueOf(fileArr2.length));
                hashMap2.put("errorMsg", e.getMessage());
                GallerySamplingStatHelper.recordErrorEvent("file_handle", "error_execute_media_provider", hashMap2);
                Log.d("MediaFileUtils", "Done deleting %s files from provider, deleted %s files, check delete result %s\nOperation count %s,  affected %s rows", Integer.valueOf(fileArr2.length), Integer.valueOf(deleteFile), Integer.valueOf(i2), Integer.valueOf(arrayList.size()), Integer.valueOf(i));
                return i;
            }
        } else {
            i = 0;
        }
        Log.d("MediaFileUtils", "Done deleting %s files from provider, deleted %s files, check delete result %s\nOperation count %s,  affected %s rows", Integer.valueOf(fileArr2.length), Integer.valueOf(deleteFile), Integer.valueOf(i2), Integer.valueOf(arrayList.size()), Integer.valueOf(i));
        return i;
    }

    public static int deleteFileType(FileType fileType, File... fileArr) {
        if (fileType == null) {
            fileType = FileType.NORMAL;
        }
        switch (fileType) {
            case ORIGINAL:
                return deleteFile(3, fileArr);
            case NORMAL:
            case THUMBNAIL:
            case MICRO_THUMBNAIL:
            case TEMP:
            case UBI_SUB_FILE:
            case FOLDER:
                return deleteFile(1, fileArr);
            case NONE:
                return deleteFile(0, fileArr);
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Not supported file type ");
                sb.append(fileType);
                Log.w("MediaFileUtils", sb.toString());
                return 0;
        }
    }

    public static int deleteFileType(FileType fileType, String... strArr) {
        if (strArr == null || strArr.length <= 0) {
            return 0;
        }
        File[] fileArr = new File[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            if (!TextUtils.isEmpty(strArr[i])) {
                fileArr[i] = new File(strArr[i]);
            }
        }
        return deleteFileType(fileType, fileArr);
    }

    private static ComponentName getMediaComponentName(Intent intent) {
        if (sMediaComponent == null) {
            intent.setPackage("com.android.providers.media");
            PackageManager packageManager = GalleryApp.sGetAndroidContext().getPackageManager();
            if (packageManager != null) {
                List queryBroadcastReceivers = packageManager.queryBroadcastReceivers(intent, 0);
                if (queryBroadcastReceivers == null || queryBroadcastReceivers.size() <= 0) {
                    sMediaComponent = new ComponentName("", "");
                } else {
                    sMediaComponent = new ComponentName("com.android.providers.media", ((ResolveInfo) queryBroadcastReceivers.get(0)).activityInfo.name);
                }
            }
        }
        return sMediaComponent;
    }

    public static void triggerMediaScan(boolean z, File... fileArr) {
        if (fileArr != null && fileArr.length > 0) {
            for (File file : fileArr) {
                if (file != null) {
                    Intent intent = new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE", Uri.fromFile(file));
                    intent.putExtra("com.miui.gallery.extra.trigger_scan", z);
                    ComponentName mediaComponentName = getMediaComponentName(intent);
                    if (mediaComponentName != null && !TextUtils.isEmpty(mediaComponentName.getClassName())) {
                        intent.setComponent(mediaComponentName);
                    }
                    GalleryApp.sGetAndroidContext().sendBroadcast(intent);
                    Log.i("MediaFileUtils", "Trigger media scan for file %s, on system scan %s", file.getAbsolutePath(), Boolean.valueOf(z));
                }
            }
        }
    }
}
