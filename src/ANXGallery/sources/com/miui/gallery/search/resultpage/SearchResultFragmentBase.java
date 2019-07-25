package com.miui.gallery.search.resultpage;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Loader;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.StatusHandleHelper;
import com.miui.gallery.search.StatusHandleHelper.AbstractErrorViewAdapter;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.display.RequestLoadMoreListener;
import com.miui.gallery.search.core.query.QueryLoader;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.resultprocessor.SectionedResultProcessor;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.ui.BaseMediaFragment;

public abstract class SearchResultFragmentBase extends BaseMediaFragment implements RequestLoadMoreListener {
    protected LoaderCallbacks<SuggestionResult> mFilterLoaderCallback = new LoaderCallbacks<SuggestionResult>() {
        /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 23
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader<SuggestionResult> onCreateLoader(int i, Bundle bundle) {
            if (SearchResultFragmentBase.this.mSectionDataResultHelper != null) {
                Builder buildFilterListQueryInfoBuilder = SearchResultFragmentBase.this.mSectionDataResultHelper.buildFilterListQueryInfoBuilder();
                if (buildFilterListQueryInfoBuilder != null) {
                    buildFilterListQueryInfoBuilder.setAppendSerialInfo(true);
                    if (SearchResultFragmentBase.this.shouldUserPersistentResponse(bundle)) {
                        buildFilterListQueryInfoBuilder.addParam("use_persistent_response", String.valueOf(true));
                    }
                    return new QueryLoader(SearchResultFragmentBase.this.mActivity, buildFilterListQueryInfoBuilder.build(), SearchResultFragmentBase.this.mSectionDataResultHelper.getFilterResultProcessor());
                }
            }
            return null;
        }

        public void onLoadFinished(Loader<SuggestionResult> loader, SuggestionResult suggestionResult) {
            if (suggestionResult != null) {
                SearchResultFragmentBase.this.changeFilterData(suggestionResult.getQueryInfo(), suggestionResult.getData());
            } else {
                SearchLog.w("SearchResultFragmentBase", "Loader %s load finished, got no data available", Integer.valueOf(loader.getId()));
            }
        }

        public void onLoaderReset(Loader<SuggestionResult> loader) {
        }
    };
    protected boolean mInFeedbackTaskMode = false;
    /* access modifiers changed from: private */
    public long mLastInvalidTime;
    protected String mQueryText;
    protected QueryInfo mResultSectionQueryInfo;
    protected LoaderCallbacks<SuggestionResult> mSectionDataLoaderCallback = new LoaderCallbacks<SuggestionResult>() {
        /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 26
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader<SuggestionResult> onCreateLoader(int i, Bundle bundle) {
            if (SearchResultFragmentBase.this.mSectionDataResultHelper != null) {
                Builder sectionDataQueryInfoBuilder = SearchResultFragmentBase.this.getSectionDataQueryInfoBuilder();
                if (sectionDataQueryInfoBuilder != null) {
                    sectionDataQueryInfoBuilder.setAppendSerialInfo(true);
                    if (SearchResultFragmentBase.this.shouldUserPersistentResponse(bundle)) {
                        sectionDataQueryInfoBuilder.addParam("use_persistent_response", String.valueOf(true));
                    }
                    QueryLoader queryLoader = new QueryLoader(SearchResultFragmentBase.this.mActivity, sectionDataQueryInfoBuilder.build(), SearchResultFragmentBase.this.mSectionDataResultHelper.getDataListResultProcessor(), false, SearchResultFragmentBase.this.receiveResultUpdates(), false);
                    return queryLoader;
                }
            }
            SearchResultFragmentBase.this.closeLoadMore();
            return null;
        }

        public void onLoadFinished(Loader<SuggestionResult> loader, SuggestionResult suggestionResult) {
            int i = 0;
            if (SearchResultFragmentBase.this.mSectionDataResultHelper.isInvalid()) {
                if (Math.abs(SystemClock.elapsedRealtime() - SearchResultFragmentBase.this.mLastInvalidTime) < 3000) {
                    if (suggestionResult != null) {
                        int errorStatus = SearchUtils.getErrorStatus(suggestionResult);
                        SearchResultFragmentBase.this.changeSuggestions(SearchResultFragmentBase.this.mResultSectionQueryInfo, suggestionResult.getData());
                        i = errorStatus;
                    } else {
                        SearchResultFragmentBase.this.changeSuggestions(null, null);
                        i = 11;
                    }
                    SearchResultFragmentBase.this.closeLoadMore();
                    SearchStatUtils.reportEvent(SearchResultFragmentBase.this.getFrom(), "result_invalid_hash", "Query", SearchResultFragmentBase.this.mResultSectionQueryInfo.toString(), "Time", String.valueOf(System.currentTimeMillis()));
                } else {
                    if (suggestionResult != null) {
                        SearchResultFragmentBase.this.changeSuggestions(SearchResultFragmentBase.this.mResultSectionQueryInfo, suggestionResult.getData());
                    } else {
                        SearchLog.w("SearchResultFragmentBase", "Loader %s load finished, invalid hash code got no data available", Integer.valueOf(loader.getId()));
                    }
                    Bundle bundle = new Bundle(1);
                    bundle.putBoolean("force_requery", true);
                    SearchResultFragmentBase.this.restartSectionDataLoader(bundle);
                }
                SearchResultFragmentBase.this.mLastInvalidTime = SystemClock.elapsedRealtime();
                SearchResultFragmentBase.this.mStatusHandleHelper.updateResultStatus(i);
                return;
            }
            if (suggestionResult != null) {
                SearchResultFragmentBase.this.changeSuggestions(SearchResultFragmentBase.this.mResultSectionQueryInfo, suggestionResult.getData());
                i = SearchUtils.getErrorStatus(suggestionResult);
            } else {
                SearchLog.w("SearchResultFragmentBase", "Loader %s load finished, got no data available", Integer.valueOf(loader.getId()));
            }
            if (SearchResultFragmentBase.this.mSectionDataResultHelper.isLoadCompleted()) {
                SearchResultFragmentBase.this.onLoadComplete();
            } else if (!SearchConstants.isErrorStatus(i)) {
                SearchResultFragmentBase.this.openLoadMore();
                if (SearchResultFragmentBase.this.getErrorViewAdapter().isEmptyDataView() && !SearchResultFragmentBase.this.mSectionDataResultHelper.isInvalid()) {
                    SearchResultFragmentBase.this.onLoadMoreRequested();
                }
            } else {
                SearchResultFragmentBase.this.closeLoadMore();
            }
            SearchResultFragmentBase.this.mStatusHandleHelper.updateResultStatus(i);
        }

        public void onLoaderReset(Loader<SuggestionResult> loader) {
        }
    };
    protected SearchResultHelper mSectionDataResultHelper;
    /* access modifiers changed from: private */
    public SectionedResultProcessor mSectionProcessor = new SectionedResultProcessor();
    protected LoaderCallbacks<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> mSectionsLoaderCallback = new LoaderCallbacks<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>>() {
        /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 24
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public Loader<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> onCreateLoader(int i, Bundle bundle) {
            if (SearchResultFragmentBase.this.mResultSectionQueryInfo == null) {
                return null;
            }
            Builder appendSerialInfo = new Builder().cloneFrom(SearchResultFragmentBase.this.mResultSectionQueryInfo).setAppendSerialInfo(true);
            if (SearchResultFragmentBase.this.shouldUserPersistentResponse(bundle)) {
                appendSerialInfo.addParam("use_persistent_response", String.valueOf(true));
            }
            QueryLoader queryLoader = new QueryLoader(SearchResultFragmentBase.this.mActivity, appendSerialInfo.build(), SearchResultFragmentBase.this.mSectionProcessor, false, SearchResultFragmentBase.this.receiveResultUpdates(), false);
            return queryLoader;
        }

        public void onLoadFinished(Loader<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> loader, SuggestionResult<GroupedSuggestionCursor<SuggestionSection>> suggestionResult) {
            int i;
            if (suggestionResult != null) {
                if (suggestionResult.getData() == null || ((GroupedSuggestionCursor) suggestionResult.getData()).getGroupCount() <= 0) {
                    SearchResultFragmentBase.this.closeLoadMore();
                    SearchResultFragmentBase.this.mSectionDataResultHelper = null;
                } else {
                    SearchResultFragmentBase.this.mSectionDataResultHelper = SearchResultFragmentBase.this.createSearchResultHelper(SearchResultFragmentBase.this.mResultSectionQueryInfo, (GroupedSuggestionCursor) suggestionResult.getData());
                    SearchResultFragmentBase.this.openLoadMore();
                    SearchResultFragmentBase.this.onLoadMoreRequested();
                    if (SearchResultFragmentBase.this.mSectionDataResultHelper.needLoadFilterList()) {
                        SearchResultFragmentBase.this.restartFilterLoader(null);
                    }
                }
                i = SearchUtils.getErrorStatus(suggestionResult);
            } else {
                SearchLog.w("SearchResultFragmentBase", "Loader %s load finished, got no data available", Integer.valueOf(loader.getId()));
                i = 0;
            }
            SearchResultFragmentBase.this.mStatusHandleHelper.updateResultStatus(i);
            if (i == 13) {
                AIAlbumStatusHelper.requestOpenCloudControlSearch(SearchResultFragmentBase.this.getFrom());
            }
        }

        public void onLoaderReset(Loader<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> loader) {
            SearchResultFragmentBase.this.changeSuggestions(null, null);
            SearchResultFragmentBase.this.closeLoadMore();
            SearchResultFragmentBase.this.mStatusHandleHelper.updateResultStatus(-1);
            SearchResultFragmentBase.this.mSectionDataResultHelper = null;
        }
    };
    protected StatusHandleHelper mStatusHandleHelper = new StatusHandleHelper();
    protected boolean mSupportFeedback = false;

