package com.miui.gallery.ui;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;

public class LoginAndSyncCheckFragment extends Fragment implements OnCancelListener {
    private boolean mCheckGallerySync;
    private int mCheckingType = 0;
    private Dialog mDialog;

    private void checkGallerySync() {
        this.mCheckingType = 3;
        showDialog(R.string.to_enable_sync_dialog_title, R.string.to_enable_gallery_sync_dialog_message, R.string.to_enable_sync_dialog_positive_button_text, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                IntentUtil.enterGallerySetting(LoginAndSyncCheckFragment.this.getActivity());
            }
        }, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                LoginAndSyncCheckFragment.this.setResult(0);
            }
        });
    }

    private void checkLogin() {
        IntentUtil.guideToLoginXiaomiAccount((Context) getActivity(), getArguments());
        this.mCheckingType = 1;
    }

    public static void checkLoginAndSyncState(Fragment fragment, Bundle bundle) {
        FragmentTransaction beginTransaction = fragment.getChildFragmentManager().beginTransaction();
        LoginAndSyncCheckFragment loginAndSyncCheckFragment = new LoginAndSyncCheckFragment();
        loginAndSyncCheckFragment.setArguments(bundle);
        beginTransaction.add(loginAndSyncCheckFragment, "LoginAndSyncCheckFragment");
        beginTransaction.commitAllowingStateLoss();
    }

    private void checkSystemSync() {
        this.mCheckingType = 2;
        showDialog(R.string.to_enable_sync_dialog_title, R.string.to_enable_sync_dialog_message, R.string.to_enable_sync_dialog_positive_button_text, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                LoginAndSyncCheckFragment.this.getActivity().startActivity(new Intent("com.xiaomi.action.MICLOUD_MAIN"));
            }
        }, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                ToastUtils.makeText((Context) LoginAndSyncCheckFragment.this.getActivity(), (int) R.string.sync_diabled_toast);
                LoginAndSyncCheckFragment.this.setResult(0);
            }
        });
    }

    private void doCheck() {
        if (!SyncUtil.existXiaomiAccount(getActivity())) {
            checkLogin();
        } else if (!ContentResolver.getMasterSyncAutomatically()) {
            checkSystemSync();
        } else if (!this.mCheckGallerySync || SyncUtil.isGalleryCloudSyncable(getActivity())) {
            setResult(-1);
        } else {
            checkGallerySync();
        }
    }

    /* access modifiers changed from: private */
    public void setResult(int i) {
        Fragment parentFragment = getParentFragment();
        if (parentFragment != null) {
            parentFragment.onActivityResult(29, i, getArguments() != null ? new Intent().putExtras(getArguments()) : null);
        }
        getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
    }

    private void showDialog(int i, int i2, int i3, OnClickListener onClickListener, OnClickListener onClickListener2) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.setOnCancelListener(null);
            this.mDialog.dismiss();
        }
        this.mDialog = new Builder(getActivity()).setTitle(i).setMessage(i2).setPositiveButton(i3, onClickListener).setNegativeButton(17039360, onClickListener2).create();
        this.mDialog.setOnCancelListener(this);
        this.mDialog.show();
    }

    public void onCancel(DialogInterface dialogInterface) {
        switch (this.mCheckingType) {
            case 2:
                ToastUtils.makeText((Context) getActivity(), (int) R.string.sync_diabled_toast);
                setResult(0);
                return;
            case 3:
                ToastUtils.makeText((Context) getActivity(), (int) R.string.gallery_sync_disable_toast);
                setResult(0);
                break;
        }
        setResult(0);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle arguments = getArguments();
        boolean z = false;
        this.mCheckingType = 0;
        if (arguments != null) {
            z = arguments.getBoolean("key_check_gallery_sync", false);
        }
        this.mCheckGallerySync = z;
        return new View(getActivity());
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.setOnCancelListener(null);
            this.mDialog.dismiss();
        }
        Log.i("LoginAndSyncCheckFragment", "onDestroy");
    }

    public void onStart() {
        super.onStart();
        switch (this.mCheckingType) {
            case 0:
                doCheck();
                break;
            case 1:
                if (SyncUtil.existXiaomiAccount(getActivity())) {
                    doCheck();
                    break;
                } else {
                    ToastUtils.makeText((Context) getActivity(), (int) R.string.xiaomi_account_not_exists_toast);
                    setResult(0);
                    break;
                }
            case 2:
                if (ContentResolver.getMasterSyncAutomatically()) {
                    doCheck();
                    break;
                } else {
                    ToastUtils.makeText((Context) getActivity(), (int) R.string.sync_diabled_toast);
                    setResult(0);
                    break;
                }
            case 3:
                if (SyncUtil.isGalleryCloudSyncable(getActivity())) {
                    doCheck();
                    break;
                } else {
                    ToastUtils.makeText((Context) getActivity(), (int) R.string.gallery_sync_disable_toast);
                    setResult(0);
                    break;
                }
            default:
                setResult(0);
                break;
        }
        Log.i("LoginAndSyncCheckFragment", "onStart isCheckPending %d", (Object) Integer.valueOf(this.mCheckingType));
    }
}
