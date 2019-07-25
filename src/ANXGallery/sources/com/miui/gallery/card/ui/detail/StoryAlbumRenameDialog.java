package com.miui.gallery.card.ui.detail;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import com.miui.gallery.R;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class StoryAlbumRenameDialog extends GalleryDialogFragment {
    protected Button mConfirmButton;
    /* access modifiers changed from: private */
    public final OnClickListener mConfirmListener = new OnClickListener() {
        public void onClick(View view) {
            String obj = StoryAlbumRenameDialog.this.mInputView.getText().toString();
            if (StoryAlbumRenameDialog.this.verify(obj)) {
                if (!TextUtils.equals(StoryAlbumRenameDialog.this.mDefaultName, obj)) {
                    StoryAlbumRenameDialog.this.mConfirmButton.setEnabled(true);
                    if (StoryAlbumRenameDialog.this.mOnRenameDoneListener != null) {
                        StoryAlbumRenameDialog.this.mOnRenameDoneListener.onOperationDone(obj);
                    }
                }
                StoryAlbumRenameDialog.this.mDialog.dismiss();
            }
        }
    };
    protected String mDefaultName;
    protected AlertDialog mDialog;
    protected EditText mInputView;
    protected OnRenameDoneListener mOnRenameDoneListener;
    private final TextWatcher mTextWatcher = new TextWatcher() {
        public void afterTextChanged(Editable editable) {
        }

        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            if (StoryAlbumRenameDialog.this.mConfirmButton != null) {
                StoryAlbumRenameDialog.this.mConfirmButton.setEnabled(!TextUtils.isEmpty(charSequence));
            }
        }
    };

    public interface OnRenameDoneListener {
        void onOperationDone(String str);
    }

    private void parseArguments() {
        this.mDefaultName = getArguments().getString("card_name");
    }

    /* access modifiers changed from: private */
    public boolean verify(String str) {
        if (TextUtils.isEmpty(str.trim())) {
            this.mInputView.selectAll();
            return false;
        } else if ("._".indexOf(str.charAt(0)) >= 0) {
            ToastUtils.makeText((Context) getActivity(), (int) R.string.story_rename_invalid_prefix);
            return false;
        } else {
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if ("/\\:@*?<>\r\n\t".indexOf(charAt) >= 0) {
                    if ("\r\n\t".indexOf(charAt) >= 0) {
                        charAt = ' ';
                    }
                    ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.story_rename_invalid_char, new Object[]{Character.valueOf(charAt)}));
                    return false;
                }
            }
            return true;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        parseArguments();
        this.mInputView = (EditText) LayoutInflater.from(getActivity()).inflate(R.layout.edit_text_dialog, null, false);
        this.mInputView.setHint(R.string.rename_dialog_hint);
        this.mInputView.setText(this.mDefaultName);
        this.mInputView.selectAll();
        this.mInputView.addTextChangedListener(this.mTextWatcher);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mDialog = new Builder(getActivity()).setView(this.mInputView).setTitle(R.string.rename_dialog_title).setPositiveButton(17039370, null).setNegativeButton(17039360, null).create();
        if (this.mDialog.getWindow() != null) {
            this.mDialog.getWindow().setSoftInputMode(4);
        }
        this.mDialog.setOnShowListener(new OnShowListener() {
            public void onShow(DialogInterface dialogInterface) {
                StoryAlbumRenameDialog.this.mConfirmButton = StoryAlbumRenameDialog.this.mDialog.getButton(-1);
                StoryAlbumRenameDialog.this.mConfirmButton.setEnabled(!TextUtils.isEmpty(StoryAlbumRenameDialog.this.mInputView.getText()));
                StoryAlbumRenameDialog.this.mConfirmButton.setOnClickListener(StoryAlbumRenameDialog.this.mConfirmListener);
            }
        });
        return this.mDialog;
    }

    public void setOnRenameDoneListener(OnRenameDoneListener onRenameDoneListener) {
        this.mOnRenameDoneListener = onRenameDoneListener;
    }
}
