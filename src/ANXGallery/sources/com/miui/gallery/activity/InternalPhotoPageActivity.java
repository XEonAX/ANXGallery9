package com.miui.gallery.activity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.ui.PhotoPageFragment;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.photoview.PhotoPageDataCache;
import com.nostra13.universalimageloader.core.ImageLoader;

public class InternalPhotoPageActivity extends BaseActivity {
    private void repackageExtras() {
        Bundle arguments = PhotoPageDataCache.getInstance().getArguments();
        if (arguments != null) {
            Uri uri = (Uri) arguments.getParcelable("photo_data");
            Intent intent = getIntent();
            intent.setData(uri);
            intent.putExtras(arguments);
        }
    }

    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    public String[] getRuntimePermissions() {
        return null;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public void onActivityReenter(int i, Intent intent) {
        PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
        if (photoPageFragment != null) {
            photoPageFragment.onActivityReenter(i, intent);
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (getFragmentManager().getBackStackEntryCount() == 0) {
            PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
            if (photoPageFragment != null) {
                photoPageFragment.onActivityResult(i, i2, intent);
            }
        }
    }

    public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() == 0) {
            PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
            if (photoPageFragment != null && photoPageFragment.isVisible() && photoPageFragment.onBackPressed()) {
                return;
            }
        }
        super.onBackPressed();
    }

    /* JADX WARNING: type inference failed for: r4v3, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v3, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment]
  assigns: [com.miui.gallery.ui.PhotoPageFragment]
  uses: [android.app.Fragment]
  mth insns count: 20
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
        if (bundle != null) {
            PhotoPageDataCache.getInstance().restoreInstance(bundle);
        }
        Intent intent = getIntent();
        repackageExtras();
        if (intent.getData() == null) {
            Log.e("InternalPhotoPageActivity", "uri shouldn't be null");
            finish();
            return;
        }
        startFragment(PhotoPageFragment.newInstance(intent.getData(), intent.getType(), intent.getExtras(), 1), "PhotoPageFragment", false, true);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        PhotoPageDataCache.getInstance().clear();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        ImageLoader.getInstance().pause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        ImageLoader.getInstance().resume();
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        PhotoPageDataCache.getInstance().saveInstance(bundle);
    }
}
