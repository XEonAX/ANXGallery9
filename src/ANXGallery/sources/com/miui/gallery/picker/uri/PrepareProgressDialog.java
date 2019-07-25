package com.miui.gallery.picker.uri;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.widget.GalleryDialogFragment;

public class PrepareProgressDialog extends GalleryDialogFragment {
    private OnCancelListener mCancelListener;
    private int mMax;
    private int mProgress;
    private int mStage;

    public int getDialogMessageId() {
        switch (this.mStage) {
            case 0:
                return R.string.picker_download_progress_message;
            case 1:
                return R.string.picker_origin_request_progress_message;
            default:
                return 0;
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        if (this.mCancelListener != null) {
            this.mCancelListener.onCancel(dialogInterface);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        ProgressDialog progressDialog = new ProgressDialog(getActivity());
        progressDialog.setIndeterminate(true);
        progressDialog.setCancelable(true);
        int dialogMessageId = getDialogMessageId();
        if (dialogMessageId != 0) {
            progressDialog.setMessage(getActivity().getString(dialogMessageId, new Object[]{Integer.valueOf(this.mProgress), Integer.valueOf(this.mMax)}));
        }
        return progressDialog;
    }

    public void setCancelListener(OnCancelListener onCancelListener) {
        this.mCancelListener = onCancelListener;
    }

    public void setDialogMessage() {
        int dialogMessageId = getDialogMessageId();
        if (dialogMessageId != 0) {
            ProgressDialog progressDialog = (ProgressDialog) getDialog();
            if (progressDialog != null && progressDialog.isShowing()) {
                progressDialog.setMessage(getActivity().getString(dialogMessageId, new Object[]{Integer.valueOf(this.mProgress), Integer.valueOf(this.mMax)}));
            }
        }
    }

    public void setMax(int i) {
        this.mMax = i;
        setDialogMessage();
    }

    public void setStage(int i) {
        this.mStage = i;
        setDialogMessage();
    }

    public void updateProgress(int i) {
        this.mProgress = i;
        setDialogMessage();
    }
}
