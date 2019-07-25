package com.miui.gallery.assistant.process;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.Config.ImageDownload;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.algorithm.Algorithm;
import com.miui.gallery.assistant.library.LibraryConstants;
import com.miui.gallery.assistant.library.LibraryDownloadTask;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.assistant.manager.result.BatchAlgorithmResult;
import com.miui.gallery.assistant.manager.result.ClusteGroupResult;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.assistant.model.ImageFeatureGroupSet;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.sdk.download.DownloadOptions.Builder;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.ImageDownloader;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.assistant.FlagUtil;
import com.miui.gallery.util.uil.CloudUriAdapter;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class BaseImageTask extends PendingTask<JSONObject> {
    protected final String TAG = getClass().getSimpleName();

    private static class ImageGuaranteeJob implements Job<String> {
        private final DownloadType mDownloadType;
        private final boolean mIsDownloadCloudImage;
        private final MediaFeatureItem mMediaFeatureItem;

        ImageGuaranteeJob(MediaFeatureItem mediaFeatureItem, DownloadType downloadType, boolean z) {
            this.mMediaFeatureItem = mediaFeatureItem;
            this.mDownloadType = downloadType;
            this.mIsDownloadCloudImage = z;
        }

        public String run(JobContext jobContext) {
            String str = null;
            if (this.mMediaFeatureItem == null) {
                return null;
            }
            String microThumbnailPath = FileUtils.isFileExist(this.mMediaFeatureItem.getMicroThumbnailPath()) ? this.mMediaFeatureItem.getMicroThumbnailPath() : null;
            String thumbnailPath = FileUtils.isFileExist(this.mMediaFeatureItem.getThumbnailPath()) ? this.mMediaFeatureItem.getThumbnailPath() : null;
            String originPath = FileUtils.isFileExist(this.mMediaFeatureItem.getOriginPath()) ? this.mMediaFeatureItem.getOriginPath() : null;
            try {
                if (!this.mIsDownloadCloudImage) {
                    if (!TextUtils.isEmpty(thumbnailPath)) {
                        microThumbnailPath = thumbnailPath;
                    } else if (!TextUtils.isEmpty(originPath)) {
                        microThumbnailPath = originPath;
                    }
                    return microThumbnailPath;
                }
                if (this.mDownloadType != DownloadType.ORIGIN) {
                    if (this.mDownloadType != DownloadType.THUMBNAIL) {
                        if (microThumbnailPath == null) {
                            if (thumbnailPath == null) {
                                if (originPath == null) {
                                    microThumbnailPath = BaseImageTask.downloadImage(this.mMediaFeatureItem.getId(), this.mDownloadType);
                                    this.mMediaFeatureItem.setMicroThumbnailPath(microThumbnailPath);
                                }
                            }
                        }
                        return microThumbnailPath;
                    } else if (thumbnailPath == null) {
                        if (originPath == null) {
                            microThumbnailPath = BaseImageTask.downloadImage(this.mMediaFeatureItem.getId(), this.mDownloadType);
                            this.mMediaFeatureItem.setThumbnailPath(microThumbnailPath);
                            return microThumbnailPath;
                        }
                    }
                    microThumbnailPath = thumbnailPath;
                    return microThumbnailPath;
                } else if (originPath == null) {
                    microThumbnailPath = BaseImageTask.downloadImage(this.mMediaFeatureItem.getId(), this.mDownloadType);
                    try {
                        this.mMediaFeatureItem.setOriginPath(microThumbnailPath);
                    } catch (Exception e) {
                        Object obj = e;
                        str = microThumbnailPath;
                        e = obj;
                    }
                    return microThumbnailPath;
                }
                microThumbnailPath = originPath;
                return microThumbnailPath;
            } catch (Exception e2) {
                e = e2;
                Log.e("ImageGuaranteeJob", "downloadImage occur error.\n", e);
                microThumbnailPath = str;
                return microThumbnailPath;
            }
        }
    }

    public BaseImageTask(int i) {
        super(i);
    }

    private void calculateAllImageFeature(MediaFeatureItem mediaFeatureItem) {
        int i;
        int[] iArr;
        if (mediaFeatureItem != null) {
            if (mediaFeatureItem.getImageFeature() != null) {
                i = 0;
                for (int i2 : Algorithm.FLAG_FEATURE_ALL_ARRAY) {
                    if (!mediaFeatureItem.getImageFeature().isFeatureDone(i2)) {
                        i = FlagUtil.setFlag(i, i2);
                    }
                }
            } else {
                i = Algorithm.FLAG_FEATURE_ALL;
            }
            BatchAlgorithmResult handleImageWithAlgorithmSync = ImageFeatureManager.getInstance().handleImageWithAlgorithmSync(Priority.PRIORITY_NORMAL, mediaFeatureItem, false, i);
            if (handleImageWithAlgorithmSync == null || handleImageWithAlgorithmSync.getResultCode() == 3) {
                ImageFeature imageFeature = new ImageFeature(mediaFeatureItem.getId(), mediaFeatureItem.getSha1(), mediaFeatureItem.getDateTime());
                imageFeature.setImageType(-1);
                GalleryEntityManager.getInstance().insert((Entity) imageFeature);
                Log.d(this.TAG, "insert image %d feature, image path is null", (Object) Long.valueOf(imageFeature.getImageId()));
            }
        }
    }

    /* access modifiers changed from: private */
    public static String downloadImage(long j, DownloadType downloadType) throws Exception {
        if (!NetworkUtils.isNetworkConnected() || (downloadType == DownloadType.ORIGIN && NetworkUtils.isActiveNetworkMetered())) {
            throw new RuntimeException("network invalid.");
        } else if (AccountCache.getAccount() != null) {
            DownloadedItem loadSync = ImageDownloader.getInstance().loadSync(CloudUriAdapter.getDownloadUri(j), downloadType, new Builder().setRequireWLAN(ImageDownload.requireWLAN(downloadType)).setRequireCharging(false).setRequirePower(true).build());
            if (loadSync != null) {
                return loadSync.getFilePath();
            }
            return null;
        } else {
            throw new RuntimeException("no account.");
        }
    }

    public static Future<String> getImageFilePath(MediaFeatureItem mediaFeatureItem, DownloadType downloadType, boolean z) {
        return ThreadManager.getMiscPool().submit(new ImageGuaranteeJob(mediaFeatureItem, downloadType, z));
    }

    protected static List<MediaFeatureItem> getSelectedImages(List<MediaFeatureItem> list) {
        List<MediaFeatureItem> list2 = null;
        if (MiscUtil.isValid(list)) {
            ArrayList arrayList = new ArrayList();
            for (MediaFeatureItem mediaFeatureItem : list) {
                if (mediaFeatureItem.getImageFeature() != null) {
                    ImageFeature imageFeature = mediaFeatureItem.getImageFeature();
                    if (imageFeature.hasClusterFeature() && !imageFeature.isDocumentImage() && !imageFeature.isPoorImage()) {
                        arrayList.add(mediaFeatureItem);
                    }
                }
            }
            ClusteGroupResult calculateClusterGroupSync = ImageFeatureManager.getInstance().calculateClusterGroupSync(arrayList, true, false);
            if (calculateClusterGroupSync != null && calculateClusterGroupSync.getResultCode() == 0) {
                ImageFeatureGroupSet imageFeatureGroupSet = new ImageFeatureGroupSet(arrayList, calculateClusterGroupSync.getClusters());
                if (MiscUtil.isValid(imageFeatureGroupSet)) {
                    list2 = imageFeatureGroupSet.getSelectedImages();
                }
                return list2;
            }
        }
        return null;
    }

    public static List<MediaFeatureItem> queryMediaItem(String str) {
        return (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, MediaFeatureItem.PROJECTION, str, (String[]) null, "mixedDateTime ASC", (QueryHandler<T>) new QueryHandler<List<MediaFeatureItem>>() {
            public List<MediaFeatureItem> handle(Cursor cursor) {
                return MediaFeatureItem.getMediaFeatureItemsFromCursor(cursor);
            }
        });
    }

    protected static List<MediaFeatureItem> queryMediaItemByIds(List<Long> list) {
        StringBuilder sb = new StringBuilder();
        sb.append(ScenarioConstants.CAMERA_BASE_SELECTION);
        sb.append(" AND ");
        sb.append("_id");
        sb.append(" IN ('");
        sb.append(TextUtils.join("','", list));
        sb.append("')");
        sb.append(" AND ");
        sb.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))");
        return queryMediaItem(sb.toString());
    }

    /* access modifiers changed from: 0000 */
    public List<Long> getAllProcessedSuccessImages() {
        ArrayList arrayList = new ArrayList();
        Cursor rawQuery = GalleryEntityManager.getInstance().rawQuery(ImageFeature.class, new String[]{"imageId"}, ImageFeature.ALL_PROCESSED_SELECTION, null, null, null, "imageId ASC", null);
        if (rawQuery != null) {
            while (rawQuery.moveToNext()) {
                try {
                    arrayList.add(Long.valueOf(ImageFeature.getLong(rawQuery, "imageId")));
                } finally {
                    rawQuery.close();
                }
            }
        }
        return arrayList;
    }

    public abstract DownloadType onGetImageDownloadType();

    public final JSONObject parseData(byte[] bArr) throws Exception {
        return bArr == null ? new JSONObject() : new JSONObject(new String(bArr, "utf-8"));
    }

    /* access modifiers changed from: protected */
    public boolean processImages(JSONObject jSONObject, List<MediaFeatureItem> list, boolean z, boolean z2) {
        if (!MiscUtil.isValid(list)) {
            return true;
        }
        CardUtil.bindImageFeatures(list);
        if (LibraryManager.getInstance().loadLibrary(LibraryConstants.sImageProcessLibraries)) {
            Log.d(this.TAG, "processing %d images", (Object) Integer.valueOf(list.size()));
            if (onGetImageDownloadType() != null) {
                for (int i = 1; i < list.size(); i++) {
                    long currentTimeMillis = System.currentTimeMillis();
                    int i2 = i - 1;
                    calculateAllImageFeature((MediaFeatureItem) list.get(i2));
                    Log.d(this.TAG, "Image %d ImageFeature Algorithm time: %d", Long.valueOf(((MediaFeatureItem) list.get(i2)).getId()), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                }
                calculateAllImageFeature((MediaFeatureItem) list.get(list.size() - 1));
                if (z) {
                    ClusteGroupResult calculateClusterGroupSync = ImageFeatureManager.getInstance().calculateClusterGroupSync(list, true, true);
                    return calculateClusterGroupSync == null || calculateClusterGroupSync.getResultCode() == 0;
                }
            }
            throw new IllegalStateException("onGetImageDownloadType in Sub class return null!");
        }
        Log.d(this.TAG, "loadLibrary fail, schedule download task!");
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("originalType", getType());
            jSONObject2.put("originalData", jSONObject);
            jSONObject2.put("libraryIds", GsonUtils.toString(LibraryConstants.sImageProcessLibraries));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        PendingTaskManager.getInstance().postTask(7, jSONObject2, LibraryDownloadTask.class.getSimpleName());
        return false;
    }

    public final byte[] wrapData(JSONObject jSONObject) throws Exception {
        if (jSONObject == null) {
            return null;
        }
        return jSONObject.toString().getBytes("utf-8");
    }
}
