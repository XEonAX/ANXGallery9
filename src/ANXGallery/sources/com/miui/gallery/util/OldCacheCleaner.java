package com.miui.gallery.util;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.preference.GalleryPreferences.PrefKeys;
import com.miui.gallery.preference.PreferenceHelper;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.deprecated.Storage;
import com.miui.gallery.util.uil.BlobCache;
import java.io.File;

public class OldCacheCleaner {
    public static void clean() {
        if (!PreferenceHelper.getBoolean(PrefKeys.UPGRADE_OLD_CACHE_CLEANED, false)) {
            PreferenceHelper.putBoolean(PrefKeys.UPGRADE_OLD_CACHE_CLEANED, true);
            cleanThumbnailCache();
            cleanBlobCache();
            cleanTempFiles();
        }
    }

    private static void cleanBlobCache() {
        File[] fileArr;
        String[] strArr = {"imgcache", "rev_geocoding", "bookmark", "avatar", "internal_img_cache", "cover"};
        for (File file : new File[]{GalleryApp.sGetAndroidContext().getCacheDir(), GalleryApp.sGetAndroidContext().getExternalCacheDir()}) {
            if (file != null) {
                for (String str : strArr) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(file.getAbsolutePath());
                    sb.append(File.separator);
                    sb.append(str);
                    BlobCache.deleteFiles(sb.toString());
                }
            }
        }
    }

    private static void cleanTempFiles() {
        for (String str : Storage.getAllSdCardAvatarFilePath()) {
            MediaFileUtils.deleteFileType(FileType.TEMP, str);
        }
    }

    private static void cleanThumbnailCache() {
        String[] pathsInExternalStorage;
        for (String str : StorageUtils.getPathsInExternalStorage(GalleryApp.sGetAndroidContext(), "MIUI")) {
            FileType fileType = FileType.TEMP;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            sb.append(".cache/Gallery");
            MediaFileUtils.deleteFileType(fileType, sb.toString());
        }
    }
}
