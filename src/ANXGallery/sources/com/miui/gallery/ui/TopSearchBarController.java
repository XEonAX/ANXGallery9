package com.miui.gallery.ui;

import android.app.Activity;
import android.app.LoaderManager;
import android.app.LoaderManager.LoaderCallbacks;
import android.content.Intent;
import android.content.Loader;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v4.util.Pair;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.provider.GalleryContract.Search;
import com.miui.gallery.search.SearchActivity;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.query.QueryLoader;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.resultprocessor.LinearResultProcessor;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.hint.SearchBarHintAdapter;
import com.miui.gallery.search.hint.SearchBarHintItem;
import com.miui.gallery.search.transitions.SearchSharedElementCallback;
import com.miui.gallery.search.transitions.SearchTransitionHelperImp;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.search.widget.BannerSearchBar;
import com.miui.gallery.search.widget.BannerSearchBar.OnHintClickListener;
import com.miui.gallery.search.widget.bannerView.BaseBannerAdapter.OnUpdateTextListener;
import com.miui.gallery.util.ActionURIHandler;
import miui.app.Fragment;

public class TopSearchBarController implements LoaderCallbacks<SuggestionResult>, OnHintClickListener, OnUpdateTextListener {
    private Bundle mActionBundle = null;
    private SearchBarHintItem[] mDefaultHints = null;
    private Fragment mFragment;
    private SearchBarHintAdapter mHintAdapter;
    private boolean mNeedReloadHint = false;
    private BannerSearchBar mSearchBar;
    private TextView mSearchTextView;

    public TopSearchBarController(Fragment fragment, BannerSearchBar bannerSearchBar, String str) {
        this.mFragment = fragment;
        this.mSearchBar = bannerSearchBar;
        this.mSearchTextView = (TextView) this.mSearchBar.findViewById(R.id.banner_search_view);
        this.mHintAdapter = new SearchBarHintAdapter(getLocalDefaultHints());
        this.mHintAdapter.setOnUpdateTextListener(this);
        this.mSearchBar.setHintAdapter(this.mHintAdapter);
        this.mSearchBar.setOnHintClickListener(this);
        if (str != null) {
            this.mActionBundle = new Bundle(1);
            this.mActionBundle.putString("from", str);
        }
        this.mNeedReloadHint = true;
    }

    private SearchBarHintItem[] formatHintResult(SuggestionResult suggestionResult) {
        if (suggestionResult == null || suggestionResult.isEmpty()) {
            return null;
        }
        SuggestionCursor data = suggestionResult.getData();
        SearchBarHintItem[] searchBarHintItemArr = new SearchBarHintItem[data.getCount()];
        for (int i = 0; i < data.getCount(); i++) {
            data.moveToPosition(i);
            int i2 = 4000;
            String string = getString(data, "display_duration");
            if (!TextUtils.isEmpty(string)) {
                try {
                    i2 = Math.max(4000, Integer.valueOf(string).intValue());
                } catch (NumberFormatException e) {
                    SearchLog.w("TopSearchBarController", "error occurred when formatting hint display duration, %s", e);
                }
            }
            searchBarHintItemArr[i] = new SearchBarHintItem(getString(data, "hint_text"), getString(data, "query_text"), i2);
        }
        return searchBarHintItemArr;
    }

    private String getHintText(int i, boolean z) {
        if (i < 0 || i >= this.mHintAdapter.getCount()) {
            return null;
        }
        SearchBarHintItem searchBarHintItem = (SearchBarHintItem) this.mHintAdapter.getItem(i);
        return z ? searchBarHintItem.getQueryText() : searchBarHintItem.getHintText();
    }

    private SearchBarHintItem[] getLocalDefaultHints() {
        if (this.mDefaultHints == null) {
            this.mDefaultHints = new SearchBarHintItem[]{new SearchBarHintItem(getActivity().getString(R.string.search_hint), null)};
        }
        return this.mDefaultHints;
    }

    private static String getString(SuggestionCursor suggestionCursor, String str) {
        int columnIndex = suggestionCursor.getColumnIndex(str);
        if (columnIndex >= 0) {
            return suggestionCursor.getString(columnIndex);
        }
        return null;
    }

