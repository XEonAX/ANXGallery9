package com.miui.gallery.provider.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Bundle;
import android.os.Process;
import android.text.TextUtils;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.assistant.model.TinyImageFeature;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.preference.GalleryPreferences.HomePage;
import com.miui.gallery.provider.AlbumManager;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.MediaSortDateHelper;
import com.miui.gallery.provider.MediaSortDateHelper.SortDate;
import com.miui.gallery.provider.TimelineHeadersGroup;
import com.miui.gallery.provider.cache.MediaItem.Generator;
import com.miui.gallery.provider.cache.MediaItem.QueryFactory;
import com.miui.gallery.util.DebugUtil;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

public class MediaManager extends CacheManager<MediaItem> {
    private static Comparator<MediaItem> sFeatureComparator;
    private static Comparator<MediaItem> sTimeComparator;
    /* access modifiers changed from: private */
    public AlbumDelegate mAlbumDelegate;
    /* access modifiers changed from: private */
    public FavoritesDelegate mFavoritesDelegate;
    /* access modifiers changed from: private */
    public String mFirstPartIds;
    /* access modifiers changed from: private */
    public CountDownLatch mFullLoadDoneSignal;
    /* access modifiers changed from: private */
    public final ArrayList<InitializeListener> mInitializeListeners;
    /* access modifiers changed from: private */
    public volatile boolean mInitialized;
    /* access modifiers changed from: private */
    public volatile boolean mIsFullLoadDone;
    private volatile boolean mIsLoadStarted;
    /* access modifiers changed from: private */
    public volatile boolean mIsMinimumLoadDone;
    /* access modifiers changed from: private */
    public final Object mMinimumLoadLock;

    public interface InitializeListener {
        void onProgressUpdate();
    }

    private class InitializeTask implements Runnable {
        private SQLiteOpenHelper mDBHelper;

        public InitializeTask(SQLiteOpenHelper sQLiteOpenHelper) {
            this.mDBHelper = sQLiteOpenHelper;
        }

        private String getLoadSortBy() {
            List albumIdsBySortDate = MediaSortDateHelper.getSortDateProvider().getAlbumIdsBySortDate(SortDate.MODIFY_TIME);
            if (!MiscUtil.isValid(albumIdsBySortDate)) {
                return "mixedDateTime";
            }
            return String.format(Locale.US, "(case when %s in (%s) then %s else %s end)", new Object[]{"localGroupId", TextUtils.join(",", albumIdsBySortDate), "dateModified", "mixedDateTime"});
        }

        /* JADX INFO: finally extract failed */
        private void loadFullPart(SQLiteDatabase sQLiteDatabase) {
            String format;
            String loadSortBy;
            Log.d(".provider.cache.MediaManager", "start load second part");
            long currentTimeMillis = System.currentTimeMillis();
            ArrayList arrayList = new ArrayList();
            if (TextUtils.isEmpty(MediaManager.this.mFirstPartIds)) {
                format = "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType IN (1,2)";
                StringBuilder sb = new StringBuilder();
                sb.append(getLoadSortBy());
                sb.append(" DESC LIMIT -1 OFFSET ");
                sb.append(128);
                loadSortBy = sb.toString();
            } else {
                format = String.format("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType IN (1,2) AND _id NOT IN (%s)", new Object[]{MediaManager.this.mFirstPartIds});
                loadSortBy = getLoadSortBy();
            }
            Cursor query = sQLiteDatabase.query("cloud", MediaManager.this.mGenerator.getProjection(), format, null, null, null, loadSortBy, null);
            if (query != null) {
                try {
                    arrayList.ensureCapacity(4096);
                    while (true) {
                        int i = 0;
                        while (query.moveToNext()) {
                            arrayList.add(MediaManager.this.mGenerator.from(query));
                            i++;
                            if (i != 4096) {
                                if (query.isLast()) {
                                }
                            }
                            publishResult(arrayList);
                            arrayList.clear();
                        }
                        query.close();
                        Log.d(".provider.cache.MediaManager", "load second part cost: %d. current position = %d", Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Integer.valueOf(query.getPosition()));
                        return;
                    }
                } catch (Throwable th) {
                    query.close();
                    throw th;
                }
            }
        }

