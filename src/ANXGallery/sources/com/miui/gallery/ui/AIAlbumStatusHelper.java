package com.miui.gallery.ui;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.preference.GalleryPreferences.Face;
import com.miui.gallery.preference.GalleryPreferences.Search;
import com.miui.gallery.preference.GalleryPreferences.SettingsSync;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.core.source.server.OpenSearchRequest;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import com.miui.os.Rom;

public class AIAlbumStatusHelper {
    public static void doPostCloudControlJob() {
        if (!CloudControlStrategyHelper.getSearchStrategy().isAIAlbumEnabled() && CloudControlManager.getInstance().queryFeatureStatus("search-auto-open-search") == Status.ENABLE) {
            SearchStatUtils.reportEvent("from_cloud_control", "auto_request_open_search", "result", SearchConstants.isErrorStatus(OpenSearchRequest.request()) ? "failed" : "succeeded", "device", Build.DEVICE);
        }
    }

    public static int getOpenApiSearchStatus() {
        int i = 0;
        if (!isLocalSearchOpen(true)) {
            return 0;
        }
        if (isCloudControlSearchAIAlbumOpen()) {
            return 1;
        }
        if (isLocalSearchOpen(false)) {
            i = 2;
        }
        return i;
    }

    private static boolean internalSetFaceAlbumStatus(boolean z) {
        if (isFaceSwitchSet() && isFaceAlbumEnabled() == z) {
            return false;
        }
        Face.setFaceSwitchStatus(z);
        SettingsSync.markDirty(true);
        return true;
    }

    private static boolean internalSetLocalSearchStatus(boolean z) {
        if (isLocalSearchSet() && z == isLocalSearchOpen(true)) {
            return false;
        }
        Search.setIsUserSearchSwitchOpen(z);
        SettingsSync.markDirty(true);
        return true;
    }

    public static boolean isAIAlbumEnabled() {
        return isFaceAlbumEnabled() || isLocalSearchOpen(true);
    }

    public static boolean isCloudControlSearchAIAlbumOpen() {
        return CloudControlStrategyHelper.getSearchStrategy().isAIAlbumEnabled();
    }

    public static boolean isCloudControlSearchBarOpen() {
        return CloudControlStrategyHelper.getSearchStrategy().isSearchBarEnabled();
    }

    public static boolean isFaceAlbumEnabled() {
        return Face.getFaceSwitchEnabled();
    }

    public static boolean isFaceSwitchSet() {
        return Face.isFaceSwitchSet();
    }

    public static boolean isLocalSearchOpen(boolean z) {
        return Search.isUserSearchSwitchOpen(z);
    }

    public static boolean isLocalSearchSet() {
        return Search.isUserSearchSwitchSet();
    }

    private static void notifyAIAlbumStatusChanged(Context context, boolean z) {
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent("com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"));
    }

    private static void notifyFaceAlbumStatusChange(Context context, boolean z) {
        context.getContentResolver().notifyChange(Album.URI, null, false);
        context.getContentResolver().notifyChange(PeopleFace.PERSONS_URI, null, false);
    }

    private static void notifySearchStatusChanged(boolean z) {
    }

    public static void registerAIAlbumStatusReceiver(Context context, BroadcastReceiver broadcastReceiver) {
        LocalBroadcastManager.getInstance(context).registerReceiver(broadcastReceiver, new IntentFilter("com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"));
    }

    public static void requestOpenCloudControlSearch(String str) {
        if (!isLocalSearchOpen(true)) {
            Log.w("AIAlbumStatusHelper", "Local search switch is off, no need to request open cloud search.");
            return;
        }
        long userLastRequestOpenTime = Search.getUserLastRequestOpenTime();
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - userLastRequestOpenTime > 600000) {
            ThreadManager.getMiscPool().submit(new Job<Void>() {
                public Void run(JobContext jobContext) {
                    Search.setIsUserSearchSwitchOpen(true);
                    OpenSearchRequest.request();
                    return null;
                }
            });
            Search.setUserLastRequestOpenTime(currentTimeMillis);
        } else {
            Log.w("AIAlbumStatusHelper", "Ignore open search request, too frequent.");
        }
        SearchStatUtils.reportEvent(str, "auto_request_open_search");
    }

    public static void setAIAlbumLocalStatus(Context context, boolean z) {
        boolean z2;
        if (internalSetLocalSearchStatus(z)) {
            notifySearchStatusChanged(z);
            z2 = true;
        } else {
            z2 = false;
        }
        if (internalSetFaceAlbumStatus(z)) {
            notifyFaceAlbumStatusChange(context, z);
            z2 = true;
        }
        if (z2) {
            notifyAIAlbumStatusChanged(context, z);
        }
    }

    public static void setFaceAlbumStatus(Context context, boolean z) {
        if (internalSetFaceAlbumStatus(z)) {
            notifyFaceAlbumStatusChange(context, z);
            notifyAIAlbumStatusChanged(context, z);
        }
    }

    public static void setLocalSearchStatus(Context context, boolean z) {
        if (internalSetLocalSearchStatus(z)) {
            notifySearchStatusChanged(z);
            notifyAIAlbumStatusChanged(context, z);
        }
    }

    public static void unregisterAIAlbumStatusReceiver(Context context, BroadcastReceiver broadcastReceiver) {
        LocalBroadcastManager.getInstance(context).unregisterReceiver(broadcastReceiver);
    }

    public static boolean useNewAIAlbumSwitch() {
        return !Rom.IS_INTERNATIONAL || isCloudControlSearchAIAlbumOpen();
    }
}
