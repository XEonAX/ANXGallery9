package com.miui.gallery.view.menu;

import android.content.Context;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import com.miui.gallery.R;
import com.miui.gallery.view.menu.MenuPresenter.Callback;
import com.miui.gallery.view.menu.MenuView.ItemView;
import java.util.ArrayList;

public class ListMenuPresenter implements OnItemClickListener, MenuPresenter {
    MenuAdapter mAdapter;
    private Callback mCallback;
    Context mContext;
    LayoutInflater mInflater;
    /* access modifiers changed from: private */
    public int mItemIndexOffset;
    int mItemLayoutRes;
    MenuBuilder mMenu;
    int mMenuLayout;
    ExpandedMenuView mMenuView;
    int mThemeRes;

    private class MenuAdapter extends BaseAdapter {
        private int mExpandedIndex = -1;

        public MenuAdapter() {
            findExpandedIndex();
        }

        /* access modifiers changed from: 0000 */
        public void findExpandedIndex() {
            MenuItemImpl expandedItem = ListMenuPresenter.this.mMenu.getExpandedItem();
            if (expandedItem != null) {
                ArrayList nonActionItems = ListMenuPresenter.this.mMenu.getNonActionItems();
                int size = nonActionItems.size();
                for (int i = 0; i < size; i++) {
                    if (((MenuItemImpl) nonActionItems.get(i)) == expandedItem) {
                        this.mExpandedIndex = i;
                        return;
                    }
                }
            }
            this.mExpandedIndex = -1;
        }

        public int getCount() {
            int size = ListMenuPresenter.this.mMenu.getNonActionItems().size() - ListMenuPresenter.this.mItemIndexOffset;
            return this.mExpandedIndex < 0 ? size : size - 1;
        }

        public MenuItemImpl getItem(int i) {
            ArrayList nonActionItems = ListMenuPresenter.this.mMenu.getNonActionItems();
            int access$000 = i + ListMenuPresenter.this.mItemIndexOffset;
            if (this.mExpandedIndex >= 0 && access$000 >= this.mExpandedIndex) {
                access$000++;
            }
            return (MenuItemImpl) nonActionItems.get(access$000);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = ListMenuPresenter.this.mInflater.inflate(ListMenuPresenter.this.mItemLayoutRes, viewGroup, false);
            }
            ((ItemView) view).initialize(getItem(i), 0);
            return view;
        }

        public void notifyDataSetChanged() {
            findExpandedIndex();
            super.notifyDataSetChanged();
        }
    }

    public ListMenuPresenter(int i, int i2) {
        this((int) R.layout.expanded_menu_layout, i, i2);
    }

    public ListMenuPresenter(int i, int i2, int i3) {
        this.mItemLayoutRes = i2;
        this.mMenuLayout = i;
        this.mThemeRes = i3;
    }

    public ListMenuPresenter(Context context, int i, int i2) {
        this(i, i2, 0);
        this.mContext = context;
        this.mInflater = LayoutInflater.from(this.mContext);
    }

    public boolean collapseItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public boolean expandItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public boolean flagActionItems() {
        return false;
    }

    public ListAdapter getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new MenuAdapter();
        }
        return this.mAdapter;
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        if (this.mAdapter == null) {
            this.mAdapter = new MenuAdapter();
        }
        if (this.mAdapter.isEmpty()) {
            return null;
        }
        if (this.mMenuView == null) {
            this.mMenuView = (ExpandedMenuView) this.mInflater.inflate(this.mMenuLayout, viewGroup, false);
            this.mMenuView.setAdapter(this.mAdapter);
            this.mMenuView.setOnItemClickListener(this);
        }
        return this.mMenuView;
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        if (this.mThemeRes != 0) {
            this.mContext = new ContextThemeWrapper(context, this.mThemeRes);
            this.mInflater = LayoutInflater.from(this.mContext);
        } else if (this.mContext != null) {
            this.mContext = context;
            if (this.mInflater == null) {
                this.mInflater = LayoutInflater.from(this.mContext);
            }
        }
        if (this.mMenu != null) {
            this.mMenu.removeMenuPresenter(this);
        }
        this.mMenu = menuBuilder;
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.mCallback != null) {
            this.mCallback.onCloseMenu(menuBuilder, z);
        }
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        this.mMenu.performItemAction(this.mAdapter.getItem(i), 0);
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        if (!subMenuBuilder.hasVisibleItems()) {
            return false;
        }
        new MenuDialogHelper(subMenuBuilder).show(null);
        if (this.mCallback != null) {
            this.mCallback.onOpenSubMenu(subMenuBuilder);
        }
        return true;
    }

    public void setCallback(Callback callback) {
        this.mCallback = callback;
    }

    public void updateMenuView(boolean z) {
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
        }
    }
}
