package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.model.ImageFeature;

public abstract class ImageFeatureResult extends AlgorithmResult {
    private final long mImageId;

    public ImageFeatureResult(int i, long j) {
        super(i);
        this.mImageId = j;
    }

    public abstract void updateImageFeature(ImageFeature imageFeature);
}
