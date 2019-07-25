package com.miui.gallery.assistant.utils;

import android.text.TextUtils;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.assistant.model.ImageFeatureItem;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ImageFeatureItemUtils<E extends ImageFeatureItem> {
    public void bindImageFeatures(List<E> list) {
        if (MiscUtil.isValid(list)) {
            ArrayList arrayList = new ArrayList(list.size());
            for (E mediaId : list) {
                arrayList.add(Long.valueOf(mediaId.getMediaId()));
            }
            List query = GalleryEntityManager.getInstance().query(ImageFeature.class, String.format("%s IN (%s)", new Object[]{"imageId", TextUtils.join(",", arrayList)}), null, "createTime DESC", null);
            if (MiscUtil.isValid(query)) {
                for (E e : list) {
                    Iterator it = query.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        ImageFeature imageFeature = (ImageFeature) it.next();
                        if (imageFeature.getImageId() == e.getMediaId()) {
                            e.setImageFeature(imageFeature);
                            break;
                        }
                    }
                }
            }
        }
    }
}
