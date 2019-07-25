package com.miui.gallery.view.menu;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.view.menu.MenuPresenter.Callback;
import com.miui.gallery.view.menu.MenuView.ItemView;
import java.util.Iterator;

public abstract class BaseMenuPresenter implements MenuPresenter {
    private Callback mCallback;
    protected Context mContext;
    private int mId;
    protected LayoutInflater mInflater;
    private int mItemLayoutRes;
    protected MenuBuilder mMenu;
    private int mMenuLayoutRes;
    protected MenuView mMenuView;
    protected Context mSystemContext;
    protected LayoutInflater mSystemInflater;

    public BaseMenuPresenter(Context context, int i, int i2) {
        this.mSystemContext = context;
        this.mSystemInflater = LayoutInflater.from(context);
        this.mMenuLayoutRes = i;
        this.mItemLayoutRes = i2;
    }

    /* access modifiers changed from: protected */
    public void addItemView(View view, int i) {
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        if (viewGroup != null) {
            viewGroup.removeView(view);
        }
        ((ViewGroup) this.mMenuView).addView(view, i);
    }

    public abstract void bindItemView(MenuItemImpl menuItemImpl, ItemView itemView);

    public boolean collapseItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public ItemView createItemView(ViewGroup viewGroup) {
        return (ItemView) this.mSystemInflater.inflate(this.mItemLayoutRes, viewGroup, false);
    }

    public boolean expandItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public boolean flagActionItems() {
        return false;
    }

    public View getItemView(MenuItemImpl menuItemImpl, View view, ViewGroup viewGroup) {
        ItemView createItemView = view instanceof ItemView ? (ItemView) view : createItemView(viewGroup);
        bindItemView(menuItemImpl, createItemView);
        return (View) createItemView;
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        if (this.mMenuView == null) {
            this.mMenuView = (MenuView) this.mSystemInflater.inflate(this.mMenuLayoutRes, viewGroup, false);
            this.mMenuView.initialize(this.mMenu);
            updateMenuView(true);
        }
        return this.mMenuView;
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        this.mContext = context;
        this.mInflater = LayoutInflater.from(this.mContext);
        this.mMenu = menuBuilder;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.mCallback != null) {
            this.mCallback.onCloseMenu(menuBuilder, z);
        }
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        return this.mCallback != null && this.mCallback.onOpenSubMenu(subMenuBuilder);
    }

    public void setCallback(Callback callback) {
        this.mCallback = callback;
    }

    public void setId(int i) {
        this.mId = i;
    }

    public boolean shouldIncludeItem(int i, MenuItemImpl menuItemImpl) {
        return true;
    }

    public void updateMenuView(boolean z) {
        ViewGroup viewGroup = (ViewGroup) this.mMenuView;
        if (viewGroup != null) {
            int hasBackgroundView = this.mMenuView.hasBackgroundView();
            if (this.mMenu != null) {
                this.mMenu.flagActionItems();
                Iterator it = this.mMenu.getVisibleItems().iterator();
                while (it.hasNext()) {
                    MenuItemImpl menuItemImpl = (MenuItemImpl) it.next();
                    if (shouldIncludeItem(hasBackgroundView, menuItemImpl)) {
                        View childAt = viewGroup.getChildAt(hasBackgroundView);
                        MenuItemImpl itemData = childAt instanceof ItemView ? ((ItemView) childAt).getItemData() : null;
                        View itemView = getItemView(menuItemImpl, childAt, viewGroup);
                        if (menuItemImpl != itemData) {
                            itemView.setPressed(false);
                        }
                        if (itemView != childAt) {
                            addItemView(itemView, hasBackgroundView);
                        }
                        hasBackgroundView++;
                    }
                }
            }
            while (hasBackgroundView < viewGroup.getChildCount()) {
                if (!this.mMenuView.filterLeftoverView(hasBackgroundView)) {
                    hasBackgroundView++;
                }
            }
        }
    }
}
