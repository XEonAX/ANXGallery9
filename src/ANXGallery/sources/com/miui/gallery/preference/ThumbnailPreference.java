package com.miui.gallery.preference;

import android.content.SharedPreferences;
import com.miui.gallery.GalleryApp;

public class ThumbnailPreference {
    private SharedPreferences mSharedPreferences;

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static ThumbnailPreference sInstance = new ThumbnailPreference();
    }

    private ThumbnailPreference() {
        this.mSharedPreferences = GalleryApp.sGetAndroidContext().getSharedPreferences("com.miui.gallery_thumbnails", 0);
    }

    public static boolean clear() {
        return getPreferences().edit().clear().commit();
    }

    public static boolean containsThumbnailKey(String str) {
        return getPreferences().contains(str);
    }

    private static SharedPreferences getPreferences() {
        return SingletonHolder.sInstance.mSharedPreferences;
    }

    public static void putThumbnailKey(String str) {
        getPreferences().edit().putString(str, "").commit();
    }
}
