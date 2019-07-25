package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewStub;
import com.miui.gallery.R;
import com.miui.gallery.preference.GalleryPreferences.Search;
import com.miui.gallery.search.StatusHandleHelper.AbstractErrorViewAdapter;
import com.miui.gallery.search.StatusHandleHelper.InfoViewPosition;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.feedback.FeedbackPolicyNoticeFragment;
import com.miui.gallery.ui.SearchFeedbackTaskController;

public class TagListFragment extends SearchResultFragment {
    private FeedbackPolicyNoticeFragment mPolicyNoticeFragment = null;
    private SearchFeedbackTaskController mSearchFeedbackTaskController;
    private View mSearchFeedbackTaskIndicator;
    /* access modifiers changed from: private */
    public boolean mUserAgreedPolicy = false;

    private class TagListErrorViewAdapter extends ErrorViewAdapter {
        public TagListErrorViewAdapter(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        public int getIconResForStatus(int i, InfoViewPosition infoViewPosition) {
            if (infoViewPosition == InfoViewPosition.FULL_SCREEN) {
                return R.drawable.empty_page_things;
            }
            if (infoViewPosition == InfoViewPosition.FOOTER) {
                return R.drawable.search_connection_error_icon;
            }
            return 0;
        }

        /* access modifiers changed from: protected */
        public String getInfoTitleForStatus(int i, InfoViewPosition infoViewPosition) {
            boolean z = infoViewPosition == InfoViewPosition.FULL_SCREEN;
            int i2 = R.string.things_album_empty_title;
            if (i != 1) {
                if (i == 10) {
                    i2 = R.string.search_syncing;
                } else if (i != 13) {
                    switch (i) {
                        case 3:
                            if (!z) {
                                i2 = R.string.search_login_title;
                                break;
                            }
                            break;
                        case 4:
                            if (!z) {
                                i2 = R.string.search_backup_title;
                                break;
                            }
                            break;
                        default:
                            if (!z) {
                                i2 = R.string.search_error_and_retry;
                                break;
                            }
                            break;
                    }
                } else {
                    i2 = R.string.ai_album_requesting_title;
                }
            } else if (!z) {
                i2 = R.string.search_connection_error_and_set;
            }
            return this.mContext.getString(i2);
        }
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
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public AbstractErrorViewAdapter getErrorViewAdapter() {
        if (this.mErrorViewAdapter == null) {
            this.mErrorViewAdapter = new TagListErrorViewAdapter(this.mActivity);
        }
        return this.mErrorViewAdapter;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResource() {
        return R.layout.search_tag_list_fragment;
    }

    /* access modifiers changed from: protected */
    public Builder getSectionDataQueryInfoBuilder() {
        Builder sectionDataQueryInfoBuilder = super.getSectionDataQueryInfoBuilder();
        if (this.mInFeedbackTaskMode) {
            sectionDataQueryInfoBuilder.addParam("filterMode", "feedback");
        }
        return sectionDataQueryInfoBuilder;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        if (bundle != null) {
            this.mUserAgreedPolicy = bundle.getBoolean("UserAgreedPolicy", false);
        }
    }

    /* access modifiers changed from: protected */
    public void onInflateView(View view, Bundle bundle, Uri uri) {
        super.onInflateView(view, bundle, uri);
        if (this.mInFeedbackTaskMode) {
            if (this.mSearchFeedbackTaskIndicator == null) {
                this.mSearchFeedbackTaskIndicator = ((ViewStub) view.findViewById(R.id.search_feedback_task_indicator)).inflate();
            }
            if (this.mSearchFeedbackTaskController == null) {
                this.mSearchFeedbackTaskController = new SearchFeedbackTaskController(this, this.mSearchFeedbackTaskIndicator);
            }
            if (isResumed()) {
                this.mSearchFeedbackTaskController.onResume();
            }
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mSearchFeedbackTaskController != null) {
            this.mSearchFeedbackTaskController.onPause();
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mSearchFeedbackTaskController != null) {
            this.mSearchFeedbackTaskController.onResume();
        }
        if (this.mInFeedbackTaskMode && Search.shouldShowFeedbackPolicy() && !this.mUserAgreedPolicy) {
            if (this.mPolicyNoticeFragment == null || !this.mPolicyNoticeFragment.isAdded()) {
                if (this.mPolicyNoticeFragment == null) {
                    this.mPolicyNoticeFragment = (FeedbackPolicyNoticeFragment) getFragmentManager().findFragmentByTag("PolicyNoticeFragment");
                    if (this.mPolicyNoticeFragment == null) {
                        this.mPolicyNoticeFragment = new FeedbackPolicyNoticeFragment();
                        this.mPolicyNoticeFragment.setOnPositiveButtonClickListener(new OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int i) {
                                TagListFragment.this.mUserAgreedPolicy = true;
                            }
                        });
                    }
                }
                if (!this.mPolicyNoticeFragment.isAdded()) {
                    this.mPolicyNoticeFragment.showAllowingStateLoss(getFragmentManager(), "PolicyNoticeFragment");
                }
            }
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("UserAgreedPolicy", this.mUserAgreedPolicy);
    }
}
