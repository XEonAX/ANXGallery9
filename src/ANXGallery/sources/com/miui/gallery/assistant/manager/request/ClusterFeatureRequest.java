package com.miui.gallery.assistant.manager.request;

import com.miui.gallery.assistant.algorithm.AlgorithmFactroy;
import com.miui.gallery.assistant.algorithm.ClusterAlgorithm;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.BgrParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBgrRequestParams;
import com.miui.gallery.assistant.manager.result.ClusterFeatureResult;
import com.miui.gallery.util.Log;

public class ClusterFeatureRequest extends PixelImageFeatureRequest<ClusterFeatureResult> {
    public ClusterFeatureRequest(Priority priority, ImageFeatureBgrRequestParams imageFeatureBgrRequestParams) {
        super(priority, imageFeatureBgrRequestParams);
    }

    /* access modifiers changed from: protected */
    public ClusterFeatureResult process(BgrParams bgrParams) {
        if (bgrParams == null) {
            Log.d(this.TAG, "bgr params is null");
            return new ClusterFeatureResult(3, this.mImageId);
        } else if (LibraryManager.getInstance().loadLibrary(1004001)) {
            float[] extractFeature = ((ClusterAlgorithm) AlgorithmFactroy.getAlgorithmByFlag(4)).extractFeature(bgrParams.pix, bgrParams.width, bgrParams.height);
            if (extractFeature == null) {
                return new ClusterFeatureResult(1, this.mImageId);
            }
            Log.d(this.TAG, "ClusterAlgorithm execute success!");
            return new ClusterFeatureResult(extractFeature, this.mImageId);
        } else {
            Log.d(this.TAG, "Load library %s failed", (Object) "ClusterAlgorithm");
            return new ClusterFeatureResult(2, this.mImageId);
        }
    }
}
