package com.miui.gallery.search.core.source.local;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.suggestion.Suggestion;
import java.util.List;

public abstract class LocalCacheBackedSuggestionSource<T> extends LocalSingleSectionSuggestionSource implements ContentCacheProvider<T> {
    private ContentCache<T> mCache = new ContentCache<>(this);

    public LocalCacheBackedSuggestionSource(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public abstract List<Suggestion> handleQuery(T t, String str, QueryInfo queryInfo);

    /* access modifiers changed from: protected */
    public List<Suggestion> querySuggestion(String str, QueryInfo queryInfo) {
        return handleQuery(this.mCache.getCache(), str, queryInfo);
    }

    public void registerContentObserver(Uri uri, boolean z, ContentObserver contentObserver) {
        this.mContext.getContentResolver().registerContentObserver(uri, z, contentObserver);
    }

    public void unregisterContentObserver(ContentObserver contentObserver) {
        this.mContext.getContentResolver().unregisterContentObserver(contentObserver);
    }
}
