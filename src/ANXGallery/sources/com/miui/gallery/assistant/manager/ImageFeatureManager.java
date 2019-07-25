package com.miui.gallery.assistant.manager;

import android.content.ContentValues;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.os.Build;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.algorithm.Algorithm;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.library.LibraryConstants;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Listener;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.request.BatchImageAlgorithmRequest;
import com.miui.gallery.assistant.manager.request.ClusterGroupRequest;
import com.miui.gallery.assistant.manager.request.param.ClusteGroupRequestParams;
import com.miui.gallery.assistant.manager.request.param.ImageFeatureBitmapRequestParams;
import com.miui.gallery.assistant.manager.result.AlgorithmResult;
import com.miui.gallery.assistant.manager.result.BatchAlgorithmResult;
import com.miui.gallery.assistant.manager.result.ClusteGroupResult;
import com.miui.gallery.assistant.model.ImageFeature;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.assistant.process.BaseImageTask;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.ScenarioConstants;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.preference.GalleryPreferences.Assistant;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.assistant.FlagUtil;
import com.miui.os.Rom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ImageFeatureManager {
    private static boolean sIsSupportImageFeatureSelection;
    private static final String[] sWhiteList = {"dipper", "ursa", "jason", "wayne", "platina", "chiron", "sagit", "polaris", "perseus", "equuleus", "sirius", "comet", "lavender", "capricorn", "lithium", "natrium", "scorpio", "gemini", "cepheus", "davinci", "davinciin", "grus", "raphael", "raphaelin", "pyxis", "vela", "crux"};
    /* access modifiers changed from: private */
    public volatile boolean mHasMoreImageToProcess;
    private final Runnable mImageDeleteRunnable;
    private final ImageFeatureReusedBitCache mImageFeatureReusedBitCache;
    private volatile boolean mIsCaculating;
    private final ThreadPoolExecutor mThreadPoolExecutor;

    private static final class ImageFeatureMangerHolder {
        /* access modifiers changed from: private */
        public static final ImageFeatureManager INSTANCE = new ImageFeatureManager();
    }

    static {
        sIsSupportImageFeatureSelection = false;
        for (String equalsIgnoreCase : sWhiteList) {
            if (equalsIgnoreCase.equalsIgnoreCase(Build.DEVICE)) {
                sIsSupportImageFeatureSelection = true;
            }
        }
    }

    private ImageFeatureManager() {
        this.mHasMoreImageToProcess = false;
        this.mImageFeatureReusedBitCache = new ImageFeatureReusedBitCache();
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 2, 30, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        this.mThreadPoolExecutor = threadPoolExecutor;
        this.mThreadPoolExecutor.allowCoreThreadTimeOut(true);
        this.mIsCaculating = false;
        this.mImageDeleteRunnable = new Runnable() {
            public void run() {
                ImageFeatureManager.this.deleteImageFromCard();
            }
        };
    }

    private Runnable createImagesDeleteRunnable() {
        return new Runnable() {
            public void run() {
                if (ImageFeatureManager.isDeviceSupportStoryFunction()) {
                    ImageFeatureManager.this.deleteImagesFromCard();
                }
            }
        };
    }

    private Runnable createNewImageCalculateRunnable() {
        return new Runnable() {
            public void run() {
                ImageFeatureManager.this.scheduleNewImages();
            }
        };
    }

    /* access modifiers changed from: private */
    public void deleteImageFromCard() {
        this.mThreadPoolExecutor.execute(createImagesDeleteRunnable());
    }

    /* access modifiers changed from: private */
    public synchronized void deleteImagesFromCard() {
        List<ImageFeature> query = GalleryEntityManager.getInstance().query(ImageFeature.class, "imageId>0 AND version=2 AND imageType=2", null, null, null);
        if (MiscUtil.isValid(query)) {
            Log.d("ImageFeatureManager", "Delete %d images,search them in cards", (Object) Integer.valueOf(query.size()));
            ArrayList arrayList = new ArrayList(query.size());
            for (ImageFeature sha1 : query) {
                arrayList.add(sha1.getSha1());
            }
            if (MiscUtil.isValid(arrayList)) {
                CardManager.getInstance().onDeleteImages(arrayList);
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("imageType", Integer.valueOf(3));
            GalleryEntityManager.getInstance().update(ImageFeature.class, contentValues, String.format("%s IN ('%s')", new Object[]{"sha1", TextUtils.join("','", arrayList)}), null);
        }
    }

    private boolean ensureImagePath(MediaFeatureItem mediaFeatureItem) {
        String str;
        String imagePath = mediaFeatureItem.getImagePath();
        if (TextUtils.isEmpty(imagePath)) {
            str = (String) BaseImageTask.getImageFilePath(mediaFeatureItem, DownloadType.MICRO, true).get();
            Log.d("ImageFeatureManager", "get micro thumb image using time:%d ms", (Object) Long.valueOf(System.currentTimeMillis() - System.currentTimeMillis()));
        } else {
            str = imagePath;
        }
        return !TextUtils.isEmpty(str);
    }

    public static List<MediaFeatureItem> filterNearByImages(List<MediaFeatureItem> list) {
        LinkedList linkedList = new LinkedList();
        if (MiscUtil.isValid(list)) {
            long j = 0;
            for (MediaFeatureItem mediaFeatureItem : list) {
                ImageFeature imageFeature = mediaFeatureItem.getImageFeature();
                if (imageFeature != null) {
                    long clusterGroupId = imageFeature.getClusterGroupId();
                    if (clusterGroupId != 0) {
                        if (j != 0) {
                            if (j != clusterGroupId) {
                                break;
                            }
                            linkedList.add(mediaFeatureItem);
                        } else {
                            linkedList.add(mediaFeatureItem);
                            j = clusterGroupId;
                        }
                    } else {
                        linkedList.add(mediaFeatureItem);
                    }
                } else {
                    linkedList.add(mediaFeatureItem);
                }
            }
        }
        return linkedList;
    }

    public static ImageFeatureManager getInstance() {
        return ImageFeatureMangerHolder.INSTANCE;
    }

    private List<MediaFeatureItem> getUnProcessedImages(List<MediaFeatureItem> list, int i) {
        ArrayList arrayList = new ArrayList();
        if (MiscUtil.isValid(list)) {
            for (int i2 = 0; i2 < list.size(); i2++) {
                MediaFeatureItem mediaFeatureItem = (MediaFeatureItem) list.get(i2);
                if (i2 < list.size() - 1 && mediaFeatureItem.isSelectionFeatureDone() && !((MediaFeatureItem) list.get(i2 + 1)).isSelectionFeatureDone()) {
                    arrayList.add(mediaFeatureItem);
                } else if (!mediaFeatureItem.isSelectionFeatureDone() || (!arrayList.isEmpty() && DateUtils.withinTime(((MediaFeatureItem) arrayList.get(arrayList.size() - 1)).getDateTime(), mediaFeatureItem.getDateTime(), 3600000))) {
                    arrayList.add(mediaFeatureItem);
                }
                if (arrayList.size() >= i) {
                    break;
                }
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            if (!ensureImagePath((MediaFeatureItem) it.next())) {
                it.remove();
            }
        }
        return arrayList;
    }

    public static boolean isDeviceSupportImageFeatureSelection() {
        return sIsSupportImageFeatureSelection && !BuildUtil.isPad() && Rom.IS_MIUI;
    }

    public static boolean isDeviceSupportStoryFunction() {
        return isImageFeatureCalculationEnable() && !BuildUtil.isInternational() && !BuildUtil.isPad();
    }

    public static boolean isImageFeatureCalculationEnable() {
        return isDeviceSupportImageFeatureSelection();
    }

    public static boolean isImageFeatureSelectionVisiable() {
        return isImageFeatureCalculationEnable() && Assistant.isImageSelectionFunctionOn();
    }

    public static boolean isStoryGenerateEnable() {
        return isDeviceSupportStoryFunction() && Assistant.isStoryFunctionOn();
    }

    /* access modifiers changed from: private */
    public boolean markCaculateState(boolean z) {
        Log.d("ImageFeatureManager", "New image Caculating : %b", (Object) Boolean.valueOf(z));
        this.mIsCaculating = z;
        return this.mIsCaculating;
    }

    public static List<MediaFeatureItem> queryNearByMediaItems(long j) {
        return (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, MediaFeatureItem.PROJECTION, String.format("%s < %s AND %s > %s", new Object[]{"mixedDateTime", Long.valueOf(j), "mixedDateTime", Long.valueOf(j - 3600000)}), (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) new QueryHandler<List<MediaFeatureItem>>() {
            public List<MediaFeatureItem> handle(Cursor cursor) {
                return MediaFeatureItem.getMediaFeatureItemsFromCursor(cursor);
            }
        });
    }

    /* access modifiers changed from: private */
    public void scheduleNewImages() {
        boolean z = false;
        if (MiscUtil.isAppProcessInForeground(GalleryApp.sGetAndroidContext()) && Sync.getPowerCanSync()) {
            Log.d("ImageFeatureManager", "Status meet,trigger new image feature calculation");
            AnonymousClass4 r0 = new Listener() {
                public void onCancel() {
                    ImageFeatureManager.this.markCaculateState(false);
                }

                public void onComputeComplete(AlgorithmResult algorithmResult) {
                }

                public void onSaveComplete(AlgorithmResult algorithmResult) {
                    ImageFeatureManager.this.markCaculateState(false);
                    if (ImageFeatureManager.this.mHasMoreImageToProcess && algorithmResult != null && algorithmResult.getResultCode() == 0) {
                        ImageFeatureManager.this.mHasMoreImageToProcess = false;
                        ImageFeatureManager.this.triggerNewImageCalculation();
                    }
                }

                public void onStart() {
                }
            };
            Log.d("ImageFeatureManager", "Start process recent %d images for image selection", (Object) Integer.valueOf(200));
            List list = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), UriUtil.appendLimit(Cloud.CLOUD_URI, 200), MediaFeatureItem.PROJECTION, ScenarioConstants.ALL_IMAGE_BASE_SELECTION, (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) new QueryHandler<List<MediaFeatureItem>>() {
                public List<MediaFeatureItem> handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToFirst()) {
                        return null;
                    }
                    ArrayList arrayList = new ArrayList(cursor.getCount());
                    do {
                        arrayList.add(new MediaFeatureItem(cursor));
                    } while (cursor.moveToNext());
                    return arrayList;
                }
            });
            if (MiscUtil.isValid(list)) {
                CardUtil.bindImageFeatures(list);
                List unProcessedImages = getUnProcessedImages(list, 30);
                if (MiscUtil.isValid(unProcessedImages)) {
                    if (unProcessedImages.size() >= 30) {
                        z = true;
                    }
                    this.mHasMoreImageToProcess = z;
                    calculateImageFeatureAndGroupAsync(Priority.PRIORITY_NORMAL, unProcessedImages, Algorithm.FLAG_FEATURE_ALL, r0);
                    return;
                }
            }
        }
        markCaculateState(false);
    }

    public void calculateClusterGroupAsync(Priority priority, List<MediaFeatureItem> list, boolean z, boolean z2, Listener<ClusteGroupResult> listener) {
        if (MiscUtil.isValid(list)) {
            Log.d("ImageFeatureManager", "calculateClusterGroupAsync,image count:%d", (Object) Integer.valueOf(list.size()));
            ClusterGroupRequest clusterGroupRequest = new ClusterGroupRequest(priority, new ClusteGroupRequestParams(list, z), z2);
            clusterGroupRequest.setMainThreadListener(listener);
            clusterGroupRequest.execute();
        }
    }

    public ClusteGroupResult calculateClusterGroupSync(List<MediaFeatureItem> list, boolean z, boolean z2) {
        if (!MiscUtil.isValid(list)) {
            return new ClusteGroupResult(3);
        }
        Log.d("ImageFeatureManager", "calculateClusterGroupSync,image count:%d", (Object) Integer.valueOf(list.size()));
        return (ClusteGroupResult) new ClusterGroupRequest(Priority.PRIORITY_NORMAL, new ClusteGroupRequestParams(list, z), z2).executeSync();
    }

    public void calculateImageFeatureAndGroupAsync(Priority priority, List<MediaFeatureItem> list, int i, Listener listener) {
        int i2;
        int[] iArr;
        if (MiscUtil.isValid(list)) {
            Log.d("ImageFeatureManager", "Calculate imageGroup with algorithm async,image count:%d", (Object) Integer.valueOf(list.size()));
            for (MediaFeatureItem mediaFeatureItem : list) {
                if (mediaFeatureItem.getImageFeature() == null) {
                    i2 = i;
                    int i3 = i2;
                } else {
                    int i4 = 0;
                    for (int i5 : Algorithm.FLAG_FEATURE_ALL_ARRAY) {
                        if (FlagUtil.hasFlag(i, i5) && !mediaFeatureItem.getImageFeature().isFeatureDone(i5)) {
                            i4 = FlagUtil.setFlag(i4, i5);
                        }
                    }
                    int i6 = i;
                    i2 = i4;
                }
                if (i2 != 0) {
                    handleImageWithAlgorithmAsync(priority, mediaFeatureItem, true, i2, null);
                }
            }
            calculateClusterGroupAsync(priority, list, true, true, listener);
        } else if (listener != null) {
            listener.onCancel();
        }
    }

    public Bitmap getReusedBitMap(Options options) {
        Bitmap bitmap = this.mImageFeatureReusedBitCache.get(options);
        String str = "ImageFeatureManager";
        StringBuilder sb = new StringBuilder();
        sb.append("get reused bitmap :");
        sb.append(bitmap != null);
        Log.d(str, sb.toString());
        return bitmap;
    }

    public void handleImageWithAlgorithmAsync(Priority priority, MediaFeatureItem mediaFeatureItem, boolean z, int i, Listener<BatchAlgorithmResult> listener) {
        BatchImageAlgorithmRequest batchImageAlgorithmRequest = new BatchImageAlgorithmRequest(priority, new ImageFeatureBitmapRequestParams(mediaFeatureItem, z), i);
        batchImageAlgorithmRequest.setMainThreadListener(listener);
        batchImageAlgorithmRequest.execute();
    }

    public BatchAlgorithmResult handleImageWithAlgorithmSync(Priority priority, MediaFeatureItem mediaFeatureItem, boolean z, int i) {
        return (BatchAlgorithmResult) new BatchImageAlgorithmRequest(priority, new ImageFeatureBitmapRequestParams(mediaFeatureItem, z), i).executeSync();
    }

    public boolean isNewImageCalculationEnable() {
        return isImageFeatureCalculationEnable() && LibraryManager.getInstance().isLibrarysExist(LibraryConstants.sImageFeatureSelectionLibraries);
    }

    public void onImageBatchDelete(List<Long> list) {
        if (MiscUtil.isValid(list) && ImageFeatureCacheManager.getInstance().onImageDeleteBatch(list)) {
            Log.d("ImageFeatureManager", "%d Images delete or add to secret batch, delete them in cards", (Object) Integer.valueOf(list.size()));
            ThreadManager.getWorkHandler().removeCallbacks(this.mImageDeleteRunnable);
            ThreadManager.getWorkHandler().postDelayed(this.mImageDeleteRunnable, 3000);
        }
    }

    public void onImageDelete(long j) {
        if (ImageFeatureCacheManager.getInstance().onImageDelete(j)) {
            Log.d("ImageFeatureManager", "Image %s delete or add to secret, delete them in cards", (Object) Long.valueOf(j));
            ThreadManager.getWorkHandler().removeCallbacks(this.mImageDeleteRunnable);
            ThreadManager.getWorkHandler().postDelayed(this.mImageDeleteRunnable, 3000);
        }
    }

    public void onImageDelete(String str) {
        try {
            onImageDelete(Long.parseLong(str));
        } catch (NumberFormatException e) {
            Log.e("ImageFeatureManager", (Throwable) e);
        }
    }

    public void recycleBitmap(Bitmap bitmap) {
        this.mImageFeatureReusedBitCache.put(bitmap);
    }

    public void triggerNewImageCalculation() {
        if (!isNewImageCalculationEnable()) {
            Log.d("ImageFeatureManager", "ImageFeature Selection Disable or Libraries not exist");
            return;
        }
        if (!this.mIsCaculating) {
            this.mIsCaculating = true;
            this.mThreadPoolExecutor.execute(createNewImageCalculateRunnable());
        }
    }
}
