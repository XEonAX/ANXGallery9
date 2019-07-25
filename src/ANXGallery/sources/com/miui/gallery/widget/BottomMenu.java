package com.miui.gallery.widget;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.view.menu.ActionMenuPresenter;
import com.miui.gallery.view.menu.ActionMenuView;
import com.miui.gallery.view.menu.MenuBuilder;
import com.miui.gallery.view.menu.MenuPresenter.Callback;
import com.miui.gallery.view.menu.PhoneActionMenuView;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class BottomMenu extends FrameLayout {
    private ActionMenuPresenter mActionMenuPresenter;
    private Rect mBaseInnerInsets = new Rect();
    /* access modifiers changed from: private */
    public View mContentMask;
    private OnClickListener mContentMaskOnClickListener;
    private View mCustomView;
    private boolean mHiddenByApp;
    private Animator mMenuBarAnim;
    /* access modifiers changed from: private */
    public ActionMenuView mMenuView;
    private MenuBuilder mOptionsMenu;
    /* access modifiers changed from: private */
    public PhoneActionMenuView mSplitMenuView;

    public class ContentMaskAnimator implements AnimatorListener {
        private ObjectAnimator mHideAnimator;
        private OnClickListener mOnClickListener;
        private ObjectAnimator mShowAnimator;

        private ContentMaskAnimator(OnClickListener onClickListener) {
            this.mOnClickListener = onClickListener;
            this.mShowAnimator = ObjectAnimator.ofFloat(BottomMenu.this.mContentMask, "alpha", new float[]{0.0f, 1.0f});
            this.mShowAnimator.addListener(this);
            this.mHideAnimator = ObjectAnimator.ofFloat(BottomMenu.this.mContentMask, "alpha", new float[]{1.0f, 0.0f});
            this.mHideAnimator.addListener(this);
        }

        public Animator hide() {
            return this.mHideAnimator;
        }

        public void onAnimationCancel(Animator animator) {
            if (animator == this.mHideAnimator) {
                BottomMenu.this.mMenuView.bringToFront();
                BottomMenu.this.mContentMask.setOnClickListener(null);
            }
        }

        public void onAnimationEnd(Animator animator) {
            if (BottomMenu.this.mContentMask.getAlpha() == 0.0f) {
                BottomMenu.this.mMenuView.bringToFront();
                BottomMenu.this.mContentMask.setOnClickListener(null);
                BottomMenu.this.mContentMask.setVisibility(8);
            }
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
            if (animator == this.mShowAnimator) {
                BottomMenu.this.mContentMask.setVisibility(0);
                BottomMenu.this.mContentMask.bringToFront();
                BottomMenu.this.mMenuView.bringToFront();
                BottomMenu.this.mContentMask.setOnClickListener(this.mOnClickListener);
            }
        }

        public Animator show() {
            return this.mShowAnimator;
        }
    }

    public BottomMenu(Context context) {
        super(context);
    }

    public BottomMenu(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public BottomMenu(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private boolean applyInsets(View view, Rect rect, boolean z, boolean z2, boolean z3, boolean z4) {
        boolean z5;
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (!z || layoutParams.leftMargin == rect.left) {
            z5 = false;
        } else {
            layoutParams.leftMargin = rect.left;
            z5 = true;
        }
        if (z2 && layoutParams.topMargin != rect.top) {
            layoutParams.topMargin = rect.top;
            z5 = true;
        }
        if (z4 && layoutParams.rightMargin != rect.right) {
            layoutParams.rightMargin = rect.right;
            z5 = true;
        }
        if (!z3 || layoutParams.bottomMargin == rect.bottom) {
            return z5;
        }
        layoutParams.bottomMargin = rect.bottom;
        return true;
    }

    private void configPresenters(MenuBuilder menuBuilder) {
        if (menuBuilder != null) {
            menuBuilder.addMenuPresenter(this.mActionMenuPresenter);
        } else {
            this.mActionMenuPresenter.initForMenu(getContext(), null);
        }
        this.mActionMenuPresenter.updateMenuView(true);
    }

    private Animator getMenuBarAnimator(boolean z) {
        AnimatorSet animatorSet = new AnimatorSet();
        if (z) {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mMenuView, "TranslationY", new float[]{this.mMenuView.getTranslationY(), 0.0f}), ObjectAnimator.ofFloat(this.mMenuView, "Alpha", new float[]{this.mMenuView.getAlpha(), 1.0f})});
            animatorSet.setInterpolator(new CubicEaseOutInterpolator());
            animatorSet.setDuration((long) getContext().getResources().getInteger(R.integer.action_bar_appear_duration));
        } else {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mMenuView, "TranslationY", new float[]{this.mMenuView.getTranslationY(), (float) (getMenuBarHeight() + ViewCompat.getSystemWindowInsetBottom(this))}), ObjectAnimator.ofFloat(this.mMenuView, "Alpha", new float[]{this.mMenuView.getAlpha(), 0.0f})});
            animatorSet.setInterpolator(new CubicEaseInInterpolator());
            animatorSet.setDuration((long) getContext().getResources().getInteger(R.integer.action_bar_disappear_duration));
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    BottomMenu.this.mMenuView.setVisibility(8);
                }
            });
        }
        return animatorSet;
    }

    private int getMenuBarHeight() {
        int height = this.mMenuView.getHeight();
        if (!(this.mMenuView instanceof PhoneActionMenuView)) {
            return height;
        }
        PhoneActionMenuView phoneActionMenuView = (PhoneActionMenuView) this.mMenuView;
        return !phoneActionMenuView.isOverflowMenuShowing() ? phoneActionMenuView.getCollapsedHeight() : height;
    }

    private boolean isBackPressed(KeyEvent keyEvent) {
        return keyEvent.getKeyCode() == 4 && keyEvent.getAction() == 1;
    }

    private void pullChildren() {
        if (this.mContentMask == null) {
            this.mContentMask = findViewById(R.id.content_mask);
            if (BuildUtil.isOledDisplay() && this.mContentMask != null) {
                this.mContentMask.setBackground(getContext().getResources().getDrawable(R.drawable.window_content_mask_oled));
            }
        }
    }

    private void updateContentMaskVisibility(boolean z) {
        if (this.mMenuView instanceof PhoneActionMenuView) {
            this.mSplitMenuView = (PhoneActionMenuView) this.mMenuView;
            if (this.mSplitMenuView.isOverflowMenuShowing() && this.mContentMask != null) {
                if (z) {
                    getContentMaskAnimator(this.mContentMaskOnClickListener).show().start();
                } else {
                    getContentMaskAnimator(null).hide().start();
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public ActionMenuPresenter createActionMenuPresenter(Callback callback) {
        ActionMenuPresenter actionMenuPresenter = new ActionMenuPresenter(getContext(), BuildUtil.isTablet() ? R.layout.action_menu_layout_tablet : R.layout.action_menu_layout, R.layout.action_menu_item_layout, R.layout.action_bar_expanded_menu_layout, R.layout.action_bar_list_menu_item_layout);
        actionMenuPresenter.setCallback(callback);
        actionMenuPresenter.setId(R.id.action_menu_presenter);
        return actionMenuPresenter;
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (super.dispatchKeyEvent(keyEvent)) {
            return true;
        }
        boolean z = false;
        if (isBackPressed(keyEvent) && this.mActionMenuPresenter != null && this.mActionMenuPresenter.hideOverflowMenu(false)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public boolean fitSystemWindows(Rect rect) {
        boolean z;
        this.mBaseInnerInsets.set(ViewCompat.getSystemWindowInsets(this));
        if (this.mMenuView != null) {
            z = applyInsets(this.mMenuView, this.mBaseInnerInsets, true, false, false, true) | false;
        } else {
            z = false;
        }
        if (z) {
            requestLayout();
        }
        return false;
    }

    public int getAnimatedVisibility() {
        if (!this.mHiddenByApp) {
            return getVisibility();
        }
        return 8;
    }

    public int getCollapsedHeight() {
        if (this.mMenuView == null) {
            return -1;
        }
        int collapsedHeight = this.mMenuView.getCollapsedHeight();
        if (collapsedHeight <= 0) {
            collapsedHeight = -1;
        }
        return collapsedHeight;
    }

    public ContentMaskAnimator getContentMaskAnimator(OnClickListener onClickListener) {
        return new ContentMaskAnimator(onClickListener);
    }

    public void hide(boolean z) {
        if (!this.mHiddenByApp) {
            this.mHiddenByApp = true;
            if (this.mMenuView != null) {
                if (this.mMenuBarAnim != null) {
                    this.mMenuBarAnim.cancel();
                }
                if (z) {
                    this.mMenuBarAnim = getMenuBarAnimator(false);
                    this.mMenuBarAnim.start();
                } else {
                    this.mMenuView.setTranslationY((float) (getMenuBarHeight() + ViewCompat.getSystemWindowInsetBottom(this)));
                    this.mMenuView.setAlpha(0.0f);
                    this.mMenuView.setVisibility(8);
                }
                updateContentMaskVisibility(false);
            }
        }
    }

    public boolean hideOverflowMenu() {
        return this.mActionMenuPresenter != null && this.mActionMenuPresenter.hideOverflowMenu(false);
    }

    public boolean isOverflowMenuShowing() {
        return this.mActionMenuPresenter != null && this.mActionMenuPresenter.isOverflowMenuShowing();
    }

    public boolean isOverflowReserved() {
        return this.mActionMenuPresenter != null && this.mActionMenuPresenter.isOverflowReserved();
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        requestFitSystemWindows();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        pullChildren();
        this.mContentMaskOnClickListener = new OnClickListener() {
            public void onClick(View view) {
                if (BottomMenu.this.mSplitMenuView != null && BottomMenu.this.mSplitMenuView.isOverflowMenuShowing()) {
                    BottomMenu.this.mSplitMenuView.getPresenter().hideOverflowMenu(true);
                }
            }
        };
    }

    public void setCustomView(View view) {
        this.mCustomView = view;
        if (this.mMenuView != null) {
            this.mMenuView.setCustomView(view);
        }
    }

    public void setMenu(Menu menu, Callback callback) {
        if (menu != this.mOptionsMenu) {
            if (this.mOptionsMenu != null) {
                this.mOptionsMenu.removeMenuPresenter(this.mActionMenuPresenter);
            }
            MenuBuilder menuBuilder = (MenuBuilder) menu;
            this.mOptionsMenu = menuBuilder;
            if (this.mMenuView != null) {
                ViewGroup viewGroup = (ViewGroup) this.mMenuView.getParent();
                if (viewGroup != null) {
                    viewGroup.removeView(this.mMenuView);
                }
            }
            if (this.mActionMenuPresenter == null) {
                this.mActionMenuPresenter = createActionMenuPresenter(callback);
            }
            this.mActionMenuPresenter.setExpandedActionViewsExclusive(false);
            this.mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
            LayoutParams layoutParams = new LayoutParams(-1, -2);
            layoutParams.gravity = 80;
            configPresenters(menuBuilder);
            ActionMenuView actionMenuView = (ActionMenuView) this.mActionMenuPresenter.getMenuView(this);
            ViewGroup viewGroup2 = (ViewGroup) actionMenuView.getParent();
            if (!(viewGroup2 == null || viewGroup2 == this)) {
                viewGroup2.removeView(actionMenuView);
            }
            int animatedVisibility = getAnimatedVisibility();
            actionMenuView.setVisibility(animatedVisibility);
            addView(actionMenuView, layoutParams);
            View findViewById = actionMenuView.findViewById(R.id.expanded_menu);
            if (findViewById != null) {
                findViewById.requestLayout();
            }
            if (animatedVisibility != 8) {
                requestFitSystemWindows();
            }
            actionMenuView.setCustomView(this.mCustomView);
            this.mMenuView = actionMenuView;
        }
    }

    public void show(boolean z) {
        if (this.mHiddenByApp) {
            this.mHiddenByApp = false;
            if (this.mMenuView == null) {
                Log.d("BottomMenu", "show: menuView is null");
                return;
            }
            if (this.mMenuBarAnim != null) {
                this.mMenuBarAnim.cancel();
            }
            this.mMenuView.setVisibility(0);
            if (z) {
                this.mMenuBarAnim = getMenuBarAnimator(true);
                this.mMenuBarAnim.start();
                if ((this.mMenuView instanceof PhoneActionMenuView) && (!((PhoneActionMenuView) this.mMenuView).isOverflowMenuShowing())) {
                    this.mMenuView.startLayoutAnimation();
                }
            } else {
                this.mMenuView.setTranslationY(0.0f);
                this.mMenuView.setAlpha(1.0f);
            }
            updateContentMaskVisibility(true);
        }
    }

    public boolean showOverflowMenu() {
        return this.mActionMenuPresenter != null && this.mActionMenuPresenter.showOverflowMenu();
    }
}
