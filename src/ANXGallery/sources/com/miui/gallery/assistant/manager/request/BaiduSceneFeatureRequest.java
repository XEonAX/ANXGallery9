package com.miui.gallery.assistant.manager.request;

import android.graphics.Bitmap;
import com.baidu.vis.ClassIfication.Response;
import com.miui.gallery.assistant.algorithm.AlgorithmFactroy;
import com.miui.gallery.assistant.algorithm.BaiduSceneFilterAlgorithm;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBitmapRequestParams;
import com.miui.gallery.assistant.manager.result.BaiduSceneFeatureResult;
import com.miui.gallery.util.Log;

public class BaiduSceneFeatureRequest extends ImageFeatureRequest<Bitmap, ImageFeatureBitmapRequestParams, BaiduSceneFeatureResult> {
    public BaiduSceneFeatureRequest(Priority priority, ImageFeatureBitmapRequestParams imageFeatureBitmapRequestParams) {
        super(priority, imageFeatureBitmapRequestParams);
    }

    /* access modifiers changed from: protected */
    public BaiduSceneFeatureResult process(Bitmap bitmap) {
        if (bitmap == null || this.mRequestParams == null) {
            return new BaiduSceneFeatureResult(3, this.mImageId);
        }
        if (LibraryManager.getInstance().loadLibrary(1005)) {
            Response predict = ((BaiduSceneFilterAlgorithm) AlgorithmFactroy.getAlgorithmByFlag(16)).predict(bitmap);
            return predict != null ? new BaiduSceneFeatureResult(new BaiduSceneResult(predict.classNum, predict.classProb), this.mImageId) : new BaiduSceneFeatureResult(1, this.mImageId);
        }
        Log.d(this.TAG, "Load library %s failed", (Object) "BaiduSceneFilterAlgorithm");
        return new BaiduSceneFeatureResult(2, this.mImageId);
    }
}
