package com.miui.gallery.search.transitions;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.transition.ChangeBounds;
import android.transition.ChangeClipBounds;
import android.transition.ChangeTransform;
import android.transition.Transition;
import android.transition.Transition.TransitionListener;
import android.transition.TransitionSet;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.search.transitions.SearchTransitionHelper.SearchTransitionListener;
import java.util.List;
import java.util.Map;
import miui.app.Fragment;

public class SearchTransitionHelperImp extends SearchTransitionHelper {
    private SearchSharedElementCallback mSharedElementCallback;

    public SearchTransitionHelperImp(Fragment fragment, SearchTransitionListener searchTransitionListener) {
        super(fragment, searchTransitionListener);
        this.mSharedElementCallback = !supportSharedElementTransition() ? null : new SearchSharedElementCallback() {
            public void onMapSharedElements(List<String> list, Map<String, View> map) {
                super.onMapSharedElements(list, map);
                if (SearchTransitionHelperImp.this.mEnterTransitionListener != null) {
                    SearchTransitionHelperImp.this.mEnterTransitionListener.onTransitionStart();
                }
            }
        };
    }

    @TargetApi(21)
    private Transition generateTransition(boolean z) {
        if (!supportSharedElementTransition()) {
            return null;
        }
        String string = this.mFragment.getString(R.string.search_transition_element_input);
        String string2 = this.mFragment.getString(R.string.search_transition_element_icon);
        String string3 = this.mFragment.getString(R.string.search_transition_element_voice);
        TransitionSet transitionSet = new TransitionSet();
        transitionSet.setDuration((long) this.mFragment.getResources().getInteger(R.integer.search_activity_transition_duration));
        transitionSet.addTransition(new ChangeTransform());
        transitionSet.addTransition(new ChangeBounds());
        transitionSet.addTransition(new ChangeClipBounds());
        FadeOutInTransform fadeOutInTransform = new FadeOutInTransform();
        fadeOutInTransform.addTarget(string2);
        fadeOutInTransform.addTarget(string3);
        transitionSet.addTransition(fadeOutInTransform);
        ChangeImage changeImage = new ChangeImage();
        changeImage.addTarget(string2);
        changeImage.addTarget(string);
        changeImage.addTarget(string3);
        transitionSet.addTransition(changeImage);
        ChangeTextView changeTextView = new ChangeTextView();
        changeTextView.addTarget(string);
        transitionSet.addTransition(changeTextView);
        if (z) {
            transitionSet.addListener(new TransitionListener() {
                public void onTransitionCancel(Transition transition) {
                }

                public void onTransitionEnd(Transition transition) {
                    if (SearchTransitionHelperImp.this.mEnterTransitionListener != null) {
                        SearchTransitionHelperImp.this.mEnterTransitionListener.onTransitionEnd();
                    }
                }

                public void onTransitionPause(Transition transition) {
                }

                public void onTransitionResume(Transition transition) {
                }

                public void onTransitionStart(Transition transition) {
                }
            });
        }
        return transitionSet;
    }

    public static boolean supportSharedElementTransition() {
        return VERSION.SDK_INT >= 21;
    }

    @TargetApi(21)
    public void configTransition() {
        if (supportSharedElementTransition()) {
            this.mFragment.getActivity().getWindow().setSharedElementEnterTransition(generateTransition(true));
            this.mFragment.getActivity().getWindow().setSharedElementReturnTransition(generateTransition(false));
        }
    }

    public SearchSharedElementCallback getSharedElementCallback() {
        return this.mSharedElementCallback;
    }
}
