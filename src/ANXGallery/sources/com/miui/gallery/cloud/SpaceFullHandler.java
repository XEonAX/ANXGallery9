package com.miui.gallery.cloud;

import android.content.ComponentName;
import android.content.pm.PackageManager;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Utils;
import com.miui.gallery.util.deprecated.Preference;
import java.util.HashMap;

public class SpaceFullHandler {
    private static OwnerSpaceFullListener sOwnerSpaceFullListener;
    private static SharerSpaceFullListener sSharerSpaceFullListener;
    static HashMap<String, Boolean> sSpaceFullMap = new HashMap<>();

    static class OwnerSpaceFullListener implements SpaceFullListener {
        OwnerSpaceFullListener() {
        }

        public void handleSpaceFullError(RequestCloudItem requestCloudItem) {
            SpaceFullHandler.setOwnerSpaceFull();
        }

        public void handleSpaceNotFull(RequestCloudItem requestCloudItem) {
            SpaceFullHandler.removeOwnerSpaceFull();
        }

        public boolean isSpaceFull(RequestCloudItem requestCloudItem) {
            return SpaceFullHandler.isOwnerSpaceFull();
        }
    }

    static class SharerSpaceFullListener implements SpaceFullListener {
        SharerSpaceFullListener() {
        }

        public void handleSpaceFullError(RequestCloudItem requestCloudItem) {
            SpaceFullHandler.setSharerSpaceFull(requestCloudItem.dbCloud.getAlbumId());
        }

        public void handleSpaceNotFull(RequestCloudItem requestCloudItem) {
            SpaceFullHandler.removeSharerSpaceFull(requestCloudItem.dbCloud.getAlbumId());
        }

        public boolean isSpaceFull(RequestCloudItem requestCloudItem) {
            return SpaceFullHandler.isSharerSpaceFull(requestCloudItem.dbCloud.getAlbumId());
        }
    }

    public interface SpaceFullListener {
        void handleSpaceFullError(RequestCloudItem requestCloudItem);

        void handleSpaceNotFull(RequestCloudItem requestCloudItem);

        boolean isSpaceFull(RequestCloudItem requestCloudItem);
    }

    public static OwnerSpaceFullListener getOwnerSpaceFullListener() {
        if (sOwnerSpaceFullListener == null) {
            sOwnerSpaceFullListener = new OwnerSpaceFullListener();
        }
        return sOwnerSpaceFullListener;
    }

    public static SharerSpaceFullListener getSharerSpaceFullListener() {
        if (sSharerSpaceFullListener == null) {
            sSharerSpaceFullListener = new SharerSpaceFullListener();
        }
        return sSharerSpaceFullListener;
    }

    public static synchronized boolean isOwnerSpaceFull() {
        boolean sGetCloudGallerySpaceFull;
        synchronized (SpaceFullHandler.class) {
            sGetCloudGallerySpaceFull = Preference.sGetCloudGallerySpaceFull();
        }
        return sGetCloudGallerySpaceFull;
    }

    public static synchronized boolean isSharerSpaceFull(String str) {
        synchronized (SpaceFullHandler.class) {
            Boolean bool = (Boolean) sSpaceFullMap.get(str);
            if (bool == null) {
                return false;
            }
            boolean booleanValue = bool.booleanValue();
            return booleanValue;
        }
    }

    public static synchronized void removeOwnerSpaceFull() {
        synchronized (SpaceFullHandler.class) {
            Preference.sSetCloudGallerySpaceFull(false);
            setMiCloudStatusInfoReceiverEnabledSetting(false);
        }
    }

    public static synchronized void removeSharerSpaceFull(String str) {
        synchronized (SpaceFullHandler.class) {
            Log.d("SpaceFullHandler", "%s, remove shareAlbum: %s space full.", new Throwable().getStackTrace()[1].getClassName(), Utils.desensitizeShareAlbumId(str));
            sSpaceFullMap.put(str, Boolean.valueOf(false));
        }
    }

    private static void setMiCloudStatusInfoReceiverEnabledSetting(boolean z) {
        PackageManager packageManager = GalleryApp.sGetAndroidContext().getPackageManager();
        ComponentName componentName = new ComponentName(GalleryApp.sGetAndroidContext(), MiCloudStatusInfoReceiver.class);
        int i = z ? 1 : 2;
        if (i != packageManager.getComponentEnabledSetting(componentName)) {
            packageManager.setComponentEnabledSetting(componentName, i, 1);
        }
    }

    public static synchronized void setOwnerSpaceFull() {
        synchronized (SpaceFullHandler.class) {
            String className = new Throwable().getStackTrace()[1].getClassName();
            StringBuilder sb = new StringBuilder();
            sb.append(className);
            sb.append(" set owner space full.");
            Log.d("SpaceFullHandler", sb.toString());
            Preference.sSetCloudGallerySpaceFull(true);
            setMiCloudStatusInfoReceiverEnabledSetting(true);
        }
    }

    public static synchronized void setSharerSpaceFull(String str) {
        synchronized (SpaceFullHandler.class) {
            Log.d("SpaceFullHandler", "%s, set shareAlbum: %s space full.", new Throwable().getStackTrace()[1].getClassName(), Utils.desensitizeShareAlbumId(str));
            sSpaceFullMap.put(str, Boolean.valueOf(true));
        }
    }
}
