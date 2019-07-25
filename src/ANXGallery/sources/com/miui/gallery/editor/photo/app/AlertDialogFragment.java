package com.miui.gallery.editor.photo.app;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import com.miui.gallery.widget.GalleryDialogFragment;

public class AlertDialogFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public Callbacks mCallbacks;
    private OnClickListener mOnClickListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            if (dialogInterface != AlertDialogFragment.this.getDialog()) {
                throw new IllegalStateException("click event is not from current fragment, maybe listener not detached");
            } else if (AlertDialogFragment.this.mCallbacks != null) {
                AlertDialogFragment.this.mCallbacks.onClick(AlertDialogFragment.this, i);
            }
        }
    };

    public static class Builder {
        private boolean mCancellable;
        private int mMessageId;
        private int mNegativeId;
        private int mPositiveId;

        public AlertDialogFragment build() {
            Bundle bundle = new Bundle();
            if (this.mMessageId != 0) {
                bundle.putInt("AlertDialogFragment:message_resource", this.mMessageId);
            }
            if (this.mPositiveId != 0) {
                bundle.putInt("AlertDialogFragment:positive_resource", this.mPositiveId);
            }
            if (this.mNegativeId != 0) {
                bundle.putInt("AlertDialogFragment:negative_resource", this.mNegativeId);
            }
            AlertDialogFragment alertDialogFragment = new AlertDialogFragment();
            alertDialogFragment.setCancelable(this.mCancellable);
            alertDialogFragment.setArguments(bundle);
            return alertDialogFragment;
        }

        public Builder setCancellable(boolean z) {
            this.mCancellable = z;
            return this;
        }

        public Builder setMessage(int i) {
            this.mMessageId = i;
            return this;
        }

        public Builder setNegativeButton(int i) {
            this.mNegativeId = i;
            return this;
        }

        public Builder setPositiveButton(int i) {
            this.mPositiveId = i;
            return this;
        }
    }

    public interface Callbacks {
        void onCancel(AlertDialogFragment alertDialogFragment);

        void onClick(AlertDialogFragment alertDialogFragment, int i);

        void onDismiss(AlertDialogFragment alertDialogFragment);
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        if (this.mCallbacks != null) {
            this.mCallbacks.onCancel(this);
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        Bundle arguments = getArguments();
        int i = arguments.getInt("AlertDialogFragment:message_resource");
        if (i != 0) {
            builder.setMessage(i);
        }
        int i2 = arguments.getInt("AlertDialogFragment:negative_resource");
        if (i2 != 0) {
            builder.setNegativeButton(i2, this.mOnClickListener);
        }
        int i3 = arguments.getInt("AlertDialogFragment:positive_resource");
        if (i3 != 0) {
            builder.setPositiveButton(i3, this.mOnClickListener);
        }
        return builder.create();
    }

    public void onDetach() {
        super.onDetach();
        this.mCallbacks = null;
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (this.mCallbacks != null) {
            this.mCallbacks.onDismiss(this);
        }
    }

    public final void setCallbacks(Callbacks callbacks) {
        this.mCallbacks = callbacks;
    }
}
