package com.miui.gallery.search.resultpage;

import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.result.BaseSuggestionResult;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.resultprocessor.LinearResultProcessor;
import com.miui.gallery.search.core.resultprocessor.ResultProcessor;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.ListSuggestionCursor;
import com.miui.gallery.search.core.suggestion.RankInfo;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchResultHelper {
    /* access modifiers changed from: private */
    public WeakReference<SuggestionResult> mCachedResult;
    /* access modifiers changed from: private */
    public final Object mCachedResultLock;
    protected RankInfo mCurrentDataListRankInfo;
    protected Long mDataListIndexHash;
    protected List<RankInfo> mDataListRankInfos;
    protected ResultProcessor<SuggestionResult> mDataListResultProcessor;
    protected List<Suggestion> mDataListSuggestions;
    protected Map<String, String> mFilterQueryParams;
    protected ResultProcessor<SuggestionResult> mFilterResultProcessor;
    protected boolean mIsInvalid;
    protected boolean mLoadCompleted;
    protected Map<String, String> mNextLoadParams;
    protected final Object mProcessLock;
    protected QueryInfo mQueryInfo;

    /* renamed from: com.miui.gallery.search.resultpage.SearchResultHelper$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$miui$gallery$search$SearchConstants$SectionType = new int[SectionType.values().length];

        static {
            try {
                $SwitchMap$com$miui$gallery$search$SearchConstants$SectionType[SectionType.SECTION_TYPE_FILTER.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
        }
    }

    protected class DataListResultProcessor extends ResultProcessor<SuggestionResult> {
        private final RankInfo mRankInfo;

        public DataListResultProcessor(RankInfo rankInfo) {
            this.mRankInfo = rankInfo;
        }

        private void updateCacheResult(QueryInfo queryInfo, List<Suggestion> list, ErrorInfo errorInfo) {
            SuggestionResult createSuggestionResult = createSuggestionResult(list, queryInfo, this.mRankInfo, errorInfo);
            synchronized (SearchResultHelper.this.mCachedResultLock) {
                SearchResultHelper.this.mCachedResult = new WeakReference(createSuggestionResult);
            }
        }

        /* access modifiers changed from: protected */
        public boolean checkIndexHash(DataListSourceResult dataListSourceResult) {
            if (SearchResultHelper.this.mDataListIndexHash == null || dataListSourceResult.getIndexHash() == SearchResultHelper.this.mDataListIndexHash.longValue()) {
                if (SearchResultHelper.this.mDataListIndexHash == null) {
                    SearchResultHelper.this.mDataListIndexHash = Long.valueOf(dataListSourceResult.getIndexHash());
                }
                return true;
            }
            synchronized (SearchResultHelper.this.mCachedResultLock) {
                SearchResultHelper.this.mNextLoadParams.put("pos", MovieStatUtils.DOWNLOAD_SUCCESS);
                SearchResultHelper.this.mNextLoadParams.put("num", String.valueOf(Math.max(dataListSourceResult.getNextPosition(), SearchResultHelper.this.getDataLoadCount(SearchResultHelper.this.mQueryInfo))));
                SearchResultHelper.this.mIsInvalid = true;
                SearchResultHelper.this.mLoadCompleted = false;
            }
            SearchResultHelper.this.mDataListIndexHash = null;
            SearchLog.d("SearchResultHelper", "On check index hash failed, old %s, new %s, next pos %d", String.valueOf(SearchResultHelper.this.mDataListIndexHash), String.valueOf(dataListSourceResult.getIndexHash()), Integer.valueOf(dataListSourceResult.getNextPosition()));
            return false;
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x004c, code lost:
            if (android.text.TextUtils.equals(r5, r3) != false) goto L_0x0050;
         */
        public boolean checkRankInfo(DataListSourceResult dataListSourceResult) {
            boolean z = true;
            if (this.mRankInfo == null && TextUtils.isEmpty(dataListSourceResult.getQueryInfo().getParam("rankName"))) {
                return true;
            }
            String str = null;
            if (TextUtils.equals(dataListSourceResult.getQueryInfo().getParam("rankName"), this.mRankInfo == null ? null : this.mRankInfo.getName())) {
                String param = dataListSourceResult.getQueryInfo().getParam("rankOrder");
                if (this.mRankInfo != null) {
                    str = this.mRankInfo.getOrder();
                }
            }
            z = false;
            return z;
        }

        /* access modifiers changed from: protected */
        public SuggestionResult createErrorResult(QueryInfo queryInfo, int i) {
            return new BaseSuggestionResult(queryInfo, null, new ErrorInfo(i));
        }

        /* access modifiers changed from: protected */
        public Bundle createRankInfoBundle(RankInfo rankInfo) {
            Bundle bundle = new Bundle();
            bundle.putSerializable("rankInfo", rankInfo);
            return bundle;
        }

        /* access modifiers changed from: protected */
        public SuggestionResult createSuggestionResult(List<Suggestion> list, QueryInfo queryInfo, RankInfo rankInfo, ErrorInfo errorInfo) {
            return new BaseSuggestionResult(queryInfo, new ListSuggestionCursor(queryInfo, new ArrayList(list), rankInfo != null ? createRankInfoBundle(rankInfo) : null), errorInfo);
        }

        /* access modifiers changed from: protected */
        public DataListSourceResult getDataListResult(List<SourceResult> list) {
            for (SourceResult sourceResult : list) {
                if (sourceResult instanceof DataListSourceResult) {
                    return (DataListSourceResult) sourceResult;
                }
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public SuggestionResult getMergedResult(List<SourceResult> list) {
            DataListSourceResult dataListResult = getDataListResult(list);
            if (dataListResult == null || !checkRankInfo(dataListResult) || (SearchUtils.isErrorResult(dataListResult) && dataListResult.isEmpty())) {
                return createErrorResult(SearchResultHelper.this.mQueryInfo, 8);
            }
            synchronized (SearchResultHelper.this.mProcessLock) {
                if (SearchResultHelper.this.mDataListSuggestions.size() <= 0 && !MovieStatUtils.DOWNLOAD_SUCCESS.equals(dataListResult.getQueryInfo().getParam("pos"))) {
                    SearchLog.w("SearchResultHelper", "Later pages arrived before first page!");
                    SuggestionResult result = SearchResultHelper.this.getResult();
                    return result;
                } else if (!checkIndexHash(dataListResult)) {
                    updateCacheResult(SearchResultHelper.this.mQueryInfo, SearchResultHelper.this.mDataListSuggestions, new ErrorInfo(9));
                    SearchResultHelper.this.mDataListSuggestions.clear();
                    SuggestionResult result2 = SearchResultHelper.this.getResult();
                    return result2;
                } else {
                    if (!dataListResult.isEmpty() && dataListResult.getNextPosition() > SearchResultHelper.this.mDataListSuggestions.size()) {
                        SuggestionCursor data = dataListResult.getData();
                        for (int i = 0; i < data.getCount(); i++) {
                            if (data.moveToPosition(i) && data.getCurrent() != null) {
                                SearchResultHelper.this.mDataListSuggestions.add(toSuggestion(data.getCurrent()));
                            }
                        }
                    }
                    updateCacheResult(SearchResultHelper.this.mQueryInfo, SearchResultHelper.this.mDataListSuggestions, dataListResult.getErrorInfo());
                    synchronized (SearchResultHelper.this.mCachedResultLock) {
                        if (!dataListResult.isLastPage()) {
                            SearchResultHelper.this.mNextLoadParams.put("pos", String.valueOf(dataListResult.getNextPosition()));
                            SearchResultHelper.this.mNextLoadParams.put("num", String.valueOf(SearchResultHelper.this.getDataLoadCount(SearchResultHelper.this.mQueryInfo)));
                        } else {
                            SearchResultHelper.this.mLoadCompleted = true;
                        }
                        SearchResultHelper.this.mIsInvalid = false;
                    }
                    SuggestionResult result3 = SearchResultHelper.this.getResult();
                    return result3;
                }
            }
        }
    }

    public SearchResultHelper(QueryInfo queryInfo, GroupedSuggestionCursor<SuggestionSection> groupedSuggestionCursor) {
        this.mNextLoadParams = null;
        this.mDataListIndexHash = null;
        this.mDataListSuggestions = new ArrayList();
        this.mLoadCompleted = false;
        this.mIsInvalid = false;
        this.mDataListRankInfos = null;
        this.mCurrentDataListRankInfo = null;
        this.mProcessLock = new Object();
        this.mCachedResultLock = new Object();
        this.mFilterQueryParams = null;
        this.mQueryInfo = queryInfo;
        for (int i = 0; i < groupedSuggestionCursor.getGroupCount(); i++) {
            handleSection((SuggestionSection) groupedSuggestionCursor.getGroup(i));
        }
    }

    public SearchResultHelper(QueryInfo queryInfo, SuggestionSection suggestionSection) {
        this.mNextLoadParams = null;
        this.mDataListIndexHash = null;
        this.mDataListSuggestions = new ArrayList();
        this.mLoadCompleted = false;
        this.mIsInvalid = false;
        this.mDataListRankInfos = null;
        this.mCurrentDataListRankInfo = null;
        this.mProcessLock = new Object();
        this.mCachedResultLock = new Object();
        this.mFilterQueryParams = null;
        this.mQueryInfo = queryInfo;
        handleSection(suggestionSection);
    }

    private void appendRankInfoToQuery(Builder builder, RankInfo rankInfo) {
        if (rankInfo != null) {
            builder.addParam("rankName", rankInfo.getName());
            builder.addParam("rankOrder", rankInfo.getOrder());
        }
    }

    private void handleSection(SuggestionSection suggestionSection) {
        if (AnonymousClass1.$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType[suggestionSection.getSectionType().ordinal()] != 1) {
            if (this.mNextLoadParams == null && !TextUtils.isEmpty(suggestionSection.getDataURI())) {
                this.mDataListRankInfos = suggestionSection.getRankInfos();
                this.mNextLoadParams = new HashMap();
                this.mNextLoadParams.put("pos", MovieStatUtils.DOWNLOAD_SUCCESS);
                this.mNextLoadParams.put("num", String.valueOf(getDataLoadCount(this.mQueryInfo)));
                Uri parse = Uri.parse(suggestionSection.getDataURI());
                for (String str : parse.getQueryParameterNames()) {
                    this.mNextLoadParams.put(str, parse.getQueryParameter(str));
                }
                this.mDataListResultProcessor = createDataListResultProcessor(getDataListRankInfo());
            }
        } else if (this.mFilterQueryParams == null && !TextUtils.isEmpty(suggestionSection.getDataURI())) {
            this.mFilterQueryParams = new HashMap();
            Uri parse2 = Uri.parse(suggestionSection.getDataURI());
            for (String str2 : parse2.getQueryParameterNames()) {
                this.mFilterQueryParams.put(str2, parse2.getQueryParameter(str2));
            }
            this.mFilterResultProcessor = createFilterProcessor();
        }
    }

    public Builder buildDataListQueryInfo() {
        synchronized (this.mCachedResultLock) {
            if (!canLoadNextPage()) {
                return null;
            }
            Builder addParams = new Builder(SearchType.SEARCH_TYPE_RESULT_LIST).addParams(this.mNextLoadParams);
            appendRankInfoToQuery(addParams, getDataListRankInfo());
            return addParams;
        }
    }

    public Builder buildFilterListQueryInfoBuilder() {
        if (needLoadFilterList()) {
            return new Builder(SearchType.SEARCH_TYPE_FILTER).addParams(this.mFilterQueryParams);
        }
        return null;
    }

    public boolean canLoadNextPage() {
        boolean z;
        synchronized (this.mCachedResultLock) {
            z = !isLoadCompleted() && this.mNextLoadParams != null && !this.mNextLoadParams.isEmpty();
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public ResultProcessor<SuggestionResult> createDataListResultProcessor(RankInfo rankInfo) {
        return new DataListResultProcessor(rankInfo);
    }

    /* access modifiers changed from: protected */
    public ResultProcessor<SuggestionResult> createFilterProcessor() {
        return new LinearResultProcessor();
    }

    public RankInfo getDataListRankInfo() {
        if (this.mCurrentDataListRankInfo != null) {
            return this.mCurrentDataListRankInfo;
        }
        if (this.mDataListRankInfos == null || this.mDataListRankInfos.isEmpty()) {
            return null;
        }
        return (RankInfo) this.mDataListRankInfos.get(0);
    }

    public ResultProcessor<SuggestionResult> getDataListResultProcessor() {
        return this.mDataListResultProcessor;
    }

    /* access modifiers changed from: protected */
    public int getDataLoadCount(QueryInfo queryInfo) {
        return SearchConfig.get().getResultConfig().getTagLocationLoadCount();
    }

    public ResultProcessor<SuggestionResult> getFilterResultProcessor() {
        return this.mFilterResultProcessor;
    }

    public SuggestionResult getResult() {
        SuggestionResult suggestionResult;
        synchronized (this.mCachedResultLock) {
            suggestionResult = (this.mCachedResult == null || this.mCachedResult.get() == null || ((SuggestionResult) this.mCachedResult.get()).isClosed()) ? null : (SuggestionResult) this.mCachedResult.get();
        }
        return suggestionResult;
    }

    public boolean isInvalid() {
        return this.mIsInvalid;
    }

    public boolean isLoadCompleted() {
        return this.mLoadCompleted;
    }

    public boolean needLoadFilterList() {
        return this.mFilterQueryParams != null && !this.mFilterQueryParams.isEmpty();
    }

    public void resetCacheInfo() {
        synchronized (this.mProcessLock) {
            synchronized (this.mCachedResultLock) {
                this.mNextLoadParams.put("pos", MovieStatUtils.DOWNLOAD_SUCCESS);
                this.mNextLoadParams.put("num", String.valueOf(Math.max(this.mDataListSuggestions.size(), getDataLoadCount(this.mQueryInfo))));
                this.mIsInvalid = true;
                this.mLoadCompleted = false;
            }
            this.mDataListSuggestions.clear();
        }
        this.mDataListIndexHash = null;
        SearchLog.w("SearchResultHelper", "On reset cache info called!");
    }
}
