package com.miui.gallery.provider;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.observers.FeatureStrategyObserver;
import com.miui.gallery.cloudcontrol.strategies.AlbumSortDateStrategy;
import com.miui.gallery.preference.GalleryPreferences.Album;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class MediaSortDateHelper {

    private static class CacheBackedSortDateProvider implements SortDateProvider {
        private static final SortDate DEFAULT_SORT_DATE = SortDate.CREATE_TIME;
        private FeatureStrategyObserver<AlbumSortDateStrategy> mFeatureStatusObserver;
        private Set<Long> mSortByModifyAlbumIds;
        private Set<String> mSortByModifyAlbumPaths = Album.getCachedSortByModifyAlbumPaths();

        CacheBackedSortDateProvider() {
            Set<String> cachedSortByModifyAlbumIds = Album.getCachedSortByModifyAlbumIds();
            if (MiscUtil.isValid(cachedSortByModifyAlbumIds)) {
                this.mSortByModifyAlbumIds = new HashSet(cachedSortByModifyAlbumIds.size());
                for (String valueOf : cachedSortByModifyAlbumIds) {
                    this.mSortByModifyAlbumIds.add(Long.valueOf(valueOf));
                }
            }
            this.mFeatureStatusObserver = new FeatureStrategyObserver<AlbumSortDateStrategy>() {
                public void onStrategyChanged(String str, AlbumSortDateStrategy albumSortDateStrategy) {
                    CacheBackedSortDateProvider.this.dispatchStrategy(albumSortDateStrategy);
                }
            };
            AlbumSortDateStrategy albumSortDateStrategy = (AlbumSortDateStrategy) CloudControlManager.getInstance().registerStrategyObserver("album-sort-date", AlbumSortDateStrategy.class, null, this.mFeatureStatusObserver);
            if (albumSortDateStrategy != null) {
                dispatchStrategy(albumSortDateStrategy);
            }
        }

        /* access modifiers changed from: private */
        public void dispatchStrategy(AlbumSortDateStrategy albumSortDateStrategy) {
            if (this.mFeatureStatusObserver != null) {
                CloudControlManager.getInstance().unregisterStrategyObserver(this.mFeatureStatusObserver);
                this.mFeatureStatusObserver = null;
            }
            ThreadManager.getMiscPool().submit(new Job() {
                public final Object run(JobContext jobContext) {
                    return CacheBackedSortDateProvider.updateCacheInfo(AlbumSortDateStrategy.this);
                }
            });
        }

        /* access modifiers changed from: private */
        public static void updateCacheInfo(AlbumSortDateStrategy albumSortDateStrategy) {
            HashSet hashSet = null;
            if (albumSortDateStrategy == null) {
                Album.setCachedSortByModifyAlbumPaths(null);
                return;
            }
            HashSet hashSet2 = new HashSet(albumSortDateStrategy.getAlbumPathsBySortDate(com.miui.gallery.cloudcontrol.strategies.AlbumSortDateStrategy.SortDate.DATE_MODIFIED));
            Album.setCachedSortByModifyAlbumPaths(hashSet2);
            if (MiscUtil.isValid(hashSet2)) {
                hashSet = (HashSet) SafeDBUtil.safeQuery(GalleryApp.sGetAndroidContext(), Cloud.CLOUD_URI, new String[]{"_id"}, String.format(Locale.US, "%s AND (%s COLLATE NOCASE IN ('%s'))", new Object[]{"(serverType=0)", "localFile", TextUtils.join("', '", hashSet2)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<HashSet<String>>() {
                    public HashSet<String> handle(Cursor cursor) {
                        if (cursor == null || !cursor.moveToFirst()) {
                            return null;
                        }
                        HashSet<String> hashSet = new HashSet<>(cursor.getCount());
                        do {
                            hashSet.add(cursor.getString(0));
                        } while (cursor.moveToNext());
                        return hashSet;
                    }
                });
            }
            Album.setCachedSortByModifyAlbumIds(hashSet);
        }

        public List<Long> getAlbumIdsBySortDate(SortDate sortDate) {
            return (sortDate != SortDate.MODIFY_TIME || !MiscUtil.isValid(this.mSortByModifyAlbumIds)) ? new ArrayList() : new ArrayList(this.mSortByModifyAlbumIds);
        }

        public List<String> getAlbumPathsBySortDate(SortDate sortDate) {
            return (sortDate != SortDate.MODIFY_TIME || !MiscUtil.isValid(this.mSortByModifyAlbumPaths)) ? new ArrayList() : new ArrayList(this.mSortByModifyAlbumPaths);
        }

        public SortDate getDefaultSortDate() {
            return DEFAULT_SORT_DATE;
        }

        public SortDate getSortDateByAlbumPath(String str) {
            if (!MiscUtil.isValid(this.mSortByModifyAlbumPaths) || TextUtils.isEmpty(str)) {
                return DEFAULT_SORT_DATE;
            }
            return this.mSortByModifyAlbumPaths.contains(str.toLowerCase()) ? SortDate.MODIFY_TIME : DEFAULT_SORT_DATE;
        }
    }

    private static class SingletonHolder {
        static final SortDateProvider INSTANCE = MediaSortDateHelper.createSortDateProvider();
    }

    public enum SortDate {
        CREATE_TIME,
        MODIFY_TIME
    }

    public interface SortDateProvider {
        List<Long> getAlbumIdsBySortDate(SortDate sortDate);

        List<String> getAlbumPathsBySortDate(SortDate sortDate);

        SortDate getDefaultSortDate();

        SortDate getSortDateByAlbumPath(String str);
    }

    /* access modifiers changed from: private */
    public static SortDateProvider createSortDateProvider() {
        return new CacheBackedSortDateProvider();
    }

    public static SortDateProvider getSortDateProvider() {
        return SingletonHolder.INSTANCE;
    }
}
