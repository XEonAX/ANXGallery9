package com.miui.gallery.provider;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.provider.cache.SearchHistoryManager;
import com.miui.gallery.provider.cache.SearchIconManager;
import com.miui.gallery.search.SearchContract.History;

public class SearchProvider extends ContentProvider {
    /* access modifiers changed from: private */
    public static final UriMatcher sUriMatcher = new UriMatcher(-1);
    private ContentResolver mContentResolver;
    private SearchHistoryManager mSearchHistoryManager = null;
    private SearchIconManager mSearchIconManager = null;

    private class ContentResolver extends GalleryContentResolver {
        private ContentResolver() {
        }

        /* access modifiers changed from: protected */
        public Object matchUri(Uri uri) {
            return Integer.valueOf(SearchProvider.sUriMatcher.match(uri));
        }

        /* access modifiers changed from: protected */
        public void notifyInternal(Uri uri, ContentObserver contentObserver, long j) {
            if (SearchProvider.sUriMatcher.match(uri) == 1) {
                SearchProvider.this.getContext().getContentResolver().notifyChange(History.URI, contentObserver, false);
            }
        }
    }

    static {
        sUriMatcher.addURI("com.miui.gallery.search", "history", 1);
        sUriMatcher.addURI("com.miui.gallery.search", "icon", 2);
    }

    private void notifyChange(Uri uri) {
        this.mContentResolver.notifyInternal(uri, null, 0);
    }

    private void registerNotifyUri(Cursor cursor, int i) {
        if (i == 1) {
            cursor.setNotificationUri(getContext().getContentResolver(), History.URI);
        }
    }

    public int delete(Uri uri, String str, String[] strArr) {
        int delete = sUriMatcher.match(uri) != 1 ? 0 : this.mSearchHistoryManager.delete(str, strArr);
        if (delete > 0) {
            notifyChange(uri);
        }
        return delete;
    }

    public String getType(Uri uri) {
        return null;
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        long insert = sUriMatcher.match(uri) != 1 ? -1 : this.mSearchHistoryManager.insert(-1, contentValues);
        if (insert != -1) {
            notifyChange(uri);
        }
        if (insert != -1) {
            return ContentUris.withAppendedId(uri, insert);
        }
        return null;
    }

    public boolean onCreate() {
        this.mSearchHistoryManager = new SearchHistoryManager();
        this.mSearchIconManager = new SearchIconManager();
        this.mContentResolver = new ContentResolver();
        return true;
    }

    public void onLowMemory() {
        this.mSearchHistoryManager.releaseCache();
        this.mSearchIconManager.releaseCache();
    }

    public void onTrimMemory(int i) {
        if (i >= 5) {
            this.mSearchHistoryManager.releaseCache();
            this.mSearchIconManager.releaseCache();
        }
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        int match = sUriMatcher.match(uri);
        switch (match) {
            case 1:
                Bundle bundle = new Bundle();
                if (uri.getQueryParameter("query_limit") != null) {
                    bundle.putInt("query_limit", Integer.valueOf(uri.getQueryParameter("query_limit")).intValue());
                }
                if (!TextUtils.isEmpty(uri.getQueryParameter("query_text"))) {
                    bundle.putString("query_text", uri.getQueryParameter("query_text"));
                }
                Cursor query = this.mSearchHistoryManager.query(strArr, str, strArr2, str2, null, bundle);
                if (query == null) {
                    return query;
                }
                registerNotifyUri(query, match);
                return query;
            case 2:
                String queryParameter = uri.getQueryParameter("icon_uri");
                boolean booleanQueryParameter = uri.getBooleanQueryParameter("use_disk_cache", false);
                boolean z = booleanQueryParameter || uri.getBooleanQueryParameter("cache_to_disk", false);
                boolean booleanQueryParameter2 = uri.getBooleanQueryParameter("high_accuracy", false);
                if (!TextUtils.isEmpty(queryParameter)) {
                    Bundle bundle2 = new Bundle();
                    bundle2.putBoolean("use_disk_cache", booleanQueryParameter);
                    bundle2.putBoolean("cache_to_disk", z);
                    bundle2.putBoolean("high_accuracy", booleanQueryParameter2);
                    return this.mSearchIconManager.query(Uri.parse(queryParameter), strArr, bundle2);
                }
                break;
        }
        return null;
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        int update = sUriMatcher.match(uri) != 1 ? 0 : this.mSearchHistoryManager.update(str, strArr, contentValues);
        if (update > 0) {
            notifyChange(uri);
        }
        return update;
    }
}
