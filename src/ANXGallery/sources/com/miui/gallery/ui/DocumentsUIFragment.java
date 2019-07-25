package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog.Builder;

public class DocumentsUIFragment extends GalleryDialogFragment {
    private int mLayoutId;
    private String mMessage;
    private OnClickListener mPositiveClickListener;
    private String mPositiveText;
    private String mTitle;

    public static DocumentsUIFragment newInstance(int i, int i2) {
        DocumentsUIFragment documentsUIFragment = new DocumentsUIFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("which_page", i);
        bundle.putInt("request_code", i2);
        documentsUIFragment.setArguments(bundle);
        return documentsUIFragment;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
        Bundle arguments = getArguments();
        int i = arguments.getInt("which_page");
        final int i2 = arguments.getInt("request_code");
        this.mTitle = getString(R.string.ext_sdcard_permission_request_title);
        this.mMessage = getString(R.string.ext_sdcard_guide_text);
        if (i != 2) {
            this.mLayoutId = R.layout.external_sdcard_documentsui_guide_page1;
            this.mPositiveText = getString(R.string.ext_sdcard_guide_first_page_button_text);
            this.mPositiveClickListener = new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    DocumentsUIFragment.newInstance(2, i2).showAllowingStateLoss(DocumentsUIFragment.this.getActivity().getFragmentManager(), "DocumentsUIFragment");
                    dialogInterface.dismiss();
                }
            };
            return;
        }
        this.mLayoutId = R.layout.external_sdcard_documentsui_guide_page2;
        this.mPositiveText = getString(R.string.ext_sdcard_guide_last_page_button_text);
        this.mPositiveClickListener = new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                DocumentsUIFragment.this.getActivity().startActivityForResult(new Intent("android.intent.action.OPEN_DOCUMENT_TREE"), i2);
            }
        };
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(this.mTitle).setMessage(this.mMessage).setView(this.mLayoutId).setPositiveButton(this.mPositiveText, this.mPositiveClickListener).create();
    }
}
