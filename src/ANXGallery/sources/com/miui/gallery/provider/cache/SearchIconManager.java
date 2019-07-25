package com.miui.gallery.provider.cache;

import android.content.ContentResolver;
import android.content.Context;
import android.content.UriMatcher;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Printer;
import com.google.common.cache.Cache;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.cache.CacheItem.QueryFactory;
import com.miui.gallery.search.core.display.icon.IconImageLoader;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.logger.TimingTracing;
import com.miui.gallery.util.uil.CloudUriAdapter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class SearchIconManager {
    private static final UriMatcher sIconURIMatcher = new UriMatcher(-1);
    private final ContentObserver mContentObserver = new ContentObserver(ThreadManager.getMainHandler()) {
        public static /* synthetic */ Object lambda$onChange$18(AnonymousClass1 r1, JobContext jobContext) {
            SearchLog.d(".searchProvider.SearchIconManager", "On notify change, clear cache");
            SearchIconManager.this.releaseCache();
            return null;
        }

        public void onChange(boolean z) {
            ThreadManager.getMiscPool().submit(new Job() {
                public final Object run(JobContext jobContext) {
                    return AnonymousClass1.lambda$onChange$18(AnonymousClass1.this, jobContext);
                }
            });
        }
    };
    private final Cache<String, SearchIconItem> mIconCache = IconImageLoader.getInstance().getMemoryCache();
    private final List<Uri> mObserveUris = new ArrayList();
    private final QueryFactory<SearchIconItem> mQueryFactory = new SearchIconItem.QueryFactory();
    private final Printer mTracingPrinter = $$Lambda$SearchIconManager$PEl6aDORk8dmNf2lAWaQ8oqI8.INSTANCE;

    private static class AlbumCoverIconLoader {
        private static final String[] PROJECTION = {"cover_id", "cover_path", "cover_sha1"};
        private static final String SELECTION;

        static {
            StringBuilder sb = new StringBuilder();
            sb.append("=? AND (media_count>0  OR (");
            sb.append(Cloud.ALIAS_USER_CREATE_ALBUM);
            sb.append(") OR ");
            sb.append("_id");
            sb.append("=");
            sb.append(2147483646);
            sb.append(")");
            SELECTION = sb.toString();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0083, code lost:
            if (r13 != null) goto L_0x0085;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:20:0x0085, code lost:
            r13.close();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:28:0x0095, code lost:
            if (r13 != null) goto L_0x0085;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:29:0x0098, code lost:
            return r3;
         */
        /* JADX WARNING: Removed duplicated region for block: B:32:0x009c  */
        static SearchIconItem queryIcon(Uri uri, ContentResolver contentResolver) {
            String[] strArr;
            String sb;
            Cursor cursor;
            String queryParameter = uri.getQueryParameter("serverId");
            String queryParameter2 = uri.getQueryParameter("id");
            SearchIconItem searchIconItem = null;
            if (!TextUtils.isEmpty(queryParameter)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("serverId");
                sb2.append(SELECTION);
                strArr = new String[]{queryParameter};
                sb = sb2.toString();
            } else if (!TextUtils.isEmpty(queryParameter2)) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("_id");
                sb3.append(SELECTION);
                strArr = new String[]{queryParameter2};
                sb = sb3.toString();
            } else {
                SearchLog.e(".searchProvider.SearchIconManager", "No valid id found for icon uri: %s", uri);
                return null;
            }
            try {
                cursor = contentResolver.query(Album.URI_ALL_EXCEPT_DELETED, PROJECTION, sb, strArr, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            String string = cursor.getString(1);
                            if (TextUtils.isEmpty(string)) {
                                string = StorageUtils.getPriorMicroThumbnailPath(cursor.getString(2));
                            }
                            searchIconItem = SearchIconManager.createIconItem(uri, string, cursor.getLong(0), cursor.getNotificationUri());
                        }
                    } catch (Exception e) {
                        e = e;
                        try {
                            SearchLog.e(".searchProvider.SearchIconManager", "Error occurred while query icon uri %s, %s", uri, e);
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                            }
                            throw th;
                        }
                    }
                }
            } catch (Exception e2) {
                e = e2;
                cursor = null;
                SearchLog.e(".searchProvider.SearchIconManager", "Error occurred while query icon uri %s, %s", uri, e);
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }
    }

    private static class LocalImageFaceLoader {
        private static final String[] PROJECTION = {"photo_id", "microthumbfile", "thumbnailFile", "localFile", "sha1", "faceXScale", "faceYScale", "faceWScale", "faceHScale"};

        static /* synthetic */ SearchIconItem lambda$queryIcon$19(Uri uri, Cursor cursor) {
            if (cursor == null || !cursor.moveToFirst()) {
                return null;
            }
            String string = cursor.getString(2);
            if (TextUtils.isEmpty(string)) {
                string = cursor.getString(3);
            }
            if (TextUtils.isEmpty(string)) {
                string = cursor.getString(1);
            }
            if (TextUtils.isEmpty(string)) {
                string = StorageUtils.getPriorMicroThumbnailPath(cursor.getString(4));
            }
            SearchIconItem access$100 = SearchIconManager.createIconItem(uri, string, cursor.getLong(0), cursor.getNotificationUri());
            access$100.decodeRegionX = Float.valueOf(cursor.getFloat(5));
            access$100.decodeRegionY = Float.valueOf(cursor.getFloat(6));
            access$100.decodeRegionW = Float.valueOf(cursor.getFloat(7));
            access$100.decodeRegionH = Float.valueOf(cursor.getFloat(8));
            return access$100;
        }

        static SearchIconItem queryIcon(Uri uri, Context context) {
            String queryParameter = uri.getQueryParameter("serverId");
            return (SearchIconItem) SafeDBUtil.safeQuery(context, PeopleFace.IMAGE_FACE_URI.buildUpon().appendQueryParameter("image_server_id", queryParameter).appendQueryParameter("serverId", uri.getQueryParameter("faceId")).build(), PROJECTION, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler(uri) {
                private final /* synthetic */ Uri f$0;

                {
                    this.f$0 = r1;
                }

                public final Object handle(Cursor cursor) {
                    return LocalImageFaceLoader.lambda$queryIcon$19(this.f$0, cursor);
                }
            });
        }
    }

    private static class LocalImageIconLoader {
        private static final String[] PROJECTION = {"_id", "alias_clear_thumbnail", "sha1"};

        /* JADX WARNING: Code restructure failed: missing block: B:25:0x008b, code lost:
            if (r12 != null) goto L_0x008d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x008d, code lost:
            r12.close();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:34:0x009d, code lost:
            if (r12 != null) goto L_0x008d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:35:0x00a0, code lost:
            return r7;
         */
        /* JADX WARNING: Removed duplicated region for block: B:38:0x00a4  */
        static SearchIconItem queryIcon(Uri uri, boolean z, ContentResolver contentResolver) {
            String format;
            Cursor cursor;
            Uri uri2 = Media.URI_ALL;
            if (z) {
                uri2 = uri2.buildUpon().appendQueryParameter("require_full_load", "true").build();
            }
            Uri uri3 = uri2;
            String queryParameter = uri.getQueryParameter("serverId");
            String queryParameter2 = uri.getQueryParameter("id");
            SearchIconItem searchIconItem = null;
            if (!TextUtils.isEmpty(queryParameter)) {
                format = String.format(Locale.US, "%s=%s", new Object[]{"serverId", queryParameter});
            } else if (!TextUtils.isEmpty(queryParameter2)) {
                format = String.format(Locale.US, "%s=%s", new Object[]{"_id", queryParameter2});
            } else {
                SearchLog.e(".searchProvider.SearchIconManager", "No valid id found for icon uri: %s", uri);
                return null;
            }
            try {
                cursor = contentResolver.query(uri3, PROJECTION, format, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            String string = cursor.getString(1);
                            if (TextUtils.isEmpty(string)) {
                                string = StorageUtils.getPriorMicroThumbnailPath(cursor.getString(2));
                            }
                            Uri notificationUri = cursor.getNotificationUri();
                            if (notificationUri == null) {
                                notificationUri = Media.URI;
                            }
                            searchIconItem = SearchIconManager.createIconItem(uri, string, cursor.getLong(0), notificationUri);
                        }
                    } catch (Exception e) {
                        e = e;
                        try {
                            SearchLog.e(".searchProvider.SearchIconManager", "Error occurred while query icon uri %s, %s", uri, e);
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    }
                }
            } catch (Exception e2) {
                e = e2;
                cursor = null;
                SearchLog.e(".searchProvider.SearchIconManager", "Error occurred while query icon uri %s, %s", uri, e);
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                }
                throw th;
            }
        }
    }

    private static class PeopleCoverIconLoader {
        private static final String[] PROJECTION = {"photo_id", "microthumbfile", "thumbnailFile", "localFile", "sha1", "exifOrientation", "faceXScale", "faceYScale", "faceWScale", "faceHScale"};

        /* access modifiers changed from: private */
        /* JADX WARNING: Code restructure failed: missing block: B:25:0x00b1, code lost:
            r1 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x00b2, code lost:
            r4 = r13;
            r13 = r0;
            r0 = r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x00b6, code lost:
            r12 = th;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:45:0x00d9, code lost:
            r13.close();
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Removed duplicated region for block: B:27:0x00b6 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:9:0x003e] */
        /* JADX WARNING: Removed duplicated region for block: B:32:0x00c0  */
        /* JADX WARNING: Removed duplicated region for block: B:45:0x00d9  */
        public static SearchIconItem queryIcon(Uri uri, ContentResolver contentResolver) {
            Cursor cursor;
            SearchIconItem searchIconItem;
            SearchIconItem searchIconItem2;
            String queryParameter = uri.getQueryParameter("serverId");
            String queryParameter2 = uri.getQueryParameter("id");
            Builder buildUpon = PeopleFace.PEOPLE_COVER_URI.buildUpon();
            Cursor cursor2 = null;
            if (!TextUtils.isEmpty(queryParameter)) {
                buildUpon.appendQueryParameter("serverId", queryParameter);
            } else if (!TextUtils.isEmpty(queryParameter2)) {
                buildUpon.appendQueryParameter("_id", queryParameter2).build();
            } else {
                SearchLog.w(".searchProvider.SearchIconManager", "No valid id found for uri %s", uri);
                return null;
            }
            try {
                cursor = contentResolver.query(buildUpon.build(), PROJECTION, null, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            String string = cursor.getString(2);
                            if (TextUtils.isEmpty(string)) {
                                string = cursor.getString(3);
                            }
                            if (TextUtils.isEmpty(string)) {
                                string = cursor.getString(1);
                            }
                            if (TextUtils.isEmpty(string)) {
                                string = StorageUtils.getPriorMicroThumbnailPath(cursor.getString(4));
                            }
                            searchIconItem2 = SearchIconManager.createIconItem(uri, string, cursor.getLong(0), cursor.getNotificationUri());
                            searchIconItem2.decodeRegionOrientation = cursor.getInt(5);
                            searchIconItem2.decodeRegionX = Float.valueOf(cursor.getFloat(6));
                            searchIconItem2.decodeRegionY = Float.valueOf(cursor.getFloat(7));
                            searchIconItem2.decodeRegionW = Float.valueOf(cursor.getFloat(8));
                            searchIconItem2.decodeRegionH = Float.valueOf(cursor.getFloat(9));
                            if (cursor != null) {
                                cursor.close();
                            }
                            searchIconItem = searchIconItem2;
                            return searchIconItem;
                        }
                    } catch (Exception e) {
                        e = e;
                        cursor2 = cursor;
                        searchIconItem = null;
                    } catch (Throwable th) {
                    }
                }
                searchIconItem2 = null;
                if (cursor != null) {
                }
                searchIconItem = searchIconItem2;
            } catch (Exception e2) {
                e = e2;
                searchIconItem = null;
                try {
                    SearchLog.e(".searchProvider.SearchIconManager", "Error occurred while query icon uri %s, %s", uri, e);
                    if (cursor2 != null) {
                        cursor2.close();
                    }
                    return searchIconItem;
                } catch (Throwable th2) {
                    th = th2;
                    cursor = cursor2;
                    if (cursor != null) {
                    }
                    throw th;
                }
            }
            return searchIconItem;
        }
    }

    static {
        sIconURIMatcher.addURI("people", null, 1);
        sIconURIMatcher.addURI("album", null, 2);
        sIconURIMatcher.addURI("image", null, 3);
    }

    /* access modifiers changed from: private */
    public static SearchIconItem createIconItem(Uri uri, String str, long j, Uri uri2) {
        SearchIconItem searchIconItem = new SearchIconItem();
        searchIconItem.iconUri = uri.toString();
        searchIconItem.filePath = str;
        searchIconItem.downloadUri = getDownloadUri(j);
        searchIconItem.notifyUri = uri2;
        return searchIconItem;
    }

    private ContentResolver getContentResolver() {
        return getContext().getContentResolver();
    }

    private Context getContext() {
        return GalleryApp.sGetAndroidContext();
    }

    private static String getDownloadUri(long j) {
        Uri downloadUri = CloudUriAdapter.getDownloadUri(j);
        if (downloadUri == null) {
            return null;
        }
        return downloadUri.toString();
    }

    static /* synthetic */ void lambda$new$17(String str) {
    }

    private void observerUri(Uri uri) {
        if (!this.mObserveUris.contains(uri)) {
            getContentResolver().registerContentObserver(uri, true, this.mContentObserver);
            this.mObserveUris.add(uri);
        }
    }

    private void onIconQueried(String str, SearchIconItem searchIconItem, boolean z) {
        if (searchIconItem != null) {
            this.mIconCache.put(str, searchIconItem);
            if (z) {
                SearchIconDiskCache.getInstance().putIcon(str, searchIconItem);
            }
            if (searchIconItem.notifyUri != null) {
                observerUri(searchIconItem.notifyUri);
            }
        }
    }

    private SearchIconItem queryIcon(Uri uri, boolean z) {
        switch (sIconURIMatcher.match(uri)) {
            case 1:
                return PeopleCoverIconLoader.queryIcon(uri, getContentResolver());
            case 2:
                return AlbumCoverIconLoader.queryIcon(uri, getContentResolver());
            case 3:
                return !TextUtils.isEmpty(uri.getQueryParameter("faceId")) ? LocalImageFaceLoader.queryIcon(uri, getContext()) : LocalImageIconLoader.queryIcon(uri, z, getContentResolver());
            default:
                return null;
        }
    }

    public Cursor query(Uri uri, String[] strArr, Bundle bundle) {
        boolean z;
        boolean z2;
        boolean z3;
        StringBuilder sb = new StringBuilder();
        sb.append("SearchIconManager-");
        sb.append(SystemClock.elapsedRealtimeNanos());
        String sb2 = sb.toString();
        TimingTracing.beginTracing(sb2, "query");
        try {
            ArrayList arrayList = new ArrayList(1);
            boolean z4 = false;
            if (bundle != null) {
                z3 = bundle.getBoolean("use_disk_cache", false);
                if (!z3) {
                    if (!bundle.getBoolean("cache_to_disk", false)) {
                        z2 = false;
                        z = bundle.getBoolean("high_accuracy", false);
                    }
                }
                z2 = true;
                z = bundle.getBoolean("high_accuracy", false);
            } else {
                z = false;
                z3 = false;
                z2 = false;
            }
            SearchIconItem searchIconItem = (SearchIconItem) this.mIconCache.getIfPresent(uri.toString());
            TimingTracing.addSplit(sb2, "query from memory cache");
            if (searchIconItem == null && z3) {
                searchIconItem = SearchIconDiskCache.getInstance().getIcon(uri.toString());
                if (searchIconItem != null) {
                    z4 = true;
                }
                TimingTracing.addSplit(sb2, "query from disk blob cache");
            }
            if (searchIconItem == null) {
                searchIconItem = queryIcon(uri, z);
                TimingTracing.addSplit(sb2, "query from database");
                onIconQueried(uri.toString(), searchIconItem, z2);
                TimingTracing.addSplit(sb2, "dispatch query result");
            }
            if (searchIconItem != null) {
                arrayList.add(searchIconItem);
            }
            RawCursor rawCursor = new RawCursor(arrayList, strArr, this.mQueryFactory.getMapper());
            if (z4) {
                Bundle bundle2 = new Bundle();
                bundle2.putBoolean("from_unreliable_cache", true);
                rawCursor.setExtras(bundle2);
            }
            return rawCursor;
        } finally {
            TimingTracing.stopTracing(sb2, this.mTracingPrinter);
        }
    }

    public void releaseCache() {
        this.mIconCache.invalidateAll();
        this.mIconCache.cleanUp();
        getContentResolver().unregisterContentObserver(this.mContentObserver);
        this.mObserveUris.clear();
    }
}
