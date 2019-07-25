package com.miui.gallery.ui;

import android.app.Activity;
import android.os.Bundle;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.app.Fragment;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.nostra13.universalimageloader.core.ImageLoader;

public abstract class BaseFragment extends Fragment {
    /* access modifiers changed from: protected */
    public BaseActivity mActivity;
    protected boolean mUserFirstVisible = false;

    public void finish() {
        if (this.mActivity.getFragmentManager().getBackStackEntryCount() > 0) {
            this.mActivity.getFragmentManager().popBackStack();
        } else {
            this.mActivity.onBackPressed();
        }
    }

    public abstract String getPageName();

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 2131820703;
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.mActivity = (BaseActivity) activity;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        int themeRes = getThemeRes();
        if (themeRes != 0) {
            setThemeRes(themeRes);
        }
    }

    public void onDetach() {
        super.onDetach();
        this.mActivity = null;
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onPause() {
        super.onPause();
        if (useImageLoader()) {
            ImageLoader.getInstance().onPagePause();
        }
        if (recordPageByDefault()) {
            GallerySamplingStatHelper.recordPageEnd(this.mActivity, getPageName());
        }
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.app.Activity]
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
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onResume() {
        super.onResume();
        if (useImageLoader()) {
            ImageLoader.getInstance().onPageResume();
        }
        if (recordPageByDefault()) {
            GallerySamplingStatHelper.recordPageStart(this.mActivity, getPageName());
        }
    }

    /* access modifiers changed from: protected */
    public void onUserFirstVisible() {
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return true;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (getUserVisibleHint() && !this.mUserFirstVisible) {
            this.mUserFirstVisible = true;
            onUserFirstVisible();
        }
    }

    /* access modifiers changed from: protected */
    public boolean useImageLoader() {
        return true;
    }
}
