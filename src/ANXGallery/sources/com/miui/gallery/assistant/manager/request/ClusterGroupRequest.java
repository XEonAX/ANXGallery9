package com.miui.gallery.assistant.manager.request;

import android.content.ContentValues;
import android.text.TextUtils;
import android.util.LongSparseArray;
import com.miui.gallery.assistant.algorithm.AlgorithmFactroy;
import com.miui.gallery.assistant.algorithm.ClusterAlgorithm;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.jni.cluster.Cluster;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.param.ClusteGroupRequestParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBgrRequestParams;
import com.miui.gallery.assistant.manager.result.ClusteGroupResult;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.List;

public class ClusterGroupRequest extends AlgorithmRequest<List<MediaFeatureItem>, ClusteGroupRequestParams<MediaFeatureItem>, ClusteGroupResult> {
    private List<MediaFeatureItem> mImageFeatureItems;
    private ImageFeature[] mImageFeatures;
    private boolean mIsCalculateClusterFeature;
    private final boolean mSaveResult;

    public ClusterGroupRequest(Priority priority, ClusteGroupRequestParams<MediaFeatureItem> clusteGroupRequestParams, boolean z) {
        super(priority, clusteGroupRequestParams);
        this.mIsCalculateClusterFeature = clusteGroupRequestParams.isCalculateClusterFeature();
        this.mSaveResult = z;
    }

    private boolean allImagesHaveClusterFeature() {
        if (MiscUtil.isValid(this.mImageFeatureItems)) {
            for (MediaFeatureItem mediaFeatureItem : this.mImageFeatureItems) {
                if (mediaFeatureItem.getImageFeature() != null) {
                    if (mediaFeatureItem.getImageFeature().getClusterFeature() == null) {
                    }
                }
                return false;
            }
        }
        return true;
    }

    private long generateGroupId(long j) {
        return (System.currentTimeMillis() * 1000000) + ((System.nanoTime() - j) % 1000000);
    }

    /* access modifiers changed from: protected */
    public void onSaveResult(ClusteGroupResult clusteGroupResult) {
        if (this.mSaveResult && clusteGroupResult != null && clusteGroupResult.getResultCode() == 0 && MiscUtil.isValid(clusteGroupResult.getClusters())) {
            LongSparseArray longSparseArray = new LongSparseArray(this.mImageFeatureItems.size());
            for (MediaFeatureItem mediaFeatureItem : this.mImageFeatureItems) {
                if (mediaFeatureItem.getMediaSha1() != null) {
                    longSparseArray.put(mediaFeatureItem.getMediaId(), mediaFeatureItem);
                }
            }
            long nanoTime = System.nanoTime();
            for (Cluster imageIds : clusteGroupResult.getClusters()) {
                long[] imageIds2 = imageIds.getImageIds();
                if (!(imageIds2 == null || imageIds2.length == 0)) {
                    long j = -1;
                    int length = imageIds2.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            break;
                        }
                        MediaFeatureItem mediaFeatureItem2 = (MediaFeatureItem) longSparseArray.get(imageIds2[i]);
                        if (mediaFeatureItem2 != null && mediaFeatureItem2.getImageFeature() != null && mediaFeatureItem2.getImageFeature().getClusterGroupId() > 0) {
                            j = mediaFeatureItem2.getImageFeature().getClusterGroupId();
                            break;
                        }
                        i++;
                    }
                    if (j < 0) {
                        j = generateGroupId(nanoTime);
                    }
                    GalleryEntityManager instance = GalleryEntityManager.getInstance();
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("clusterGroupId", Long.valueOf(j));
                    List arrayToList = MiscUtil.arrayToList(imageIds2);
                    instance.update(ImageFeature.class, contentValues, String.format("%s IN (%s)", new Object[]{"imageId", TextUtils.join(",", arrayToList)}), null);
                    ImageFeatureCacheManager.getInstance().onImageFeaturesChanged(arrayToList);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public ClusteGroupResult process(List<MediaFeatureItem> list) {
        this.mImageFeatureItems = list;
        if (!MiscUtil.isValid(this.mImageFeatureItems)) {
            return new ClusteGroupResult(3);
        }
        if (!this.mIsCalculateClusterFeature || allImagesHaveClusterFeature()) {
            Log.d(this.TAG, "Process %d images", (Object) Integer.valueOf(this.mImageFeatureItems.size()));
            int i = 0;
            for (int i2 = 0; i2 < this.mImageFeatureItems.size(); i2++) {
                ImageFeature imageFeature = ((MediaFeatureItem) this.mImageFeatureItems.get(i2)).getImageFeature();
                if (!(imageFeature == null || imageFeature.getClusterFeature() == null)) {
                    i++;
                }
            }
            Log.d(this.TAG, "Valid image count:%d", (Object) Integer.valueOf(i));
            float[] fArr = new float[(i * 1024)];
            long[] jArr = new long[i];
            long[] jArr2 = new long[i];
            this.mImageFeatures = new ImageFeature[i];
            int i3 = 0;
            for (int i4 = 0; i4 < this.mImageFeatureItems.size() && i3 < i; i4++) {
                ImageFeature imageFeature2 = ((MediaFeatureItem) this.mImageFeatureItems.get(i4)).getImageFeature();
                if (!(imageFeature2 == null || imageFeature2.getClusterFeature() == null)) {
                    this.mImageFeatures[i3] = imageFeature2;
                    System.arraycopy(imageFeature2.getClusterFeature(), 0, fArr, i3 * 1024, 1024);
                    jArr[i3] = ((MediaFeatureItem) this.mImageFeatureItems.get(i4)).getDateTime();
                    jArr2[i3] = imageFeature2.getImageId();
                    i3++;
                }
            }
            if (LibraryManager.getInstance().loadLibrary(1004001)) {
                ArrayList clusterResult = ((ClusterAlgorithm) AlgorithmFactroy.getAlgorithmByFlag(8)).getClusterResult(fArr, jArr, jArr2, jArr2.length);
                if (!MiscUtil.isValid(clusterResult)) {
                    return new ClusteGroupResult(1);
                }
                Log.d(this.TAG, "ClusterAlgorithm execute success!");
                return new ClusteGroupResult(clusterResult);
            }
            Log.d(this.TAG, "Load library %s failed", (Object) "ClusterAlgorithm");
            return new ClusteGroupResult(2);
        }
        this.mIsCalculateClusterFeature = false;
        for (MediaFeatureItem imageFeatureBgrRequestParams : this.mImageFeatureItems) {
            new ClusterFeatureRequest(getPriority(), new ImageFeatureBgrRequestParams(imageFeatureBgrRequestParams)).execute();
        }
        execute();
        Log.d(this.TAG, "calculate cluster feature before group");
        return new ClusteGroupResult(6);
    }
}
