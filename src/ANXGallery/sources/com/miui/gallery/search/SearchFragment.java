package com.miui.gallery.search;

import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.SharedElementCallback;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.miui.gallery.R;
import com.miui.gallery.search.navigationpage.NavigationFragment;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.suggestionpage.SuggestionFragment;
import com.miui.gallery.search.transitions.SearchTransitionHelper;
import com.miui.gallery.search.transitions.SearchTransitionHelper.SearchTransitionListener;
import com.miui.gallery.search.transitions.SearchTransitionHelperImp;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.widget.SearchView;
import com.miui.gallery.search.widget.SearchView.SearchViewListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.StringUtils;
import com.miui.gallery.util.ToastUtils;
import java.util.HashMap;

public class SearchFragment extends BaseFragment implements SearchFragmentCallback, SearchTransitionListener {
    private SearchFragmentBase[] mFragments = new SearchFragmentBase[2];
    /* access modifiers changed from: private */
    public SearchView mSearchView;
    /* access modifiers changed from: private */
    public SearchViewListener mSearchViewListener = new SearchViewListener() {
        public void onCancelSearch(View view) {
            SearchFragment.this.mSearchView.selectAll(false);
            SearchFragment.this.mSearchView.hideInputMethod();
            SearchFragment.this.finish();
        }

        public void onFocusChanged(View view, boolean z) {
        }

        public void onQueryTextChanged(View view, String str) {
            if (TextUtils.isEmpty(SearchFragment.this.getQueryText())) {
                SearchFragment.this.setTopFragment(0);
                SearchFragment.this.mSearchView.showInputMethod();
                return;
            }
            SearchFragment.this.setTopFragment(1);
            SearchFragment.this.mTopVisibleFragment.setQueryText(SearchFragment.this.getQueryText(), false, false);
        }

        /* JADX WARNING: type inference failed for: r3v16, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v16, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 29
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
        public void onQueryTextSubmit(View view, String str) {
            SearchFragment.this.mSearchView.clearFocus();
            if (TextUtils.isEmpty(SearchFragment.this.getQueryText())) {
                SearchFragment.this.setTopFragment(0);
                SearchFragment.this.mSearchView.showInputMethod();
                ToastUtils.makeText((Context) SearchFragment.this.mActivity, (int) R.string.empty_query_text_msg);
                return;
            }
            SearchFragment.this.setTopFragment(1);
            if (SearchFragment.this.mTopVisibleFragment instanceof SuggestionFragment) {
                SearchFragment.this.mTopVisibleFragment.setQueryText(SearchFragment.this.getQueryText(), true, false);
            }
        }

        /* JADX WARNING: type inference failed for: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
        /* JADX WARNING: type inference failed for: r1v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
  mth insns count: 11
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
        /* JADX WARNING: Unknown variable types count: 2 */
        public void onStartVoiceAssistant(View view) {
            IntentUtil.startSpeechInput(SearchFragment.this.mActivity, 43, true, SearchConfig.get().getVoiceAssistantSuggestion(SearchFragment.this.mActivity));
            SearchStatUtils.reportEvent("from_search", "start_voice_assistant");
        }
    };
    /* access modifiers changed from: private */
    public SearchFragmentBase mTopVisibleFragment;
    private SearchTransitionHelper mTransitionHelper = new SearchTransitionHelperImp(this, this);
    private boolean mUseTransition;

    private void configSearchView() {
        ThreadManager.getMainHandler().postDelayed(new Runnable() {
            public void run() {
                SearchFragment.this.mSearchView.requestFocus();
                SearchFragment.this.mSearchView.selectAll(true);
                SearchFragment.this.mSearchView.setCursorVisible(true);
                SearchFragment.this.mSearchView.setSearchViewListener(SearchFragment.this.mSearchViewListener);
                SearchFragment.this.mSearchView.showInputMethod();
            }
        }, 100);
    }

    private SearchFragmentBase ensureFragment(int i) {
        switch (i) {
            case 0:
                if (this.mFragments[i] == null) {
                    this.mFragments[i] = new NavigationFragment();
                    break;
                }
                break;
            case 1:
                if (this.mFragments[i] == null) {
                    this.mFragments[i] = new SuggestionFragment();
                    break;
                }
                break;
        }
        this.mFragments[i].setSearchFragmentCallback(this);
        return getFragment(i);
    }

