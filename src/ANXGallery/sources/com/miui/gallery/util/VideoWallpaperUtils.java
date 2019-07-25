package com.miui.gallery.util;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import com.miui.os.Rom;
import com.nexstreaming.nexeditorsdk.nexExportFormat;

public class VideoWallpaperUtils {
    private static boolean sSupported = (!Rom.IS_INTERNATIONAL && Rom.IS_MIUI && !BuildUtil.isTablet() && !BuildUtil.isPad() && MiscUtil.getAppVersionCode("com.android.thememanager") >= 490);

    public static boolean isSupported() {
        return sSupported;
    }

    public static void setVideoWallpaper(Context context, String str) {
        try {
            Intent intent = new Intent("miui.intent.action.START_VIDEO_DETAIL");
            intent.addCategory("android.intent.category.DEFAULT");
            intent.putExtra(nexExportFormat.TAG_FORMAT_PATH, str);
            intent.putExtra("miref", "com.miui.gallery");
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("video", "set_as_video_wallpaper");
        } catch (ActivityNotFoundException e) {
            Log.w("VideoWallpaperUtils", (Throwable) e);
            GallerySamplingStatHelper.recordCountEvent("video", "set_slide_wallpaper_fail");
        }
    }
}
