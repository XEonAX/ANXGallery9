package com.miui.gallery.assistant.library;

import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyCheckHelper;
import com.miui.gallery.net.download.Verifier.Sha1;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.PhotoMovieEntranceUtils;
import java.io.File;

public class LibraryUtils {
    public static Long[] concat(Long[] lArr, Long[] lArr2) {
        if (lArr == null || lArr.length == 0) {
            return lArr2;
        }
        if (lArr2 == null || lArr2.length == 0) {
            return lArr;
        }
        Long[] lArr3 = new Long[(lArr.length + lArr2.length)];
        System.arraycopy(lArr, 0, lArr3, 0, lArr.length);
        System.arraycopy(lArr2, 0, lArr3, lArr.length, lArr2.length);
        return lArr3;
    }

    static Long[] getAllLibraries() {
        Long[] lArr = new Long[0];
        if (PhotoMovieEntranceUtils.isPhotoMovieAvailable()) {
            lArr = concat(lArr, LibraryConstants.sPhotoMovieLibraries);
        }
        if (SkyCheckHelper.isSkyEnable()) {
            lArr = concat(lArr, LibraryConstants.sSkyTransferLibraries);
        }
        return ImageFeatureManager.isStoryGenerateEnable() ? concat(lArr, LibraryConstants.sStoryLibraries) : ImageFeatureManager.isImageFeatureCalculationEnable() ? concat(lArr, LibraryConstants.sImageFeatureSelectionLibraries) : lArr;
    }

    static String getCurrentAbi() {
        if (VERSION.SDK_INT < 21) {
            return Build.CPU_ABI;
        }
        String[] strArr = Build.SUPPORTED_ABIS;
        String[] strArr2 = Build.SUPPORTED_64_BIT_ABIS;
        return (strArr2 == null || strArr2.length <= 0) ? strArr[0] : strArr2[0];
    }

    public static String getLibraryDirPath(Context context) {
        return context.getDir("libs", 0).getAbsolutePath();
    }

    static boolean isLibraryItemExist(Context context, LibraryItem libraryItem) {
        boolean z = false;
        if (context == null || libraryItem == null) {
            return false;
        }
        File file = new File(libraryItem.getTargetPath(context));
        Sha1 sha1 = new Sha1(libraryItem.getSha1());
        if (file.exists() && sha1.verify(FileUtils.getFileSha1(file.getAbsolutePath()))) {
            z = true;
        }
        return z;
    }
}
