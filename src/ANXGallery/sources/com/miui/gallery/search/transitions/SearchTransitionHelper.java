package com.miui.gallery.search.transitions;

import miui.app.Fragment;

public abstract class SearchTransitionHelper {
    protected SearchTransitionListener mEnterTransitionListener;
    protected Fragment mFragment;

    public interface SearchTransitionListener {
        void onTransitionEnd();

        void onTransitionStart();
    }

    public SearchTransitionHelper(Fragment fragment, SearchTransitionListener searchTransitionListener) {
        this.mFragment = fragment;
        this.mEnterTransitionListener = searchTransitionListener;
    }

    public abstract void configTransition();

    public abstract SearchSharedElementCallback getSharedElementCallback();
}
