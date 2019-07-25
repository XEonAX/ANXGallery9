package com.miui.gallery.assistant.algorithm;

import com.miui.gallery.assistant.jni.cluster.Cluster;
import com.miui.gallery.assistant.jni.cluster.ImageClusterJNI;
import com.miui.gallery.util.Log;
import java.util.ArrayList;

public class ClusterAlgorithm extends Algorithm {
    ImageClusterJNI mImageClusterJNI;
    long mNativePtr;

    ClusterAlgorithm() {
        super(1004001);
    }

    public synchronized float[] extractFeature(byte[] bArr, int i, int i2) {
        if (!this.mIsNativeInitiated) {
            return null;
        }
        return this.mImageClusterJNI.extractFeature(this.mNativePtr, bArr, i, i2);
    }

    public synchronized ArrayList<Cluster> getClusterResult(float[] fArr, long[] jArr, long[] jArr2, int i) {
        if (!this.mIsNativeInitiated) {
            return null;
        }
        return this.mImageClusterJNI.getClusterResult(this.mNativePtr, fArr, jArr, jArr2, i, 1024);
    }

    /* access modifiers changed from: protected */
    public void onDestroyAlgorithm() {
        try {
            this.mImageClusterJNI.nativeDestroy(this.mNativePtr);
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
        }
        this.mNativePtr = 0;
    }

    /* access modifiers changed from: protected */
    public boolean onInitAlgorithm() {
        this.mImageClusterJNI = new ImageClusterJNI();
        try {
            this.mNativePtr = this.mImageClusterJNI.nativeCreate(0.741f, 3600000);
            return true;
        } catch (Exception e) {
            Log.e(this.TAG, (Throwable) e);
            return false;
        }
    }
}