        private void loadMinimumPart(SQLiteDatabase sQLiteDatabase) {
            String format;
            Log.d(".provider.cache.MediaManager", "read first part");
            long currentTimeMillis = System.currentTimeMillis();
            try {
                if (TextUtils.isEmpty(MediaManager.this.mFirstPartIds)) {
                    format = "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType IN (1,2)";
                } else {
                    format = String.format("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType IN (1,2) AND _id IN (%s)", new Object[]{MediaManager.this.mFirstPartIds});
                }
                String str = format;
                String[] projection = MediaManager.this.mGenerator.getProjection();
                StringBuilder sb = new StringBuilder();
                sb.append(getLoadSortBy());
                sb.append(" DESC");
                Cursor query = sQLiteDatabase.query("cloud", projection, str, null, null, null, sb.toString(), String.valueOf(128));
                if (query == null) {
                    Log.e(".provider.cache.MediaManager", "fill provider failed with a null cursor");
                }
                try {
                    ArrayList arrayList = new ArrayList(64);
                    while (query.moveToNext()) {
                        arrayList.add(MediaManager.this.mGenerator.from(query));
                    }
                    publishResult(arrayList);
                    Log.d(".provider.cache.MediaManager", "load %d item for the first time, costs %dms", Integer.valueOf(query.getCount()), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                } finally {
                    query.close();
                }
            } catch (SQLiteException e) {
                Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
                generatorCommonParams.put("dbversion", String.valueOf(sQLiteDatabase.getVersion()));
                StringBuilder sb2 = new StringBuilder();
                sb2.append(e.getMessage());
                sb2.append(" : ");
                sb2.append(e.getCause());
                generatorCommonParams.put("exception", sb2.toString());
                GallerySamplingStatHelper.recordErrorEvent("db_helper", "db_mediamanager_load", generatorCommonParams);
                DebugUtil.exportDB(false);
                GalleryDBHelper.getInstance().deleteDatabase();
                throw e;
            }
        }

        private void lockedLoadMinimumPart(SQLiteDatabase sQLiteDatabase) {
            synchronized (MediaManager.this.mMinimumLoadLock) {
                try {
                    Log.d(".provider.cache.MediaManager", "read albums");
                    MediaManager.this.mAlbumDelegate.load(sQLiteDatabase);
                    MediaManager.this.mFavoritesDelegate.load(sQLiteDatabase);
                    MediaManager.this.mFirstPartIds = HomePage.getHomePageImageIds();
                    loadMinimumPart(sQLiteDatabase);
                    MediaManager.this.mIsMinimumLoadDone = true;
                    MediaManager.this.mMinimumLoadLock.notifyAll();
                } catch (Throwable th) {
                    MediaManager.this.mIsMinimumLoadDone = true;
                    MediaManager.this.mMinimumLoadLock.notifyAll();
                    throw th;
                }
            }
        }

        private void notifyProgressUpdate() {
            synchronized (MediaManager.this.mInitializeListeners) {
                if (MediaManager.this.mInitializeListeners.size() > 0) {
                    Iterator it = MediaManager.this.mInitializeListeners.iterator();
                    while (it.hasNext()) {
                        InitializeListener initializeListener = (InitializeListener) it.next();
                        if (initializeListener != null) {
                            initializeListener.onProgressUpdate();
                        }
                    }
                }
            }
        }

        private void publishResult(List<MediaItem> list) {
            synchronized (MediaManager.this.mModifyLock) {
                for (MediaItem add : list) {
                    MediaManager.this.mCache.add(add);
                }
                notifyProgressUpdate();
            }
        }

        public void run() {
            Log.d(".provider.cache.MediaManager", "acquire initialize lock");
            try {
                Log.d(".provider.cache.MediaManager", "start initialize");
                SQLiteDatabase readableDatabase = this.mDBHelper.getReadableDatabase();
                lockedLoadMinimumPart(readableDatabase);
                Process.setThreadPriority(10);
                loadFullPart(readableDatabase);
                MediaManager.this.mInitialized = true;
                MediaManager.this.mIsFullLoadDone = true;
                MediaManager.this.mFullLoadDoneSignal.countDown();
                synchronized (MediaManager.this.mInitializeListeners) {
                    MediaManager.this.mInitializeListeners.clear();
                }
            } catch (Throwable th) {
                MediaManager.this.mIsFullLoadDone = true;
                MediaManager.this.mFullLoadDoneSignal.countDown();
                synchronized (MediaManager.this.mInitializeListeners) {
                    MediaManager.this.mInitializeListeners.clear();
                    throw th;
                }
            }
        }
    }

