package com.miui.gallery.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import com.miui.gallery.R;
import com.miui.gallery.preference.GalleryPreferences.SlideShow;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class SlideshowIntervalDialogFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public AlertDialog mDialog;
    /* access modifiers changed from: private */
    public CompleteListener mListener;

    public interface CompleteListener {
        void onComplete();
    }

    /* access modifiers changed from: private */
    public boolean isTextValid(CharSequence charSequence) {
        boolean z = false;
        if (TextUtils.isEmpty(charSequence)) {
            return false;
        }
        try {
            int parseInt = Integer.parseInt(charSequence.toString());
            if (parseInt >= 3 && parseInt <= 3600) {
                z = true;
            }
            return z;
        } catch (NumberFormatException unused) {
            return false;
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Activity activity = getActivity();
        final EditText editText = (EditText) LayoutInflater.from(activity).inflate(R.layout.edit_text_dialog, null, false);
        editText.setText(String.valueOf(SlideShow.getSlideShowInterval()));
        editText.selectAll();
        editText.setRawInputType(2);
        this.mDialog = new Builder(activity).setView(editText).setTitle(R.string.slideshow_interval_dialog_title).setPositiveButton(17039370, null).setNegativeButton(17039360, null).create();
        this.mDialog.getWindow().setSoftInputMode(4);
        this.mDialog.setOnShowListener(new OnShowListener() {
            public void onShow(DialogInterface dialogInterface) {
                SlideshowIntervalDialogFragment.this.mDialog.getButton(-1).setOnClickListener(new OnClickListener() {
                    public void onClick(View view) {
                        if (!SlideshowIntervalDialogFragment.this.isTextValid(editText.getText())) {
                            ToastUtils.makeText((Context) SlideshowIntervalDialogFragment.this.getActivity(), (int) R.string.slideshow_interval_invalid);
                            return;
                        }
                        SlideShow.setSlideShowInterval(Integer.parseInt(editText.getText().toString()));
                        if (SlideshowIntervalDialogFragment.this.mListener != null) {
                            SlideshowIntervalDialogFragment.this.mListener.onComplete();
                        }
                        SlideshowIntervalDialogFragment.this.mDialog.dismiss();
                    }
                });
            }
        });
        return this.mDialog;
    }

    public void setCompleteListener(CompleteListener completeListener) {
        this.mListener = completeListener;
    }
}
