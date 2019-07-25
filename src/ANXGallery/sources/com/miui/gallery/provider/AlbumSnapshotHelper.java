package com.miui.gallery.provider;

import android.content.Context;
import android.database.Cursor;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.dao.GalleryLiteEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.EntityTransaction;
import com.miui.gallery.loader.AlbumConvertCallback;
import com.miui.gallery.model.Album;
import com.miui.gallery.model.AlbumConstants;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class AlbumSnapshotHelper {
    /* JADX INFO: finally extract failed */
    public static synchronized int persist(List<Album> list) {
        int i;
        synchronized (AlbumSnapshotHelper.class) {
            i = 0;
            if (list != Collections.EMPTY_LIST) {
                long currentTimeMillis = System.currentTimeMillis();
                Collections.sort(list, $$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY.INSTANCE);
                EntityTransaction transaction = GalleryLiteEntityManager.getInstance().getTransaction();
                transaction.begin();
                try {
                    GalleryLiteEntityManager.getInstance().deleteAll(Album.class);
                    for (Album album : list) {
                        if (album.getClass() == Album.class) {
                            if (album.getAlbumClassification() == 0) {
                                i += GalleryLiteEntityManager.getInstance().insert((Entity) album) ? 1 : 0;
                                if (i >= 180) {
                                    break;
                                }
                            }
                        }
                    }
                    transaction.commit();
                    transaction.end();
                    long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                    Log.d("AlbumSnapshotHelper", "Save snapshot for [%d] albums costs [%dms]", Integer.valueOf(i), Long.valueOf(currentTimeMillis2));
                    HashMap hashMap = new HashMap();
                    hashMap.put("album_count", String.valueOf(i));
                    hashMap.put("costs", String.valueOf(currentTimeMillis2));
                    GallerySamplingStatHelper.recordCountEvent("album", "album_snapshot_save_time", hashMap);
                } catch (Throwable th) {
                    transaction.end();
                    throw th;
                }
            } else {
                GalleryLiteEntityManager.getInstance().deleteAll(Album.class);
            }
        }
        return i;
    }

    public static void queryAndPersist(Context context) {
        Cursor cursor;
        Exception e;
        try {
            cursor = context.getContentResolver().query(GalleryContract.Album.URI.buildUpon().appendQueryParameter("join_face", String.valueOf(AccountCache.getAccount() != null)).appendQueryParameter("join_video", "true").appendQueryParameter("join_share", "true").appendQueryParameter("join_recent", "true").appendQueryParameter("join_favorites", "true").appendQueryParameter("exclude_empty_album", "true").appendQueryParameter("fill_covers", "true").build(), AlbumConstants.PROJECTION, "classification = 0", null, null);
            try {
                persist(new AlbumConvertCallback().convert(cursor));
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Exception e3) {
            e = e3;
            cursor = null;
            try {
                Log.e("AlbumSnapshotHelper", (Throwable) e);
                MiscUtil.closeSilently(cursor);
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            MiscUtil.closeSilently(cursor);
            throw th;
        }
        MiscUtil.closeSilently(cursor);
    }
}
