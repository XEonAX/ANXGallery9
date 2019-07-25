package com.miui.gallery.assistant.algorithm;

import com.miui.gallery.assistant.jni.score.QualityScore;
import com.miui.gallery.assistant.jni.score.QualityScoreJNI;
import com.miui.gallery.util.Log;

public class QualityScoreAlgorithm extends Algorithm {
    private long mNativePtr;
    private QualityScoreJNI mQualityScoreJNI;

    QualityScoreAlgorithm() {
        super(1002001);
    }

    public synchronized QualityScore getBaseQualityScore(byte[] bArr, int i, int i2) {
        if (this.mIsNativeInitiated) {
            try {
                return this.mQualityScoreJNI.nativeGetImageIqa(this.mNativePtr, bArr, i, i2);
            } catch (Exception e) {
                Log.e(this.TAG, (Throwable) e);
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void onDestroyAlgorithm() {
        try {
            this.mQualityScoreJNI.nativeDestroy(this.mNativePtr);
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
        }
        this.mNativePtr = 0;
    }

    /* access modifiers changed from: protected */
    public boolean onInitAlgorithm() {
        this.mQualityScoreJNI = new QualityScoreJNI();
        try {
            this.mNativePtr = this.mQualityScoreJNI.nativeCreate();
            return true;
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
            return false;
        }
    }
}
