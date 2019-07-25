package com.miui.gallery.permission.core;

import android.app.Activity;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;

public class PermissionCheckHelper {
    /* access modifiers changed from: private */
    public Activity mActivity;
    /* access modifiers changed from: private */
    public PermissionCheckCallback mCallback;
    private boolean mIsShowWhenLocked;

    private static class CheckResult {
        String permission;
        int result;

        private CheckResult() {
        }
    }

    public PermissionCheckHelper(Activity activity, boolean z, PermissionCheckCallback permissionCheckCallback) {
        if (activity == null || permissionCheckCallback == null) {
            throw new RuntimeException("PermissionCheckHelper: activity or callback can't be null");
        }
        this.mActivity = activity;
        this.mIsShowWhenLocked = z;
        this.mCallback = permissionCheckCallback;
    }

    private String[] filterResults(CheckResult[] checkResultArr, int i) {
        LinkedList linkedList = new LinkedList();
        for (CheckResult checkResult : checkResultArr) {
            if (checkResult.result == i) {
                linkedList.add(checkResult.permission);
            }
        }
        return (String[]) linkedList.toArray(new String[linkedList.size()]);
    }

    private CheckResult[] initResults(String[] strArr) {
        CheckResult[] checkResultArr = new CheckResult[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            checkResultArr[i] = new CheckResult();
            checkResultArr[i].permission = strArr[i];
            checkResultArr[i].result = -1;
        }
        return checkResultArr;
    }

    /* access modifiers changed from: private */
    public void requestPermissions(CheckResult[] checkResultArr) {
        String[] filterResults = filterResults(checkResultArr, 0);
        String[] ungrantedPermissions = PermissionUtils.getUngrantedPermissions(this.mActivity, filterResults);
        if (ungrantedPermissions == null || ungrantedPermissions.length <= 0) {
            int[] iArr = new int[filterResults.length];
            Arrays.fill(iArr, 0);
            this.mCallback.onPermissionsChecked(filterResults, iArr);
        } else if (this.mIsShowWhenLocked) {
            PermissionDeniedActivity.startActivity(this.mActivity, Arrays.asList(ungrantedPermissions), true);
            this.mActivity.finish();
        } else {
            PermissionUtils.requestPermissions(this.mActivity, ungrantedPermissions, 46);
        }
    }

    /* access modifiers changed from: private */
    public void showPermissionIntroduction(final CheckResult[] checkResultArr, final int i) {
        this.mCallback.showPermissionIntroduction(this.mActivity, checkResultArr[i].permission, new OnPermissionIntroduced() {
            public void onPermissionIntroduced(boolean z) {
                if (z) {
                    checkResultArr[i].result = 0;
                } else if (!PermissionCheckHelper.this.mCallback.isPermissionRequired(checkResultArr[i].permission)) {
                    checkResultArr[i].result = -1;
                } else {
                    PermissionCheckHelper.this.mActivity.finish();
                    return;
                }
                if (i < checkResultArr.length - 1) {
                    PermissionCheckHelper.this.showPermissionIntroduction(checkResultArr, i + 1);
                } else {
                    PermissionCheckHelper.this.requestPermissions(checkResultArr);
                }
            }
        });
    }

    public void checkPermission() {
        String[] runtimePermissions = this.mCallback.getRuntimePermissions();
        if (runtimePermissions == null || runtimePermissions.length <= 0) {
            this.mCallback.onPermissionsChecked(runtimePermissions, new int[0]);
        } else {
            showPermissionIntroduction(initResults(runtimePermissions), 0);
        }
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (i == 46 && strArr != null) {
            ArrayList arrayList = new ArrayList();
            boolean z = true;
            for (int i2 = 0; i2 < strArr.length; i2++) {
                if (iArr[i2] != 0 && this.mCallback.isPermissionRequired(strArr[i2])) {
                    arrayList.add(strArr[i2]);
                    z = false;
                }
            }
            if (z) {
                this.mCallback.onPermissionsChecked(strArr, iArr);
                return;
            }
            PermissionDeniedActivity.startActivity(this.mActivity, arrayList, this.mIsShowWhenLocked);
            this.mActivity.finish();
        }
    }
}
