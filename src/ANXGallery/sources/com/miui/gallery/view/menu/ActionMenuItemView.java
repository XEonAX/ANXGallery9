package com.miui.gallery.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.view.menu.MenuBuilder.ItemInvoker;
import com.miui.gallery.view.menu.MenuView.ItemView;

public class ActionMenuItemView extends Button implements ItemView {
    private boolean mIsCheckable;
    private MenuItemImpl mItemData;
    private ItemInvoker mItemInvoker;
    private final boolean mWithText;

    public ActionMenuItemView(Context context) {
        this(context, null, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mWithText = getResources().getBoolean(R.bool.bottomMenu_config_withText);
    }

    private void tagById(int i) {
        setTag(Integer.valueOf(i));
    }

    public MenuItemImpl getItemData() {
        return this.mItemData;
    }

    public void initialize(MenuItemImpl menuItemImpl, int i) {
        this.mItemData = menuItemImpl;
        setSelected(false);
        setTitle(menuItemImpl.getTitle());
        setIcon(menuItemImpl.getIcon());
        setCheckable(menuItemImpl.isCheckable());
        setChecked(menuItemImpl.isChecked());
        setEnabled(menuItemImpl.isEnabled());
        setClickable(true);
        tagById(menuItemImpl.getItemId());
    }

    public boolean performClick() {
        if (super.performClick()) {
            return true;
        }
        if (this.mItemInvoker == null || !this.mItemInvoker.invokeItem(this.mItemData)) {
            return false;
        }
        playSoundEffect(0);
        return true;
    }

    public boolean prefersCondensedTitle() {
        return false;
    }

    public void setCheckable(boolean z) {
        this.mIsCheckable = z;
    }

    public void setChecked(boolean z) {
        if (this.mIsCheckable) {
            setSelected(z);
        }
    }

    public void setIcon(Drawable drawable) {
        if (getCompoundDrawables()[1] != drawable) {
            setCompoundDrawablesWithIntrinsicBounds(null, drawable, null, null);
        }
    }

    public void setItemInvoker(ItemInvoker itemInvoker) {
        this.mItemInvoker = itemInvoker;
    }

    public void setTitle(CharSequence charSequence) {
        setText(this.mWithText ? charSequence : null);
        setContentDescription(charSequence);
    }
}
