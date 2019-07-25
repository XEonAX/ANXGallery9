package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.model.ImageFeature;

public class ClusterFeatureResult extends ImageFeatureResult {
    private float[] mClusterFeature;

    public ClusterFeatureResult(int i, long j) {
        super(i, j);
    }

    public ClusterFeatureResult(float[] fArr, long j) {
        super(0, j);
        this.mClusterFeature = fArr;
    }

    public float[] getClusterFeature() {
        return this.mClusterFeature;
    }

    public void updateImageFeature(ImageFeature imageFeature) {
        if (imageFeature != null) {
            imageFeature.setClusterFeature(getClusterFeature());
        }
    }
}
