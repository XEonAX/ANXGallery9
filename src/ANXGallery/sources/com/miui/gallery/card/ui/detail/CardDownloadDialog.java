package com.miui.gallery.card.ui.detail;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.view.KeyEvent;
import com.miui.gallery.R;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.ProgressDialog;

public class CardDownloadDialog extends GalleryDialogFragment {
    private CallBack mCallBack;
    private long mLastBackPressedTime;
    private ProgressDialog mProgressDialog;

    public interface CallBack {
        void cancel();
    }

    /* access modifiers changed from: private */
    public boolean backPress() {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
            this.mLastBackPressedTime = currentTimeMillis;
            ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.story_back_stop_download));
        } else {
            if (this.mCallBack != null) {
                this.mCallBack.cancel();
            }
            dismissSafely();
        }
        return true;
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mProgressDialog = new ProgressDialog(getActivity());
        this.mProgressDialog.setMessage(getResources().getString(R.string.story_photo_downloading));
        this.mProgressDialog.setProgressStyle(1);
        this.mProgressDialog.setIndeterminate(false);
        this.mProgressDialog.setMax(100);
        this.mProgressDialog.setCanceledOnTouchOutside(false);
        this.mProgressDialog.setOnKeyListener(new OnKeyListener() {
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                if (i == 4 && keyEvent.getAction() == 0) {
                    return CardDownloadDialog.this.backPress();
                }
                return false;
            }
        });
        setCancelable(false);
        return this.mProgressDialog;
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mCallBack = null;
    }

    public void setCallBack(CallBack callBack) {
        this.mCallBack = callBack;
    }

    public void show(Activity activity) {
        showAllowingStateLoss(activity.getFragmentManager(), "CardDownloadDialog");
    }

    public void updateProgress(float f) {
        if (this.mProgressDialog != null) {
            this.mProgressDialog.setProgress((int) (f * 100.0f));
        }
    }
}
