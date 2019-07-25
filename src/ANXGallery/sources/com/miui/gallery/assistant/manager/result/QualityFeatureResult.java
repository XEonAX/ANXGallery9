package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.jni.score.QualityScore;
import com.miui.gallery.assistant.model.ImageFeature;

public class QualityFeatureResult extends ImageFeatureResult {
    private QualityScore mQualityScore;

    public QualityFeatureResult(int i, long j) {
        super(i, j);
    }

    public QualityFeatureResult(QualityScore qualityScore, long j) {
        super(0, j);
        this.mQualityScore = qualityScore;
    }

    public QualityScore getQualityScore() {
        return this.mQualityScore;
    }

    public void updateImageFeature(ImageFeature imageFeature) {
        if (imageFeature != null) {
            imageFeature.setQualityScore(getQualityScore());
        }
    }
}
