package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.jni.filter.ISceneResult;
import com.miui.gallery.assistant.model.ImageFeature;

public class BaiduSceneFeatureResult extends ImageFeatureResult {
    private BaiduSceneResult mBaiduSceneResult;

    public BaiduSceneFeatureResult(int i, long j) {
        super(i, j);
    }

    public BaiduSceneFeatureResult(BaiduSceneResult baiduSceneResult, long j) {
        super(0, j);
        this.mBaiduSceneResult = baiduSceneResult;
    }

    public BaiduSceneResult getBaiduSceneResult() {
        return this.mBaiduSceneResult;
    }

    public void updateImageFeature(ImageFeature imageFeature) {
        if (imageFeature != null) {
            imageFeature.setSceneResult((ISceneResult) getBaiduSceneResult());
        }
    }
}
