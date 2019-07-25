package com.miui.gallery.provider.cache;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import com.google.common.collect.Sets;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.DebugUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Map;
import java.util.Set;

public class FavoritesDelegate {
    private static final Object INITIALIZATION_LOCK = new Object();
    private static final String[] PROJECTION = {"sha1"};
    private Set<String> mSha1Set = Sets.newConcurrentHashSet();

    public void insertToFavorites(String str) {
        if (!TextUtils.isEmpty(str)) {
            Log.d(".provider.cache.FavoritesDelegate", "insert sha1 [%s]", (Object) str);
            this.mSha1Set.add(str);
        }
    }

    public boolean isFavorite(String str) {
        return this.mSha1Set.contains(str);
    }

    public void load(SQLiteDatabase sQLiteDatabase) {
        Cursor query;
        synchronized (INITIALIZATION_LOCK) {
            long currentTimeMillis = System.currentTimeMillis();
            try {
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                query = sQLiteDatabase2.query("favorites", PROJECTION, "(isFavorite NOT NULL  AND isFavorite > 0) AND source = ? AND sha1 NOT NULL", new String[]{String.valueOf(1)}, null, null, null);
                if (query != null) {
                    query.moveToFirst();
                    while (!query.isAfterLast()) {
                        this.mSha1Set.add(query.getString(0));
                        query.moveToNext();
                    }
                    Log.d(".provider.cache.FavoritesDelegate", "loaded %d favorite sha1 from cursor [%d]", Integer.valueOf(this.mSha1Set.size()), Integer.valueOf(query.getCount()));
                } else {
                    Log.e(".provider.cache.FavoritesDelegate", "fill provider failed with a null cursor");
                }
                if (query != null) {
                    query.close();
                }
                Log.d(".provider.cache.FavoritesDelegate", "load favorite sha1 costs [%d]", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            } catch (SQLiteException e) {
                Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
                generatorCommonParams.put("dbversion", String.valueOf(sQLiteDatabase.getVersion()));
                StringBuilder sb = new StringBuilder();
                sb.append(e.getMessage());
                sb.append(" : ");
                sb.append(e.getCause());
                generatorCommonParams.put("exception", sb.toString());
                GallerySamplingStatHelper.recordErrorEvent("db_helper", "db_mediamanager_load", generatorCommonParams);
                DebugUtil.exportDB(false);
                GalleryDBHelper.getInstance().deleteDatabase();
                throw e;
            } catch (Throwable th) {
                if (query != null) {
                    query.close();
                }
                throw th;
            }
        }
    }

    public void removeFromFavorites(String str) {
        if (!TextUtils.isEmpty(str)) {
            Log.d(".provider.cache.FavoritesDelegate", "remove sha1 [%s]", (Object) str);
            this.mSha1Set.remove(str);
        }
    }
}