    private String extractQueryFromVoiceAssistantResult(Intent intent) {
        try {
            Bundle bundleExtra = intent.getBundleExtra("android.speech.extra.RESULTS");
            if (bundleExtra == null) {
                return (String) intent.getStringArrayListExtra("android.speech.extra.RESULTS").get(0);
            }
            JsonObject jsonObject = (JsonObject) new Gson().fromJson(bundleExtra.getString("nlpIntention"), JsonObject.class);
            JsonElement jsonElement = jsonObject.get("search_query");
            return (jsonElement == null || TextUtils.isEmpty(jsonElement.getAsString())) ? jsonObject.get("query").getAsString() : jsonElement.getAsString();
        } catch (Exception e) {
            SearchLog.w("SearchFragment", "Error occurred while extracting query from voice assistant result, %s", e);
            return null;
        }
    }

    private SearchFragmentBase getFragment(int i) {
        return this.mFragments[i];
    }

    private String getFromFromIntent(Intent intent) {
        String stringExtra = intent.getStringExtra("from");
        return (!TextUtils.isEmpty(stringExtra) || intent.getData() == null) ? stringExtra : intent.getData().getQueryParameter("from");
    }

    /* access modifiers changed from: private */
    public String getQueryText() {
        if (this.mSearchView.getQueryText() == null) {
            return null;
        }
        return this.mSearchView.getQueryText().trim();
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 14
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
    private void initTopBar() {
        this.mSearchView = new SearchView(this.mActivity);
        this.mActivity.getActionBar().setDisplayShowCustomEnabled(true);
        this.mActivity.getActionBar().setCustomView(this.mSearchView);
        this.mActivity.getActionBar().setDisplayShowTitleEnabled(false);
    }

    private boolean isTopFragment(int i) {
        return this.mTopVisibleFragment != null && this.mTopVisibleFragment == getFragment(i);
    }

    private void recordQueryArrivedFromIntent(String str, String str2) {
        SearchStatUtils.createNewSerial("from_search");
        HashMap hashMap = new HashMap();
        hashMap.put("queryText", str);
        hashMap.put("srcPage", str2);
        SearchStatUtils.cacheEvent(null, "client_enter_search_page", hashMap);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.search.SearchFragmentBase] */
    /* JADX WARNING: type inference failed for: r1v1, types: [android.app.Fragment, com.miui.gallery.search.SearchFragmentBase] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.miui.gallery.search.SearchFragmentBase] */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [com.miui.gallery.search.SearchFragmentBase]
  assigns: [com.miui.gallery.search.SearchFragmentBase]
  uses: [?[int, boolean, OBJECT, ARRAY, byte, short, char], android.app.Fragment, com.miui.gallery.search.SearchFragmentBase]
  mth insns count: 14
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
    /* JADX WARNING: Unknown variable types count: 2 */
    public void setTopFragment(int i) {
        if (!isTopFragment(i)) {
            FragmentTransaction beginTransaction = getChildFragmentManager().beginTransaction();
            ? fragment = getFragment(i);
            if (fragment == 0) {
                fragment = ensureFragment(i);
            }
            beginTransaction.replace(R.id.search_fragments, fragment, String.valueOf(i));
            beginTransaction.commitAllowingStateLoss();
            this.mTopVisibleFragment = fragment;
        }
    }

    private void updateQueryFromIntent(final String str, final boolean z) {
        this.mSearchView.setQueryText(str);
        setTopFragment(1);
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                if (SearchFragment.this.mTopVisibleFragment instanceof SuggestionFragment) {
                    SearchFragment.this.mTopVisibleFragment.setQueryText(str, true, z);
                }
            }
        });
    }

    public String getPageName() {
        return "search";
    }

    public SharedElementCallback getSharedElementCallback(boolean z) {
        return this.mTransitionHelper.getSharedElementCallback();
    }

    public void onActivityCreated(Bundle bundle) {
        String str;
        boolean z;
        super.onActivityCreated(bundle);
        Intent intent = this.mActivity.getIntent();
        String str2 = null;
        if (intent.getData() != null) {
            Uri data = intent.getData();
            str2 = data.getQueryParameter("query");
            str = data.getQueryParameter("queryHint");
            z = data.getBooleanQueryParameter("enableShortcut", false);
        } else {
            str = null;
            z = false;
        }
        if (TextUtils.isEmpty(str2)) {
            if (!TextUtils.isEmpty(str)) {
                this.mSearchView.setQueryText(str);
            }
            setTopFragment(0);
        } else {
            updateQueryFromIntent(str2, z);
        }
        this.mSearchView.setVoiceButtonEnabled(IntentUtil.isSpeechInputSupported());
        boolean z2 = bundle == null || bundle.getBoolean("state_first_creation", true);
        boolean booleanExtra = intent.getBooleanExtra("usingSpecialAnimation", false);
        if (!z2 || !booleanExtra || !SearchTransitionHelperImp.supportSharedElementTransition()) {
            configSearchView();
        } else {
            this.mUseTransition = true;
            ViewCompat.setTransitionName(this.mSearchView.findViewById(R.id.search_view_input), getString(R.string.search_transition_element_input));
            ViewCompat.setTransitionName(this.mSearchView.findViewById(R.id.search_btn_cancel), getString(R.string.search_transition_element_icon));
            ViewCompat.setTransitionName(this.mSearchView.findViewById(R.id.search_btn_voice), getString(R.string.search_transition_element_voice));
            this.mTransitionHelper.configTransition();
            ActivityCompat.startPostponedEnterTransition(getActivity());
        }
        recordQueryArrivedFromIntent(str2, getFromFromIntent(intent));
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 41 && i2 == -1 && intent != null) {
            String string = intent.getExtras().getString("server_id_of_album");
            String string2 = intent.getExtras().getString("origin_album_name");
            String string3 = intent.getExtras().getString("mark_album_name");
            String string4 = intent.getExtras().getString("album_name");
            if (TextUtils.isEmpty(string4)) {
                string4 = string3;
            }
            String string5 = intent.getExtras().getString("mark_relation");
            String queryText = getQueryText();
            if (!TextUtils.isEmpty(string3) && !TextUtils.isEmpty(string4) && !TextUtils.isEmpty(queryText)) {
                String replaceFirst = queryText.replaceFirst(string3, string4);
                SearchConfig.get().getSuggestionConfig().addQueryExtra(string4, string2, string);
                this.mSearchView.setQueryText(replaceFirst);
                this.mSearchViewListener.onQueryTextSubmit(this.mSearchView, replaceFirst);
            }
            HashMap hashMap = new HashMap();
            hashMap.put("peopleServerID", StringUtils.nullToEmpty(string));
            hashMap.put("originName", StringUtils.nullToEmpty(string2));
            hashMap.put("newName", StringUtils.nullToEmpty(string4));
            hashMap.put("markName", StringUtils.nullToEmpty(string3));
            hashMap.put("queryText", StringUtils.nullToEmpty(queryText));
            hashMap.put("markRelation", StringUtils.nullToEmpty(string5));
            SearchStatUtils.reportEvent("from_guide", "suggestion_mark_people", hashMap);
        } else if (i == 43 && i2 == -1) {
            String extractQueryFromVoiceAssistantResult = extractQueryFromVoiceAssistantResult(intent);
            if (!TextUtils.isEmpty(extractQueryFromVoiceAssistantResult)) {
                updateQueryFromIntent(extractQueryFromVoiceAssistantResult, false);
                SearchStatUtils.reportEvent("from_search", "receive_voice_assistant_result", "query", extractQueryFromVoiceAssistantResult);
            }
        }
    }

    public boolean onBackPressed() {
        return false;
    }

    public void onDestroy() {
        super.onDestroy();
        SearchStatUtils.onCompleteSerial("from_search");
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.search_fragment, viewGroup, false);
        initTopBar();
        return inflate;
    }

    public void onNewIntent(Intent intent) {
        if (intent.getData() != null) {
            Uri data = intent.getData();
            String queryParameter = data.getQueryParameter("query");
            boolean booleanQueryParameter = data.getBooleanQueryParameter("enableShortcut", false);
            if (!TextUtils.isEmpty(queryParameter)) {
                updateQueryFromIntent(queryParameter, booleanQueryParameter);
                recordQueryArrivedFromIntent(queryParameter, getFromFromIntent(intent));
            }
        }
    }

    public void onPause() {
        super.onPause();
        this.mSearchView.setSearchViewListener(null);
    }

    public void onResume() {
        super.onResume();
        if (!this.mUseTransition) {
            ThreadManager.getMainHandler().postDelayed(new Runnable() {
                public void run() {
                    SearchFragment.this.mSearchView.requestFocus();
                    SearchFragment.this.mSearchView.selectAll(true);
                    SearchFragment.this.mSearchView.showInputMethod();
                    SearchFragment.this.mSearchView.setSearchViewListener(SearchFragment.this.mSearchViewListener);
                }
            }, 100);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean("state_first_creation", false);
    }

    public void onTransitionEnd() {
        this.mUseTransition = false;
        configSearchView();
    }

    public void onTransitionStart() {
        this.mSearchView.setSearchViewListener(null);
        this.mSearchView.setCursorVisible(false);
    }

    public void requestIME(final boolean z) {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                if (z) {
                    SearchFragment.this.mSearchView.showInputMethod();
                } else {
                    SearchFragment.this.mSearchView.hideInputMethod();
                }
            }
        });
    }
}
