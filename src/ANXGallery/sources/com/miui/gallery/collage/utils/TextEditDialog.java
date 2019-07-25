package com.miui.gallery.collage.utils;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import com.miui.gallery.widget.GalleryDialogFragment;

public class TextEditDialog extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public FrameLayout mContainerView;
    /* access modifiers changed from: private */
    public EditText mEditText;
    /* access modifiers changed from: private */
    public int mMax = -1;
    /* access modifiers changed from: private */
    public int mScreenHeight = 0;
    /* access modifiers changed from: private */
    public TextWatcher mTextWatcher;
    private View mWholeView;
    /* access modifiers changed from: private */
    public String mWillEditText;
    /* access modifiers changed from: private */
    public boolean mWillSelection = false;

    private class LayoutListener implements OnGlobalLayoutListener {
        int mHeight;
        Rect mRect;

        private LayoutListener() {
            this.mHeight = 0;
            this.mRect = new Rect();
        }

        public void onGlobalLayout() {
            int access$800 = TextEditDialog.getHeightDifference(TextEditDialog.this.mContainerView, TextEditDialog.this.mScreenHeight, this.mRect);
            Log.d("TextEditDialog", "widgetHeight : %d", (Object) Integer.valueOf(access$800));
            if (access$800 > 0) {
                this.mHeight = access$800;
                TextEditDialog.this.setBottomMargin(this.mHeight);
            } else if (this.mHeight > 0) {
                TextEditDialog.this.dismissSafely();
            }
        }
    }

    /* access modifiers changed from: private */
    public static int getHeightDifference(View view, int i, Rect rect) {
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        int height = (i - iArr[1]) - view.getHeight();
        view.getWindowVisibleDisplayFrame(rect);
        return (i - (rect.bottom - rect.top)) - height;
    }

    /* access modifiers changed from: private */
    public void setBottomMargin(int i) {
        if (this.mContainerView.getPaddingBottom() != i) {
            this.mContainerView.setPadding(0, 0, 0, i);
        }
    }

    public boolean isShowing() {
        Dialog dialog = getDialog();
        return dialog != null && dialog.isShowing();
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Dialog dialog = getDialog();
        if (dialog != null) {
            Window window = dialog.getWindow();
            if (window != null) {
                window.setSoftInputMode(5);
                this.mEditText.requestFocus();
            }
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = new Dialog(getActivity(), 2131820547);
        dialog.setOnShowListener(new OnShowListener() {
            public void onShow(DialogInterface dialogInterface) {
                if (TextEditDialog.this.mWillEditText != null) {
                    TextEditDialog.this.mEditText.setText(TextEditDialog.this.mWillEditText);
                    if (TextEditDialog.this.mWillSelection) {
                        TextEditDialog.this.mEditText.setSelection(0, TextEditDialog.this.mWillEditText.length());
                    } else {
                        TextEditDialog.this.mEditText.setSelection(TextEditDialog.this.mWillEditText.length());
                    }
                }
                if (TextEditDialog.this.mTextWatcher != null) {
                    TextEditDialog.this.mEditText.addTextChangedListener(TextEditDialog.this.mTextWatcher);
                }
                if (TextEditDialog.this.mMax > 0) {
                    TextEditDialog.this.mEditText.setFilters(new InputFilter[]{new LengthFilter(TextEditDialog.this.mMax)});
                }
            }
        });
        Window window = dialog.getWindow();
        if (window != null) {
            window.requestFeature(1);
            Point point = new Point();
            window.getWindowManager().getDefaultDisplay().getSize(point);
            this.mScreenHeight = point.y;
            window.getAttributes().windowAnimations = 2131820547;
        }
        return dialog;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContainerView = new FrameLayout(getActivity());
        this.mContainerView.setLayoutParams(new LayoutParams(-1, -2));
        this.mContainerView.getViewTreeObserver().addOnGlobalLayoutListener(new LayoutListener());
        this.mWholeView = layoutInflater.inflate(R.layout.text_append_edit_text, this.mContainerView);
        this.mEditText = (EditText) this.mWholeView.findViewById(R.id.text_append_edit_text);
        this.mWholeView.findViewById(R.id.text_append_edit_text_delete).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                TextEditDialog.this.mEditText.setText("");
            }
        });
        this.mWholeView.findViewById(R.id.text_append_edit_text_submit).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                TextEditDialog.this.dismissSafely();
            }
        });
        this.mEditText.setFocusable(true);
        this.mEditText.setFocusableInTouchMode(true);
        return this.mContainerView;
    }

    public void onPause() {
        dismissSafely();
        super.onPause();
    }

    public void onStart() {
        super.onStart();
        Window window = getDialog().getWindow();
        if (window != null) {
            window.setGravity(80);
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.width = -1;
            attributes.height = -2;
            attributes.dimAmount = 0.0f;
            window.setAttributes(attributes);
            window.setBackgroundDrawable(new ColorDrawable(0));
        }
        Window window2 = getActivity().getWindow();
        if (window2 != null) {
            window2.setSoftInputMode(48);
        }
    }

    public void setMaxEditLength(int i) {
        this.mMax = i;
    }

    public void setTextWatch(TextWatcher textWatcher) {
        this.mTextWatcher = textWatcher;
    }

    public void setWillEditText(String str, boolean z) {
        this.mWillEditText = str;
        this.mWillSelection = z;
    }
}
