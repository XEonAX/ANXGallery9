package com.miui.gallery.activity;

import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyEvent;
import com.miui.gallery.R;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.app.Activity;
import com.miui.gallery.permission.PermissionIntroductionUtils;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.core.PermissionCheckCallback;
import com.miui.gallery.permission.core.PermissionCheckHelper;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ReceiverUtils;
import com.miui.gallery.util.TransitionPatching;
import com.nexstreaming.nexeditorsdk.nexEngine;
import miui.app.ActionBar;

public class BaseActivity extends Activity implements PermissionCheckCallback {
    private static final String[] REQUIRED_RUNTIME_PERMISSIONS = {"android.permission.WRITE_EXTERNAL_STORAGE"};
    protected ActionBar mActionBar;
    private boolean mIsResumed;
    /* access modifiers changed from: private */
    public boolean mIsStartingEnterTransition = false;
    private PermissionCheckHelper mPermissionCheckHelper;
    private BroadcastReceiver mScreenReceiver;

    private class ScreenBroadcastReceiver extends BroadcastReceiver {
        private ScreenBroadcastReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.SCREEN_OFF".equals(intent.getAction()) && !BaseActivity.this.isFinishing()) {
                BaseActivity.this.finish();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean allowUseOnOffline() {
        return true;
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 0;
    }

    public String[] getRuntimePermissions() {
        return REQUIRED_RUNTIME_PERMISSIONS;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void initActionBar() {
        this.mActionBar = getActionBar();
    }

    public boolean isPermissionRequired(String str) {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean isShowWhenLocked() {
        return getIntent().getBooleanExtra("StartActivityWhenLocked", false);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, com.miui.gallery.app.Activity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        DocumentProviderUtils.handleRequestPermissionResult(this, i, i2, intent);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.permission.core.PermissionCheckCallback, com.miui.gallery.app.Activity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!hasCustomContentView()) {
            setContentView(R.layout.base_activity);
        }
        initActionBar();
        this.mPermissionCheckHelper = new PermissionCheckHelper(this, isShowWhenLocked(), this);
        this.mPermissionCheckHelper.checkPermission();
        if (supportShowOnScreenLocked() && isShowWhenLocked()) {
            getWindow().addFlags(nexEngine.ExportHEVCHighTierLevel52);
            this.mScreenReceiver = new ScreenBroadcastReceiver();
            ReceiverUtils.registerReceiver(this, this.mScreenReceiver, "android.intent.action.SCREEN_OFF");
        }
    }

    /* access modifiers changed from: protected */
    public void onCtaChecked(boolean z) {
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.app.Activity] */
    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.mScreenReceiver != null) {
            ReceiverUtils.safeUnregisterReceiver(this, this.mScreenReceiver);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.app.Activity] */
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if ((i != 82 && i != 187) || !supportEnterSetting()) {
            return super.onKeyDown(i, keyEvent);
        }
        IntentUtil.enterGallerySetting(this);
        return true;
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        this.mIsResumed = false;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity] */
    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        if ((!CTA.allowUseOnOfflineGlobal() || !allowUseOnOffline()) && !CTA.canConnectNetwork()) {
            AgreementsUtils.showUserAgreements(this, new OnAgreementInvokedListener() {
                public void onAgreementInvoked(boolean z) {
                    if (!BaseActivity.this.allowUseOnOffline()) {
                        BaseActivity.this.finish();
                    }
                    BaseActivity.this.onCtaChecked(z);
                }
            });
        } else {
            onCtaChecked(true);
        }
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.mPermissionCheckHelper.onRequestPermissionsResult(i, strArr, iArr);
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        this.mIsResumed = true;
        this.mIsStartingEnterTransition = false;
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, com.miui.gallery.app.Activity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onStop() {
        if (this.mIsStartingEnterTransition) {
            TransitionPatching.onActivityStopWhenEnterStarting(this);
            this.mIsStartingEnterTransition = false;
        }
        super.onStop();
    }

    public final boolean resumed() {
        return this.mIsResumed;
    }

    public void setTitle(CharSequence charSequence) {
        if (this.mActionBar != null) {
            this.mActionBar.setTitle(charSequence);
        }
    }

    public void showPermissionIntroduction(android.app.Activity activity, String str, OnPermissionIntroduced onPermissionIntroduced) {
        PermissionIntroductionUtils.showPermissionIntroduction(activity, str, onPermissionIntroduced);
    }

    public void startFragment(Fragment fragment, String str, boolean z, boolean z2) {
        if (getFragmentContainerId() <= 0) {
            throw new IllegalArgumentException("invalidate container id");
        } else if (TextUtils.isEmpty(str) || getFragmentManager().findFragmentByTag(str) == null) {
            FragmentTransaction beginTransaction = getFragmentManager().beginTransaction();
            if (z) {
                beginTransaction.addToBackStack(str);
            }
            if (z2) {
                beginTransaction.add(getFragmentContainerId(), fragment, str);
            } else {
                beginTransaction.replace(getFragmentContainerId(), fragment, str);
            }
            beginTransaction.commitAllowingStateLoss();
        } else {
            Log.w("BaseActivity", "already has tag of fragment %s", str);
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, com.miui.gallery.app.Activity, android.app.Activity] */
    public void startPostponedEnterTransition() {
        super.startPostponedEnterTransition();
        this.mIsStartingEnterTransition = true;
        TransitionPatching.setOnEnterStartedListener(this, new Runnable() {
            public void run() {
                BaseActivity.this.mIsStartingEnterTransition = false;
            }
        });
    }

    /* access modifiers changed from: protected */
    public boolean supportEnterSetting() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean supportShowOnScreenLocked() {
        return false;
    }
}
