package com.miui.gallery.activity;

import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.compat.app.ActivityCompat;
import com.miui.gallery.ui.BurstPhotoFragment;

public class BurstPhotoActivity extends BaseActivity {
    private BurstPhotoFragment mFragment;

    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public void onBackPressed() {
        if (!this.mFragment.onBackPressed()) {
            super.onBackPressed();
        }
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity, com.miui.gallery.activity.BurstPhotoActivity] */
    /* JADX WARNING: type inference failed for: r0v3, types: [android.app.Fragment, com.miui.gallery.ui.BurstPhotoFragment] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [android.app.Fragment, com.miui.gallery.ui.BurstPhotoFragment]
  assigns: [com.miui.gallery.ui.BurstPhotoFragment]
  uses: [android.app.Fragment]
  mth insns count: 19
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
        Intent intent = getIntent();
        if (intent == null || intent.getData() == null) {
            finish();
            return;
        }
        this.mFragment = BurstPhotoFragment.newInstance(intent.getData(), intent.getExtras());
        startFragment(this.mFragment, "BurstPhotoFragment", false, true);
        if (intent.getBooleanExtra("has_transition", false)) {
            ActivityCompat.startPostponedEnterTransition(this);
        }
    }
}
