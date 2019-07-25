package com.miui.gallery.cleaner;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.CleanerPhotoPickActivity;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager.GroupBestImage;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Listener;
import com.miui.gallery.assistant.manager.AlgorithmRequest.Priority;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.assistant.manager.result.AlgorithmResult;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.assistant.model.TinyImageFeature;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.cleaner.ScanResult.Builder;
import com.miui.gallery.cleaner.ScanResult.OnScanResultClickListener;
import com.miui.gallery.cleaner.ScanResult.ResultImage;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.UriUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class SimilarScanner extends BaseScanner {
    public static final String[] SIMILAR_SCAN_PROJECTION = {"_id", "localFile", "thumbnailFile", "microthumbfile", "size", "alias_create_time", "sha1"};
    private long mCameraLocalId = -1;
    private ArrayList<Long> mClusterGroupId = new ArrayList<>();
    /* access modifiers changed from: private */
    public long mFeatureSqlStartTime = Long.MAX_VALUE;
    private Future mFurtherLoadingTask;
    private ArrayList<Integer> mGroupItemCount = new ArrayList<>();
    private ArrayList<Integer> mGroupStartPos = new ArrayList<>();
    /* access modifiers changed from: private */
    public HashMap<Long, SimilarMediaItem> mId2Item = new HashMap<>();
    /* access modifiers changed from: private */
    public volatile boolean mIsLoadingValid = false;
    private OnScanResultClickListener mOnScanResultClickListener = new OnScanResultClickListener() {
        public void onClick(Context context) {
            Intent intent = new Intent(context, CleanerPhotoPickActivity.class);
            intent.putExtra("extra_cleaner_photo_pick_type", SimilarScanner.this.mType);
            context.startActivity(intent);
            GallerySamplingStatHelper.recordCountEvent("cleaner", "cleaner_result_similar_click");
        }
    };
    /* access modifiers changed from: private */
    public final Object mScanLock = new Object();
    /* access modifiers changed from: private */
    public boolean mScanLockCompleted = false;
    private ArrayList<SimilarGroup> mSimilarGroupList = new ArrayList<>();

    interface OnClusterCompletedListener {
        void onAllCompleted();

        void onCompleteInBatch();
    }

    public class SimilarGroup {
        public long mGroupId;
        public Long[] mImageIdsInGroup;

        SimilarGroup(long j, Long[] lArr) {
            this.mImageIdsInGroup = lArr;
            this.mGroupId = j;
        }
    }

    private static class SimilarMediaItem {
        public long mCreateTime;
        public long mId;
        public String mPath;
        public String mSha1;
        public long mSize;

        private SimilarMediaItem() {
        }
    }

    protected SimilarScanner() {
        super(3);
    }

    /* access modifiers changed from: private */
    public ScanResult buildScanResult() {
        long j;
        int i;
        ResultImage[] resultImageArr = new ResultImage[4];
        synchronized (this.mSimilarGroupList) {
            this.mGroupItemCount.clear();
            this.mGroupStartPos.clear();
            this.mClusterGroupId.clear();
            Iterator it = this.mSimilarGroupList.iterator();
            j = 0;
            i = 0;
            int i2 = 0;
            while (it.hasNext()) {
                SimilarGroup similarGroup = (SimilarGroup) it.next();
                if (!this.mClusterGroupId.contains(Long.valueOf(similarGroup.mGroupId))) {
                    Long[] lArr = similarGroup.mImageIdsInGroup;
                    this.mGroupItemCount.add(Integer.valueOf(lArr.length));
                    this.mGroupStartPos.add(Integer.valueOf(i2));
                    this.mClusterGroupId.add(Long.valueOf(similarGroup.mGroupId));
                    i2 += lArr.length;
                    int i3 = i;
                    long j2 = j;
                    for (Long l : lArr) {
                        SimilarMediaItem similarMediaItem = (SimilarMediaItem) this.mId2Item.get(l);
                        if (i3 < resultImageArr.length) {
                            resultImageArr[i3] = new ResultImage(similarMediaItem.mId, similarMediaItem.mPath);
                        }
                        i3++;
                        j2 += similarMediaItem.mSize;
                    }
                    j = j2;
                    i = i3;
                }
            }
        }
        return new Builder(GalleryApp.sGetAndroidContext()).setType(this.mType).setTitle(R.string.cleaner_similar_title).setDescription(R.string.cleaner_similar_description).setImages(resultImageArr).setAction(R.string.cleaner_similar_action).setSize(j).setCount(i).setCountText(R.plurals.photo_count_format).setOnScanResultClickListener(this.mOnScanResultClickListener).build();
    }

    private void calculateImageFeatureAndCluster(List<MediaFeatureItem> list, int i, OnClusterCompletedListener onClusterCompletedListener) {
        if (this.mIsLoadingValid) {
            calculateImageFeatureAndClusterInBatch(list, 0, i, onClusterCompletedListener);
        }
    }

    /* access modifiers changed from: private */
    public void calculateImageFeatureAndClusterInBatch(List<MediaFeatureItem> list, int i, int i2, OnClusterCompletedListener onClusterCompletedListener) {
        final int i3;
        ArrayList arrayList = new ArrayList();
        if (!MiscUtil.isValid(list) || !this.mIsLoadingValid) {
            onClusterCompletedListener.onAllCompleted();
            return;
        }
        int i4 = i;
        while (true) {
            if (i >= list.size()) {
                i3 = i4;
                break;
            }
            MediaFeatureItem mediaFeatureItem = (MediaFeatureItem) list.get(i);
            if (i < list.size() - 1 && mediaFeatureItem.isSelectionFeatureDone() && !((MediaFeatureItem) list.get(i + 1)).isSelectionFeatureDone()) {
                arrayList.add(mediaFeatureItem);
            } else if (!mediaFeatureItem.isSelectionFeatureDone() || (!arrayList.isEmpty() && DateUtils.withinTime(((MediaFeatureItem) list.get(list.size() - 1)).getDateTime(), mediaFeatureItem.getDateTime(), 3600000))) {
                arrayList.add(mediaFeatureItem);
            }
            if (arrayList.size() >= i2) {
                i3 = i;
                break;
            }
            i4 = i;
            i++;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            if (TextUtils.isEmpty(((MediaFeatureItem) it.next()).getImagePath())) {
                it.remove();
            }
        }
        if (!this.mIsLoadingValid || !MiscUtil.isValid(arrayList) || arrayList.size() <= 1) {
            onClusterCompletedListener.onAllCompleted();
            return;
        }
        ImageFeatureManager instance = ImageFeatureManager.getInstance();
        Priority priority = Priority.PRIORITY_HIGH;
        ArrayList arrayList2 = new ArrayList(arrayList);
        final List<MediaFeatureItem> list2 = list;
        final int i5 = i2;
        final OnClusterCompletedListener onClusterCompletedListener2 = onClusterCompletedListener;
        AnonymousClass7 r2 = new Listener() {
            public void onCancel() {
            }

            public void onComputeComplete(AlgorithmResult algorithmResult) {
            }

            public void onSaveComplete(AlgorithmResult algorithmResult) {
                if (SimilarScanner.this.mIsLoadingValid) {
                    SimilarScanner.this.calculateImageFeatureAndClusterInBatch(list2, i3, i5, onClusterCompletedListener2);
                }
                onClusterCompletedListener2.onCompleteInBatch();
            }

            public void onStart() {
            }
        };
        instance.calculateImageFeatureAndGroupAsync(priority, arrayList2, 5, r2);
    }

    private List<Long> getImagesIdsByGroup(long j) {
        List<TinyImageFeature> imageFeaturesByGroup = ImageFeatureCacheManager.getInstance().getImageFeaturesByGroup(j);
        Collections.sort(imageFeaturesByGroup);
        ArrayList arrayList = new ArrayList();
        for (TinyImageFeature imageId : imageFeaturesByGroup) {
            arrayList.add(Long.valueOf(imageId.getImageId()));
        }
        return arrayList;
    }

    private List<GroupBestImage> getSimilarGroups() {
        List<GroupBestImage> allGroups = ImageFeatureCacheManager.getInstance().getAllGroups(false);
        if (MiscUtil.isValid(allGroups)) {
            Collections.sort(allGroups, new Comparator<GroupBestImage>() {
                public int compare(GroupBestImage groupBestImage, GroupBestImage groupBestImage2) {
                    TinyImageFeature bestImage = groupBestImage.getBestImage();
                    TinyImageFeature bestImage2 = groupBestImage2.getBestImage();
                    long j = 0;
                    long imageDateTime = bestImage == null ? 0 : bestImage.getImageDateTime();
                    if (bestImage2 != null) {
                        j = bestImage2.getImageDateTime();
                    }
                    if (imageDateTime > j) {
                        return -1;
                    }
                    return imageDateTime < j ? 1 : 0;
                }
            });
        }
        return allGroups;
    }

    /* access modifiers changed from: private */
    public boolean handleImagesByLimit(final int i, int i2, OnClusterCompletedListener onClusterCompletedListener) {
        List list = (List) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), UriUtil.appendLimit(Cloud.CLOUD_URI, i), MediaFeatureItem.PROJECTION, String.format(Locale.US, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType=1 AND lower(mimeType) != 'image/gif'  AND exifImageWidth > 1000 AND exifImageLength > 1000 AND localGroupId = %d AND mixedDateTime <= %s", new Object[]{Long.valueOf(this.mCameraLocalId), String.valueOf(this.mFeatureSqlStartTime)}), (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) new QueryHandler<List<MediaFeatureItem>>() {
            public List<MediaFeatureItem> handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst() || !SimilarScanner.this.mIsLoadingValid) {
                    if (SimilarScanner.this.isLoadingValid()) {
                        SimilarScanner.this.mFeatureSqlStartTime = 0;
                    }
                    return null;
                }
                ArrayList arrayList = new ArrayList(cursor.getCount());
                do {
                    arrayList.add(new MediaFeatureItem(cursor));
                } while (cursor.moveToNext());
                if (arrayList.size() >= i) {
                    SimilarScanner.this.mFeatureSqlStartTime = ((MediaFeatureItem) arrayList.get(i - 1)).getDateTime();
                } else {
                    SimilarScanner.this.mFeatureSqlStartTime = 0;
                }
                return arrayList;
            }
        });
        if (MiscUtil.isValid(list) && this.mIsLoadingValid) {
            CardUtil.bindImageFeatures(list);
        }
        if (this.mIsLoadingValid) {
            calculateImageFeatureAndCluster(list, i2, onClusterCompletedListener);
        }
        return list != null && list.size() >= i;
    }

    private void handleRemainImages() {
        this.mFurtherLoadingTask = ThreadManager.getMiscPool().submit(new Job<Object>() {
            private OnClusterCompletedListener mOnCompleteListener = new OnClusterCompletedListener() {
                public void onAllCompleted() {
                    if (SimilarScanner.this.mFeatureSqlStartTime <= 0 || !SimilarScanner.this.mIsLoadingValid) {
                        SimilarScanner.this.mIsLoadingValid = false;
                        SimilarScanner.this.resetSimilarGroupList();
                        SimilarScanner.this.updateScanResult(SimilarScanner.this.buildScanResult());
                        Log.d("SimilarScanner", "finish handle all images.");
                        return;
                    }
                    SimilarScanner.this.handleImagesByLimit(1000, 30, this);
                }

                public void onCompleteInBatch() {
                    if (SimilarScanner.this.mIsLoadingValid) {
                        SimilarScanner.this.resetSimilarGroupList();
                        SimilarScanner.this.updateScanResult(SimilarScanner.this.buildScanResult());
                        Log.d("SimilarScanner", "update scan result.");
                    }
                }
            };

            public Object run(JobContext jobContext) {
                if (SimilarScanner.this.mIsLoadingValid) {
                    Log.d("SimilarScanner", "handle remain images");
                    SimilarScanner.this.handleImagesByLimit(1000, 30, this.mOnCompleteListener);
                }
                return null;
            }
        });
    }

    private long queryCameraAlbumId(Context context) {
        return ((Long) SafeDBUtil.safeQuery(context, Cloud.CLOUD_URI, new String[]{"_id"}, "serverId = 1 AND (serverType=0)", (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Long>() {
            public Long handle(Cursor cursor) {
                long j = -1;
                long j2 = (cursor == null || !cursor.moveToFirst()) ? -1 : cursor.getLong(0);
                if (j2 > 0) {
                    j = j2;
                }
                return Long.valueOf(j);
            }
        })).longValue();
    }

    private boolean removeItem(long j) {
        boolean z;
        synchronized (this.mSimilarGroupList) {
            Iterator it = this.mSimilarGroupList.iterator();
            z = false;
            while (it.hasNext()) {
                SimilarGroup similarGroup = (SimilarGroup) it.next();
                Long[] lArr = similarGroup.mImageIdsInGroup;
                int i = 0;
                while (true) {
                    if (i >= lArr.length) {
                        break;
                    } else if (lArr[i].longValue() == j) {
                        if (lArr.length == 1) {
                            it.remove();
                        } else {
                            Long[] lArr2 = new Long[(lArr.length - 1)];
                            System.arraycopy(lArr, 0, lArr2, 0, i);
                            if (i < lArr.length - 1) {
                                System.arraycopy(lArr, i + 1, lArr2, i, (lArr.length - i) - 1);
                            }
                            similarGroup.mImageIdsInGroup = lArr2;
                        }
                        z = true;
                        continue;
                    } else {
                        i++;
                    }
                }
                if (z) {
                    break;
                }
            }
        }
        return z;
    }

    private void resetIdToItemList() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Set keySet = this.mId2Item.keySet();
        List<Long> scanResultIds = getScanResultIds();
        ArrayList arrayList = new ArrayList();
        for (Long l : scanResultIds) {
            if (!keySet.contains(l)) {
                arrayList.add(l);
            }
        }
        if (MiscUtil.isValid(arrayList)) {
            SafeDBUtil.safeQuery(sGetAndroidContext, Media.URI_OWNER_ALBUM_MEDIA, SIMILAR_SCAN_PROJECTION, String.format("%s IN (%s) AND %s = %d", new Object[]{"_id", TextUtils.join(",", arrayList), "localGroupId", Long.valueOf(this.mCameraLocalId)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Object>() {
                public Object handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToFirst()) {
                        return null;
                    }
                    do {
                        SimilarMediaItem similarMediaItem = new SimilarMediaItem();
                        similarMediaItem.mId = cursor.getLong(0);
                        similarMediaItem.mSha1 = cursor.getString(6);
                        similarMediaItem.mPath = cursor.getString(2);
                        if (TextUtils.isEmpty(similarMediaItem.mPath)) {
                            similarMediaItem.mPath = cursor.getString(1);
                        }
                        if (TextUtils.isEmpty(similarMediaItem.mPath)) {
                            similarMediaItem.mPath = cursor.getString(3);
                        }
                        similarMediaItem.mSize = cursor.getLong(4);
                        similarMediaItem.mCreateTime = cursor.getLong(5);
                        SimilarScanner.this.mId2Item.put(Long.valueOf(similarMediaItem.mId), similarMediaItem);
                    } while (cursor.moveToNext());
                    return null;
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void resetSimilarGroupList() {
        List<GroupBestImage> similarGroups = getSimilarGroups();
        synchronized (this.mSimilarGroupList) {
            this.mSimilarGroupList.clear();
            HashSet hashSet = new HashSet();
            HashSet hashSet2 = new HashSet();
            for (GroupBestImage groupId : similarGroups) {
                Long valueOf = Long.valueOf(groupId.getGroupId());
                if (hashSet.add(valueOf)) {
                    List imagesIdsByGroup = getImagesIdsByGroup(valueOf.longValue());
                    Iterator it = imagesIdsByGroup.iterator();
                    while (it.hasNext()) {
                        if (!hashSet2.add(Long.valueOf(((Long) it.next()).longValue()))) {
                            it.remove();
                        }
                    }
                    if (imagesIdsByGroup.size() > 1) {
                        this.mSimilarGroupList.add(new SimilarGroup(valueOf.longValue(), (Long[]) imagesIdsByGroup.toArray(new Long[imagesIdsByGroup.size()])));
                    }
                }
            }
            resetIdToItemList();
            Iterator it2 = this.mSimilarGroupList.iterator();
            Set keySet = this.mId2Item.keySet();
            while (it2.hasNext()) {
                SimilarGroup similarGroup = (SimilarGroup) it2.next();
                Long[] lArr = similarGroup.mImageIdsInGroup;
                int i = 0;
                int i2 = 0;
                while (true) {
                    if (i >= lArr.length) {
                        break;
                    }
                    if (keySet.contains(lArr[i])) {
                        i2++;
                    } else if (similarGroup.mImageIdsInGroup.length <= 2) {
                        it2.remove();
                        break;
                    } else {
                        Long[] lArr2 = new Long[(similarGroup.mImageIdsInGroup.length - 1)];
                        System.arraycopy(similarGroup.mImageIdsInGroup, 0, lArr2, 0, i2);
                        if (i2 < similarGroup.mImageIdsInGroup.length - 1) {
                            System.arraycopy(similarGroup.mImageIdsInGroup, i2 + 1, lArr2, i2, (similarGroup.mImageIdsInGroup.length - i2) - 1);
                        }
                        similarGroup.mImageIdsInGroup = lArr2;
                    }
                    i++;
                }
            }
        }
    }

    public ArrayList<Long> getClusterGroupId() {
        ArrayList<Long> arrayList;
        synchronized (this.mSimilarGroupList) {
            arrayList = new ArrayList<>(this.mClusterGroupId);
        }
        return arrayList;
    }

    public ArrayList<Integer> getGroupItemCount() {
        ArrayList<Integer> arrayList;
        synchronized (this.mSimilarGroupList) {
            arrayList = new ArrayList<>(this.mGroupItemCount);
        }
        return arrayList;
    }

    public ArrayList<Integer> getGroupStartPos() {
        ArrayList<Integer> arrayList;
        synchronized (this.mSimilarGroupList) {
            arrayList = new ArrayList<>(this.mGroupStartPos);
        }
        return arrayList;
    }

    public List<Long> getScanResultIds() {
        ArrayList arrayList;
        synchronized (this.mSimilarGroupList) {
            arrayList = new ArrayList();
            int size = this.mSimilarGroupList.size();
            for (int i = 0; i < size; i++) {
                Long[] lArr = ((SimilarGroup) this.mSimilarGroupList.get(i)).mImageIdsInGroup;
                for (Long add : lArr) {
                    arrayList.add(add);
                }
            }
        }
        return arrayList;
    }

    public boolean isLoadingValid() {
        return this.mIsLoadingValid;
    }

    public void onMediaItemDeleted(long j) {
        if (removeItem(j)) {
            updateScanResult(buildScanResult());
        }
    }

    /* access modifiers changed from: protected */
    public void onReset() {
        synchronized (this.mSimilarGroupList) {
            this.mSimilarGroupList.clear();
            this.mId2Item.clear();
            this.mGroupItemCount.clear();
            this.mGroupStartPos.clear();
            this.mClusterGroupId.clear();
            this.mFeatureSqlStartTime = Long.MAX_VALUE;
            this.mIsLoadingValid = false;
            this.mScanLockCompleted = false;
            if (this.mFurtherLoadingTask != null) {
                this.mFurtherLoadingTask.cancel();
                this.mFurtherLoadingTask = null;
            }
        }
    }

    public void removeItems(long[] jArr) {
        if (jArr != null) {
            synchronized (this.mSimilarGroupList) {
                for (long j : jArr) {
                    if (removeItem(j)) {
                        updateScanResult(j, buildScanResult());
                    }
                }
            }
        }
    }

    public void removeSingleItemGroups() {
        boolean z;
        synchronized (this.mSimilarGroupList) {
            Iterator it = this.mSimilarGroupList.iterator();
            z = false;
            while (it.hasNext()) {
                if (((SimilarGroup) it.next()).mImageIdsInGroup.length <= 1) {
                    it.remove();
                    z = true;
                }
            }
        }
        if (z) {
            updateScanResult(buildScanResult());
        }
    }

    public ScanResult scan() {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (this.mCameraLocalId == -1) {
            this.mCameraLocalId = queryCameraAlbumId(sGetAndroidContext);
            if (this.mCameraLocalId == -1) {
                return null;
            }
        }
        this.mIsLoadingValid = true;
        this.mFeatureSqlStartTime = Long.MAX_VALUE;
        do {
            resetSimilarGroupList();
            if (this.mSimilarGroupList.size() <= 0 && ImageFeatureManager.getInstance().isNewImageCalculationEnable()) {
                this.mScanLockCompleted = false;
                handleImagesByLimit(30, 30, new OnClusterCompletedListener() {
                    public void onAllCompleted() {
                        synchronized (SimilarScanner.this.mScanLock) {
                            SimilarScanner.this.mScanLockCompleted = true;
                            SimilarScanner.this.mScanLock.notifyAll();
                        }
                    }

                    public void onCompleteInBatch() {
                    }
                });
                synchronized (this.mScanLock) {
                    while (!this.mScanLockCompleted && this.mIsLoadingValid) {
                        try {
                            Log.d("SimilarScanner", "lock for similar cluster result");
                            this.mScanLock.wait();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            if (this.mSimilarGroupList.size() > 0 || this.mFeatureSqlStartTime <= 0 || !this.mIsLoadingValid) {
            }
        } while (ImageFeatureManager.getInstance().isNewImageCalculationEnable());
        if (this.mIsLoadingValid && this.mFeatureSqlStartTime > 0 && ImageFeatureManager.getInstance().isNewImageCalculationEnable()) {
            handleRemainImages();
        }
        Log.d("SimilarScanner", "scan finish.");
        return buildScanResult();
    }
}
