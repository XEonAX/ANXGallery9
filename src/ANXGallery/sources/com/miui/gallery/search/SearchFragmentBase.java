package com.miui.gallery.search;

import com.miui.gallery.ui.BaseFragment;

public abstract class SearchFragmentBase extends BaseFragment {
    private SearchFragmentCallback mCallback;

    public SearchFragmentCallback getCallback() {
        return this.mCallback;
    }

    public void setQueryText(String str, boolean z, boolean z2) {
    }

    public void setSearchFragmentCallback(SearchFragmentCallback searchFragmentCallback) {
        this.mCallback = searchFragmentCallback;
    }
}
