package com.miui.gallery.provider;

import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.dao.GalleryLiteEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.EntityTransaction;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.miui.gallery.util.face.PeopleItem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PeopleFaceSnapshotHelper {
    public static List<PeopleItem> cursor2Entities(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null && cursor.getCount() > 0 && cursor.moveToFirst()) {
            int i = 0;
            do {
                PeopleItem fromCursor = PeopleItem.fromCursor(cursor);
                if (fromCursor != null) {
                    arrayList.add(fromCursor);
                    if (PeopleContactInfo.isUnKnownRelation(fromCursor.getRelationType()) && TextUtils.isEmpty(fromCursor.getName())) {
                        i++;
                    }
                }
                if (!cursor.moveToNext()) {
                    break;
                }
            } while (i < 18);
        }
        return arrayList;
    }

    /* JADX INFO: finally extract failed */
    public static synchronized int persist(List<PeopleItem> list) {
        int i;
        synchronized (PeopleFaceSnapshotHelper.class) {
            i = 0;
            if (MiscUtil.isValid(list)) {
                long currentTimeMillis = System.currentTimeMillis();
                EntityTransaction transaction = GalleryLiteEntityManager.getInstance().getTransaction();
                transaction.begin();
                try {
                    GalleryLiteEntityManager.getInstance().deleteAll(PeopleItem.class);
                    for (PeopleItem insert : list) {
                        i += GalleryLiteEntityManager.getInstance().insert((Entity) insert) ? 1 : 0;
                    }
                    transaction.commit();
                    transaction.end();
                    long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                    Log.d("PeopleFaceSnapshotHelper", "save people count %d, cost %d", Integer.valueOf(i), Long.valueOf(currentTimeMillis2));
                    HashMap hashMap = new HashMap();
                    hashMap.put("costs", String.valueOf(currentTimeMillis2));
                    hashMap.put("count", String.valueOf(i));
                    GallerySamplingStatHelper.recordCountEvent("people", "people_snapshot_save_time", hashMap);
                } catch (Throwable th) {
                    transaction.end();
                    throw th;
                }
            } else {
                GalleryLiteEntityManager.getInstance().deleteAll(PeopleItem.class);
            }
        }
        return i;
    }

    public static void queryAndPersist(Context context) {
        Log.d("PeopleFaceSnapshotHelper", "queryAndPersist on thread: %s", (Object) Thread.currentThread().getName());
        Cursor cursor = null;
        try {
            Cursor query = context.getContentResolver().query(PeopleFace.PERSONS_URI, PeopleCursorHelper.PROJECTION, null, null, null);
            try {
                persist(cursor2Entities(query));
                MiscUtil.closeSilently(query);
            } catch (Throwable th) {
                Throwable th2 = th;
                cursor = query;
                th = th2;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            MiscUtil.closeSilently(cursor);
            throw th;
        }
    }
}
