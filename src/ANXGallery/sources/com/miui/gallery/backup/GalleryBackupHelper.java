package com.miui.gallery.backup;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.backup.GalleryBackupProtos.BackupMessage;
import com.miui.gallery.backup.GalleryBackupProtos.BackupMessage.AlbumProfile;
import com.miui.gallery.backup.GalleryBackupProtos.BackupMessage.Settings;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.preference.GalleryPreferences.HiddenAlbum;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.preference.GalleryPreferences.SlideShow;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StaticContext;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class GalleryBackupHelper {
    private static final String TAG = "GalleryBackupHelper";

    public static BackupMessage backup() {
        long currentTimeMillis = System.currentTimeMillis();
        HashMap hashMap = new HashMap();
        BackupMessage build = BackupMessage.newBuilder().setSettings(backupSettings()).addAllAlbumProfiles(backupAlbumProfiles(hashMap)).build();
        hashMap.put("costs", String.valueOf(System.currentTimeMillis() - currentTimeMillis));
        GallerySamplingStatHelper.recordCountEvent("local_backup", "full_backup", hashMap);
        return build;
    }

    private static List<AlbumProfile> backupAlbumProfiles(Map<String, String> map) {
        LinkedList linkedList = new LinkedList();
        Uri build = Album.URI.buildUpon().appendQueryParameter("fill_covers", "false").appendQueryParameter("exclude_empty_album", "true").build();
        SafeDBUtil.safeQuery(StaticContext.sGetAndroidContext(), build, new String[]{"local_path", "attributes", "name"}, "attributes & 48 <> 16", (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler(linkedList) {
            private final /* synthetic */ List f$0;

            {
                this.f$0 = r1;
            }

            public final Object handle(Cursor cursor) {
                return GalleryBackupHelper.lambda$backupAlbumProfiles$33(this.f$0, cursor);
            }
        });
        Log.i(TAG, "Backup %d album profiles", (Object) Integer.valueOf(linkedList.size()));
        map.put("album_count", String.valueOf(linkedList.size()));
        return linkedList;
    }

    private static Settings backupSettings() {
        return Settings.newBuilder().setOnlyShowLocalPhoto(LocalMode.isOnlyShowLocalPhoto()).setShowHiddenAlbum(HiddenAlbum.isShowHiddenAlbum()).setSlideshowInterval(SlideShow.getSlideShowInterval()).setRemindConnectNetworkEveryTime(CTA.remindConnectNetworkEveryTime()).build();
    }

    static /* synthetic */ Object lambda$backupAlbumProfiles$33(List list, Cursor cursor) {
        if (cursor == null || cursor.isClosed() || cursor.getCount() <= 0) {
            return null;
        }
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            list.add(AlbumProfile.newBuilder().setPath(cursor.getString(0)).setAttributes(cursor.getLong(1)).setName(cursor.getString(2)).build());
            cursor.moveToNext();
        }
        return null;
    }

    public static void restore(BackupMessage backupMessage) {
        if (backupMessage == null) {
            Log.w(TAG, "Backup message is null");
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        HashMap hashMap = new HashMap();
        restoreSettings(backupMessage.getSettings());
        restoreAlbumProfiles(backupMessage.getAlbumProfilesList());
        hashMap.put("costs", String.valueOf(System.currentTimeMillis() - currentTimeMillis));
        GallerySamplingStatHelper.recordCountEvent("local_backup", "full_restore", hashMap);
    }

    private static void restoreAlbumProfiles(List<AlbumProfile> list) {
        if (list == null || list.size() <= 0) {
            Log.i(TAG, "No album profile exists");
            return;
        }
        int i = 0;
        ContentValues contentValues = new ContentValues();
        for (AlbumProfile albumProfile : list) {
            if (!TextUtils.isEmpty(albumProfile.getPath())) {
                contentValues.clear();
                contentValues.put("attributes", Long.valueOf(albumProfile.getAttributes()));
                if (!TextUtils.isEmpty(albumProfile.getName())) {
                    contentValues.put("fileName", albumProfile.getName());
                }
                MediaScanner.updateOrInsertAlbum(StaticContext.sGetAndroidContext(), albumProfile.getPath(), contentValues);
                i++;
            }
        }
        if (i > 0) {
            GalleryPreferences.MediaScanner.recordAlbumRestoreTimeMillis();
        }
        Log.i(TAG, "Restore %d album profiles", (Object) Integer.valueOf(i));
    }

    private static void restoreSettings(Settings settings) {
        if (settings != null) {
            LocalMode.setOnlyShowLocalPhoto(settings.getOnlyShowLocalPhoto());
            HiddenAlbum.setShowHiddenAlbum(settings.getShowHiddenAlbum());
            SlideShow.setSlideShowInterval(settings.getSlideshowInterval());
        }
    }
}