    private static class SingletonHolder {
        static final MediaManager INSTANCE = new MediaManager();
    }

    private MediaManager() {
        this.mIsLoadStarted = false;
        this.mIsFullLoadDone = false;
        this.mMinimumLoadLock = new Object();
        this.mIsMinimumLoadDone = false;
        this.mInitialized = false;
        this.mFullLoadDoneSignal = new CountDownLatch(1);
        this.mInitializeListeners = new ArrayList<>();
        this.mAlbumDelegate = new AlbumDelegate();
        this.mFavoritesDelegate = new FavoritesDelegate();
        this.mCache = new LinkedList();
        this.mGenerator = new Generator(this.mAlbumDelegate, this.mFavoritesDelegate);
        this.mQueryFactory = new QueryFactory();
    }

    private static List<MediaItem> filterBestItems(List<MediaItem> list, int i) {
        Collections.sort(list, getFeatureComparator());
        List<MediaItem> subList = list.subList(0, i);
        Collections.sort(subList, getTimeComparator());
        return subList;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x00ab  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0011 A[SYNTHETIC] */
    private List<TimelineHeadersGroup> generateGroup(List<MediaItem> list, Comparator<MediaItem> comparator) {
        Integer valueOf = Integer.valueOf(1);
        LinkedList linkedList = new LinkedList();
        MediaItem mediaItem = null;
        int i = 0;
        TimelineHeadersGroup timelineHeadersGroup = null;
        for (MediaItem mediaItem2 : list) {
            if (mediaItem == null) {
                TimelineHeadersGroup timelineHeadersGroup2 = new TimelineHeadersGroup();
                timelineHeadersGroup2.start = i;
                timelineHeadersGroup2.itemLocations.add(mediaItem2.getLocation());
                if (!TextUtils.isEmpty(mediaItem2.getLocation())) {
                    timelineHeadersGroup2.validLocation = mediaItem2.getLocation();
                }
                timelineHeadersGroup = timelineHeadersGroup2;
            } else if (comparator.compare(mediaItem2, mediaItem) == 0) {
                valueOf = Integer.valueOf(valueOf.intValue() + 1);
                timelineHeadersGroup.itemLocations.add(mediaItem2.getLocation());
                if (TextUtils.isEmpty(timelineHeadersGroup.validLocation) && !TextUtils.isEmpty(mediaItem2.getLocation())) {
                    timelineHeadersGroup.validLocation = mediaItem2.getLocation();
                }
                i++;
                if (i != list.size()) {
                    timelineHeadersGroup.count = valueOf.intValue();
                    linkedList.add(timelineHeadersGroup);
                }
            } else {
                timelineHeadersGroup.count = valueOf.intValue();
                linkedList.add(timelineHeadersGroup);
                TimelineHeadersGroup timelineHeadersGroup3 = new TimelineHeadersGroup();
                timelineHeadersGroup3.start = i;
                timelineHeadersGroup3.itemLocations.add(mediaItem2.getLocation());
                if (!TextUtils.isEmpty(mediaItem2.getLocation())) {
                    timelineHeadersGroup3.validLocation = mediaItem2.getLocation();
                }
                timelineHeadersGroup = timelineHeadersGroup3;
                valueOf = Integer.valueOf(1);
            }
            mediaItem = mediaItem2;
            i++;
            if (i != list.size()) {
            }
        }
        return linkedList;
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x00f0  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x016b  */
    private List<TimelineHeadersGroup> generateMonthItems(List<MediaItem> list) {
        Iterator it;
        AnonymousClass4 r24;
        TimelineHeadersGroup timelineHeadersGroup;
        List<MediaItem> list2 = list;
        AnonymousClass2 r2 = new Comparator<MediaItem>() {
            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                if (GalleryDateUtils.isSameMonth(mediaItem.getAliasSortDate(), mediaItem2.getAliasSortDate())) {
                    return 0;
                }
                return Long.compare(mediaItem2.getAliasSortTime(), mediaItem.getAliasSortTime());
            }
        };
        LinkedList linkedList = new LinkedList();
        long currentTimeMillis = System.currentTimeMillis();
        List<TimelineHeadersGroup> generateGroup = generateGroup(list2, r2);
        Log.d(".provider.cache.MediaManager", "generate date groups cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        AnonymousClass3 r4 = new Comparator<MediaItem>() {
            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                return (!TextUtils.isEmpty(mediaItem.getLocation()) || !TextUtils.isEmpty(mediaItem2.getLocation())) ? MediaManager.this.locationCompare(mediaItem.getLocation(), mediaItem2.getLocation()) : mediaItem2.getAliasSortDate() - mediaItem.getAliasSortDate();
            }
        };
        long currentTimeMillis2 = System.currentTimeMillis();
        for (TimelineHeadersGroup timelineHeadersGroup2 : generateGroup) {
            int size = linkedList.size();
            TimelineHeadersGroup timelineHeadersGroup3 = null;
            TimelineHeadersGroup timelineHeadersGroup4 = null;
            for (TimelineHeadersGroup timelineHeadersGroup5 : generateGroup(list2.subList(timelineHeadersGroup2.start, timelineHeadersGroup2.start + timelineHeadersGroup2.count), r4)) {
                TimelineHeadersGroup timelineHeadersGroup6 = linkedList.size() > size ? (TimelineHeadersGroup) linkedList.get(linkedList.size() - 1) : null;
                timelineHeadersGroup5.start += timelineHeadersGroup2.start;
                if (timelineHeadersGroup3 != null) {
                    if (!TextUtils.isEmpty(timelineHeadersGroup3.validLocation)) {
                        if (timelineHeadersGroup6 != null && locationCompare(timelineHeadersGroup3.validLocation, timelineHeadersGroup6.validLocation) == 0) {
                            timelineHeadersGroup6.count += timelineHeadersGroup3.count;
                            timelineHeadersGroup6.itemLocations.addAll(timelineHeadersGroup3.itemLocations);
                        } else if (timelineHeadersGroup6 == null || locationCompare(timelineHeadersGroup3.validLocation, timelineHeadersGroup5.validLocation) == 0) {
                            timelineHeadersGroup5.start = timelineHeadersGroup3.start;
                            timelineHeadersGroup5.count += timelineHeadersGroup3.count;
                            timelineHeadersGroup5.itemLocations.addAll(0, timelineHeadersGroup3.itemLocations);
                        }
                        timelineHeadersGroup = null;
                        if (timelineHeadersGroup != null) {
                            if ((timelineHeadersGroup6 != null ? Math.abs(((MediaItem) list2.get((timelineHeadersGroup6.start + timelineHeadersGroup6.count) - 1)).getAliasSortTime() - ((MediaItem) list2.get(timelineHeadersGroup.start)).getAliasSortTime()) : Long.MAX_VALUE) <= Math.abs(((MediaItem) list2.get((timelineHeadersGroup.start + timelineHeadersGroup.count) - 1)).getAliasSortTime() - ((MediaItem) list2.get(timelineHeadersGroup5.start)).getAliasSortTime())) {
                                timelineHeadersGroup6.count += timelineHeadersGroup.count;
                                timelineHeadersGroup6.itemLocations.addAll(timelineHeadersGroup.itemLocations);
                            } else {
                                timelineHeadersGroup5.start = timelineHeadersGroup.start;
                                timelineHeadersGroup5.count += timelineHeadersGroup.count;
                                timelineHeadersGroup5.itemLocations.addAll(0, timelineHeadersGroup.itemLocations);
                            }
                            timelineHeadersGroup = null;
                        }
                        if (isValidLocationGroup(timelineHeadersGroup5)) {
                            if (timelineHeadersGroup6 == null || locationCompare(timelineHeadersGroup5.validLocation, timelineHeadersGroup6.validLocation) != 0) {
                                linkedList.add(timelineHeadersGroup5);
                            } else {
                                timelineHeadersGroup6.count += timelineHeadersGroup5.count;
                                timelineHeadersGroup6.itemLocations.addAll(timelineHeadersGroup5.itemLocations);
                            }
                            timelineHeadersGroup3 = timelineHeadersGroup;
                            timelineHeadersGroup4 = timelineHeadersGroup6;
                        }
                    }
                    timelineHeadersGroup = timelineHeadersGroup3;
                    if (timelineHeadersGroup != null) {
                    }
                    if (isValidLocationGroup(timelineHeadersGroup5)) {
                    }
                } else if (isValidLocationGroup(timelineHeadersGroup5)) {
                    if (timelineHeadersGroup6 == null || locationCompare(timelineHeadersGroup5.validLocation, timelineHeadersGroup6.validLocation) != 0) {
                        linkedList.add(timelineHeadersGroup5);
                        timelineHeadersGroup4 = timelineHeadersGroup6;
                    } else {
                        timelineHeadersGroup6.count += timelineHeadersGroup5.count;
                        timelineHeadersGroup6.itemLocations.addAll(timelineHeadersGroup5.itemLocations);
                        timelineHeadersGroup4 = timelineHeadersGroup6;
                    }
                }
                timelineHeadersGroup3 = timelineHeadersGroup5;
                timelineHeadersGroup4 = timelineHeadersGroup6;
            }
            if (timelineHeadersGroup3 != null) {
                if (timelineHeadersGroup4 == null) {
                    linkedList.add(timelineHeadersGroup3);
                } else if (!isValidLocationGroup(timelineHeadersGroup3) || locationCompare(timelineHeadersGroup3.validLocation, timelineHeadersGroup4.validLocation) == 0) {
                    timelineHeadersGroup4.count += timelineHeadersGroup3.count;
                    timelineHeadersGroup4.itemLocations.addAll(timelineHeadersGroup3.itemLocations);
                } else {
                    linkedList.add(timelineHeadersGroup3);
                }
            }
        }
        Log.d(".provider.cache.MediaManager", "generate location groups cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis2));
        long currentTimeMillis3 = System.currentTimeMillis();
        LinkedList linkedList2 = new LinkedList();
        AnonymousClass4 r6 = new Comparator<MediaItem>() {
            public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                if (GalleryDateUtils.isSameDay(mediaItem.getAliasSortDate(), mediaItem2.getAliasSortDate())) {
                    return 0;
                }
                return mediaItem2.getAliasSortDate() - mediaItem.getAliasSortDate();
            }
        };
        Log.d(".provider.cache.MediaManager", "image feature initialized %s", (Object) Boolean.valueOf(ImageFeatureCacheManager.getInstance().isInitialized()));
        Iterator it2 = linkedList.iterator();
        while (it2.hasNext()) {
            TimelineHeadersGroup timelineHeadersGroup7 = (TimelineHeadersGroup) it2.next();
            LinkedList linkedList3 = new LinkedList();
            if (timelineHeadersGroup7.count <= 10) {
                linkedList3.addAll(list2.subList(timelineHeadersGroup7.start, timelineHeadersGroup7.start + timelineHeadersGroup7.count));
            } else if (ImageFeatureCacheManager.getInstance().isInitialized()) {
                int i = timelineHeadersGroup7.start;
                int i2 = -1;
                long j = -1;
                double d = -1.0d;
                while (i < timelineHeadersGroup7.start + timelineHeadersGroup7.count) {
                    MediaItem mediaItem = (MediaItem) list2.get(i);
                    TimelineHeadersGroup timelineHeadersGroup8 = timelineHeadersGroup7;
                    TinyImageFeature imageFeature = ImageFeatureCacheManager.getInstance().getImageFeature(mediaItem.getId());
                    if (imageFeature == null) {
                        if (i2 != -1) {
                            linkedList3.add(list2.get(i2));
                        }
                        linkedList3.add(mediaItem);
                        i2 = -1;
                        j = -1;
                        d = -1.0d;
                    } else if (imageFeature.getClusterGroupId() != j) {
                        if (i2 != -1) {
                            linkedList3.add(list2.get(i2));
                        }
                        long clusterGroupId = imageFeature.getClusterGroupId();
                        d = imageFeature.getScore();
                        j = clusterGroupId;
                        i2 = i;
                    } else if (imageFeature.getScore() > d) {
                        d = imageFeature.getScore();
                        i2 = i;
                    }
                    i++;
                    timelineHeadersGroup7 = timelineHeadersGroup8;
                }
                TimelineHeadersGroup timelineHeadersGroup9 = timelineHeadersGroup7;
                if (i2 != -1) {
                    linkedList3.add(list2.get(i2));
                }
                timelineHeadersGroup7 = timelineHeadersGroup9;
            } else {
                linkedList3.addAll(list2.subList(timelineHeadersGroup7.start, timelineHeadersGroup7.start + timelineHeadersGroup7.count));
            }
            int size2 = linkedList2.size();
            if (linkedList3.size() > 40) {
                float size3 = 40.0f / ((float) linkedList3.size());
                Iterator it3 = generateGroup(linkedList3, r6).iterator();
                int i3 = 0;
                while (true) {
                    if (!it3.hasNext()) {
                        r24 = r6;
                        it = it2;
                        break;
                    }
                    TimelineHeadersGroup timelineHeadersGroup10 = (TimelineHeadersGroup) it3.next();
                    r24 = r6;
                    it = it2;
                    int ceil = (int) Math.ceil((double) (((float) timelineHeadersGroup10.count) * size3));
                    if (ceil > 0) {
                        List filterBestItems = filterBestItems(linkedList3.subList(timelineHeadersGroup10.start, timelineHeadersGroup10.start + timelineHeadersGroup10.count), ceil);
                        i3 += filterBestItems.size();
                        linkedList2.addAll(filterBestItems);
                        if (i3 >= 40) {
                            for (int i4 = 0; i4 < i3 - 40; i4++) {
                                linkedList2.remove(linkedList2.size() - 1);
                            }
                        }
                    }
                    r6 = r24;
                    it2 = it;
                }
            } else {
                r24 = r6;
                it = it2;
                linkedList2.addAll(linkedList3);
            }
            int size4 = linkedList2.size();
            timelineHeadersGroup7.start = size2;
            timelineHeadersGroup7.count = size4 - size2;
            r6 = r24;
            it2 = it;
        }
        Log.d(".provider.cache.MediaManager", "filter items cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis3));
        list.clear();
        list2.addAll(linkedList2);
        return linkedList;
    }

    private static Comparator<MediaItem> getFeatureComparator() {
        if (sFeatureComparator == null) {
            sFeatureComparator = new Comparator<MediaItem>() {
                public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                    TinyImageFeature imageFeature = ImageFeatureCacheManager.getInstance().getImageFeature(mediaItem.getId());
                    TinyImageFeature imageFeature2 = ImageFeatureCacheManager.getInstance().getImageFeature(mediaItem2.getId());
                    if (imageFeature == null && imageFeature2 != null) {
                        return 1;
                    }
                    if (imageFeature != null && imageFeature2 == null) {
                        return -1;
                    }
                    if (imageFeature == null || imageFeature2 == null) {
                        return 0;
                    }
                    return Double.compare(imageFeature2.getScore(), imageFeature.getScore());
                }
            };
        }
        return sFeatureComparator;
    }

