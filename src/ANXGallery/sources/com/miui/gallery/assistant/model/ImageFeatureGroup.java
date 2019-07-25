package com.miui.gallery.assistant.model;

import com.miui.gallery.assistant.model.ImageFeatureItem;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class ImageFeatureGroup<T extends ImageFeatureItem> {
    private T mBestImage;
    private final List<T> mImageFeatures = new LinkedList();

    ImageFeatureGroup(Collection<T> collection) {
        this.mImageFeatures.addAll(collection);
        for (T t : collection) {
            if (this.mBestImage == null) {
                this.mBestImage = t;
            } else if (!(this.mBestImage.getImageFeature() == null || t.getImageFeature() == null || this.mBestImage.getImageFeature().getScore() >= t.getImageFeature().getScore())) {
                this.mBestImage = t;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public T getBestImage() {
        return this.mBestImage;
    }
}
