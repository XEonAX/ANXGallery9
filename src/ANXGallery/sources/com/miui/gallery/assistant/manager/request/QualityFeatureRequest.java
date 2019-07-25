package com.miui.gallery.assistant.manager.request;

import com.miui.gallery.assistant.algorithm.AlgorithmFactroy;
import com.miui.gallery.assistant.algorithm.QualityScoreAlgorithm;
import com.miui.gallery.assistant.jni.score.QualityScore;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.BgrParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBgrRequestParams;
import com.miui.gallery.assistant.manager.result.QualityFeatureResult;
import com.miui.gallery.util.Log;

public class QualityFeatureRequest extends PixelImageFeatureRequest<QualityFeatureResult> {
    public QualityFeatureRequest(Priority priority, ImageFeatureBgrRequestParams imageFeatureBgrRequestParams) {
        super(priority, imageFeatureBgrRequestParams);
    }

    /* access modifiers changed from: protected */
    public QualityFeatureResult process(BgrParams bgrParams) {
        if (bgrParams == null) {
            Log.d(this.TAG, "bgr params is null");
            return new QualityFeatureResult(3, this.mImageId);
        } else if (LibraryManager.getInstance().loadLibrary(1002001)) {
            QualityScore baseQualityScore = ((QualityScoreAlgorithm) AlgorithmFactroy.getAlgorithmByFlag(1)).getBaseQualityScore(bgrParams.pix, bgrParams.width, bgrParams.height);
            if (baseQualityScore == null) {
                return new QualityFeatureResult(1, this.mImageId);
            }
            Log.d(this.TAG, "QualityScoreAlgorithm execute success,result: %s", (Object) baseQualityScore);
            return new QualityFeatureResult(baseQualityScore, this.mImageId);
        } else {
            Log.d(this.TAG, "Load library %s failed", (Object) "QualityScoreAlgorithm");
            return new QualityFeatureResult(2, this.mImageId);
        }
    }
}
