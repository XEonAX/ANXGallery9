package com.miui.gallery.picker.uri;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.widget.GalleryDialogFragment;

public class DownloadCancelDialog extends GalleryDialogFragment {
    private OnClickListener mCancelListener;
    private OnClickListener mContinueListener;

    public Dialog onCreateDialog(Bundle bundle) {
        int i = getArguments().getInt("remaining_count");
        return new Builder(getActivity()).setMessage(getResources().getQuantityString(R.plurals.picker_cancel_confirm_message, i, new Object[]{Integer.valueOf(i)})).setPositiveButton(R.string.picker_continue_download, this.mContinueListener).setNegativeButton(R.string.picker_cancel_download, this.mCancelListener).setCancelable(false).create();
    }

    public void setCancelListener(OnClickListener onClickListener) {
        this.mCancelListener = onClickListener;
    }

    public void setContinueListener(OnClickListener onClickListener) {
        this.mContinueListener = onClickListener;
    }
}
