package com.miui.gallery.search;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.search.transitions.SearchTransitionHelperImp;

public class SearchActivity extends BaseActivity {
    SearchFragment mSearchFragment;

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mSearchFragment.onActivityResult(i, i2, intent);
    }

    public void onBackPressed() {
        if (!this.mSearchFragment.onBackPressed()) {
            super.onBackPressed();
            if (!SearchTransitionHelperImp.supportSharedElementTransition()) {
                overridePendingTransition(R.anim.appear, R.anim.disappear);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, com.miui.gallery.search.SearchActivity, android.app.Activity] */
    /* JADX WARNING: type inference failed for: r4v12, types: [com.miui.gallery.search.SearchFragment, android.app.Fragment] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v12, types: [com.miui.gallery.search.SearchFragment, android.app.Fragment]
  assigns: [com.miui.gallery.search.SearchFragment]
  uses: [android.app.Fragment]
  mth insns count: 31
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
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mSearchFragment = (SearchFragment) getFragmentManager().findFragmentByTag("RootFragment");
        boolean z = false;
        if (this.mSearchFragment == null) {
            this.mSearchFragment = new SearchFragment();
            startFragment(this.mSearchFragment, "RootFragment", false, true);
        }
        if (getIntent() != null && getIntent().getBooleanExtra("usingSpecialAnimation", false)) {
            z = true;
        }
        if (z && SearchTransitionHelperImp.supportSharedElementTransition()) {
            ActivityCompat.setEnterSharedElementCallback(this, this.mSearchFragment.getSharedElementCallback(true));
            ActivityCompat.postponeEnterTransition(this);
        }
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        setIntent(intent);
        if (this.mSearchFragment != null) {
            this.mSearchFragment.onNewIntent(intent);
        }
    }
}
