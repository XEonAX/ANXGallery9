package com.miui.gallery.util;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.v4.content.ContextCompat;
import android.text.TextUtils;

public class WallpaperUtils {
    private static String sWallpagerPackage;

    private static Intent resolve(Context context, String str, String str2, String str3) {
        Intent intent = new Intent(str);
        intent.setComponent(new ComponentName(str2, str3));
        if (intent.resolveActivityInfo(context.getPackageManager(), 0) != null) {
            return intent;
        }
        return null;
    }

    public static void setWallPapers(Context context, Uri uri, String str) {
        Intent intent;
        if (!supported(context)) {
            Log.w("WallpaperUtils", "set wallpaper not supported");
            return;
        }
        if (sWallpagerPackage == "com.android.thememanager") {
            intent = new Intent("miui.intent.action.START_WALLPAPER_DETAIL");
            intent.setComponent(new ComponentName("com.android.thememanager", "com.android.thememanager.activity.WallpaperDetailActivity"));
            intent.putExtra("Wallpaper_uri", uri.toString());
            intent.putExtra(":miui:starting_window_label", "");
        } else {
            intent = new Intent("android.intent.action.ATTACH_DATA");
            intent.setComponent(new ComponentName("com.miui.home", "com.miui.home.launcher.setting.WallpaperPreviewActivity"));
            intent.putExtra("Wallpaper_uri", uri.toString());
        }
        context.startActivity(intent);
    }

    public static boolean supported(Context context) {
        if (sWallpagerPackage != null) {
            return !TextUtils.isEmpty(sWallpagerPackage);
        }
        if (resolve(context, "miui.intent.action.START_WALLPAPER_DETAIL", "com.android.thememanager", "com.android.thememanager.activity.WallpaperDetailActivity") != null && ContextCompat.checkSelfPermission(context, "miui.permission.USE_INTERNAL_GENERAL_API") == 0) {
            sWallpagerPackage = "com.android.thememanager";
            return true;
        } else if (resolve(context, "android.intent.action.ATTACH_DATA", "com.miui.home", "com.miui.home.launcher.setting.WallpaperPreviewActivity") != null) {
            sWallpagerPackage = "com.miui.home";
            return true;
        } else {
            sWallpagerPackage = "";
            return false;
        }
    }
}
