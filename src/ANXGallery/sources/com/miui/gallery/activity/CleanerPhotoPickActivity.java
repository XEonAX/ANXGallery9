package com.miui.gallery.activity;

import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.ui.ScreenshotPhotoPickFragment;
import com.miui.gallery.ui.SimilarPhotoPickFragment;
import com.miui.gallery.ui.SlimPhotoPickFragment;
import com.miui.gallery.ui.VideoResultPickFragment;

public class CleanerPhotoPickActivity extends BaseActivity {
    /* JADX WARNING: type inference failed for: r4v3, types: [com.miui.gallery.ui.SlimPhotoPickFragment, android.app.Fragment] */
    /* JADX WARNING: type inference failed for: r4v6, types: [android.app.Fragment, com.miui.gallery.ui.ScreenshotPhotoPickFragment] */
    /* JADX WARNING: type inference failed for: r4v9, types: [com.miui.gallery.ui.VideoResultPickFragment, android.app.Fragment] */
    /* JADX WARNING: type inference failed for: r4v12, types: [android.app.Fragment, com.miui.gallery.ui.SimilarPhotoPickFragment] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [com.miui.gallery.ui.SlimPhotoPickFragment, android.app.Fragment]
  assigns: [com.miui.gallery.ui.SlimPhotoPickFragment]
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
    /* JADX WARNING: Unknown variable types count: 4 */
    private void startFragmentByType(int i) {
        switch (i) {
            case 0:
                if (getFragmentManager().findFragmentByTag("SlimPhotoPickFragment") == null) {
                    startFragment(new SlimPhotoPickFragment(), "SlimPhotoPickFragment", false, true);
                    break;
                }
                break;
            case 1:
                if (getFragmentManager().findFragmentByTag("ScreenshotPhotoPickFragment") == null) {
                    startFragment(new ScreenshotPhotoPickFragment(), "ScreenshotPhotoPickFragment", false, true);
                    break;
                }
                break;
            case 2:
                if (getFragmentManager().findFragmentByTag("VideoResultPickFragment") == null) {
                    startFragment(new VideoResultPickFragment(), "VideoResultPickFragment", false, true);
                    break;
                }
                break;
            case 3:
                if (getFragmentManager().findFragmentByTag("SimilarPhotoPickFragment") == null) {
                    startFragment(new SimilarPhotoPickFragment(), "SimilarPhotoPickFragment", false, true);
                    break;
                }
                break;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        startFragmentByType(getIntent().getIntExtra("extra_cleaner_photo_pick_type", -1));
        this.mActionBar.setCustomView(R.layout.cleaner_photo_pick_action_layout);
        this.mActionBar.setDisplayShowCustomEnabled(true);
    }
}