    public static MediaManager getInstance() {
        return SingletonHolder.INSTANCE;
    }

    private static Comparator<MediaItem> getTimeComparator() {
        if (sTimeComparator == null) {
            sTimeComparator = new Comparator<MediaItem>() {
                public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                    return Long.compare(mediaItem2.getAliasSortTime(), mediaItem.getAliasSortTime());
                }
            };
        }
        return sTimeComparator;
    }

    private boolean isValidLocationGroup(TimelineHeadersGroup timelineHeadersGroup) {
        return timelineHeadersGroup.count >= 10 && !TextUtils.isEmpty(timelineHeadersGroup.validLocation);
    }

    /* access modifiers changed from: private */
    public int locationCompare(String str, String str2) {
        String subToCity = LocationManager.getInstance().subToCity(str);
        String subToCity2 = LocationManager.getInstance().subToCity(str2);
        int i = 0;
        if (TextUtils.isEmpty(subToCity) && TextUtils.isEmpty(subToCity2)) {
            return 0;
        }
        if (TextUtils.isEmpty(subToCity) || TextUtils.isEmpty(subToCity2)) {
            return 1;
        }
        if (!subToCity.contains(subToCity2) && !subToCity2.contains(subToCity)) {
            i = 1;
        }
        return i;
    }

