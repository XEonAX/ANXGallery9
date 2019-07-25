package com.miui.gallery.editor.photo.core.imports.text.editdialog;

import android.animation.LayoutTransition;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.util.ArrayList;
import java.util.List;

public class TextEditDialog extends GalleryDialogFragment {
    private ConfigChangeListener mConfigChangeListener;
    /* access modifiers changed from: private */
    public FrameLayout mContainerView;
    /* access modifiers changed from: private */
    public Tab mCurrentTab = Tab.KEYBOARD;
    /* access modifiers changed from: private */
    public List<DialogSubMenu> mDialogSubMenuList = new ArrayList();
    /* access modifiers changed from: private */
    public EditText mEditText;
    private RelativeLayout mEditView;
    private DialogStatusData mInitializeData;
    /* access modifiers changed from: private */
    public int mKeyBoardHeight = 0;
    private OnClickListener mNavigationClickListener = new OnClickListener() {
        public void onClick(View view) {
            int ordinal = TextEditDialog.this.mCurrentTab.ordinal();
            for (int i = 0; i < TextEditDialog.this.mDialogSubMenuList.size(); i++) {
                DialogSubMenu dialogSubMenu = (DialogSubMenu) TextEditDialog.this.mDialogSubMenuList.get(i);
                if (view != dialogSubMenu.getNavigationButton()) {
                    dialogSubMenu.setChecked(false);
                } else if (ordinal != i) {
                    dialogSubMenu.setChecked(true);
                    if (i == 0) {
                        TextEditDialog.this.showKeyboard();
                    } else {
                        if (TextEditDialog.this.mCurrentTab == Tab.KEYBOARD) {
                            TextEditDialog.this.mCurrentTab = Tab.values()[i];
                            TextEditDialog.this.hideKeyboard();
                        }
                        ViewGroup subMenuView = dialogSubMenu.getSubMenuView();
                        TextEditDialog.this.mTabContainer.removeAllViews();
                        TextEditDialog.this.mTabContainer.addView(subMenuView, new LayoutParams(-1, -1));
                    }
                    TextEditDialog.this.mCurrentTab = Tab.values()[i];
                    Log.d("TextEditDialog", "current click index : %d", (Object) Integer.valueOf(i));
                }
            }
        }
    };
    private LinearLayout mNavigationContainer;
    /* access modifiers changed from: private */
    public int mScreenHeight = 0;
    private StatusListener mStatusListener;
    /* access modifiers changed from: private */
    public FrameLayout mTabContainer;
    private TextWatcher mTextWatcher;
    private ViewGroup mWholeView;
    private String mWillEditText;
    private boolean mWillSelection = false;

    public interface ConfigChangeListener {
        void onBoldChange(boolean z);

        void onColorChange(int i);

        void onShadowChange(boolean z);

        void onTextAlignChange(TextAlignment textAlignment);

        void onTransparentChange(int i);

        void onTypefaceChange(TextStyle textStyle);
    }

    private class LayoutListener implements OnGlobalLayoutListener {
        private Rect mRect;

        private LayoutListener() {
            this.mRect = new Rect();
        }

        public void onGlobalLayout() {
            Dialog dialog = TextEditDialog.this.getDialog();
            if (dialog != null && dialog.getWindow() != null) {
                int access$400 = TextEditDialog.getHeightDifference(TextEditDialog.this.mContainerView, TextEditDialog.this.mScreenHeight, this.mRect);
                Log.d("TextEditDialog", "heightDifference : %d:%d:%d", Integer.valueOf(access$400), Integer.valueOf(TextEditDialog.this.mKeyBoardHeight), Integer.valueOf(TextEditDialog.this.mScreenHeight));
                if (access$400 != 0) {
                    if (TextEditDialog.this.mKeyBoardHeight != access$400) {
                        TextEditDialog.this.mKeyBoardHeight = access$400;
                    }
                    TextEditDialog.this.mKeyBoardHeight = Math.max(TextEditDialog.this.mKeyBoardHeight, (int) ScreenUtils.dpToPixel(200.0f));
                    TextEditDialog.this.notifyKeyboardHeightChange();
                }
                TextEditDialog.this.notifyHeightChange(TextEditDialog.this.mKeyBoardHeight);
            }
        }
    }

