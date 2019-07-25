package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.provider.GalleryContract.SearchResultPhoto;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.StatusHandleHelper.AbstractErrorViewAdapter;
import com.miui.gallery.search.StatusHandleHelper.InfoViewPosition;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.display.RequestLoadMoreListener;
import com.miui.gallery.search.core.suggestion.RankInfo;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.IntentUtil;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersGridView;
import java.util.ArrayList;

public abstract class SearchImageResultFragmentBase extends SearchResultFragmentBase implements RequestLoadMoreListener {
    protected ImageResultSimpleAdapter mAdapter;
    protected int mColumnCount = 0;
    private ErrorViewAdapter mErrorViewAdapter = null;
    protected StickyGridHeadersGridView mGridView;
    /* access modifiers changed from: private */
    public View mLoadCompleteFooter;

    private class ErrorViewAdapter extends AbstractErrorViewAdapter {
        public ErrorViewAdapter(Context context) {
            super(context);
        }

        public void addFooterView(View view) {
            SearchImageResultFragmentBase.this.mGridView.addFooterView(view);
        }

        public void addHeaderView(View view) {
            SearchImageResultFragmentBase.this.mGridView.addHeaderView(view);
        }

        /* access modifiers changed from: protected */
        public View getInfoItemView(View view, int i, InfoViewPosition infoViewPosition) {
            return infoViewPosition == InfoViewPosition.FOOTER ? this.mInflater.inflate(R.layout.search_item_error_footer_layout, null) : super.getInfoItemView(view, i, infoViewPosition);
        }

        public boolean isEmptyDataView() {
            return SearchImageResultFragmentBase.this.mAdapter.getCount() <= 0;
        }

        public boolean isLoading() {
            return SearchImageResultFragmentBase.this.mAdapter.isLoading();
        }

        public void removeFooterView(View view) {
            SearchImageResultFragmentBase.this.mGridView.removeFooterView(view);
        }

        public void removeHeaderView(View view) {
            SearchImageResultFragmentBase.this.mGridView.removeHeaderView(view);
        }

        public void requestRetry() {
            SearchImageResultFragmentBase.this.doRetry();
        }
    }

    /* access modifiers changed from: protected */
    public final void bind(StickyGridHeadersGridView stickyGridHeadersGridView, ImageResultSimpleAdapter imageResultSimpleAdapter) {
        this.mGridView = stickyGridHeadersGridView;
        this.mAdapter = imageResultSimpleAdapter;
        this.mAdapter.setRequestLoadMoreListener(this);
    }

    /* access modifiers changed from: protected */
    public void changeSuggestions(QueryInfo queryInfo, SuggestionCursor suggestionCursor) {
        int i;
        RankInfo rankInfo = SearchUtils.getRankInfo(suggestionCursor);
        boolean isHorizontalDocumentStyle = SearchConstants.isHorizontalDocumentStyle(rankInfo);
        if (isHorizontalDocumentStyle) {
            ThumbConfig.get().getClass();
            i = 2;
        } else {
            i = ThumbConfig.get().sMicroThumbColumnsPortrait;
        }
        int dimensionPixelSize = isHorizontalDocumentStyle ? getResources().getDimensionPixelSize(R.dimen.micro_thumb_document_spacing) : getResources().getDimensionPixelSize(R.dimen.micro_thumb_horizontal_spacing);
        if (this.mColumnCount != i) {
            this.mColumnCount = i;
            this.mGridView.setNumColumns(this.mColumnCount);
            this.mGridView.setVerticalSpacing(dimensionPixelSize);
            this.mGridView.setHorizontalSpacing(dimensionPixelSize);
        }
        this.mAdapter.changeSuggestions(queryInfo, rankInfo, suggestionCursor);
    }

    /* access modifiers changed from: protected */
    public void closeLoadMore() {
        this.mAdapter.closeLoadMore();
        this.mStatusHandleHelper.refreshInfoViews();
    }