    private int transformOrderByColumnIndex(int i) {
        if (i == 18) {
            return 19;
        }
        if (i == 30) {
            return 31;
        }
        if (i != 36) {
            return i;
        }
        return 37;
    }

    public void addInitializeListener(InitializeListener initializeListener) {
        if (this.mIsFullLoadDone) {
            Log.d(".provider.cache.MediaManager", "no need to add listener after full load done!");
            return;
        }
        synchronized (this.mInitializeListeners) {
            this.mInitializeListeners.add(initializeListener);
        }
    }

    public void deleteAttributes(long j) {
        this.mAlbumDelegate.delete(j);
    }

    public void ensureMinimumPartDone() {
        if (!this.mIsMinimumLoadDone) {
            long currentTimeMillis = System.currentTimeMillis();
            synchronized (this.mMinimumLoadLock) {
                if (!this.mIsMinimumLoadDone) {
                    try {
                        this.mMinimumLoadLock.wait();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            Log.d(".provider.cache.MediaManager", "wait for minimum part loading cost : %dms ", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }

    /* access modifiers changed from: protected */
    public ContentValues filterLogInfo(ContentValues contentValues) {
        if (contentValues == null) {
            return null;
        }
        ContentValues contentValues2 = new ContentValues(contentValues);
        contentValues2.remove("location");
        contentValues2.remove("extraGPS");
        contentValues2.remove("address");
        contentValues2.remove("exifGPSLatitude");
        contentValues2.remove("exifGPSLongitude");
        contentValues2.remove("exifGPSAltitude");
        return contentValues2;
    }

    public boolean initialized() {
        if (this.mIsFullLoadDone) {
            return this.mInitialized;
        }
        Log.d(".provider.cache.MediaManager", "not initialized, waiting lock from: %s", (Object) TextUtils.join("\n\t", Thread.currentThread().getStackTrace()));
        long currentTimeMillis = System.currentTimeMillis();
        try {
            this.mFullLoadDoneSignal.await();
            Log.d(".provider.cache.MediaManager", "wait full load done costs %d ms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        } catch (InterruptedException e) {
            Log.e(".provider.cache.MediaManager", (Throwable) e);
        }
        Log.d(".provider.cache.MediaManager", "initialization finished: %b", (Object) Boolean.valueOf(this.mInitialized));
        return this.mInitialized;
    }

    public int insert(SQLiteDatabase sQLiteDatabase, String str, String[] strArr) {
        int i = 0;
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        Cursor query = sQLiteDatabase2.query("cloud", this.mGenerator.getProjection(), String.format("%s AND (%s)", new Object[]{"(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND serverType IN (1,2)", str}), strArr, null, null, null, null);
        if (query != null) {
            while (query.moveToNext()) {
                try {
                    MediaItem mediaItem = (MediaItem) this.mGenerator.from(query);
                    synchronized (this.mModifyLock) {
                        this.mCache.add(mediaItem);
                    }
                    i++;
                } catch (Throwable th) {
                    query.close();
                    throw th;
                }
            }
            query.close();
        }
        return i;
    }

    public long insert(long j, ContentValues contentValues) {
        if (!isItemDeleted(contentValues)) {
            return super.insert(j, contentValues);
        }
        return 0;
    }

    public void insertAttributes(long j, long j2) {
        Log.d(".provider.cache.MediaManager", "insert attributes[%d] for album[%d]", Long.valueOf(j2), Long.valueOf(j));
        this.mAlbumDelegate.insert(j, j2);
    }

    public void insertToFavorites(String str) {
        this.mFavoritesDelegate.insertToFavorites(str);
    }

    public boolean isItemDeleted(ContentValues contentValues) {
        Integer asInteger = contentValues.getAsInteger("localFlag");
        if (asInteger == null || !(asInteger.intValue() == 11 || asInteger.intValue() == 2)) {
            if (contentValues.containsKey("serverStatus")) {
                String asString = contentValues.getAsString("serverStatus");
                if ("deleted".equals(asString) || "purged".equals(asString)) {
                    Log.d(".provider.cache.MediaManager", "find a deleted server type");
                    return true;
                }
            }
            return false;
        }
        Log.d(".provider.cache.MediaManager", "find a deleted local flag");
        return true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
        return;
     */
    public synchronized void load(SQLiteOpenHelper sQLiteOpenHelper) {
        if (!this.mIsLoadStarted) {
            if (!this.mIsFullLoadDone) {
                this.mIsLoadStarted = true;
                new Thread(new InitializeTask(sQLiteOpenHelper)).start();
            }
        }
    }

    /* access modifiers changed from: protected */
    public Cursor onCreateCursor(String[] strArr, List<MediaItem> list, String str, String str2, Bundle bundle) {
        List list2;
        RawCursor rawCursor = new RawCursor(list, strArr, this.mQueryFactory.getMapper());
        if (bundle != null && bundle.getBoolean("extra_generate_header")) {
            Log.d(".provider.cache.MediaManager", "caller need a header data, start generate for %d", (Object) Integer.valueOf(list.size()));
            long currentTimeMillis = System.currentTimeMillis();
            int i = bundle.getInt("extra_media_group_by");
            if (i == 0) {
                int indexOf = str2.indexOf(32);
                if (indexOf <= 0) {
                    indexOf = str2.length();
                }
                String substring = str2.substring(0, indexOf);
                int index = this.mQueryFactory.getMapper().getIndex(substring);
                if (index >= 0) {
                    final int transformOrderByColumnIndex = transformOrderByColumnIndex(index);
                    list2 = generateGroup(list, new Comparator<MediaItem>() {
                        public int compare(MediaItem mediaItem, MediaItem mediaItem2) {
                            if (mediaItem.columnEquals(mediaItem2, transformOrderByColumnIndex)) {
                                return 0;
                            }
                            return mediaItem2.getAliasSortDate() - mediaItem.getAliasSortDate();
                        }
                    });
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append(substring);
                    sb.append(" not found");
                    throw new IllegalArgumentException(sb.toString());
                }
            } else if (i == 1) {
                list2 = generateMonthItems(list);
            } else {
                throw new IllegalArgumentException(String.format("unsupported group type %s", new Object[]{Integer.valueOf(i)}));
            }
            TimelineHeadersGroup.bindGroup(list2, rawCursor);
            Log.d(".provider.cache.MediaManager", "header[%d] generated cost %d", Integer.valueOf(i), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
        return rawCursor;
    }

    public void removeFromFavorites(String str) {
        this.mFavoritesDelegate.removeFromFavorites(str);
    }

    public int update(String str, String[] strArr, ContentValues contentValues) {
        if (isItemDeleted(contentValues)) {
            delete(str, strArr);
        }
        return super.update(str, strArr, contentValues);
    }

    public void updateAttributes(long j, long j2) {
        Log.d(".provider.cache.MediaManager", "update album[%d]'s attributes to %d", Long.valueOf(j), Long.valueOf(j2));
        this.mAlbumDelegate.update(j, j2);
    }

    public void updateAttributes(long j, long j2, boolean z, boolean z2) {
        Log.d(".provider.cache.MediaManager", "updating attributesBit[%d] for album[%d] to %s", Long.valueOf(j2), Long.valueOf(j), Boolean.valueOf(z));
        long longValue = this.mAlbumDelegate.queryAttributes(j).longValue();
        this.mAlbumDelegate.update(j, ((AlbumManager.packageAttributeBit(j2, true, true) ^ -1) & longValue) | AlbumManager.packageAttributeBit(j2, z, z2));
    }
}
