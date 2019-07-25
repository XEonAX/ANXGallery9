package com.miui.gallery.assistant.algorithm;

import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.Map;

public abstract class Algorithm {
    public static final int FLAG_FEATURE_ALL = (ImageFeatureManager.isDeviceSupportStoryFunction() ? 21 : 5);
    public static final int[] FLAG_FEATURE_ALL_ARRAY = (ImageFeatureManager.isDeviceSupportStoryFunction() ? new int[]{1, 4, 16} : new int[]{1, 4});
    protected final String TAG = getClass().getSimpleName();
    private final long mAlgorithmId;
    protected volatile boolean mIsNativeInitiated = false;

    Algorithm(long j) {
        this.mAlgorithmId = j;
    }

    private synchronized void destroy() {
        if (this.mIsNativeInitiated) {
            try {
                onDestroyAlgorithm();
            } catch (Error e) {
                reportAlgorithmError(e);
            }
            this.mIsNativeInitiated = false;
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        super.finalize();
        destroy();
    }

    /* access modifiers changed from: 0000 */
    public synchronized boolean init() {
        if (!this.mIsNativeInitiated) {
            try {
                if (onInitAlgorithm()) {
                    this.mIsNativeInitiated = true;
                }
            } catch (Error e) {
                reportAlgorithmError(e);
            }
        }
        return this.mIsNativeInitiated;
    }

    /* access modifiers changed from: protected */
    public abstract void onDestroyAlgorithm();

    /* access modifiers changed from: protected */
    public abstract boolean onInitAlgorithm();

    /* access modifiers changed from: 0000 */
    public void reportAlgorithmError(Throwable th) {
        Log.e(this.TAG, th);
        Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
        generatorCommonParams.put("algorithm", getClass().getSimpleName());
        generatorCommonParams.put("error", th != null ? th.toString() : "");
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_algorithm_error", generatorCommonParams);
    }
}
