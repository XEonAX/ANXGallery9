package com.miui.gallery.cloud;

import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.data.DBShareAlbum;
import com.miui.gallery.data.DBShareSubUbiImage;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class DownloadPathHelper {
    public static String addPostfixToFileName(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(FileUtils.getFileNameWithoutExtension(str));
        sb.append("_");
        sb.append(str2);
        String sb2 = sb.toString();
        String extension = FileUtils.getExtension(str);
        if (TextUtils.isEmpty(extension)) {
            return sb2;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(".");
        sb3.append(extension);
        return sb3.toString();
    }

    public static List<String> getAllFilePathForRead(String[] strArr, String str) {
        ArrayList arrayList = new ArrayList();
        if (strArr != null) {
            for (String str2 : strArr) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(File.separator);
                sb.append(str);
                String sb2 = sb.toString();
                if (new File(sb2).exists()) {
                    arrayList.add(sb2);
                }
            }
        }
        return arrayList;
    }

    public static String getDownloadFileNameNotSecret(DBImage dBImage, String str) {
        if (dBImage == null) {
            Log.e("DownloadPathHelper", "dbImage is null!");
            return "";
        } else if (!dBImage.isShareItem()) {
            return str;
        } else {
            if (dBImage.isSubUbiFocus()) {
                dBImage = CloudUtils.getItem(GalleryCloudUtils.SHARE_IMAGE_URI, GalleryApp.sGetAndroidContext(), "_id", ((DBShareSubUbiImage) dBImage).getUbiLocalId());
                if (dBImage == null) {
                    Log.e("DownloadPathHelper", "mainDBImage is null!");
                    return "";
                }
            }
            String albumId = dBImage.getAlbumId();
            if (TextUtils.isEmpty(albumId)) {
                DBShareAlbum dBShareAlbumByLocalId = CloudUtils.getDBShareAlbumByLocalId(dBImage.getLocalGroupId());
                if (dBShareAlbumByLocalId == null) {
                    Log.e("DownloadPathHelper", "dbShareAlbum should not be null!");
                    return "";
                }
                albumId = dBShareAlbumByLocalId.getAlbumId();
            }
            return addPostfixToFileName(str, albumId);
        }
    }

    public static String getDownloadFolderPath(DBImage dBImage) {
        String downloadFolderRelativePath = getDownloadFolderRelativePath(dBImage);
        return downloadFolderRelativePath == null ? "" : StorageUtils.getSafePathInPriorStorage(downloadFolderRelativePath);
    }

    public static String getDownloadFolderRelativePath(DBImage dBImage) {
        String str;
        String str2;
        String str3;
        if (dBImage == null) {
            Log.e("DownloadPathHelper", "dbImage is null!");
            return null;
        }
        if (dBImage.isShareItem()) {
            str = "MIUI/Gallery/cloud/sharer";
        } else {
            if (dBImage.getServerType() != 0 || TextUtils.isEmpty(dBImage.getLocalFile())) {
                if (dBImage.getServerType() == 0) {
                    str3 = dBImage.getId();
                    str2 = dBImage.getServerId();
                } else {
                    str3 = dBImage.getLocalGroupId();
                    str2 = String.valueOf(dBImage.getGroupId());
                }
                if (CloudTableUtils.isCameraGroup(str2)) {
                    str = CloudUtils.getCameraLocalFile();
                } else if (CloudTableUtils.isScreenshotGroup(str2)) {
                    str = CloudUtils.getScreenshotsLocalFile();
                } else if (CloudTableUtils.isSecretAlbum(str2, str3)) {
                    str = StorageUtils.DIRECTORY_SECRET_ALBUM_PATH;
                } else if (dBImage.getServerType() != 0) {
                    return getDownloadFolderRelativePath(CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, GalleryApp.sGetAndroidContext(), "_id", str3));
                } else {
                    str = CloudUtils.getOwnerAlbumLocalFile(dBImage.getFileName(), dBImage.getAppKey());
                }
            } else {
                str = dBImage.getLocalFile();
            }
            if (TextUtils.equals(str, StorageUtils.KEY_FOR_EMPTY_RELATIVE_PATH)) {
                return "";
            }
        }
        if (dBImage.isSubUbiFocus()) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            sb.append(".ubifocus");
            str = sb.toString();
        }
        return str;
    }

    public static String getFilePathForRead(String str, String str2) {
        return str == null ? "" : getFilePathForRead(StorageUtils.getPathsInExternalStorage(GalleryApp.sGetAndroidContext(), str), str2);
    }

    public static String getFilePathForRead(String[] strArr, String str) {
        if (strArr != null) {
            for (String str2 : strArr) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(File.separator);
                sb.append(str);
                String sb2 = sb.toString();
                if (new File(sb2).exists()) {
                    return sb2;
                }
            }
        }
        return "";
    }

    public static String getFolderRelativePathInCloud(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("MIUI/Gallery/cloud/owner");
        sb.append(File.separator);
        sb.append(str);
        return sb.toString().toLowerCase();
    }

    public static String getOriginDownloadFileNameNotSecret(DBImage dBImage) {
        if (dBImage != null) {
            return getDownloadFileNameNotSecret(dBImage, dBImage.getFileName());
        }
        Log.e("DownloadPathHelper", "dbImage is null!");
        return "";
    }

    public static String getShareFolderRelativePathInCloud() {
        return "MIUI/Gallery/cloud/sharer";
    }

    public static String getThumbnailDownloadFileNameNotSecret(DBImage dBImage) {
        if (dBImage == null) {
            Log.e("DownloadPathHelper", "dbImage is null!");
            return "";
        }
        String fileNameWithoutExtension = FileUtils.getFileNameWithoutExtension(getDownloadFileNameNotSecret(dBImage, dBImage.getFileName()));
        StringBuilder sb = new StringBuilder();
        sb.append(fileNameWithoutExtension);
        sb.append(".jpg");
        return sb.toString();
    }

    public static boolean isShareFolderRelativePath(String str) {
        return ExtraTextUtils.startsWithIgnoreCase(str, "MIUI/Gallery/cloud/sharer");
    }
}
