package com.miui.gallery.permission.core;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.permission.R;
import com.miui.gallery.stat.BaseSamplingStatHelper;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.util.ArrayList;
import java.util.List;

public class PermissionDeniedActivity extends Activity {
    private AlertDialog mInfoDialog;
    private ScreenBroadcastReceiver mScreenReceiver;
    private ArrayList<String> mUnGrantedPermissions;

    private class ScreenBroadcastReceiver extends BroadcastReceiver {
        private ScreenBroadcastReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.SCREEN_OFF".equals(intent.getAction()) && !PermissionDeniedActivity.this.isFinishing()) {
                PermissionDeniedActivity.this.finish();
            }
        }
    }

    /* access modifiers changed from: private */
    public static void enterGalleryAppSetting(Context context) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(Uri.fromParts("package", context.getPackageName(), null));
        context.startActivity(intent);
    }

    /* access modifiers changed from: private */
    public boolean isShowWhenLocked() {
        return getIntent().getBooleanExtra("StartActivityWhenLocked", false);
    }

    private AlertDialog showDialog() {
        PackageManager packageManager = getPackageManager();
        String[] strArr = new String[this.mUnGrantedPermissions.size()];
        int i = 0;
        while (i < this.mUnGrantedPermissions.size()) {
            String str = (String) this.mUnGrantedPermissions.get(i);
            try {
                CharSequence loadLabel = packageManager.getPermissionInfo((String) this.mUnGrantedPermissions.get(i), 128).loadLabel(packageManager);
                if (loadLabel != null) {
                    str = loadLabel.toString();
                }
            } catch (NameNotFoundException unused) {
                Log.w("PermissionDeniedActivity", "Get permission info failed, %s", str);
            } finally {
                strArr[i] = String.format(getString(R.string.grant_permission_item), new Object[]{str});
            }
            i++;
        }
        return new Builder(this).setCancelable(false).setMessage(String.format(getString(R.string.grant_permission_text), new Object[]{TextUtils.join("\n", strArr)})).setTitle(getString(R.string.grant_permission_title)).setPositiveButton(isShowWhenLocked() ? R.string.grant_permission_unlock_and_set : R.string.grant_permission_go_and_set, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (PermissionDeniedActivity.this.isShowWhenLocked()) {
                    PermissionDeniedActivity.this.getWindow().addFlags(nexEngine.ExportHEVCMainTierLevel61);
                }
                PermissionDeniedActivity.enterGalleryAppSetting(PermissionDeniedActivity.this);
                PermissionDeniedActivity.this.finish();
            }
        }).setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                PermissionDeniedActivity.this.finish();
            }
        }).show();
    }

    public static void startActivity(Activity activity, List<String> list, boolean z) {
        if (activity != null && list != null && list.size() > 0) {
            Intent intent = new Intent(activity, PermissionDeniedActivity.class);
            intent.putStringArrayListExtra("permissions", new ArrayList(list));
            intent.putExtra("StartActivityWhenLocked", z);
            activity.startActivity(intent);
            activity.overridePendingTransition(0, 0);
        }
    }

    public void finish() {
        if (this.mInfoDialog != null) {
            this.mInfoDialog.dismiss();
            this.mInfoDialog = null;
        }
        if (this.mScreenReceiver != null) {
            unregisterReceiver(this.mScreenReceiver);
            this.mScreenReceiver = null;
        }
        super.finish();
        overridePendingTransition(0, 0);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.permission_denied_activity);
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        BaseSamplingStatHelper.recordPageEnd(this, "permission_denied");
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        BaseSamplingStatHelper.recordPageStart(this, "permission_denied");
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        if (isShowWhenLocked()) {
            getWindow().addFlags(nexEngine.ExportHEVCHighTierLevel52);
        }
        this.mUnGrantedPermissions = getIntent().getStringArrayListExtra("permissions");
        if (this.mUnGrantedPermissions == null || this.mUnGrantedPermissions.size() <= 0) {
            finish();
            return;
        }
        if (this.mInfoDialog == null) {
            this.mInfoDialog = showDialog();
        }
        if (this.mScreenReceiver == null) {
            this.mScreenReceiver = new ScreenBroadcastReceiver();
            registerReceiver(this.mScreenReceiver, new IntentFilter("android.intent.action.SCREEN_OFF"));
        }
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
        finish();
    }
}
