package com.miui.gallery.util;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.cloud.CloudAlbumSortUtil;
import com.miui.gallery.cloud.CloudTableUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CloudUtils.Insertable;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.preference.GalleryPreferences;
import com.miui.gallery.preference.ThumbnailPreference;
import com.miui.gallery.provider.GalleryContract.Favorites;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.cache.SearchHistoryManager;
import com.miui.gallery.provider.cloudmanager.MediaRemarkManager;
import com.miui.gallery.provider.peoplecover.PeopleCoverManager;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.sdk.download.ImageDownloader;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.deprecated.Preference;
import java.io.File;
import java.util.ArrayList;
import java.util.Locale;

public class DeleteDataUtil {
    public static boolean delete(Context context, int i) {
        SyncUtil.stopSync(context);
        ImageDownloader.getInstance().cancelAll();
        boolean deleteDB = deleteDB(context, i) & deleteFile(context, i) & true & deletePreferences();
        MediaScannerUtil.scanAllAlbumDirectories(GalleryApp.sGetAndroidContext(), 5, true);
        return deleteDB;
    }

    private static boolean deleteDB(Context context, int i) {
        Preference.setSyncShouldClearDataBase(true);
        boolean resetCloudDataBase = resetCloudDataBase();
        if (resetCloudDataBase) {
            SyncLog.d("DeleteDataUtil", "delete cloud success");
            Preference.setSyncShouldClearDataBase(false);
        } else {
            SyncLog.e("DeleteDataUtil", "delete cloud failed");
        }
        boolean resetMediaRemarkInfo = resetCloudDataBase & resetMediaRemarkInfo();
        if (resetMediaRemarkInfo) {
            SyncLog.d("DeleteDataUtil", "delete MediaRemarkInfo end.");
        } else {
            SyncLog.e("DeleteDataUtil", "delete MediaRemarkInfo DB failed!");
        }
        boolean resetCloudControlData = resetMediaRemarkInfo & resetCloudControlData();
        if (resetCloudControlData) {
            SyncLog.d("DeleteDataUtil", "delete CloudControl DB end.");
        } else {
            SyncLog.e("DeleteDataUtil", "delete CloudControl DB failed!");
        }
        boolean resetFavoritesData = resetCloudControlData & resetFavoritesData();
        if (resetFavoritesData) {
            SyncLog.d("DeleteDataUtil", "delete Favorites DB end.");
        } else {
            SyncLog.e("DeleteDataUtil", "delete Favorites DB failed!");
        }
        CardManager.getInstance().onAccountDelete();
        PersistentResponseHelper.clearData();
        PeopleCoverManager.getInstance().onAccountDelete();
        SearchHistoryManager.getInstance().deleteAll();
        return resetFavoritesData;
    }