    public interface StatusListener {
        void onBottomChange(int i);

        void onDismiss();

        void onShow();
    }

    public enum Tab {
        KEYBOARD,
        STYLE,
        FONT;

        public DialogSubMenu getSubMenu(Context context, ConfigChangeListener configChangeListener, ViewGroup viewGroup) {
            switch (this) {
                case KEYBOARD:
                    return new DialogKeyboardMenu(context);
                case STYLE:
                    return new DialogStyleMenu(context, viewGroup, configChangeListener);
                case FONT:
                    return new DialogFontMenu(context, viewGroup, configChangeListener);
                default:
                    return null;
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
    public void hideKeyboard() {
        if (isAdded()) {
            Log.d("TextEditDialog", "hideKeyboard");
            ((InputMethodManager) getActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.mEditText.getWindowToken(), 0);
        }
    }

    private void initView(LayoutInflater layoutInflater) {
        Tab[] values;
        this.mWholeView = (ViewGroup) layoutInflater.inflate(R.layout.text_edit_text_dialog, null);
        this.mNavigationContainer = (LinearLayout) this.mWholeView.findViewById(R.id.text_append_edit_text_tab_group);
        this.mTabContainer = (FrameLayout) this.mWholeView.findViewById(R.id.text_append_edit_text_tab_container);
        this.mEditView = (RelativeLayout) this.mWholeView.findViewById(R.id.text_append_edit_text_layout);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2);
        layoutParams.weight = 1.0f;
        for (Tab tab : Tab.values()) {
            DialogSubMenu subMenu = tab.getSubMenu(getActivity(), this.mConfigChangeListener, this.mTabContainer);
            if (tab.ordinal() == 0) {
                subMenu.setChecked(true);
            }
            View navigationButton = subMenu.getNavigationButton();
            navigationButton.setOnClickListener(this.mNavigationClickListener);
            this.mNavigationContainer.addView(navigationButton, layoutParams);
            this.mDialogSubMenuList.add(subMenu);
        }
        this.mEditText = (EditText) this.mWholeView.findViewById(R.id.text_append_edit_text);
        this.mWholeView.findViewById(R.id.text_append_edit_text_delete).setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                TextEditDialog.this.mEditText.setText("");
            }
        });
        this.mWholeView.findViewById(R.id.text_append_edit_text_submit).setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                TextEditDialog.this.dismissSafely();
            }
        });
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.enableTransitionType(4);
        this.mWholeView.setLayoutTransition(layoutTransition);
    }

    public static /* synthetic */ void lambda$onCreateDialog$49(TextEditDialog textEditDialog, DialogInterface dialogInterface) {
        Log.d("TextEditDialog", "onShow");
        textEditDialog.mEditText.setFocusable(true);
        textEditDialog.mEditText.setFocusableInTouchMode(true);
        textEditDialog.mEditText.requestFocus();
        if (textEditDialog.mCurrentTab == Tab.KEYBOARD) {
            textEditDialog.showKeyboard();
        }
        if (textEditDialog.mWillEditText != null) {
            textEditDialog.mEditText.setText(textEditDialog.mWillEditText);
            if (textEditDialog.mWillSelection) {
                textEditDialog.mEditText.setSelection(0, textEditDialog.mWillEditText.length());
            } else {
                textEditDialog.mEditText.setSelection(textEditDialog.mWillEditText.length());
            }
        }
        if (textEditDialog.mTextWatcher != null) {
            textEditDialog.mEditText.addTextChangedListener(textEditDialog.mTextWatcher);
        }
        textEditDialog.notifyShow();
        textEditDialog.notifyHeightChange(textEditDialog.mKeyBoardHeight);
    }

    private void notifyDismiss() {
        if (this.mStatusListener != null) {
            this.mStatusListener.onDismiss();
        }
    }

    /* access modifiers changed from: private */
    public void notifyHeightChange(int i) {
        if (this.mStatusListener != null) {
            int height = this.mNavigationContainer.getHeight() + ((LinearLayout.LayoutParams) this.mEditView.getLayoutParams()).topMargin + this.mEditView.getHeight();
            this.mScreenHeight = ScreenUtils.getScreenHeight();
            int i2 = (this.mScreenHeight - i) - height;
            Log.d("TextEditDialog", "navigation: %d height:%d,bottom:%d,%d", Integer.valueOf(height), Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(this.mScreenHeight));
            if (i == 0) {
                this.mStatusListener.onBottomChange(this.mScreenHeight);
                Log.d("TextEditDialog", "notifyHeightChange: %d", (Object) Integer.valueOf(this.mScreenHeight));
                return;
            }
            this.mStatusListener.onBottomChange(i2);
            Log.d("TextEditDialog", "notifyHeightChange: %d", (Object) Integer.valueOf(i2));
        }
    }

    /* access modifiers changed from: private */
    public void notifyKeyboardHeightChange() {
        if (this.mKeyBoardHeight != 0) {
            if (!(this.mTabContainer.getVisibility() == 0 && this.mTabContainer.getHeight() == this.mKeyBoardHeight)) {
                this.mTabContainer.setVisibility(0);
                this.mTabContainer.setLayoutParams(new LinearLayout.LayoutParams(-1, this.mKeyBoardHeight));
            }
        }
    }

    private void notifyShow() {
        if (this.mStatusListener != null) {
            this.mStatusListener.onShow();
        }
    }

    /* access modifiers changed from: private */
    public void showKeyboard() {
        this.mEditText.post(new Runnable() {
            public void run() {
                if (TextEditDialog.this.isAdded()) {
                    ((InputMethodManager) GalleryApp.sGetAndroidContext().getSystemService("input_method")).showSoftInput(TextEditDialog.this.mEditText, 1);
                }
            }
        });
    }

    public boolean isShowing() {
        Dialog dialog = getDialog();
        return dialog != null && dialog.isShowing();
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = new Dialog(getActivity(), 2131820721);
        dialog.setOnShowListener(new OnShowListener() {
            public final void onShow(DialogInterface dialogInterface) {
                TextEditDialog.lambda$onCreateDialog$49(TextEditDialog.this, dialogInterface);
            }
        });
        Window window = dialog.getWindow();
        if (window != null) {
            Point point = new Point();
            window.getWindowManager().getDefaultDisplay().getSize(point);
            this.mScreenHeight = point.y;
            window.getAttributes().windowAnimations = 2131820721;
        }
        return dialog;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mContainerView = new FrameLayout(getActivity());
        this.mContainerView.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        this.mContainerView.getViewTreeObserver().addOnGlobalLayoutListener(new LayoutListener());
        if (this.mWholeView == null) {
            initView(layoutInflater);
        }
        this.mContainerView.addView(this.mWholeView);
        return this.mContainerView;
    }

    public void onDestroyView() {
        for (DialogSubMenu dialogSubMenu : this.mDialogSubMenuList) {
            if (dialogSubMenu != null) {
                dialogSubMenu.release();
            }
        }
        this.mContainerView.removeAllViews();
        super.onDestroyView();
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        notifyHeightChange(0);
        notifyDismiss();
        if (this.mTextWatcher != null) {
            this.mEditText.removeTextChangedListener(this.mTextWatcher);
        }
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
        Log.d("TextEditDialog", "onStart");
        notifyKeyboardHeightChange();
        for (DialogSubMenu initializeData : this.mDialogSubMenuList) {
            initializeData.initializeData(this.mInitializeData);
        }
    }

    public void setConfigChangeListener(ConfigChangeListener configChangeListener) {
        this.mConfigChangeListener = configChangeListener;
    }

    public void setInitializeData(DialogStatusData dialogStatusData) {
        this.mInitializeData = dialogStatusData;
    }

    public void setStatusListener(StatusListener statusListener) {
        this.mStatusListener = statusListener;
    }

    public void setTextWatch(TextWatcher textWatcher) {
        this.mTextWatcher = textWatcher;
    }

    public void setWillEditText(String str, boolean z) {
        this.mWillEditText = str;
        this.mWillSelection = z;
    }
}