    private void goToSearchPage(Uri uri) {
        if (!SearchTransitionHelperImp.supportSharedElementTransition()) {
            ActionURIHandler.handleUri(getActivity(), uri, this.mActionBundle);
            getActivity().overridePendingTransition(R.anim.appear, R.anim.disappear);
            return;
        }
        ActivityCompat.setExitSharedElementCallback(getActivity(), new SearchSharedElementCallback());
        this.mSearchTextView.setTextColor(getActivity().getResources().getColor(R.color.search_bar_text_color));
        this.mSearchTextView.setHintTextColor(getActivity().getResources().getColor(R.color.search_bar_text_color_hint));
        Intent intent = new Intent(getActivity(), SearchActivity.class);
        intent.setData(uri);
        intent.putExtra("from", this.mActionBundle.getString("from"));
        intent.putExtra("usingSpecialAnimation", true);
        View findViewById = this.mSearchBar.findViewById(R.id.search_btn);
        View findViewById2 = this.mSearchBar.findViewById(R.id.search_btn_voice);
        ActivityCompat.startActivity(getActivity(), intent, ActivityOptionsCompat.makeSceneTransitionAnimation(getActivity(), Pair.create(this.mSearchTextView, getActivity().getString(R.string.search_transition_element_input)), Pair.create(findViewById, getActivity().getString(R.string.search_transition_element_icon)), Pair.create(findViewById2, getActivity().getString(R.string.search_transition_element_voice))).toBundle());
    }

    private void updateHintData(SearchBarHintItem[] searchBarHintItemArr) {
        SearchBarHintAdapter searchBarHintAdapter = this.mHintAdapter;
        if (searchBarHintItemArr == null) {
            searchBarHintItemArr = getLocalDefaultHints();
        }
        searchBarHintAdapter.setData((T[]) searchBarHintItemArr);
    }

    /* access modifiers changed from: protected */
    public Activity getActivity() {
        return this.mFragment.getActivity();
    }

    /* access modifiers changed from: protected */
    public LoaderManager getLoaderManager() {
        return this.mFragment.getLoaderManager();
    }

    public Loader<SuggestionResult> onCreateLoader(int i, Bundle bundle) {
        return new QueryLoader(getActivity(), new Builder(SearchType.SEARCH_TYPE_HINT).build(), new LinearResultProcessor());
    }

    public void onHintClicked(BannerSearchBar bannerSearchBar, int i) {
        Uri.Builder buildUpon = Search.URI_SEARCH_PAGE.buildUpon();
        String hintText = getHintText(i, true);
        if (!TextUtils.isEmpty(hintText)) {
            buildUpon.appendQueryParameter("queryHint", hintText);
        }
        goToSearchPage(buildUpon.build());
    }

    public void onLoadFinished(Loader<SuggestionResult> loader, SuggestionResult suggestionResult) {
        updateHintData(suggestionResult != null ? formatHintResult(suggestionResult) : null);
        this.mNeedReloadHint = suggestionResult == null || SearchUtils.isErrorResult(suggestionResult);
        try {
            getLoaderManager().destroyLoader(loader.getId());
        } catch (Exception e) {
            SearchLog.e("TopSearchBarController", "Failed when destroying loader [%s]", e);
        }
    }

    public void onLoaderReset(Loader loader) {
    }

    public void onPause() {
        this.mSearchBar.getLooperController().stopLoop();
        this.mSearchBar.findViewById(R.id.banner_view).setVisibility(8);
    }

    public void onResume() {
        this.mSearchBar.getLooperController().startLoop();
        this.mSearchBar.findViewById(R.id.banner_view).setVisibility(0);
        this.mSearchTextView.setTextColor(0);
        this.mSearchTextView.setHintTextColor(0);
        if (this.mNeedReloadHint) {
            getLoaderManager().restartLoader(11, null, this);
            this.mNeedReloadHint = false;
        }
    }

    public void onUpdateText(String str, String str2) {
        this.mSearchTextView.setText(str);
        this.mSearchTextView.setHint(str2);
    }

    public void setEnable(boolean z) {
        this.mSearchBar.setClickable(z);
        this.mSearchBar.setEnabled(z);
    }
}
