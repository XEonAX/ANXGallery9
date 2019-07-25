package com.miui.gallery.util;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.miui.gallery.provider.GalleryOpenProvider;

public class SlideWallpaperUtils {
    public static void setSlideWallpaper(Context context, Uri uri, String str) {
        Intent intent;
        try {
            if (!supported(context)) {
                intent = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.mfashiongallery.emag&back=true&ref=MiuiGallery&startDownload=true"));
            } else {
                Intent intent2 = new Intent("android.intent.action.VIEW");
                Uri translateToContent = GalleryOpenProvider.translateToContent(uri.getPath());
                intent2.setData(Uri.parse("mifg://fashiongallery/addcw?from=MiuiGallery").buildUpon().appendQueryParameter("uri", translateToContent.toString()).appendQueryParameter("sha1", str).build());
                context.grantUriPermission("com.mfashiongallery.emag", translateToContent, 1);
                intent = intent2;
            }
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("photo", "set_as_slide_wallpaper");
        } catch (ActivityNotFoundException e) {
            Log.w("SlideWallpaperUtils", (Throwable) e);
            GallerySamplingStatHelper.recordCountEvent("photo", "set_slide_wallpaper_fail");
        }
    }

    private static boolean supported(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse("mifg://fashiongallery/addcw?uri=/DCIM/Camera/IMG.jpg&from=test"));
        return intent.resolveActivityInfo(context.getPackageManager(), 0) != null;
    }
}
