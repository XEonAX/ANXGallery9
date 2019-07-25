package com.miui.gallery.editor.photo.core.imports.text.editdialog;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.R;

abstract class DialogSubMenu<T, E> {
    protected T mListener;
    private View mNavigationButton;
    private int mNavigationDrawableRes;
    private int mNavigationStringRes;
    private TextView mRadioButton;
    private ViewGroup mSubMenuView;

    DialogSubMenu(Context context, ViewGroup viewGroup, int i, int i2) {
        this.mNavigationStringRes = i;
        this.mNavigationDrawableRes = i2;
        this.mNavigationButton = initNavigationRadioButton(context);
        this.mSubMenuView = initSubMenuView(context, viewGroup);
    }

    private View initNavigationRadioButton(Context context) {
        View inflate = LayoutInflater.from(context).inflate(R.layout.text_edit_dialog_navigation_button, null);
        this.mRadioButton = (TextView) inflate.findViewById(R.id.text_edit_dialog_navigation_button);
        this.mRadioButton.setCompoundDrawablesWithIntrinsicBounds(context.getResources().getDrawable(this.mNavigationDrawableRes), null, null, null);
        this.mRadioButton.setText(context.getString(this.mNavigationStringRes));
        return inflate;
    }

    /* access modifiers changed from: 0000 */
    public View getNavigationButton() {
        return this.mNavigationButton;
    }

    /* access modifiers changed from: 0000 */
    public ViewGroup getSubMenuView() {
        return this.mSubMenuView;
    }

    /* access modifiers changed from: 0000 */
    public abstract ViewGroup initSubMenuView(Context context, ViewGroup viewGroup);

    public abstract void initializeData(E e);

    public void release() {
    }

    public void setChecked(boolean z) {
        this.mRadioButton.setSelected(z);
    }
}
