package com.miui.gallery.assistant.manager.request;

import com.miui.gallery.assistant.algorithm.AlgorithmFactroy;
import com.miui.gallery.assistant.algorithm.SceneFilterAlgorithm;
import com.miui.gallery.assistant.jni.filter.SceneResult;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.BgrParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBgrRequestParams;
import com.miui.gallery.assistant.manager.result.SceneFeatureResult;
import com.miui.gallery.util.Log;

public class SceneFeatureRequest extends PixelImageFeatureRequest<SceneFeatureResult> {
    public SceneFeatureRequest(Priority priority, ImageFeatureBgrRequestParams imageFeatureBgrRequestParams) {
        super(priority, imageFeatureBgrRequestParams);
    }

    /* access modifiers changed from: protected */
    public SceneFeatureResult process(BgrParams bgrParams) {
        if (bgrParams == null) {
            Log.d(this.TAG, "bgr params is null");
            return new SceneFeatureResult(3, this.mImageId);
        } else if (LibraryManager.getInstance().loadLibrary(1003)) {
            SceneResult sceneResult = ((SceneFilterAlgorithm) AlgorithmFactroy.getAlgorithmByFlag(2)).getSceneResult(bgrParams.pix, bgrParams.width, bgrParams.height);
            if (sceneResult == null) {
                return new SceneFeatureResult(1, this.mImageId);
            }
            Log.d(this.TAG, "SceneFilterAlgorithm execute success,result: %s", (Object) sceneResult);
            return new SceneFeatureResult(sceneResult, this.mImageId);
        } else {
            Log.d(this.TAG, "Load library %s failed", (Object) "SceneFilterAlgorithm");
            return new SceneFeatureResult(2, this.mImageId);
        }
    }
}
