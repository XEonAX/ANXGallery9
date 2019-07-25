package com.miui.gallery.widget.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.PopupWindow.OnDismissListener;
import com.miui.gallery.R;
import com.miui.gallery.widget.menu.ImmersionMenuAdapter.OnItemCheckChangeListener;
import miui.widget.ImmersionListPopupWindow;

public class PhoneImmersionMenu extends ImmersionListPopupWindow {
    /* access modifiers changed from: private */
    public ImmersionMenuAdapter mAdapter;
    /* access modifiers changed from: private */
    public ImmersionMenuListener mImmersionMenuListener;
    /* access modifiers changed from: private */
    public View mLastAnchor;
    /* access modifiers changed from: private */
    public ViewGroup mLastParent;
    /* access modifiers changed from: private */
    public ImmersionMenu mMenu;

    public PhoneImmersionMenu(Context context, ImmersionMenuListener immersionMenuListener) {
        super(context);
        this.mImmersionMenuListener = immersionMenuListener;
        if (immersionMenuListener != null) {
            this.mMenu = new ImmersionMenu(context);
            immersionMenuListener.onCreateImmersionMenu(this.mMenu);
        }
        this.mAdapter = new ImmersionMenuAdapter(context, this.mMenu);
        setAdapter(this.mAdapter);
        setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                ImmersionMenuItem item = PhoneImmersionMenu.this.mAdapter.getItem(i);
                if (item.isCheckable()) {
                    PhoneImmersionMenu.this.mAdapter.toggleCheckableItem(view);
                    return;
                }
                if (item.hasSubMenu()) {
                    final ImmersionSubMenu subMenu = item.getSubMenu();
                    PhoneImmersionMenu.this.setOnDismissListener(new OnDismissListener() {
                        public void onDismiss() {
                            PhoneImmersionMenu.this.setOnDismissListener(null);
                            PhoneImmersionMenu.this.update(subMenu);
                            PhoneImmersionMenu.this.fastShow(PhoneImmersionMenu.this.mLastAnchor, PhoneImmersionMenu.this.mLastParent);
                        }
                    });
                } else {
                    PhoneImmersionMenu.this.mImmersionMenuListener.onImmersionMenuSelected(PhoneImmersionMenu.this.mMenu, item);
                }
                if (!item.isRemainWhenClick()) {
                    PhoneImmersionMenu.this.dismiss(false);
                }
            }
        });
        this.mAdapter.setOnItemCheckChangeListener(new OnItemCheckChangeListener() {
            public void onItemCheckChanged(ImmersionMenuItem immersionMenuItem, boolean z) {
                PhoneImmersionMenu.this.mImmersionMenuListener.onImmersionMenuSelected(PhoneImmersionMenu.this.mMenu, immersionMenuItem);
            }
        });
    }

    /* access modifiers changed from: protected */
    public Drawable getBlurBackground(Context context, View view) {
        Drawable drawable = context.getResources().getDrawable(R.color.immersion_menu_popup_window_bg);
        return drawable != null ? drawable : PhoneImmersionMenu.super.getBlurBackground(context, view);
    }

    public ImmersionMenu getImmersionMenu() {
        return this.mMenu;
    }

    public void show(View view, ViewGroup viewGroup) {
        this.mLastAnchor = view;
        this.mLastParent = viewGroup;
        if (this.mImmersionMenuListener != null && this.mImmersionMenuListener.onPrepareImmersionMenu(this.mMenu)) {
            update(this.mMenu);
        }
        PhoneImmersionMenu.super.show(view, viewGroup);
    }

    public void update(ImmersionMenu immersionMenu) {
        this.mAdapter.update(immersionMenu);
    }
}
