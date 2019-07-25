package com.miui.gallery.picker;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.permission.PermissionIntroductionUtils;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.core.PermissionCheckCallback;
import com.miui.gallery.permission.core.PermissionCheckHelper;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.util.Log;
import com.miui.security.CrossUserCompatActivity;
import miui.app.ActionBar;

public class PickerCompatActivity extends CrossUserCompatActivity implements PermissionCheckCallback {
    private static final String[] REQUIRED_RUNTIME_PERMISSIONS = {"android.permission.WRITE_EXTERNAL_STORAGE"};
    protected ActionBar mActionBar;
    private boolean mIsResumed;
    private PermissionCheckHelper mPermissionCheckHelper;

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

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.picker.PickerCompatActivity, com.miui.gallery.permission.core.PermissionCheckCallback, com.miui.security.CrossUserCompatActivity, android.app.Activity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!hasCustomContentView()) {
            setContentView(R.layout.base_activity);
        }
        initActionBar();
        this.mPermissionCheckHelper = new PermissionCheckHelper(this, false, this);
        this.mPermissionCheckHelper.checkPermission();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        this.mIsResumed = false;
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.picker.PickerCompatActivity, android.app.Activity] */
    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        if ((!CTA.allowUseOnOfflineGlobal() || !allowUseOnOffline()) && !CTA.canConnectNetwork() && !CTA.canConnectNetwork()) {
            AgreementsUtils.showUserAgreements(this, null);
        }
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.mPermissionCheckHelper.onRequestPermissionsResult(i, strArr, iArr);
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        this.mIsResumed = true;
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
    }

    public void setTitle(CharSequence charSequence) {
        if (this.mActionBar != null) {
            this.mActionBar.setTitle(charSequence);
        }
    }

    public void showPermissionIntroduction(Activity activity, String str, OnPermissionIntroduced onPermissionIntroduced) {
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
            Log.w("PickerCompatActivity", "already has tag of fragment %s", str);
        }
    }
}
