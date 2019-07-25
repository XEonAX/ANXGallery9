package com.miui.gallery.activity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.ui.PhotoPreviewSelectFragment;

public class PhotoPreviewSelectActivity extends BaseActivity {
    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.ui.PhotoPreviewSelectFragment, android.app.Fragment] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.ui.PhotoPreviewSelectFragment, android.app.Fragment]
  assigns: [com.miui.gallery.ui.PhotoPreviewSelectFragment]
  uses: [android.app.Fragment]
  mth insns count: 12
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
        if (intent != null) {
            Uri data = intent.getData();
            if (data != null) {
                startFragment(PhotoPreviewSelectFragment.newInstance(data, intent.getExtras()), "PhotoPreviewSelectFragment", false, true);
                return;
            }
        }
        finish();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
    }
}
