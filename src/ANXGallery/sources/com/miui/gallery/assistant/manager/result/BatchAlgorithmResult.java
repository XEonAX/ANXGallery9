package com.miui.gallery.assistant.manager.result;

import android.util.SparseArray;
import com.miui.gallery.assistant.model.ImageFeature;

public class BatchAlgorithmResult extends ImageFeatureResult {
    private final SparseArray<ImageFeatureResult> mAlgorithmResults = new SparseArray<>();

    public BatchAlgorithmResult(int i, long j) {
        super(i, j);
    }

    public void add(int i, ImageFeatureResult imageFeatureResult) {
        this.mAlgorithmResults.put(i, imageFeatureResult);
    }

    public void updateImageFeature(ImageFeature imageFeature) {
        if (imageFeature != null) {
            for (int i = 0; i < this.mAlgorithmResults.size(); i++) {
                ImageFeatureResult imageFeatureResult = (ImageFeatureResult) this.mAlgorithmResults.valueAt(i);
                if (imageFeatureResult != null) {
                    imageFeatureResult.updateImageFeature(imageFeature);
                }
            }
        }
    }
}
