package com.miui.gallery.view.menu;

import android.content.Context;
import android.content.DialogInterface;
import android.util.SparseBooleanArray;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.Button;
import com.miui.gallery.R;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.view.ActionBarPolicy;
import com.miui.gallery.view.menu.MenuBuilder.ItemInvoker;
import com.miui.gallery.view.menu.MenuPresenter.Callback;
import com.miui.gallery.view.menu.MenuView.ItemView;
import java.util.ArrayList;

public class ActionMenuPresenter extends BaseMenuPresenter {
    private final SparseBooleanArray mActionButtonGroups = new SparseBooleanArray();
    /* access modifiers changed from: private */
    public ActionButtonSubMenu mActionButtonPopup;
    private int mActionItemWidthLimit;
    private boolean mExpandedActionViewsExclusive;
    /* access modifiers changed from: private */
    public int mListItemLayoutRes;
    /* access modifiers changed from: private */
    public int mListLayoutRes;
    private OverflowMenu mListOverflowMenu;
    private int mMaxItems;
    private boolean mMaxItemsSet;
    int mOpenSubMenuId;
    /* access modifiers changed from: private */
    public View mOverflowButton;
    /* access modifiers changed from: private */
    public OverflowMenu mOverflowMenu;
    /* access modifiers changed from: private */
    public int mOverflowMenuAttrs = 16843510;
    private MenuItemImpl mOverflowMenuItem;
    final PopupPresenterCallback mPopupPresenterCallback = new PopupPresenterCallback();
    /* access modifiers changed from: private */
    public OpenOverflowRunnable mPostedOpenRunnable;
    private boolean mReserveOverflow;
    private boolean mReserveOverflowSet;
    private View mScrapActionButtonView;
    private boolean mStrictWidthLimit;
    private int mWidthLimit;
    private boolean mWidthLimitSet;

    private class ActionButtonSubMenu extends MenuDialogHelper {
        public ActionButtonSubMenu(SubMenuBuilder subMenuBuilder) {
            super(subMenuBuilder);
            ActionMenuPresenter.this.setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
        }

        public void onDismiss(DialogInterface dialogInterface) {
            super.onDismiss(dialogInterface);
            ActionMenuPresenter.this.mActionButtonPopup = null;
            ActionMenuPresenter.this.mOpenSubMenuId = 0;
        }
    }

    private class ListOverflowMenu implements OverflowMenu {
        private ListMenuPresenter mListMenuPresenter;

        private ListOverflowMenu() {
        }

        private ListMenuPresenter getListMenuPresenter(MenuBuilder menuBuilder) {
            if (this.mListMenuPresenter == null) {
                this.mListMenuPresenter = new ListMenuPresenter(ActionMenuPresenter.this.mContext, ActionMenuPresenter.this.mListLayoutRes, ActionMenuPresenter.this.mListItemLayoutRes);
            }
            menuBuilder.addMenuPresenter(this.mListMenuPresenter);
            return this.mListMenuPresenter;
        }

        public void dismiss(boolean z) {
            ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).hideOverflowMenu();
        }

        public View getOverflowMenuView(MenuBuilder menuBuilder) {
            if (menuBuilder == null || menuBuilder.getNonActionItems().size() <= 0) {
                return null;
            }
            return (View) getListMenuPresenter(menuBuilder).getMenuView((ViewGroup) ActionMenuPresenter.this.mMenuView);
        }

