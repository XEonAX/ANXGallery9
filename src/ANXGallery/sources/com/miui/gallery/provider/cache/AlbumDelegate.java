package com.miui.gallery.provider.cache;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.support.v4.util.LongSparseArray;
import com.miui.gallery.preference.GalleryPreferences.HiddenAlbum;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.MediaSortDateHelper;
import com.miui.gallery.provider.MediaSortDateHelper.SortDate;
import com.miui.gallery.provider.MediaSortDateHelper.SortDateProvider;
import com.miui.gallery.util.DebugUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Map;

public class AlbumDelegate {
    private static final Object INITIALIZATION_LOCK = new Object();
    private static final String[] PROJECTION = {"_id", "attributes", "localFile"};
    private LongSparseArray<Long> mAttributes = new LongSparseArray<>();
    private boolean mInitialized = false;
    private LongSparseArray<SortDate> mSortDate = new LongSparseArray<>();

    public AlbumDelegate() {
        this.mAttributes.put(-1000, Long.valueOf(1));
    }

    public void delete(long j) {
        Log.d(".provider.cache.AlbumDelegate", "delete album[%d] attributes", (Object) Long.valueOf(j));
        this.mAttributes.delete(j);
    }

    public SortDate getSortDate(long j) {
        return (SortDate) this.mSortDate.get(j, MediaSortDateHelper.getSortDateProvider().getDefaultSortDate());
    }

    public void insert(long j, long j2) {
        Log.d(".provider.cache.AlbumDelegate", "insert album[%d] attributes", (Object) Long.valueOf(j));
        this.mAttributes.put(j, Long.valueOf(j2));
    }

    public boolean isAutoUpload(long j) {
        return (((Long) this.mAttributes.get(j, Long.valueOf(0))).longValue() & 1) != 0;
    }

    public boolean isHidden(long j) {
        return (((Long) this.mAttributes.get(j, Long.valueOf(0))).longValue() & 16) != 0 && !HiddenAlbum.isShowHiddenAlbum();
    }

    public boolean isShowInHomePage(long j) {
        long longValue = ((Long) this.mAttributes.get(j, Long.valueOf(0))).longValue();
        boolean z = false;
        if (HiddenAlbum.isShowHiddenAlbum()) {
            if ((longValue & 4) != 0) {
                z = true;
            }
            return z;
        }
        if ((4 & longValue) != 0 && (longValue & 16) == 0) {
            z = true;
        }
        return z;
    }

    public void load(SQLiteDatabase sQLiteDatabase) {
        Cursor query;
        synchronized (INITIALIZATION_LOCK) {
            long currentTimeMillis = System.currentTimeMillis();
            try {
                query = sQLiteDatabase.query("cloud", PROJECTION, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (serverType=0)", null, null, null, null);
                if (query != null) {
                    SortDateProvider sortDateProvider = MediaSortDateHelper.getSortDateProvider();
                    query.moveToFirst();
                    while (!query.isAfterLast()) {
                        long j = query.getLong(0);
                        this.mAttributes.put(j, Long.valueOf(query.getLong(1)));
                        this.mSortDate.put(j, sortDateProvider.getSortDateByAlbumPath(query.getString(2)));
                        query.moveToNext();
                    }
                    Log.d(".provider.cache.AlbumDelegate", "loaded %d albums from cursor[%d]", Integer.valueOf(this.mAttributes.size()), Integer.valueOf(query.getCount()));
                } else {
                    Log.e(".provider.cache.AlbumDelegate", "fill provider failed with a null cursor");
                }
                if (query != null) {
                    query.close();
                }
                Log.d(".provider.cache.AlbumDelegate", "load attributes cost: %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                this.mInitialized = true;
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

    public Long queryAttributes(long j) {
        Long l;
        if (this.mInitialized) {
            return (Long) this.mAttributes.get(j, Long.valueOf(0));
        }
        Log.d(".provider.cache.AlbumDelegate", "not initialized, wait");
        synchronized (INITIALIZATION_LOCK) {
            l = (Long) this.mAttributes.get(j, Long.valueOf(0));
        }
        return l;
    }

    public void update(long j, long j2) {
        Log.d(".provider.cache.AlbumDelegate", "update album[%d] attributes", (Object) Long.valueOf(j));
        this.mAttributes.put(j, Long.valueOf(j2));
    }
}
