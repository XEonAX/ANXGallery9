package com.miui.gallery.ui;

import android.annotation.TargetApi;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.os.Bundle;
import com.miui.gallery.widget.GalleryDialogFragment;

@TargetApi(11)
public class AlertDialogFragment extends GalleryDialogFragment {
    private OnCancelListener mCancelListener;
    private CharSequence mCheckBoxMessage;
    private OnDismissListener mDismissListener;
    private boolean mIsChecked;
    private CharSequence mMessage;
    private OnClickListener mNegativeButtonListener;
    private CharSequence mNegativeButtonText;
    private OnClickListener mPositiveButtonListener;
    private CharSequence mPositiveButtonText;
    private CharSequence mTitle;

    public static final class Builder {
        private OnCancelListener mCancelListener;
        private boolean mCancelable = true;
        private CharSequence mCheckBoxMessage;
        private OnDismissListener mDismissListener;
        private boolean mIsChecked;
        private CharSequence mMessage;
        private OnClickListener mNegativeButtonListener;
        private CharSequence mNegativeButtonText;
        private OnClickListener mPositiveButtonListener;
        private CharSequence mPositiveButtonText;
        private CharSequence mTitle;

        public AlertDialogFragment create() {
            AlertDialogFragment alertDialogFragment = new AlertDialogFragment();
            alertDialogFragment.setTitle(this.mTitle);
            alertDialogFragment.setMessage(this.mMessage);
            alertDialogFragment.setCheckBox(this.mIsChecked, this.mCheckBoxMessage);
            alertDialogFragment.setNegativeButton(this.mNegativeButtonText, this.mNegativeButtonListener);
            alertDialogFragment.setPositiveButton(this.mPositiveButtonText, this.mPositiveButtonListener);
            alertDialogFragment.setOnCancelListener(this.mCancelListener);
            alertDialogFragment.setOnDismissListener(this.mDismissListener);
            alertDialogFragment.setCancelable(this.mCancelable);
            return alertDialogFragment;
        }

        public Builder setCancelable(boolean z) {
            this.mCancelable = z;
            return this;
        }

        public Builder setMessage(CharSequence charSequence) {
            this.mMessage = charSequence;
            return this;
        }

        public Builder setNegativeButton(CharSequence charSequence, OnClickListener onClickListener) {
            this.mNegativeButtonText = charSequence;
            this.mNegativeButtonListener = onClickListener;
            return this;
        }

        public Builder setPositiveButton(CharSequence charSequence, OnClickListener onClickListener) {
            this.mPositiveButtonText = charSequence;
            this.mPositiveButtonListener = onClickListener;
            return this;
        }

        public Builder setTitle(CharSequence charSequence) {
            this.mTitle = charSequence;
            return this;
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        if (this.mCancelListener != null) {
            this.mCancelListener.onCancel(dialogInterface);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new miui.app.AlertDialog.Builder(getActivity()).setTitle(this.mTitle).setMessage(this.mMessage).setCheckBox(this.mIsChecked, this.mCheckBoxMessage).setPositiveButton(this.mPositiveButtonText, this.mPositiveButtonListener).setNegativeButton(this.mNegativeButtonText, this.mNegativeButtonListener).create();
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (this.mDismissListener != null) {
            this.mDismissListener.onDismiss(dialogInterface);
        }
    }

    /* access modifiers changed from: 0000 */
    public void setCheckBox(boolean z, CharSequence charSequence) {
        this.mIsChecked = z;
        this.mCheckBoxMessage = charSequence;
    }

    /* access modifiers changed from: 0000 */
    public void setMessage(CharSequence charSequence) {
        this.mMessage = charSequence;
    }

    /* access modifiers changed from: 0000 */
    public void setNegativeButton(CharSequence charSequence, OnClickListener onClickListener) {
        this.mNegativeButtonText = charSequence;
        this.mNegativeButtonListener = onClickListener;
    }

    /* access modifiers changed from: 0000 */
    public void setOnCancelListener(OnCancelListener onCancelListener) {
        this.mCancelListener = onCancelListener;
    }

    /* access modifiers changed from: 0000 */
    public void setOnDismissListener(OnDismissListener onDismissListener) {
        this.mDismissListener = onDismissListener;
    }

    /* access modifiers changed from: 0000 */
    public void setPositiveButton(CharSequence charSequence, OnClickListener onClickListener) {
        this.mPositiveButtonText = charSequence;
        this.mPositiveButtonListener = onClickListener;
    }

    /* access modifiers changed from: 0000 */
    public void setTitle(CharSequence charSequence) {
        this.mTitle = charSequence;
    }
}
