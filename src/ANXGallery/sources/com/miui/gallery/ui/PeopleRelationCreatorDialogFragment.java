package com.miui.gallery.ui;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import com.miui.gallery.R;
import com.miui.gallery.model.PeopleContactInfo.UserDefineRelation;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.util.ArrayList;
import java.util.Iterator;

public class PeopleRelationCreatorDialogFragment extends GalleryDialogFragment {
    private static final String[] INVALID_NAMES = {"自己", "孩子", "家人", "同事", "同学", "家人", "朋友", "未分组", "自定义", "Me", "Child", "Family", "Collegues", "Classmates", "Friends", "Ungrouped", "Custom"};
    /* access modifiers changed from: private */
    public Button mConfirmButton;
    /* access modifiers changed from: private */
    public OnClickListener mConfirmListener = new OnClickListener() {
        public void onClick(View view) {
            String obj = PeopleRelationCreatorDialogFragment.this.mInputView.getText().toString();
            if (PeopleRelationCreatorDialogFragment.this.verify(obj)) {
                PeopleRelationCreatorDialogFragment.this.mDialog.dismiss();
                UserDefineRelation.addRelation(obj);
                if (PeopleRelationCreatorDialogFragment.this.mOnCreatedListener != null) {
                    PeopleRelationCreatorDialogFragment.this.mOnCreatedListener.onRelationCreated(obj);
                }
            }
        }
    };
    private String mDefaultName;
    /* access modifiers changed from: private */
    public AlertDialog mDialog;
    /* access modifiers changed from: private */
    public EditText mInputView;
    /* access modifiers changed from: private */
    public OnRelationCreatedListener mOnCreatedListener;

    public interface OnRelationCreatedListener {
        void onRelationCreated(String str);
    }

    private void selectAll() {
        this.mInputView.setText(this.mInputView.getText());
        this.mInputView.selectAll();
    }

    /* access modifiers changed from: private */
    public boolean verify(String str) {
        if (TextUtils.isEmpty(str.trim())) {
            ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.empty_relation));
            this.mInputView.setText(this.mDefaultName);
            this.mInputView.selectAll();
            return false;
        } else if ("._".indexOf(str.charAt(0)) >= 0) {
            ToastUtils.makeText((Context) getActivity(), (int) R.string.new_relation_invalid_prefix);
            return false;
        } else {
            for (int i = 0; i < str.length(); i++) {
                char charAt = str.charAt(i);
                if ("/\\:@*?<>\r\n\t".indexOf(charAt) >= 0) {
                    if ("\r\n\t".indexOf(charAt) >= 0) {
                        charAt = ' ';
                    }
                    ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.new_relation_invalid_char, new Object[]{Character.valueOf(charAt)}));
                    return false;
                }
            }
            for (String equals : INVALID_NAMES) {
                if (TextUtils.equals(equals, str)) {
                    ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.new_relation_invalid_name, new Object[]{str}));
                    selectAll();
                    return false;
                }
            }
            ArrayList userDefineRelations = UserDefineRelation.getUserDefineRelations();
            if (MiscUtil.isValid(userDefineRelations)) {
                Iterator it = userDefineRelations.iterator();
                while (it.hasNext()) {
                    if (TextUtils.equals((String) it.next(), str)) {
                        ToastUtils.makeText((Context) getActivity(), (CharSequence) getString(R.string.new_relation_invalid_name, new Object[]{str}));
                        selectAll();
                        return false;
                    }
                }
            }
            return true;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mInputView = (EditText) LayoutInflater.from(getActivity()).inflate(R.layout.edit_text_dialog, null, false);
        this.mInputView.setHint(R.string.input_relation_name);
        this.mDefaultName = getString(R.string.default_relation_name);
        this.mInputView.setText(this.mDefaultName);
        this.mInputView.selectAll();
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mDialog = new Builder(getActivity()).setView(this.mInputView).setTitle(R.string.default_relation_name).setPositiveButton(17039370, null).setNegativeButton(17039360, null).create();
        this.mDialog.getWindow().setSoftInputMode(4);
        this.mDialog.setOnShowListener(new OnShowListener() {
            public void onShow(DialogInterface dialogInterface) {
                PeopleRelationCreatorDialogFragment.this.mConfirmButton = PeopleRelationCreatorDialogFragment.this.mDialog.getButton(-1);
                PeopleRelationCreatorDialogFragment.this.mConfirmButton.setOnClickListener(PeopleRelationCreatorDialogFragment.this.mConfirmListener);
            }
        });
        return this.mDialog;
    }

    public void setOnCreatedListener(OnRelationCreatedListener onRelationCreatedListener) {
        this.mOnCreatedListener = onRelationCreatedListener;
    }
}