    /* access modifiers changed from: private */
    public boolean shouldUserPersistentResponse(Bundle bundle) {
        if (usePersistentResponse()) {
            return bundle == null || !bundle.getBoolean("force_requery", false);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract void changeFilterData(QueryInfo queryInfo, SuggestionCursor suggestionCursor);

    /* access modifiers changed from: protected */
    public abstract void changeSuggestions(QueryInfo queryInfo, SuggestionCursor suggestionCursor);

    /* access modifiers changed from: protected */
    public abstract void closeLoadMore();

    /* access modifiers changed from: protected */
    public SearchResultHelper createSearchResultHelper(QueryInfo queryInfo, GroupedSuggestionCursor<SuggestionSection> groupedSuggestionCursor) {
        return new SearchResultHelper(queryInfo, groupedSuggestionCursor);
    }

    public void doRetry() {
        if (SearchConstants.isErrorStatus(this.mStatusHandleHelper.getResultStatus())) {
            openLoadMore();
            this.mStatusHandleHelper.refreshInfoViews();
            if (this.mSectionDataResultHelper == null) {
                restartSectionLoader(null);
                return;
            }
            if (this.mSectionDataResultHelper.canLoadNextPage()) {
                restartSectionDataLoader(null);
            } else {
                closeLoadMore();
            }
            if (this.mSectionDataResultHelper.needLoadFilterList()) {
                restartFilterLoader(null);
            }
        }
    }

    /* access modifiers changed from: protected */
    public String getDefaultTitle() {
        return getString(R.string.search_image_result_title);
    }

    /* access modifiers changed from: protected */
    public abstract AbstractErrorViewAdapter getErrorViewAdapter();

    /* access modifiers changed from: protected */
    public abstract String getFrom();

    /* access modifiers changed from: protected */
    public abstract int getLayoutResource();

    /* access modifiers changed from: protected */
    public abstract View getResultView();

    /* access modifiers changed from: protected */
    public Builder getSectionDataQueryInfoBuilder() {
        return this.mSectionDataResultHelper.buildDataListQueryInfo();
    }

    /* access modifiers changed from: protected */
    public Builder initResultQueryInfoBuilder(Uri uri) {
        Builder builder = new Builder(SearchType.SEARCH_TYPE_RESULT);
        for (String str : uri.getQueryParameterNames()) {
            if (str.equals("title")) {
                this.mQueryText = uri.getQueryParameter(str);
            } else if (str.equals("inFeedbackTaskMode")) {
                this.mInFeedbackTaskMode = uri.getBooleanQueryParameter(str, false);
            } else if (str.equals("supportFeedback")) {
                this.mSupportFeedback = uri.getBooleanQueryParameter(str, false);
            } else {
                builder.addParam(str, uri.getQueryParameter(str));
            }
        }
        return builder;
    }

    /* access modifiers changed from: protected */
    public void initStatusHandlerHelper(View view) {
        this.mStatusHandleHelper.init(getResultView(), view.findViewById(R.id.info_view), view.findViewById(R.id.loading_view), view.findViewById(R.id.empty_view), getErrorViewAdapter());
    }

    /* access modifiers changed from: protected */
    public abstract boolean moreThanOnePage();

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        SearchStatUtils.createNewSerial(getFrom());
        restartSectionLoader(null);
        openLoadMore();
        this.mStatusHandleHelper.refreshInfoViews();
    }

    public void onDestroy() {
        super.onDestroy();
        SearchStatUtils.onCompleteSerial(getFrom());
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(getLayoutResource(), viewGroup, false);
        Uri data = this.mActivity.getIntent().getData();
        this.mResultSectionQueryInfo = initResultQueryInfoBuilder(data).build();
        onInflateView(inflate, bundle, data);
        updateTitle(data.getQueryParameter("title"));
        initStatusHandlerHelper(inflate);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public abstract void onInflateView(View view, Bundle bundle, Uri uri);

    /* access modifiers changed from: protected */
    public abstract void onLoadComplete();

    public void onLoadMoreRequested() {
        if (this.mSectionDataResultHelper == null || !this.mSectionDataResultHelper.canLoadNextPage()) {
            closeLoadMore();
        } else {
            restartSectionDataLoader(null);
        }
    }

    public void onResume() {
        super.onResume();
        doRetry();
    }

    /* access modifiers changed from: protected */
    public abstract void openLoadMore();

    /* access modifiers changed from: protected */
    public boolean receiveResultUpdates() {
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract void restartFilterLoader(Bundle bundle);

    /* access modifiers changed from: protected */
    public abstract void restartSectionDataLoader(Bundle bundle);

    /* access modifiers changed from: protected */
    public abstract void restartSectionLoader(Bundle bundle);

    /* access modifiers changed from: protected */
    public boolean supportFeedback() {
        return this.mSupportFeedback;
    }

    /* access modifiers changed from: protected */
    public void updateTitle(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.mActivity.getActionBar().setTitle(str);
        } else {
            this.mActivity.getActionBar().setTitle(getDefaultTitle());
        }
    }

    /* access modifiers changed from: protected */
    public abstract boolean usePersistentResponse();
}
