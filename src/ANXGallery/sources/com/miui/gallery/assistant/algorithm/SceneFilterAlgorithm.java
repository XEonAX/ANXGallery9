package com.miui.gallery.assistant.algorithm;

import com.miui.gallery.assistant.jni.filter.SceneClassifyJNI;
import com.miui.gallery.assistant.jni.filter.SceneResult;
import com.miui.gallery.util.Log;

public class SceneFilterAlgorithm extends Algorithm {
    private long mNativePtr;
    private SceneClassifyJNI mSceneClassifyJNI;

    SceneFilterAlgorithm() {
        super(1003);
    }

    public synchronized SceneResult getSceneResult(byte[] bArr, int i, int i2) {
        if (this.mIsNativeInitiated) {
            try {
                return this.mSceneClassifyJNI.nativeGetImageSceneCls(this.mNativePtr, bArr, i, i2);
            } catch (Exception e) {
                Log.e(this.TAG, (Throwable) e);
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void onDestroyAlgorithm() {
        try {
            this.mSceneClassifyJNI.nativeDestroy(this.mNativePtr);
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
        }
        this.mNativePtr = 0;
    }

    /* access modifiers changed from: protected */
    public boolean onInitAlgorithm() {
        this.mSceneClassifyJNI = new SceneClassifyJNI();
        try {
            this.mNativePtr = this.mSceneClassifyJNI.nativeCreate();
            return true;
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
            return false;
        }
    }
}
