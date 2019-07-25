package com.miui.gallery.assistant.manager.request;

import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.BgrParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBgrRequestParams;
import com.miui.gallery.assistant.manager.result.ImageFeatureResult;

public abstract class PixelImageFeatureRequest<T extends ImageFeatureResult> extends ImageFeatureRequest<BgrParams, ImageFeatureBgrRequestParams, T> {
    public PixelImageFeatureRequest(Priority priority, ImageFeatureBgrRequestParams imageFeatureBgrRequestParams) {
        super(priority, imageFeatureBgrRequestParams);
    }
}