    /* access modifiers changed from: protected */
    public ArrayList<String> getCheckedServerIdList(SparseBooleanArray sparseBooleanArray) {
        ArrayList<String> arrayList = new ArrayList<>();
        if (sparseBooleanArray != null && sparseBooleanArray.size() > 0) {
            for (int i = 0; i < sparseBooleanArray.size(); i++) {
                if (sparseBooleanArray.valueAt(i)) {
                    arrayList.add(this.mAdapter.getServerId(sparseBooleanArray.keyAt(i)));
                }
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String getCheckedServerIds(SparseBooleanArray sparseBooleanArray) {
        return TextUtils.join(",", getCheckedServerIdList(sparseBooleanArray));
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 7
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public AbstractErrorViewAdapter getErrorViewAdapter() {
        if (this.mErrorViewAdapter == null) {
            this.mErrorViewAdapter = new ErrorViewAdapter(this.mActivity);
        }
        return this.mErrorViewAdapter;
    }

    /* access modifiers changed from: protected */
    public String getImageIds() {
        if (this.mAdapter != null) {
            return this.mAdapter.getImageIds();
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public ImageSize getMicroThumbnailSize() {
        return this.mAdapter != null ? this.mAdapter.getMicroThumbnailSize() : ThumbConfig.get().sMicroTargetSize;
    }

    /* access modifiers changed from: protected */
    public String getOrder() {
        return null;
    }

    /* access modifiers changed from: protected */
    public Uri getPhotoPageDataLoaderUri() {
        return SearchResultPhoto.URI;
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return null;
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArguments() {
        String imageIds = getImageIds();
        if (!TextUtils.isEmpty(imageIds)) {
            return imageIds.split(",");
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void goToPhotoPage(AdapterView<?> adapterView, int i, String str) {
        int i2 = i;
        ImageLoadParams imageLoadParams = new ImageLoadParams(this.mAdapter.getItemKey(i2), this.mAdapter.getLocalPath(i2), getMicroThumbnailSize(), this.mAdapter.getItemDecodeRectF(i2), i, this.mAdapter.getMimeType(i2), this.mAdapter.getFileLength(i2));
        IntentUtil.gotoPhotoPage(this, adapterView, getPhotoPageDataLoaderUri(), i, this.mAdapter.getCount(), getSelection(), getSelectionArguments(), getOrder(), imageLoadParams, true);
        SearchStatUtils.reportEvent(str, "client_image_operation_open_photo_page", "serverIds", this.mAdapter.getServerId(i2), "queryText", this.mQueryText);
    }

    /* access modifiers changed from: protected */
    public boolean moreThanOnePage() {
        int i;
        int firstVisiblePosition = this.mGridView.getFirstVisiblePosition();
        int lastVisiblePosition = this.mGridView.getLastVisiblePosition();
        while (true) {
            if (lastVisiblePosition <= firstVisiblePosition) {
                i = Integer.MAX_VALUE;
                break;
            } else if (this.mGridView.getItemIndexByItemPosition(lastVisiblePosition) > 0) {
                i = this.mGridView.getItemIndexByItemPosition(lastVisiblePosition);
                break;
            } else {
                lastVisiblePosition--;
            }
        }
        return firstVisiblePosition > 0 || i < this.mAdapter.getCount() - 1;
    }

    public void onDestroy() {
        if (this.mAdapter != null) {
            this.mAdapter.swapCursor(null);
        }
        super.onDestroy();
    }

    /* access modifiers changed from: protected */
    public void onLoadComplete() {
        this.mAdapter.loadComplete();
        this.mStatusHandleHelper.refreshInfoViews();
        ThreadManager.getMainHandler().post(new Runnable() {
            /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
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
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public void run() {
                if (SearchImageResultFragmentBase.this.moreThanOnePage()) {
                    if (SearchImageResultFragmentBase.this.mLoadCompleteFooter == null) {
                        SearchImageResultFragmentBase.this.mLoadCompleteFooter = LayoutInflater.from(SearchImageResultFragmentBase.this.mActivity).inflate(R.layout.search_item_load_complete_layout, SearchImageResultFragmentBase.this.mGridView, false);
                        SearchImageResultFragmentBase.this.mGridView.addFooterView(SearchImageResultFragmentBase.this.mLoadCompleteFooter);
                    }
                    SearchImageResultFragmentBase.this.mStatusHandleHelper.refreshInfoViews();
                } else if (SearchImageResultFragmentBase.this.mLoadCompleteFooter != null) {
                    SearchImageResultFragmentBase.this.mGridView.removeFooterView(SearchImageResultFragmentBase.this.mLoadCompleteFooter);
                    SearchImageResultFragmentBase.this.mLoadCompleteFooter = null;
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public void openLoadMore() {
        this.mAdapter.openLoadMore();
    }

    /* access modifiers changed from: protected */
    public boolean supportFeedback() {
        return this.mInFeedbackTaskMode || super.supportFeedback();
    }

    /* access modifiers changed from: protected */
    public boolean usePersistentResponse() {
        return true;
    }
}
