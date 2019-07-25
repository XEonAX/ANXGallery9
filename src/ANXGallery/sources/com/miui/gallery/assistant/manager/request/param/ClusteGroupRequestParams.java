package com.miui.gallery.assistant.manager.request.param;

import com.miui.gallery.assistant.model.ImageFeatureItem;
import com.miui.gallery.assistant.utils.ImageFeatureItemUtils;
import java.util.List;

public class ClusteGroupRequestParams<E extends ImageFeatureItem> implements RequestParams<List<E>> {
    private List<E> mImageFeatureItems;
    private boolean mIsCalculateClusterFeature;

    public ClusteGroupRequestParams(List<E> list, boolean z) {
        this.mImageFeatureItems = list;
        this.mIsCalculateClusterFeature = z;
    }

    public List<E> getAlgorithmRequestInputs() {
        new ImageFeatureItemUtils().bindImageFeatures(this.mImageFeatureItems);
        return this.mImageFeatureItems;
    }

    public boolean isCalculateClusterFeature() {
        return this.mIsCalculateClusterFeature;
    }
}
