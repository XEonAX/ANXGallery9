package com.miui.gallery.assistant.model;

import android.util.LongSparseArray;
import com.miui.gallery.assistant.jni.cluster.Cluster;
import com.miui.gallery.assistant.model.ImageFeatureItem;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class ImageFeatureGroupSet<T extends ImageFeatureItem> extends HashSet<ImageFeatureGroup<T>> {
    public ImageFeatureGroupSet(List<T> list, List<Cluster> list2) {
        if (MiscUtil.isValid(list2) && MiscUtil.isValid(list)) {
            LongSparseArray longSparseArray = new LongSparseArray();
            for (T t : list) {
                if (t.getMediaSha1() != null) {
                    longSparseArray.put(t.getMediaId(), t);
                }
            }
            for (Cluster cluster : list2) {
                ArrayList arrayList = new ArrayList();
                for (long j : cluster.getImageIds()) {
                    ImageFeatureItem imageFeatureItem = (ImageFeatureItem) longSparseArray.get(j);
                    if (imageFeatureItem != null) {
                        arrayList.add(imageFeatureItem);
                    }
                }
                if (MiscUtil.isValid(arrayList)) {
                    add(new ImageFeatureGroup(arrayList));
                }
            }
        }
    }

    public List<T> getSelectedImages() {
        ArrayList arrayList = new ArrayList();
        Iterator it = iterator();
        while (it.hasNext()) {
            arrayList.add(((ImageFeatureGroup) it.next()).getBestImage());
        }
        return arrayList;
    }
}
