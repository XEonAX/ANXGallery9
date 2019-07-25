package com.miui.gallery.assistant.manager.result;

import com.miui.gallery.assistant.jni.cluster.Cluster;
import java.util.ArrayList;
import java.util.List;

public class ClusteGroupResult extends AlgorithmResult {
    private List<Cluster> mClusters;

    public ClusteGroupResult(int i) {
        super(i);
    }

    public ClusteGroupResult(ArrayList<Cluster> arrayList) {
        super(0);
        this.mClusters = arrayList;
    }

    public List<Cluster> getClusters() {
        return this.mClusters;
    }
}
