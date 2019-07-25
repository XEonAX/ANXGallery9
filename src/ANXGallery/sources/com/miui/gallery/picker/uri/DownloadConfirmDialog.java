package com.miui.gallery.picker.uri;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.widget.GalleryDialogFragment;

public class DownloadConfirmDialog extends GalleryDialogFragment {
    private OnClickListener mNegativeListener;
    private OnClickListener mPositiveListener;

    public Dialog onCreateDialog(Bundle bundle) {
        String str;
        String str2;
        String string;
        int i = getArguments().getInt("download_file_count");
        int i2 = getArguments().getInt("local_file_count");
        double d = (double) getArguments().getInt("download_file_size", 0);
        Double.isNaN(d);
        int ceil = (int) Math.ceil((d / 1024.0d) / 1024.0d);
        if (getArguments().getBoolean("retry_mode")) {
            if (NetworkUtils.isNetworkConnected()) {
                if (ceil != 0) {
                    str = getActivity().getResources().getQuantityString(R.plurals.picker_retry_origin_confirm_message, i, new Object[]{Integer.valueOf(i), Integer.valueOf(ceil)});
                } else {
                    str = getActivity().getResources().getQuantityString(R.plurals.picker_retry_image_confirm_message, i, new Object[]{Integer.valueOf(i)});
                }
            } else if (ceil != 0) {
                str = getActivity().getResources().getQuantityString(R.plurals.picker_no_network_retry_origin_confirm_message, i, new Object[]{Integer.valueOf(i), Integer.valueOf(ceil)});
            } else {
                str = getActivity().getResources().getQuantityString(R.plurals.picker_no_network_retry_image_confirm_message, i, new Object[]{Integer.valueOf(i)});
            }
            str2 = getActivity().getString(R.string.download_retry_text);
        } else {
            if (!NetworkUtils.isNetworkConnected()) {
                string = getActivity().getResources().getString(R.string.picker_no_network_message);
            } else if (i2 == 0) {
                if (ceil != 0) {
                    string = getActivity().getResources().getQuantityString(R.plurals.picker_all_origin_need_download, i, new Object[]{Integer.valueOf(ceil)});
                } else {
                    string = getActivity().getResources().getQuantityString(R.plurals.picker_all_image_need_download, i);
                }
            } else if (ceil != 0) {
                string = getActivity().getString(R.string.picker_origin_need_download, new Object[]{Integer.valueOf(i), Integer.valueOf(ceil)});
            } else {
                string = getActivity().getString(R.string.picker_image_need_download, new Object[]{Integer.valueOf(i)});
            }
            str2 = getActivity().getString(R.string.picker_download);
        }
        return new Builder(getActivity()).setTitle(R.string.title_tip).setMessage(str).setPositiveButton(str2, this.mPositiveListener).setNegativeButton(getActivity().getString(R.string.picker_cancel_download), this.mNegativeListener).setCancelable(true).create();
    }

    public void setNegativeListener(OnClickListener onClickListener) {
        this.mNegativeListener = onClickListener;
    }

    public void setPositiveListener(OnClickListener onClickListener) {
        this.mPositiveListener = onClickListener;
    }
}
