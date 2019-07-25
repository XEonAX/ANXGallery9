package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class CopyOrMoveDialog extends GalleryDialogFragment {
    private AlertDialog mDialog;
    private OnClickListener mItemClickListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            if (i <= 2 && CopyOrMoveDialog.this.mOnOperationSelectedListener != null) {
                Log.d("CopyOrMoveDialog", "Creation select : %d", (Object) Integer.valueOf(i));
                CopyOrMoveDialog.this.mOnOperationSelectedListener.onOperationSelected(i);
            }
        }
    };
    /* access modifiers changed from: private */
    public OnOperationSelectedListener mOnOperationSelectedListener;

    public interface OnOperationSelectedListener {
        void onOperationSelected(int i);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Builder builder = new Builder(getActivity());
        builder.setTitle(R.string.select_image_operation).setItems(R.array.menu_copy_or_move, this.mItemClickListener);
        this.mDialog = builder.create();
        this.mDialog.setCanceledOnTouchOutside(false);
        return this.mDialog;
    }

    public void setOnOperationSelectedListener(OnOperationSelectedListener onOperationSelectedListener) {
        this.mOnOperationSelectedListener = onOperationSelectedListener;
    }
}
