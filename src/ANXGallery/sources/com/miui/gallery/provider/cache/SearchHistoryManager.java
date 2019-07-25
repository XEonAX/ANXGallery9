package com.miui.gallery.provider.cache;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.provider.cache.SearchHistoryItem.Generator;
import com.miui.gallery.provider.cache.SearchHistoryItem.QueryFactory;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.StringUtils;
import java.util.ArrayList;
import java.util.List;

public class SearchHistoryManager extends CacheManager<SearchHistoryItem> {
    private static final List<SearchHistoryItem> EMPTY_CACHE = new ArrayList(0);
    private static SearchHistoryManager sSearchHistoryManager;

    public SearchHistoryManager() {
        this.mQueryFactory = new QueryFactory();
        this.mCache = EMPTY_CACHE;
        this.mGenerator = new Generator();
    }

    private void ensureCache() {
        if (this.mCache == EMPTY_CACHE) {
            synchronized (this.mModifyLock) {
                load();
            }
        }
    }

    public static SearchHistoryManager getInstance() {
        if (sSearchHistoryManager == null) {
            synchronized (SearchHistoryManager.class) {
                if (sSearchHistoryManager == null) {
                    sSearchHistoryManager = new SearchHistoryManager();
                }
            }
        }
        return sSearchHistoryManager;
    }

    private void load() {
        if (this.mCache == EMPTY_CACHE) {
            List savedHistories = SearchHistoryStorageHelper.getSavedHistories();
            if (savedHistories != null) {
                this.mCache = new ArrayList();
                this.mCache.addAll(savedHistories);
            }
        }
    }

    public int delete(String str, String[] strArr) {
        return deleteAll();
    }

    public int deleteAll() {
        int clearSavedHistories;
        synchronized (this.mModifyLock) {
            clearSavedHistories = SearchHistoryStorageHelper.clearSavedHistories();
            if (clearSavedHistories > 0 && this.mCache != EMPTY_CACHE) {
                this.mCache.clear();
            }
        }
        return clearSavedHistories;
    }

    public long insert(long j, ContentValues contentValues) {
        long j2 = -1;
        if (contentValues == null || contentValues.size() <= 0) {
            SearchLog.w(".searchProvider.SearchHistoryManager", "Try to insert history with empty content value!");
            return -1;
        }
        SearchHistoryItem searchHistoryItem = (SearchHistoryItem) this.mGenerator.from(j, contentValues);
        if (searchHistoryItem == null || TextUtils.isEmpty(searchHistoryItem.intentActionURI)) {
            SearchLog.w(".searchProvider.SearchHistoryManager", "Try to insert history with no action uri!");
            return -1;
        }
        if (searchHistoryItem.timestamp == null) {
            searchHistoryItem.timestamp = Long.valueOf(System.currentTimeMillis());
        }
        synchronized (this.mModifyLock) {
            ArrayList arrayList = new ArrayList();
            if (SearchHistoryStorageHelper.addHistoryItem(searchHistoryItem, arrayList) > 0) {
                this.mCache = arrayList;
                j2 = 0;
            }
        }
        return j2;
    }

    /* access modifiers changed from: protected */
    public Cursor onCreateCursor(String[] strArr, List<SearchHistoryItem> list, String str, String str2, Bundle bundle) {
        if (bundle != null) {
            int i = bundle.getInt("query_limit", -1);
            while (i >= 0 && i < list.size()) {
                list.remove(list.size() - 1);
            }
        }
        return new RawCursor(list, strArr, this.mQueryFactory.getMapper());
    }

    public Cursor query(String[] strArr, String str, String[] strArr2, String str2, String str3, Bundle bundle) {
        ensureCache();
        if (bundle != null && !TextUtils.isEmpty(bundle.getString("query_text"))) {
            String str4 = "(title LIKE ? OR subTitle LIKE ?)";
            String[] strArr3 = {bundle.getString("query_text"), bundle.getString("query_text")};
            if (str == null) {
                str = str4;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("(");
                sb.append(str);
                sb.append(") AND ");
                sb.append(str4);
                str = sb.toString();
            }
            strArr2 = strArr2 == null ? strArr3 : StringUtils.mergeStringArray(strArr2, strArr3);
        }
        return super.query(strArr, str, strArr2, str2, str3, bundle);
    }

    public void releaseCache() {
        this.mCache = EMPTY_CACHE;
    }

    public int update(String str, String[] strArr, ContentValues contentValues) {
        SearchLog.w(".searchProvider.SearchHistoryManager", "[Update] operation not supported! ");
        return 0;
    }
}
