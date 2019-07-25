package com.miui.gallery.search.resultpage;

import android.app.Activity;
import android.graphics.Rect;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import android.view.ViewStub;
import com.miui.gallery.R;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.context.SearchContext;
import com.miui.gallery.search.core.display.BaseSuggestionAdapter;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.widget.TwoStageDrawer;

public class FilterBarController {
    private Activity mActivity;
    /* access modifiers changed from: private */
    public BaseSuggestionAdapter mAdapter;
    private View mContainer;
    /* access modifiers changed from: private */
    public TwoStageDrawer mDrawer;
    private String mFrom;
    private RecyclerView mRecyclerView;

    private class PaddingDecoration extends ItemDecoration {
        private final int mMargin;

        public PaddingDecoration(int i) {
            this.mMargin = i;
        }

        public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
            int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
            if (childAdapterPosition == 0) {
                rect.set(this.mMargin, 0, 0, 0);
            } else if (childAdapterPosition == FilterBarController.this.mAdapter.getItemCount() - 1) {
                rect.set(0, 0, this.mMargin, 0);
            } else {
                rect.set(0, 0, 0, 0);
            }
        }
    }

    public FilterBarController(Activity activity, TwoStageDrawer twoStageDrawer, String str) {
        this.mActivity = activity;
        this.mDrawer = twoStageDrawer;
        this.mFrom = str;
    }

    public int getFilterDataCount() {
        if (this.mAdapter != null) {
            return this.mAdapter.getItemCount();
        }
        return 0;
    }

    public boolean isFilterBarVisible() {
        return this.mContainer.getVisibility() == 0;
    }

    public void showFilterBar(boolean z) {
        if (z && !isFilterBarVisible()) {
            this.mContainer.setVisibility(0);
            this.mDrawer.post(new Runnable() {
                public void run() {
                    FilterBarController.this.mDrawer.openDrawer(true, null);
                }
            });
        } else if (!z && isFilterBarVisible()) {
            this.mContainer.setVisibility(8);
            this.mDrawer.post(new Runnable() {
                public void run() {
                    FilterBarController.this.mDrawer.closeDrawer(true, null);
                }
            });
        }
    }

    public void swapCursor(QueryInfo queryInfo, SuggestionCursor suggestionCursor) {
        if (suggestionCursor != null || this.mContainer != null) {
            if (this.mContainer == null) {
                this.mContainer = this.mDrawer.findViewById(R.id.filter_bar_container);
                this.mRecyclerView = (RecyclerView) ((ViewStub) this.mContainer.findViewById(R.id.filter_bar_stub)).inflate().findViewById(R.id.filter_bar);
                this.mAdapter = new BaseSuggestionAdapter(this.mActivity, SearchContext.getInstance().getSuggestionViewFactory(), this.mFrom);
                this.mRecyclerView.setAdapter(this.mAdapter);
                this.mRecyclerView.setLayoutManager(new LinearLayoutManager(this.mActivity, 0, false));
                this.mRecyclerView.addItemDecoration(new PaddingDecoration(this.mActivity.getResources().getDimensionPixelSize(R.dimen.filter_bar_edge_padding)));
            }
            if (!(suggestionCursor == null || this.mRecyclerView.getLayoutParams() == null)) {
                this.mRecyclerView.getLayoutParams().height = this.mActivity.getResources().getDimensionPixelSize(suggestionCursor.getExtras().getInt("filter_style", 0) == 1 ? R.dimen.filter_bar_height : R.dimen.filter_bar_height_no_icon);
            }
            this.mAdapter.changeSuggestions(queryInfo, suggestionCursor);
        }
    }
}
