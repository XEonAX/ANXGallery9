package com.miui.gallery.widget.menu;

import android.content.Context;
import java.util.ArrayList;

public class ImmersionMenu {
    private Context mContext;
    private ArrayList<ImmersionMenuItem> mItems = new ArrayList<>();

    public ImmersionMenu(Context context) {
        this.mContext = context;
    }

    public ImmersionMenuItem add(int i, CharSequence charSequence) {
        return add(i, charSequence, -1);
    }

    public ImmersionMenuItem add(int i, CharSequence charSequence, int i2) {
        ImmersionMenuItem immersionMenuItem = new ImmersionMenuItem(this.mContext, i, charSequence);
        if (i2 < 0 || i2 > this.mItems.size()) {
            this.mItems.add(immersionMenuItem);
        } else {
            this.mItems.add(i2, immersionMenuItem);
        }
        return immersionMenuItem;
    }

    public ImmersionMenuItem findItem(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            ImmersionMenuItem immersionMenuItem = (ImmersionMenuItem) this.mItems.get(i2);
            if (immersionMenuItem.getItemId() == i) {
                return immersionMenuItem;
            }
            if (immersionMenuItem.hasSubMenu()) {
                ImmersionMenuItem findItem = immersionMenuItem.getSubMenu().findItem(i);
                if (findItem != null) {
                    return findItem;
                }
            }
        }
        return null;
    }

    public ImmersionMenuItem getItem(int i) {
        return (ImmersionMenuItem) this.mItems.get(i);
    }

    public int size() {
        return this.mItems.size();
    }
}
