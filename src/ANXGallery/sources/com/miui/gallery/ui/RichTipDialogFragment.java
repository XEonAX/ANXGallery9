package com.miui.gallery.ui;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.widget.GalleryDialogFragment;

public class RichTipDialogFragment extends GalleryDialogFragment {
    private View mContent;
    /* access modifiers changed from: private */
    public RichTipDialog mDialog;
    private CharSequence mPositiveButtonText;
    /* access modifiers changed from: private */
    public OnClickListener mPositiveClickListener;
    private CharSequence mSubTitle;
    private CharSequence mTitle;

    private static class RichTipDialog extends Dialog implements View.OnClickListener {
        private View mContent;
        private FrameLayout mContentContainer;
        private Button mPositiveBtn;
        private CharSequence mPositiveButtonText;
        private View.OnClickListener mPositiveClickListener;
        private TextView mSubTitle;
        private CharSequence mSubTitleText;
        private TextView mTitle;
        private CharSequence mTitleText;

        public RichTipDialog(Context context) {
            super(context);
        }

        private void initValue() {
            if (!TextUtils.isEmpty(this.mTitleText)) {
                setTitle(this.mTitleText);
            }
            if (!TextUtils.isEmpty(this.mSubTitleText)) {
                setSubTitle(this.mSubTitleText);
            }
            if (!TextUtils.isEmpty(this.mPositiveButtonText)) {
                setPositiveButton(this.mPositiveButtonText);
            }
            if (this.mContent != null) {
                setContentView(this.mContent);
            }
        }

        public void onClick(View view) {
            if (view.getId() == R.id.positive_btn && this.mPositiveClickListener != null) {
                this.mPositiveClickListener.onClick(view);
            }
        }

        /* access modifiers changed from: protected */
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            setContentView(R.layout.rich_tip_dialog);
            this.mTitle = (TextView) findViewById(R.id.title);
            this.mSubTitle = (TextView) findViewById(R.id.sub_title);
            this.mContentContainer = (FrameLayout) findViewById(R.id.content);
            this.mPositiveBtn = (Button) findViewById(R.id.positive_btn);
            this.mPositiveBtn.setOnClickListener(this);
            initValue();
            Window window = getWindow();
            LayoutParams attributes = window.getAttributes();
            attributes.gravity = 80;
            attributes.width = -1;
            attributes.height = -2;
            window.setAttributes(attributes);
        }

        public void setContentView(View view) {
            this.mContent = view;
            if (this.mContentContainer != null) {
                this.mContentContainer.removeAllViews();
                this.mContentContainer.addView(view);
            }
        }

        public void setPositiveButton(CharSequence charSequence) {
            this.mPositiveButtonText = charSequence;
            if (this.mPositiveBtn != null) {
                this.mPositiveBtn.setText(charSequence);
            }
        }

        public RichTipDialog setPositiveButtonOnClickListener(View.OnClickListener onClickListener) {
            this.mPositiveClickListener = onClickListener;
            return this;
        }

        public void setSubTitle(CharSequence charSequence) {
            this.mSubTitleText = charSequence;
            if (this.mSubTitle != null) {
                this.mSubTitle.setText(charSequence);
            }
        }

        public void setTitle(CharSequence charSequence) {
            this.mTitleText = charSequence;
            if (this.mTitle != null) {
                this.mTitle.setText(charSequence);
            }
        }
    }

    public final Dialog onCreateDialog(Bundle bundle) {
        RichTipDialog richTipDialog = new RichTipDialog(getActivity());
        richTipDialog.setTitle(this.mTitle);
        richTipDialog.setSubTitle(this.mSubTitle);
        richTipDialog.setContentView(this.mContent);
        richTipDialog.setPositiveButton(this.mPositiveButtonText);
        richTipDialog.setPositiveButtonOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (RichTipDialogFragment.this.mPositiveClickListener != null) {
                    RichTipDialogFragment.this.mPositiveClickListener.onClick(RichTipDialogFragment.this.mDialog, -1);
                }
                RichTipDialogFragment.this.dismissSafely();
            }
        });
        richTipDialog.setCancelable(true);
        richTipDialog.setCanceledOnTouchOutside(false);
        this.mDialog = richTipDialog;
        return richTipDialog;
    }

    public void setContentView(View view) {
        this.mContent = view;
        if (this.mDialog != null) {
            this.mDialog.setContentView(view);
        }
    }

    public void setPositiveButton(CharSequence charSequence) {
        this.mPositiveButtonText = charSequence;
        if (this.mDialog != null) {
            this.mDialog.setPositiveButton(charSequence);
        }
    }

    public void setSubTitle(CharSequence charSequence) {
        this.mSubTitle = charSequence;
        if (this.mDialog != null) {
            this.mDialog.setSubTitle(charSequence);
        }
    }

    public void setTitle(CharSequence charSequence) {
        this.mTitle = charSequence;
        if (this.mDialog != null) {
            this.mDialog.setTitle(charSequence);
        }
    }
}
