package com.miui.gallery.search.core.source;

import android.content.Context;
import com.miui.gallery.search.core.source.local.AlbumSource;
import com.miui.gallery.search.core.source.local.AppScreenshotSource;
import com.miui.gallery.search.core.source.server.DataListSource;
import com.miui.gallery.search.core.source.server.FeedbackLikelyListSource;
import com.miui.gallery.search.core.source.server.HintSource;
import com.miui.gallery.search.core.source.server.NavigationSource;
import com.miui.gallery.search.core.source.server.ResultSource;
import com.miui.gallery.search.core.source.server.SearchSource;
import com.miui.gallery.search.history.HistorySource;
import com.miui.gallery.search.utils.SearchLog;
import java.util.Collection;
import java.util.HashMap;

public class SearchableSources implements Sources {
    private final Context mContext;
    private HashMap<String, Source> mSources;

    public SearchableSources(Context context) {
        this.mContext = context;
    }

    /* access modifiers changed from: protected */
    public void addHintSources() {
        addSource(new HintSource(this.mContext));
    }

    /* access modifiers changed from: protected */
    public void addHistorySources() {
        addSource(new HistorySource(this.mContext));
    }

    /* access modifiers changed from: protected */
    public void addLocalSources() {
        addSource(new AlbumSource(this.mContext));
        addSource(new AppScreenshotSource(this.mContext));
    }

    /* access modifiers changed from: protected */
    public void addNavigationSources() {
        addSource(new NavigationSource(this.mContext));
    }

    /* access modifiers changed from: protected */
    public void addResultSources() {
        addSource(new ResultSource(this.mContext));
        addSource(new DataListSource(this.mContext));
        addSource(new FeedbackLikelyListSource(this.mContext));
    }

    /* access modifiers changed from: protected */
    public void addSource(Source source) {
        this.mSources.put(source.getName(), source);
    }

    /* access modifiers changed from: protected */
    public void addSuggestionSources() {
        addSource(new SearchSource(this.mContext));
    }

    public Collection<Source> getSources() {
        return this.mSources.values();
    }

    public void update() {
        SearchLog.d("SearchableSources", "update()");
        this.mSources = new HashMap<>();
        addHintSources();
        addNavigationSources();
        addResultSources();
        addSuggestionSources();
        addHistorySources();
        addLocalSources();
    }
}
