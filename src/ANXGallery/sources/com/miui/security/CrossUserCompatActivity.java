package com.miui.security;

import android.app.Fragment;
import android.content.ContentResolver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.miui.core.SdkHelper;
import com.miui.internal.CrossUserHelper;
import miui.app.Activity;

public class CrossUserCompatActivity extends Activity {
    private volatile ContentResolver mCrossUserContentResolver;
    private volatile ContextWrapper mCrossUserContextWrapper;
    private final Object mLockObject = new Object();

    class CrossUserContextWrapper extends ContextWrapper {
        Context mBase;
        int mCrossUserId;

        public CrossUserContextWrapper(Context context, int i) {
            super(context);
            this.mBase = context;
            this.mCrossUserId = i;
        }

        public ContentResolver getContentResolver() {
            return CrossUserHelper.getContentResolver(this.mBase, this.mCrossUserId);
        }
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.miui.security.CrossUserCompatActivity] */
    private boolean validateCallingPackage() {
        return getPackageName().equals(getCallingPackage()) || CrossUserHelper.checkUidPermission(this, getCallingPackage());
    }

    private int validateCrossUser() {
        if (getIntent() == null) {
            return -1;
        }
        int intExtra = getIntent().getIntExtra("android.intent.extra.picked_user_id", -1);
        if (validateCallingPackage()) {
            return intExtra;
        }
        return -1;
    }

    public Context getApplicationContext() {
        if (isCrossUserPick()) {
            if (this.mCrossUserContextWrapper == null) {
                synchronized (this.mLockObject) {
                    if (this.mCrossUserContextWrapper == null) {
                        this.mCrossUserContextWrapper = new CrossUserContextWrapper(CrossUserCompatActivity.super.getApplicationContext(), validateCrossUser());
                    }
                }
            }
            Log.d("CrossUserPickerActivity", "getApplicationContext: WrapperedApplication");
            return this.mCrossUserContextWrapper;
        }
        Log.d("CrossUserPickerActivity", "getApplicationContext: NormalApplication");
        return CrossUserCompatActivity.super.getApplicationContext();
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.miui.security.CrossUserCompatActivity, miui.app.Activity] */
    public ContentResolver getContentResolver() {
        if (isCrossUserPick()) {
            if (this.mCrossUserContentResolver == null) {
                synchronized (this.mLockObject) {
                    if (this.mCrossUserContentResolver == null) {
                        this.mCrossUserContentResolver = CrossUserHelper.getContentResolver(this, validateCrossUser());
                    }
                }
            }
            Log.d("CrossUserPickerActivity", "getContentResolver: CrossUserContentResolver");
            return this.mCrossUserContentResolver;
        }
        Log.d("CrossUserPickerActivity", "getContentResolver: NormalContentResolver");
        return CrossUserCompatActivity.super.getContentResolver();
    }

    public boolean isCrossUserPick() {
        return SdkHelper.IS_MIUI && CrossUserHelper.support() && validateCrossUser() != -1;
    }

    public void startActivity(Intent intent) {
        if (isCrossUserPick()) {
            intent.putExtra("android.intent.extra.picked_user_id", validateCrossUser());
        }
        CrossUserCompatActivity.super.startActivity(intent);
    }

    public void startActivity(Intent intent, Bundle bundle) {
        if (isCrossUserPick()) {
            intent.putExtra("android.intent.extra.picked_user_id", validateCrossUser());
        }
        CrossUserCompatActivity.super.startActivity(intent, bundle);
    }

    public void startActivityForResult(Intent intent, int i) {
        if (isCrossUserPick()) {
            intent.putExtra("android.intent.extra.picked_user_id", validateCrossUser());
        }
        CrossUserCompatActivity.super.startActivityForResult(intent, i);
    }

    public void startActivityForResult(Intent intent, int i, Bundle bundle) {
        if (isCrossUserPick()) {
            intent.putExtra("android.intent.extra.picked_user_id", validateCrossUser());
        }
        CrossUserCompatActivity.super.startActivityForResult(intent, i, bundle);
    }

    public void startActivityFromFragment(Fragment fragment, Intent intent, int i, Bundle bundle) {
        if (isCrossUserPick()) {
            intent.putExtra("android.intent.extra.picked_user_id", validateCrossUser());
        }
        CrossUserCompatActivity.super.startActivityFromFragment(fragment, intent, i, bundle);
    }
}
