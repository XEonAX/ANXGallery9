package com.miui.gallery.app;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.miui.gallery.view.ActionBarWrapper;
import com.miui.gallery.view.menu.MenuBuilder;
import com.miui.gallery.view.menu.MenuBuilder.Callback;
import com.miui.gallery.view.menu.MenuPresenter;
import com.miui.gallery.widget.BottomMenu;

public abstract class BottomMenuDelegateImpl implements Callback, MenuPresenter.Callback {
    private ActionBarWrapper mActionBarWrapper;
    final Activity mActivity;
    BottomMenu mBottomMenu;
    protected boolean mIsBottomMenuInstalled;
    protected MenuBuilder mMenu;
    private boolean mShowHideAnimationEnabled = true;

    BottomMenuDelegateImpl(Activity activity) {
        this.mActivity = activity;
    }

    /* access modifiers changed from: private */
    public void onHideActionBar() {
        if (this.mBottomMenu != null) {
            this.mBottomMenu.hide(this.mShowHideAnimationEnabled);
        }
    }

    /* access modifiers changed from: private */
    public void onSetShowHideAnimationEnabled(boolean z) {
        this.mShowHideAnimationEnabled = z;
    }

    /* access modifiers changed from: private */
    public void onShowActionBar() {
        if (this.mBottomMenu != null) {
            this.mBottomMenu.show(this.mShowHideAnimationEnabled);
        }
    }

    /* access modifiers changed from: protected */
    public MenuBuilder createMenu() {
        MenuBuilder menuBuilder = new MenuBuilder(getActionBarThemedContext());
        menuBuilder.setCallback(this);
        return menuBuilder;
    }

    /* access modifiers changed from: protected */
    public final Context getActionBarThemedContext() {
        Activity activity = this.mActivity;
        ActionBar actionBar = this.mActivity.getActionBar();
        return actionBar != null ? actionBar.getThemedContext() : activity;
    }

    public int getMenuCollapsedHeight() {
        if (this.mBottomMenu != null) {
            return this.mBottomMenu.getCollapsedHeight();
        }
        return -1;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        this.mActivity.closeOptionsMenu();
    }

    public void onCreate(Bundle bundle) {
    }

    public void onMenuModeChange(MenuBuilder menuBuilder) {
        reopenMenu(menuBuilder, true);
    }

    public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
        return false;
    }

    /* access modifiers changed from: protected */
    public void reopenMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.mBottomMenu == null || !this.mBottomMenu.isOverflowReserved()) {
            menuBuilder.close();
            return;
        }
        if (this.mBottomMenu.isOverflowMenuShowing() && z) {
            this.mBottomMenu.hideOverflowMenu();
        } else if (this.mBottomMenu.getVisibility() == 0) {
            this.mBottomMenu.showOverflowMenu();
        }
    }

    public void setCustomView(View view) {
        if (this.mBottomMenu != null) {
            this.mBottomMenu.setCustomView(view);
        }
    }

    /* access modifiers changed from: protected */
    public void setMenu(MenuBuilder menuBuilder) {
        if (menuBuilder != this.mMenu) {
            this.mMenu = menuBuilder;
            if (this.mIsBottomMenuInstalled && this.mBottomMenu != null) {
                this.mBottomMenu.setMenu(menuBuilder, this);
            }
        }
    }

    public void setVisible(boolean z) {
        if (this.mBottomMenu == null) {
            return;
        }
        if (z) {
            this.mBottomMenu.show(false);
        } else {
            this.mBottomMenu.hide(false);
        }
    }

    /* access modifiers changed from: protected */
    public miui.app.ActionBar wrapActionBar(miui.app.ActionBar actionBar) {
        if (actionBar == null) {
            return null;
        }
        if (this.mActionBarWrapper == null || this.mActionBarWrapper.getWrapped() != actionBar) {
            this.mActionBarWrapper = new ActionBarWrapper(actionBar) {
                public void hide() {
                    super.hide();
                    BottomMenuDelegateImpl.this.onHideActionBar();
                }

                public void setShowHideAnimationEnabled(boolean z) {
                    super.setShowHideAnimationEnabled(z);
                    BottomMenuDelegateImpl.this.onSetShowHideAnimationEnabled(z);
                }

                public void show() {
                    super.show();
                    BottomMenuDelegateImpl.this.onShowActionBar();
                }
            };
        }
        return this.mActionBarWrapper;
    }
}
