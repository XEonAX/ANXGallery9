package com.miui.gallery.share;

import android.app.FragmentTransaction;
import android.os.Bundle;
import com.miui.gallery.activity.BaseActivity;

public class LoginAndSyncForInvitationActivity extends BaseActivity {
    /* access modifiers changed from: protected */
    public boolean allowUseOnOffline() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    /* JADX WARNING: type inference failed for: r3v1, types: [android.app.Fragment, com.miui.gallery.share.LoginAndSyncForInvitationFragment] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v1, types: [android.app.Fragment, com.miui.gallery.share.LoginAndSyncForInvitationFragment]
  assigns: [com.miui.gallery.share.LoginAndSyncForInvitationFragment]
  uses: [com.miui.gallery.share.LoginAndSyncForInvitationFragment, android.app.Fragment]
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
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ? loginAndSyncForInvitationFragment = new LoginAndSyncForInvitationFragment();
        loginAndSyncForInvitationFragment.setArguments(getIntent().getExtras());
        FragmentTransaction beginTransaction = getFragmentManager().beginTransaction();
        beginTransaction.add(loginAndSyncForInvitationFragment, "LoginAndSyncForInvitationFragment");
        beginTransaction.commitAllowingStateLoss();
    }
}
