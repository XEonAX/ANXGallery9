package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.jni.filter.SceneResult;
import com.miui.gallery.assistant.model.ImageFeature;

public class SceneFeatureResult extends ImageFeatureResult {
    private SceneResult mSceneResult;

    public SceneFeatureResult(int i, long j) {
        super(i, j);
    }

    public SceneFeatureResult(SceneResult sceneResult, long j) {
        super(0, j);
        this.mSceneResult = sceneResult;
    }

    public SceneResult getSceneResult() {
        return this.mSceneResult;
    }

    public void updateImageFeature(ImageFeature imageFeature) {
        if (imageFeature != null) {
            imageFeature.setSceneResult(getSceneResult());
        }
    }
}
