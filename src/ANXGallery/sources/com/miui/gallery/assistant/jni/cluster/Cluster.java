package com.miui.gallery.assistant.jni.cluster;

public class Cluster {
    private final long[] imageIds;

    public Cluster(long[] jArr) {
        this.imageIds = jArr;
    }

    public long[] getImageIds() {
        return this.imageIds;
    }
}
