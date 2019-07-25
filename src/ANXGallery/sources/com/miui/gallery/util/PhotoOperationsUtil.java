package com.miui.gallery.util;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.Config.SecretAlbumConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.data.LocationUtil;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.miui.os.Rom;
import com.nexstreaming.nexeditorsdk.nexEngine;

public class PhotoOperationsUtil {
    public static int getImageSupportedOperations(String str, String str2, double d, double d2) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        int i = WallpaperUtils.supported(sGetAndroidContext) ? 5637164 : 5637132;
        if (!Rom.IS_INTERNATIONAL && Rom.IS_MIUI) {
            i |= 2048;
        }
        if (!TextUtils.isEmpty(str) && StorageUtils.isInExternalStorage(sGetAndroidContext, str)) {
            i |= 1;
            if (!TextUtils.equals(str2, "image/gif") && !DownloadPathHelper.isShareFolderRelativePath(StorageUtils.getRelativePath(sGetAndroidContext, str))) {
                i |= 512;
            }
        }
        if (FileMimeUtil.isGifFromMimeType(str2)) {
            i = i & -33 & -2049;
        }
        if (BitmapUtils.isSupportedByRegionDecoder(str2)) {
            i |= 64;
        }
        if (BitmapUtils.isRotationSupported(str2)) {
            i |= 2;
        }
        if (LocationUtil.isValidateCoordinate(d, d2)) {
            i |= 16;
        }
        return ApplicationHelper.isSecretAlbumFeatureOpen() ? i | nexEngine.ExportHEVCHighTierLevel61 : i;
    }

    public static int getVideoSupportedOperations(String str) {
        int i = VideoWallpaperUtils.isSupported() ? 1053828 : 1049732;
        if (TextUtils.isEmpty(str) || !StorageUtils.isInExternalStorage(GalleryApp.sGetAndroidContext(), str)) {
            return i;
        }
        int i2 = i | 1 | 512;
        return (!ApplicationHelper.isSecretAlbumFeatureOpen() || !SecretAlbumConfig.isVideoSupported()) ? i2 : i2 | nexEngine.ExportHEVCHighTierLevel61;
    }

    public static boolean isSupportedOptions(int i, int i2) {
        return (i & i2) != 0;
    }
}