    private static boolean deleteFile(Context context, int i) {
        switch (i) {
            case 0:
                return true;
            case 1:
                return deleteHiddenFiles(context);
            case 2:
                return deleteSyncedFile(context);
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("unsupported policy: ");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    private static void deleteFileUnderSecretAlbum(String str) {
        if (ExtraTextUtils.endsWithIgnoreCase(FileUtils.getParentFolderPath(str), StorageUtils.DIRECTORY_SECRET_ALBUM_PATH)) {
            MediaFileUtils.deleteFile(new File(str));
            SyncLog.d("DeleteDataUtil", "Delete secret album file [%s]", (Object) str);
        }
    }

    private static boolean deleteHiddenFiles(Context context) {
        boolean z;
        String[] pathsInExternalStorage = StorageUtils.getPathsInExternalStorage(context, "MIUI/Gallery/cloud");
        if (pathsInExternalStorage != null) {
            z = true;
            for (String file : pathsInExternalStorage) {
                File[] listFiles = new File(file).listFiles();
                if (listFiles != null) {
                    boolean z2 = z;
                    for (File file2 : listFiles) {
                        if (!TextUtils.equals(file2.getName(), ".secretAlbum") && file2.isHidden()) {
                            boolean deleteFile = FileUtils.deleteFile(file2);
                            z2 &= deleteFile;
                            SyncLog.d("DeleteDataUtil", "delete %s result %s", file2.getName(), Boolean.valueOf(deleteFile));
                        }
                    }
                    z = z2;
                }
            }
        } else {
            z = true;
        }
        GalleryUtils.safeQuery(GalleryCloudUtils.CLOUD_URI, new String[]{"localFlag", "thumbnailFile", "localFile"}, "localGroupId = -1000 AND (localFlag != ?) AND (localFlag != ?)", new String[]{String.valueOf(7), String.valueOf(8)}, (String) null, (QueryHandler<T>) $$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ.INSTANCE);
        return z;
    }

    private static boolean deletePreferences() {
        IntentUtil.removeAllShortCutForBabyAlbums(GalleryApp.sGetAndroidContext());
        Preference.sRemoveCloudSettings();
        GalleryPreferences.sRemoveCloudSettings();
        ThumbnailPreference.clear();
        SyncLog.d("DeleteDataUtil", "removed cloud settings.");
        CloudAlbumSortUtil.sRemoveCloudAlbumSortByFactor();
        return true;
    }

    private static boolean deleteSyncedFile(Context context) {
        Uri[] uriArr = {GalleryCloudUtils.CLOUD_URI, GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, GalleryCloudUtils.SHARE_IMAGE_URI, GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI};
        final ArrayList arrayList = new ArrayList(100);
        final File[] fileArr = new File[100];
        for (Uri uri : uriArr) {
            String[] strArr = {"microthumbfile", "thumbnailFile", "localFile"};
            StringBuilder sb = new StringBuilder();
            sb.append("serverStatus = 'custom' AND (");
            sb.append(CloudTableUtils.sItemIsNotGroup);
            sb.append(")");
            GalleryUtils.safeQuery(uri, strArr, sb.toString(), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                public Void handle(Cursor cursor) {
                    if (cursor != null) {
                        while (cursor.moveToNext()) {
                            String string = cursor.getString(0);
                            String string2 = cursor.getString(1);
                            String string3 = cursor.getString(2);
                            if (string != null) {
                                arrayList.add(new File(string));
                            }
                            if (string2 != null) {
                                arrayList.add(new File(string2));
                            }
                            if (string3 != null) {
                                arrayList.add(new File(string3));
                            }
                            if (arrayList.size() + 3 > 100 || (cursor.isLast() && !arrayList.isEmpty())) {
                                arrayList.toArray(fileArr);
                                MediaFileUtils.deleteFileType(FileType.NORMAL, fileArr);
                                arrayList.clear();
                            }
                        }
                    }
                    return null;
                }
            });
        }
        return true;
    }

    static /* synthetic */ Object lambda$deleteHiddenFiles$43(Cursor cursor) {
        if (cursor != null) {
            while (cursor.moveToNext()) {
                String string = cursor.getString(1);
                String string2 = cursor.getString(2);
                if (!TextUtils.isEmpty(string2)) {
                    deleteFileUnderSecretAlbum(string2);
                }
                if (!TextUtils.isEmpty(string)) {
                    deleteFileUnderSecretAlbum(string);
                }
            }
        }
        return null;
    }

    private static boolean resetCloudControlData() {
        CloudControlManager.getInstance().clearCloudCache();
        for (String appendPath : GalleryDBHelper.getCloudControlTables()) {
            Uri build = GalleryCloudUtils.BASE_URI.buildUpon().appendPath(appendPath).build();
            int safeDelete = GalleryUtils.safeDelete(build, null, null);
            SyncLog.d("DeleteDataUtil", String.format("clean %s finished, deleted rows=%d", new Object[]{build, Integer.valueOf(safeDelete)}));
            if (safeDelete == -1) {
                return false;
            }
        }
        return true;
    }

    private static boolean resetCloudDataBase() {
        for (String appendPath : GalleryDBHelper.getCloudTables()) {
            Uri build = GalleryCloudUtils.BASE_URI.buildUpon().appendPath(appendPath).build();
            int safeDelete = GalleryUtils.safeDelete(build, null, null);
            SyncLog.d("DeleteDataUtil", String.format(Locale.US, "clean %s finished, deleted rows=%d", new Object[]{build, Integer.valueOf(safeDelete)}));
            if (safeDelete == -1) {
                return false;
            }
        }
        CloudUtils.addRecordsForCameraAndScreenshots(new Insertable() {
            public long insert(Uri uri, String str, String str2, ContentValues contentValues) {
                return GalleryUtils.safeInsert(uri, contentValues) == null ? 0 : 1;
            }
        });
        return true;
    }

    private static boolean resetFavoritesData() {
        int safeDelete = GalleryUtils.safeDelete(Favorites.URI, null, null);
        SyncLog.d("DeleteDataUtil", String.format(Locale.US, "clean favorites finished, deleted rows=%d", new Object[]{Integer.valueOf(safeDelete)}));
        return safeDelete != -1;
    }

    private static boolean resetMediaRemarkInfo() {
        return MediaRemarkManager.onAccountDelete();
    }
}
