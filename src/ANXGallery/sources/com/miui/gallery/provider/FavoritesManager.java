package com.miui.gallery.provider;

import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.model.FavoriteInfo;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Favorites;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StorageUtils;

public class FavoritesManager {
    private static final String[] PROJECTION = {"_id", "sha1", "localGroupId", "size"};
    private static String TAG = "FavoritesManager";

    private static Cursor queryCloudItemByPath(Context context, String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (FileUtils.isFileExist(str)) {
            try {
                UserCommentData userCommentData = ExifUtil.getUserCommentData(str);
                CharSequence sha1 = userCommentData != null ? userCommentData.getSha1() : null;
                String relativePath = StorageUtils.getRelativePath(context, FileUtils.getParentFolderPath(str));
                if (TextUtils.isEmpty(relativePath)) {
                    Log.w(TAG, "Could't get album path for %s", str);
                    return null;
                } else if (TextUtils.isEmpty(sha1)) {
                    Cursor query = context.getContentResolver().query(Cloud.CLOUD_URI, PROJECTION, "fileName LIKE ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)", new String[]{FileUtils.getFileName(str), relativePath}, null);
                    if (!z || query == null || !query.moveToFirst() || query.getLong(3) == FileUtils.getFileSize(str)) {
                        return query;
                    }
                    Log.w(TAG, "file size not equals, can not favorite: %s", str);
                    MiscUtil.closeSilently(query);
                    return null;
                } else {
                    return context.getContentResolver().query(Cloud.CLOUD_URI, PROJECTION, "sha1 = ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)", new String[]{sha1, relativePath}, null);
                }
            } catch (Exception e) {
                Log.w("StorageItem", "exif exifSha1 read fail %s", e);
                return null;
            }
        } else {
            return context.getContentResolver().query(Cloud.CLOUD_URI, PROJECTION, "(localFile LIKE ? or thumbnailFile LIKE ?) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{str, str}, null);
        }
    }

    public static FavoriteInfo queryFavoriteInfoByFilePath(String str, boolean z) {
        Throwable th;
        Exception e;
        FavoriteInfo favoriteInfo = new FavoriteInfo();
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Cursor cursor = null;
        try {
            Cursor cursor2 = !TextUtils.isEmpty(str) ? queryCloudItemByPath(sGetAndroidContext, str, z) : null;
            if (cursor2 != null) {
                try {
                    if (cursor2.moveToFirst()) {
                        boolean z2 = false;
                        favoriteInfo.setFavoriteUsable(!(cursor2.getLong(2) == -1000));
                        if (favoriteInfo.isFavoriteUsable()) {
                            Integer num = (Integer) SafeDBUtil.safeQuery(sGetAndroidContext, Favorites.URI, new String[]{"isFavorite"}, "sha1 = ?", new String[]{cursor2.getString(1)}, (String) null, (QueryHandler<T>) new QueryHandler<Integer>() {
                                public Integer handle(Cursor cursor) {
                                    return (cursor == null || !cursor.moveToFirst()) ? Integer.valueOf(0) : Integer.valueOf(cursor.getInt(0));
                                }
                            });
                            if (num != null && num.intValue() > 0) {
                                z2 = true;
                            }
                            favoriteInfo.setFavorite(z2);
                        }
                    }
                } catch (Exception e2) {
                    e = e2;
                    cursor = cursor2;
                    try {
                        Log.e(TAG, (Throwable) e);
                        MiscUtil.closeSilently(cursor);
                        return favoriteInfo;
                    } catch (Throwable th2) {
                        th = th2;
                        cursor2 = cursor;
                        MiscUtil.closeSilently(cursor2);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    MiscUtil.closeSilently(cursor2);
                    throw th;
                }
            }
            MiscUtil.closeSilently(cursor2);
        } catch (Exception e3) {
            e = e3;
            Log.e(TAG, (Throwable) e);
            MiscUtil.closeSilently(cursor);
            return favoriteInfo;
        }
        return favoriteInfo;
    }
}