        public boolean isShowing() {
            return ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).isOverflowMenuShowing();
        }

        public boolean tryShow() {
            return ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).showOverflowMenu();
        }

        public void update(MenuBuilder menuBuilder) {
            ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).setOverflowMenuView(getOverflowMenuView(menuBuilder));
        }
    }

    private class OpenOverflowRunnable implements Runnable {
        private OverflowMenu mPopup;

        public OpenOverflowRunnable(OverflowMenu overflowMenu) {
            this.mPopup = overflowMenu;
        }

        public void run() {
            ActionMenuPresenter.this.mMenu.changeMenuMode();
            View view = (View) ActionMenuPresenter.this.mMenuView;
            if (!(view == null || view.getWindowToken() == null || !this.mPopup.tryShow())) {
                ActionMenuPresenter.this.mOverflowMenu = this.mPopup;
            }
            ActionMenuPresenter.this.mPostedOpenRunnable = null;
        }
    }

    private interface OverflowMenu {
        void dismiss(boolean z);

        boolean isShowing();

        boolean tryShow();

        void update(MenuBuilder menuBuilder);
    }

    private class OverflowMenuButton extends Button {
        public OverflowMenuButton(Context context) {
            CharSequence charSequence = null;
            super(context, null, ActionMenuPresenter.this.mOverflowMenuAttrs);
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
            CharSequence title = ActionMenuPresenter.this.getOverflowMenuItem().getTitle();
            if (getResources().getBoolean(R.bool.bottomMenu_config_withText)) {
                charSequence = title;
            }
            setText(charSequence);
            setContentDescription(title);
        }

        private boolean isVisible() {
            View view = this;
            while (view != null && view.getVisibility() == 0) {
                ViewParent parent = view.getParent();
                view = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            }
            return view == null;
        }

        public boolean performClick() {
            if (super.performClick() || !isVisible()) {
                return true;
            }
            if (ActionMenuPresenter.this.mMenu != null) {
                ActionMenuPresenter.this.mMenu.dispatchMenuItemSelected(ActionMenuPresenter.this.mMenu.getRootMenu(), ActionMenuPresenter.this.getOverflowMenuItem());
            }
            playSoundEffect(0);
            if (isSelected()) {
                ActionMenuPresenter.this.hideOverflowMenu(true);
            } else {
                ActionMenuPresenter.this.showOverflowMenu();
            }
            return true;
        }
    }

    private class PopupOverflowMenu extends MenuPopupHelper implements OverflowMenu {
        public PopupOverflowMenu(Context context, MenuBuilder menuBuilder, View view, boolean z) {
            super(context, menuBuilder, view, z);
            setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
            setMenuItemLayout(R.layout.overflow_popup_menu_item_layout);
        }

        public void dismiss(boolean z) {
            super.dismiss(z);
            if (ActionMenuPresenter.this.mOverflowButton != null) {
                ActionMenuPresenter.this.mOverflowButton.setSelected(false);
            }
        }

        public void onDismiss() {
            super.onDismiss();
            ActionMenuPresenter.this.mMenu.close();
            ActionMenuPresenter.this.mOverflowMenu = null;
        }

        public void update(MenuBuilder menuBuilder) {
        }
    }

    private class PopupPresenterCallback implements Callback {
        private PopupPresenterCallback() {
        }

        public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
            if (menuBuilder instanceof SubMenuBuilder) {
                menuBuilder.getRootMenu().close(false);
            }
        }

        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            if (menuBuilder == null) {
                return false;
            }
            ActionMenuPresenter.this.mOpenSubMenuId = ((SubMenuBuilder) menuBuilder).getItem().getItemId();
            return false;
        }
    }

    public ActionMenuPresenter(Context context, int i, int i2, int i3, int i4) {
        super(context, i, i2);
        this.mListLayoutRes = i3;
        this.mListItemLayoutRes = i4;
    }

    private View findViewForItem(MenuItem menuItem) {
        ViewGroup viewGroup = (ViewGroup) this.mMenuView;
        if (viewGroup == null) {
            return null;
        }
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            if ((childAt instanceof ItemView) && ((ItemView) childAt).getItemData() == menuItem) {
                return childAt;
            }
        }
        return null;
    }

    private OverflowMenu getOverflowMenu() {
        if (BuildUtil.isTablet()) {
            PopupOverflowMenu popupOverflowMenu = new PopupOverflowMenu(this.mContext, this.mMenu, this.mOverflowButton, true);
            return popupOverflowMenu;
        }
        if (this.mListOverflowMenu == null) {
            this.mListOverflowMenu = new ListOverflowMenu();
        }
        return this.mListOverflowMenu;
    }

    /* access modifiers changed from: private */
    public MenuItemImpl getOverflowMenuItem() {
        if (this.mOverflowMenuItem == null) {
            MenuItemImpl menuItemImpl = new MenuItemImpl(this.mMenu, 0, R.id.more, 0, 0, this.mContext.getString(R.string.more), 0);
            this.mOverflowMenuItem = menuItemImpl;
        }
        return this.mOverflowMenuItem;
    }

    public void bindItemView(MenuItemImpl menuItemImpl, ItemView itemView) {
        itemView.initialize(menuItemImpl, 0);
        itemView.setItemInvoker((ItemInvoker) this.mMenuView);
    }

    /* access modifiers changed from: protected */
    public View createOverflowMenuButton(Context context) {
        return new OverflowMenuButton(context);
    }

    public boolean dismissPopupMenus(boolean z) {
        return hideOverflowMenu(z);
    }

    public boolean flagActionItems() {
        ArrayList visibleItems = this.mMenu.getVisibleItems();
        int size = visibleItems.size();
        int i = this.mMaxItems < size ? this.mMaxItems - 1 : this.mMaxItems;
        int i2 = 0;
        while (i2 < size && i > 0) {
            MenuItemImpl menuItemImpl = (MenuItemImpl) visibleItems.get(i2);
            boolean z = menuItemImpl.requestsActionButton() || menuItemImpl.requiresActionButton();
            menuItemImpl.setIsActionButton(z);
            if (z) {
                i--;
            }
            i2++;
        }
        while (i2 < size) {
            ((MenuItemImpl) visibleItems.get(i2)).setIsActionButton(false);
            i2++;
        }
        return true;
    }

    public View getItemView(MenuItemImpl menuItemImpl, View view, ViewGroup viewGroup) {
        View actionView = menuItemImpl.getActionView();
        if (actionView == null || menuItemImpl.hasCollapsibleActionView()) {
            if (!(view instanceof ActionMenuItemView)) {
                view = null;
            }
            actionView = super.getItemView(menuItemImpl, view, viewGroup);
        }
        actionView.setVisibility(menuItemImpl.isActionViewExpanded() ? 8 : 0);
        ActionMenuView actionMenuView = (ActionMenuView) viewGroup;
        LayoutParams layoutParams = actionView.getLayoutParams();
        if (!actionMenuView.checkLayoutParams(layoutParams)) {
            actionView.setLayoutParams(actionMenuView.generateLayoutParams(layoutParams));
        }
        return actionView;
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        MenuView menuView = super.getMenuView(viewGroup);
        ((ActionMenuView) menuView).setPresenter(this);
        return menuView;
    }

    public boolean hideOverflowMenu(boolean z) {
        if (this.mPostedOpenRunnable != null && this.mMenuView != null) {
            this.mOverflowButton.setSelected(false);
            ((View) this.mMenuView).removeCallbacks(this.mPostedOpenRunnable);
            this.mPostedOpenRunnable = null;
            return true;
        } else if (this.mOverflowMenu == null) {
            return false;
        } else {
            boolean isShowing = this.mOverflowMenu.isShowing();
            if (isShowing) {
                this.mOverflowButton.setSelected(false);
            }
            this.mOverflowMenu.dismiss(z);
            return isShowing;
        }
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        super.initForMenu(context, menuBuilder);
        context.getResources();
        ActionBarPolicy actionBarPolicy = ActionBarPolicy.get(context);
        if (!this.mReserveOverflowSet) {
            this.mReserveOverflow = actionBarPolicy.showsOverflowMenuButton();
        }
        if (!this.mWidthLimitSet) {
            this.mWidthLimit = actionBarPolicy.getEmbeddedMenuWidthLimit();
        }
        if (!this.mMaxItemsSet) {
            this.mMaxItems = actionBarPolicy.getMaxActionButtons();
        }
        int i = this.mWidthLimit;
        if (this.mReserveOverflow) {
            if (this.mOverflowButton == null) {
                this.mOverflowButton = createOverflowMenuButton(this.mSystemContext);
                int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
                this.mOverflowButton.measure(makeMeasureSpec, makeMeasureSpec);
            }
            i -= this.mOverflowButton.getMeasuredWidth();
        } else {
            this.mOverflowButton = null;
        }
        this.mActionItemWidthLimit = i;
        this.mScrapActionButtonView = null;
    }

    public boolean isOverflowMenuShowing() {
        return this.mOverflowMenu != null && this.mOverflowMenu.isShowing();
    }

    public boolean isOverflowReserved() {
        return this.mReserveOverflow;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        dismissPopupMenus(true);
        super.onCloseMenu(menuBuilder, z);
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        if (!subMenuBuilder.hasVisibleItems()) {
            return false;
        }
        SubMenuBuilder subMenuBuilder2 = subMenuBuilder;
        while (subMenuBuilder2.getParentMenu() != this.mMenu) {
            subMenuBuilder2 = (SubMenuBuilder) subMenuBuilder2.getParentMenu();
        }
        if (findViewForItem(subMenuBuilder2.getItem()) == null) {
            if (this.mOverflowButton == null) {
                return false;
            }
            View view = this.mOverflowButton;
        }
        this.mOpenSubMenuId = subMenuBuilder.getItem().getItemId();
        this.mActionButtonPopup = new ActionButtonSubMenu(subMenuBuilder);
        this.mActionButtonPopup.show(null);
        super.onSubMenuSelected(subMenuBuilder);
        return true;
    }

    public void setExpandedActionViewsExclusive(boolean z) {
        this.mExpandedActionViewsExclusive = z;
    }

    public void setWidthLimit(int i, boolean z) {
        this.mWidthLimit = i;
        this.mStrictWidthLimit = z;
        this.mWidthLimitSet = true;
    }

    public boolean shouldIncludeItem(int i, MenuItemImpl menuItemImpl) {
        return menuItemImpl.isActionButton();
    }

    public boolean showOverflowMenu() {
        if (!this.mReserveOverflow || isOverflowMenuShowing() || this.mMenu == null || this.mMenuView == null || this.mPostedOpenRunnable != null) {
            return false;
        }
        this.mPostedOpenRunnable = new OpenOverflowRunnable(getOverflowMenu());
        ((View) this.mMenuView).post(this.mPostedOpenRunnable);
        super.onSubMenuSelected(null);
        this.mOverflowButton.setSelected(true);
        return true;
    }

    public void updateMenuView(boolean z) {
        super.updateMenuView(z);
        if (this.mMenuView != null) {
            ArrayList nonActionItems = this.mMenu != null ? this.mMenu.getNonActionItems() : null;
            boolean z2 = false;
            if (this.mReserveOverflow && nonActionItems != null) {
                int size = nonActionItems.size();
                if (size == 1) {
                    z2 = !((MenuItemImpl) nonActionItems.get(0)).isActionViewExpanded();
                } else if (size > 0) {
                    z2 = true;
                }
            }
            if (z2) {
                if (this.mOverflowButton == null) {
                    this.mOverflowButton = createOverflowMenuButton(this.mSystemContext);
                } else {
                    this.mOverflowButton.setTranslationY(0.0f);
                }
                ViewGroup viewGroup = (ViewGroup) this.mOverflowButton.getParent();
                if (viewGroup != this.mMenuView) {
                    if (viewGroup != null) {
                        viewGroup.removeView(this.mOverflowButton);
                    }
                    ActionMenuView actionMenuView = (ActionMenuView) this.mMenuView;
                    actionMenuView.addView(this.mOverflowButton, actionMenuView.generateOverflowButtonLayoutParams());
                }
            } else if (this.mOverflowButton != null && this.mOverflowButton.getParent() == this.mMenuView) {
                ((ViewGroup) this.mMenuView).removeView(this.mOverflowButton);
            }
            ((ActionMenuView) this.mMenuView).setOverflowReserved(this.mReserveOverflow);
            if (!BuildUtil.isTablet()) {
                getOverflowMenu().update(this.mMenu);
            }
        }
    }
}
