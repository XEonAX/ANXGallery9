package com.miui.gallery.search.suggestionpage;

import android.app.Activity;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Context;
import android.content.Loader;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.SearchFragmentBase;
import com.miui.gallery.search.StatusHandleHelper;
import com.miui.gallery.search.StatusHandleHelper.AbstractErrorViewAdapter;
import com.miui.gallery.search.StatusHandleHelper.InfoViewPosition;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.context.SearchContext;
import com.miui.gallery.search.core.display.SectionedSuggestionAdapter;
import com.miui.gallery.search.core.display.SectionedSuggestionItemDecoration;
import com.miui.gallery.search.core.display.SuggestionViewFactory;
import com.miui.gallery.search.core.query.QueryLoader;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.resultprocessor.SectionedResultProcessor;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.threadpool.ThreadManager;

public class SuggestionFragment extends SearchFragmentBase {
    /* access modifiers changed from: private */
    public SectionedSuggestionAdapter mAdapter;
    private LoaderCallbacks<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> mDataLoaderCallback = new LoaderCallbacks<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>>() {
        private int getResultItemCount(SuggestionResult suggestionResult) {
            if (suggestionResult == null || suggestionResult.getData() == null || suggestionResult.getData().getExtras() == null) {
                return 0;
            }
            return suggestionResult.getData().getExtras().getInt("itemCount");
        }

        private String getShortCutUri(SuggestionResult suggestionResult) {
            if (suggestionResult == null || suggestionResult.getData() == null || suggestionResult.getData().getExtras() == null) {
                return null;
            }
            return suggestionResult.getData().getExtras().getString("short_cut_uri");
        }

        private boolean isDone(SuggestionResult suggestionResult) {
            return (suggestionResult == null || suggestionResult.getResultExtras() == null || !suggestionResult.getResultExtras().getBoolean("is_done", true)) ? false : true;
        }

        /* JADX WARNING: type inference failed for: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 35
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
            SearchType searchType = SearchType.SEARCH_TYPE_SEARCH;
            String string = bundle.getString("data_loader_extra_text");
            if (TextUtils.isEmpty(string)) {
                SearchLog.e("SuggestionFragment", "Invalid query text for loader!");
                return null;
            }
            SearchStatUtils.onCompleteSerial("from_suggestion");
            SearchStatUtils.createNewSerial("from_suggestion");
            if (bundle.getSerializable("data_loader_extra_type") != null) {
                searchType = (SearchType) bundle.getSerializable("data_loader_extra_type");
            }
            return new QueryLoader(SuggestionFragment.this.mActivity, new Builder(searchType).addParam("query", string).addParam("enableShortcut", String.valueOf(bundle.getBoolean("data_loader_extra_enable_shortcut", false))).setAppendSerialInfo(true).build(), SuggestionFragment.this.mSectionProcessor);
        }

        public void onLoadFinished(Loader<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> loader, SuggestionResult<GroupedSuggestionCursor<SuggestionSection>> suggestionResult) {
            int i;
            QueryInfo queryInfo = ((QueryLoader) loader).getQueryInfo();
            boolean isDone = isDone(suggestionResult);
            if (suggestionResult != null) {
                if (suggestionResult.isEmpty()) {
                    SearchLog.d("SuggestionFragment", "Loader %s load finished, got empty result", Integer.valueOf(loader.getId()));
                } else {
                    SearchLog.d("SuggestionFragment", "Loader %s load finished, got %s results", Integer.valueOf(loader.getId()), Integer.valueOf(((GroupedSuggestionCursor) suggestionResult.getData()).getCount()));
                }
                SuggestionFragment.this.mAdapter.changeSuggestions(queryInfo, suggestionResult.getData());
                i = SearchUtils.getErrorStatus(suggestionResult);
                final String shortCutUri = getShortCutUri(suggestionResult);
                if (isDone && !TextUtils.isEmpty(shortCutUri)) {
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            SuggestionFragment.this.mAdapter.getActionClickListener().onClick(null, 1, shortCutUri, SearchStatUtils.buildSearchEventExtras(null, new String[]{"from"}, new String[]{"from_suggestion"}));
                        }
                    });
                }
            } else {
                SearchLog.w("SuggestionFragment", "Loader %s load finished, got no data available", Integer.valueOf(loader.getId()));
                i = 0;
            }
            SuggestionFragment.this.mIsLoading = !isDone;
            StatusHandleHelper access$500 = SuggestionFragment.this.mStatusHandleHelper;
            if (SuggestionFragment.this.mIsLoading) {
                i = -1;
            }
            access$500.updateResultStatus(i);
            if (isDone) {
                SearchStatUtils.reportEvent(queryInfo.getSearchType() == SearchType.SEARCH_TYPE_SEARCH ? "from_search" : "from_suggestion", "suggestion_recall", "ItemCount", String.valueOf(getResultItemCount(suggestionResult)));
            }
        }

        public void onLoaderReset(Loader<SuggestionResult<GroupedSuggestionCursor<SuggestionSection>>> loader) {
            if (SuggestionFragment.this.mAdapter != null) {
                SuggestionFragment.this.mAdapter.changeSuggestions(null, null);
                SuggestionFragment.this.mStatusHandleHelper.updateResultStatus(-1);
            }
            SuggestionFragment.this.mIsLoading = false;
        }
    };
    private RecyclerView mDataView;
    private ErrorViewAdapter mErrorViewAdapter;
    /* access modifiers changed from: private */
    public boolean mIsLoading;
    private final Handler mQueryHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                SuggestionFragment.this.restartDataLoader(SearchType.SEARCH_TYPE_SUGGESTION, (String) message.obj, false);
            }
        }
    };
    private String mQueryText = null;
    /* access modifiers changed from: private */
    public SectionedResultProcessor mSectionProcessor = new SuggestionResultProcessor();
    /* access modifiers changed from: private */
    public StatusHandleHelper mStatusHandleHelper = new StatusHandleHelper();

    private class ErrorViewAdapter extends AbstractErrorViewAdapter {
        public ErrorViewAdapter(Context context) {
            super(context);
        }

        public void addFooterView(View view) {
            SuggestionFragment.this.mAdapter.addFooterView(view);
        }

        public void addHeaderView(View view) {
            SuggestionFragment.this.mAdapter.addHeaderView(view);
        }

        public View getInfoView(View view, int i, InfoViewPosition infoViewPosition) {
            if (!SearchConstants.isErrorStatus(i) || infoViewPosition != InfoViewPosition.FOOTER) {
                return super.getInfoView(view, i, infoViewPosition);
            }
            return null;
        }

        public boolean isEmptyDataView() {
            return SuggestionFragment.this.mAdapter.isEmpty();
        }

        public boolean isLoading() {
            return SuggestionFragment.this.mIsLoading && isEmptyDataView();
        }

        public void removeFooterView(View view) {
            SuggestionFragment.this.mAdapter.removeFooterView(view);
        }

        public void removeHeaderView(View view) {
            SuggestionFragment.this.mAdapter.removeHeaderView(view);
        }

        public void requestRetry() {
            SuggestionFragment.this.doRetryIfNeeded();
        }
    }

    private static class SuggestionAdapter extends SectionedSuggestionAdapter {
        public SuggestionAdapter(Activity activity, SuggestionViewFactory suggestionViewFactory, String str) {
            super(activity, suggestionViewFactory, str);
        }

        /* access modifiers changed from: protected */
        public int getHeaderCount(int i) {
            return SearchConfig.get().getSuggestionConfig().shouldDrawSectionHeader(getSection(i).getSectionType()) ? 1 : 0;
        }
    }

    private void requery(SearchType searchType, String str, boolean z) {
        if (this.mQueryHandler.hasMessages(1)) {
            this.mQueryHandler.removeMessages(1);
        }
        if (searchType == SearchType.SEARCH_TYPE_SEARCH) {
            restartDataLoader(searchType, str, z);
            return;
        }
        this.mQueryHandler.sendMessageDelayed(this.mQueryHandler.obtainMessage(1, str), 300);
    }

    /* access modifiers changed from: private */
    public void restartDataLoader(SearchType searchType, String str, boolean z) {
        if (isAdded() && getLoaderManager() != null) {
            Bundle bundle = new Bundle();
            bundle.putSerializable("data_loader_extra_type", searchType);
            bundle.putString("data_loader_extra_text", str);
            bundle.putBoolean("data_loader_extra_enable_shortcut", z);
            getLoaderManager().restartLoader(1, bundle, this.mDataLoaderCallback);
            this.mIsLoading = true;
            this.mStatusHandleHelper.refreshInfoViews();
        }
    }

    public void doRetryIfNeeded() {
        if (SearchConstants.isErrorStatus(this.mStatusHandleHelper.getResultStatus()) && !TextUtils.isEmpty(this.mQueryText)) {
            requery(SearchType.SEARCH_TYPE_SEARCH, this.mQueryText, false);
        }
    }

    public String getPageName() {
        return "search_suggestions";
    }

    public void onDestroy() {
        super.onDestroy();
        SearchStatUtils.onCompleteSerial("from_suggestion");
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r0v3, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: type inference failed for: r9v6, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 40
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 4 */
    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.navigation_fragment, viewGroup, false);
        this.mDataView = (RecyclerView) inflate.findViewById(R.id.data_view);
        this.mDataView.setItemAnimator(null);
        SearchContext instance = SearchContext.getInstance();
        this.mDataView.setLayoutManager(new LinearLayoutManager(this.mActivity, 1, false));
        this.mAdapter = new SuggestionAdapter(this.mActivity, instance.getSuggestionViewFactory(), "from_suggestion");
        this.mDataView.setAdapter(this.mAdapter);
        RecyclerView recyclerView = this.mDataView;
        SectionedSuggestionItemDecoration sectionedSuggestionItemDecoration = new SectionedSuggestionItemDecoration(this.mActivity, this.mAdapter, true, getResources().getDimensionPixelSize(R.dimen.default_suggestion_start_margin), true);
        recyclerView.addItemDecoration(sectionedSuggestionItemDecoration);
        this.mDataView.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (SuggestionFragment.this.getCallback() != null) {
                    SuggestionFragment.this.getCallback().requestIME(false);
                }
                return false;
            }
        });
        this.mErrorViewAdapter = new ErrorViewAdapter(this.mActivity);
        this.mStatusHandleHelper.init(this.mDataView, inflate.findViewById(R.id.info_view), inflate.findViewById(R.id.loading_view), inflate.findViewById(R.id.empty_view), this.mErrorViewAdapter);
        return inflate;
    }

    public void onResume() {
        super.onResume();
        doRetryIfNeeded();
    }

    public void setQueryText(String str, boolean z, boolean z2) {
        if (!TextUtils.isEmpty(str)) {
            this.mQueryText = str;
            if (this.mAdapter != null) {
                this.mStatusHandleHelper.updateResultStatus(-1);
                this.mAdapter.changeSuggestions(null, null);
            }
            requery(z ? SearchType.SEARCH_TYPE_SEARCH : SearchType.SEARCH_TYPE_SUGGESTION, str, z2);
        }
    }
}
