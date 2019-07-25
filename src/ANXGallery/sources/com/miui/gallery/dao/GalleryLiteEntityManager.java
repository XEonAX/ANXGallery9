package com.miui.gallery.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.dao.base.EntityManager;
import com.miui.gallery.model.Album;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.face.PeopleItem;

public class GalleryLiteEntityManager extends EntityManager {

    private static class SingletonHolder {
        static final GalleryLiteEntityManager INSTANCE = new GalleryLiteEntityManager();
    }

    private GalleryLiteEntityManager() {
        super(GalleryApp.sGetAndroidContext(), "gallery_lite.db", 1);
    }

    public static GalleryLiteEntityManager getInstance() {
        return SingletonHolder.INSTANCE;
    }

    /* access modifiers changed from: protected */
    public void onDatabaseDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        Log.w("GalleryLiteEntityManager", "onDatabaseDowngrade from %s to %s", Integer.valueOf(i), Integer.valueOf(i2));
    }

    /* access modifiers changed from: protected */
    public void onDatabaseUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        Log.i("GalleryLiteEntityManager", "onDatabaseUpgrade: from %d to %d", Integer.valueOf(i), Integer.valueOf(i2));
    }

    /* access modifiers changed from: protected */
    public void onInitTableList() {
        addTable(Album.class);
        addTable(PeopleItem.class);
    }

    public void warmUp() {
        long currentTimeMillis = System.currentTimeMillis();
        Cursor cursor = null;
        try {
            Cursor cursor2 = rawQuery(Album.class, new String[]{"count(*)"}, null, null, null, null, null, null);
            if (cursor2 != null) {
                try {
                    if (cursor2.moveToFirst()) {
                        Log.d("GalleryLiteEntityManager", "table Album has %d items", (Object) Integer.valueOf(cursor2.getInt(0)));
                    }
                } catch (Exception e) {
                    e = e;
                    cursor = cursor2;
                    try {
                        Log.e("GalleryLiteEntityManager", (Throwable) e);
                        MiscUtil.closeSilently(cursor);
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = cursor;
                        MiscUtil.closeSilently(cursor2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    MiscUtil.closeSilently(cursor2);
                    throw th;
                }
            }
            Log.i("GalleryLiteEntityManager", "warm up costs: %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            MiscUtil.closeSilently(cursor2);
        } catch (Exception e2) {
            e = e2;
            Log.e("GalleryLiteEntityManager", (Throwable) e);
            MiscUtil.closeSilently(cursor);
        }
    }
}
