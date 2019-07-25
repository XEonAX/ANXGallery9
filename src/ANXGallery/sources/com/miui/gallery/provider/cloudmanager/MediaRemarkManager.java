package com.miui.gallery.provider.cloudmanager;

import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.StringUtils;
import java.util.List;

public class MediaRemarkManager {
    public static int addFileHandleMediaIds(long... jArr) {
        Numbers.ensurePositive(jArr);
        if (jArr.length <= 0) {
            return 0;
        }
        GalleryEntityManager instance = GalleryEntityManager.getInstance();
        MediaRemarkInfo mediaRemarkInfo = new MediaRemarkInfo();
        mediaRemarkInfo.setOperationType(1);
        int i = 0;
        for (long cloudId : jArr) {
            mediaRemarkInfo.setCloudId(cloudId);
            i += instance.insert((Entity) mediaRemarkInfo) ? 1 : 0;
        }
        Log.d("CloudManager.MediaRemarkManager", "Done insert %d ids, result %d", Integer.valueOf(jArr.length), Integer.valueOf(i));
        return i;
    }

    public static boolean doneHandleFileForMediaIds(long... jArr) {
        Numbers.ensurePositive(jArr);
        if (jArr.length <= 0) {
            return false;
        }
        boolean delete = GalleryEntityManager.getInstance().delete(MediaRemarkInfo.class, String.format("%s = %s AND %s IN (%s)", new Object[]{"operationType", Integer.valueOf(1), "mediaId", StringUtils.join(",", jArr)}), null);
        Log.d("CloudManager.MediaRemarkManager", "Delete %d ids, result %s", Integer.valueOf(jArr.length), String.valueOf(delete));
        return delete;
    }

    public static long[] loadFileHandleMediaIds() {
        List query = GalleryEntityManager.getInstance().query(MediaRemarkInfo.class, "operationType = ?", new String[]{String.valueOf(1)}, "_id ASC", null);
        if (query == null || query.size() <= 0) {
            return null;
        }
        long[] jArr = new long[query.size()];
        for (int i = 0; i < jArr.length; i++) {
            jArr[i] = ((MediaRemarkInfo) query.get(i)).getCloudId();
        }
        return jArr;
    }

    public static boolean onAccountDelete() {
        try {
            GalleryEntityManager.getInstance().deleteAll(MediaRemarkInfo.class);
            return true;
        } catch (Exception e) {
            Log.e("CloudManager.MediaRemarkManager", "onAccountDelete occur error. %s", (Object) e);
            return false;
        }
    }
}
