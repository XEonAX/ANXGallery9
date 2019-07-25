package com.miui.gallery.view.menu;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.view.menu.ActionMenuView.LayoutParams;
import com.miui.gallery.widget.BottomMenu;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import miui.util.ViewUtils;
import miui.view.animation.CubicEaseOutInterpolator;

public class PhoneActionMenuView extends ActionMenuView {
    private static final int[] ATTRS = {16842964, R.attr.expandBackground, R.attr.splitActionBarDivider, R.attr.splitActionBarOverlayHeight};
    private int mAverageActionButtonWidth;
    private Rect mBackgroundPadding;
    /* access modifiers changed from: private */
    public View mBackgroundView;
    private Rect mBaseInnerInsets;
    /* access modifiers changed from: private */
    public Drawable mCollapseBackground;
    private View mCustomView;
    private Drawable mExpandBackground;
    private int mInsetBottom;
    private int mMaxActionButtonWidth;
    private int mMenuItemHeight;
    private int mMenuItemWidth;
    /* access modifiers changed from: private */
    public OverflowMenuState mOverflowMenuState;
    /* access modifiers changed from: private */
    public View mOverflowMenuView;
    private OverflowMenuViewAnimator mOverflowMenuViewAnimator;
    private Drawable mSplitActionBarDivider;
    private int mSplitActionBarOverlayHeight;
    private int mSplitBarDividerY;

    private enum OverflowMenuState {
        Collapsed,
        Expanding,
        Expanded,
        Collapsing
    }

    private class OverflowMenuViewAnimator implements AnimatorListener, OnClickListener {
        private BottomMenu mBottomMenu;
        private AnimatorSet mCollapseAnimator;
        private AnimatorSet mExpandAnimator;

        private OverflowMenuViewAnimator() {
        }

        private void setContentViewImportantForAccessibility(boolean z) {
        }

        public void ensureAnimators() {
            if (this.mExpandAnimator == null) {
                this.mBottomMenu = BottomMenuBarUtils.findBottomMenuBar(PhoneActionMenuView.this);
                AnimatorSet animatorSet = new AnimatorSet();
                animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(PhoneActionMenuView.this, "Value", new float[]{1.0f, 0.0f}), this.mBottomMenu.getContentMaskAnimator(this).show()});
                animatorSet.setDuration((long) PhoneActionMenuView.this.getResources().getInteger(17694720));
                animatorSet.setInterpolator(new CubicEaseOutInterpolator());
                animatorSet.addListener(this);
                this.mExpandAnimator = animatorSet;
                AnimatorSet animatorSet2 = new AnimatorSet();
                animatorSet2.playTogether(new Animator[]{ObjectAnimator.ofFloat(PhoneActionMenuView.this, "Value", new float[]{0.0f, 1.0f}), this.mBottomMenu.getContentMaskAnimator(null).hide()});
                animatorSet2.setDuration((long) PhoneActionMenuView.this.getResources().getInteger(17694720));
                animatorSet2.setInterpolator(new CubicEaseOutInterpolator());
                animatorSet2.addListener(this);
                this.mCollapseAnimator = animatorSet2;
            }
        }

        public void hide() {
            ensureAnimators();
            this.mCollapseAnimator.cancel();
            this.mExpandAnimator.cancel();
            this.mCollapseAnimator.start();
        }

        public void onAnimationCancel(Animator animator) {
            if (PhoneActionMenuView.this.mOverflowMenuState == OverflowMenuState.Expanding || PhoneActionMenuView.this.mOverflowMenuState == OverflowMenuState.Expanded) {
                PhoneActionMenuView.this.setValue(0.0f);
                setContentViewImportantForAccessibility(false);
            } else if (PhoneActionMenuView.this.mOverflowMenuState == OverflowMenuState.Collapsing || PhoneActionMenuView.this.mOverflowMenuState == OverflowMenuState.Collapsed) {
                PhoneActionMenuView.this.setValue(1.0f);
                setContentViewImportantForAccessibility(true);
            }
            PhoneActionMenuView.this.postInvalidateOnAnimation();
        }

        public void onAnimationEnd(Animator animator) {
            if (PhoneActionMenuView.this.mOverflowMenuView != null) {
                if (PhoneActionMenuView.this.mOverflowMenuView.getTranslationY() == 0.0f) {
                    PhoneActionMenuView.this.mOverflowMenuState = OverflowMenuState.Expanded;
                    setContentViewImportantForAccessibility(false);
                } else if (PhoneActionMenuView.this.mOverflowMenuView.getTranslationY() == ((float) PhoneActionMenuView.this.getMeasuredHeight())) {
                    PhoneActionMenuView.this.mOverflowMenuState = OverflowMenuState.Collapsed;
                    setContentViewImportantForAccessibility(true);
                    PhoneActionMenuView.this.mBackgroundView.setBackground(PhoneActionMenuView.this.mCollapseBackground);
                }
            }
            PhoneActionMenuView.this.postInvalidateOnAnimation();
        }

        public void onAnimationRepeat(Animator animator) {
        }

        public void onAnimationStart(Animator animator) {
        }

        public void onClick(View view) {
            if (PhoneActionMenuView.this.mOverflowMenuState == OverflowMenuState.Expanded) {
                PhoneActionMenuView.this.getPresenter().hideOverflowMenu(true);
            }
        }

        public void reverse() {
            if (VERSION.SDK_INT >= 26) {
                try {
                    Method declaredMethod = Class.forName("android.animation.AnimatorSet").getDeclaredMethod("reverse", new Class[0]);
                    if (this.mExpandAnimator.isRunning()) {
                        declaredMethod.invoke(this.mExpandAnimator, new Object[0]);
                    }
                    if (this.mCollapseAnimator.isRunning()) {
                        declaredMethod.invoke(this.mCollapseAnimator, new Object[0]);
                    }
                } catch (Exception e) {
                    Log.e("PhoneActionMenuView", "reverse: ", e);
                }
            } else {
                ArrayList arrayList = null;
                if (this.mExpandAnimator.isRunning()) {
                    arrayList = this.mExpandAnimator.getChildAnimations();
                }
                if (this.mCollapseAnimator.isRunning()) {
                    arrayList = this.mCollapseAnimator.getChildAnimations();
                }
                if (arrayList != null) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        ((ValueAnimator) ((Animator) it.next())).reverse();
                    }
                }
            }
        }

        public void show() {
            ensureAnimators();
            this.mCollapseAnimator.cancel();
            this.mExpandAnimator.cancel();
            this.mExpandAnimator.start();
        }
    }

    public PhoneActionMenuView(Context context) {
        this(context, null);
    }

    public PhoneActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mOverflowMenuState = OverflowMenuState.Collapsed;
        this.mMaxActionButtonWidth = 0;
        this.mAverageActionButtonWidth = 0;
        this.mSplitBarDividerY = -1;
        this.mBaseInnerInsets = new Rect();
        super.setBackground(null);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ATTRS);
        this.mCollapseBackground = obtainStyledAttributes.getDrawable(0);
        this.mExpandBackground = obtainStyledAttributes.getDrawable(1);
        this.mSplitActionBarDivider = obtainStyledAttributes.getDrawable(2);
        this.mSplitActionBarOverlayHeight = obtainStyledAttributes.getDimensionPixelSize(3, 0);
        obtainStyledAttributes.recycle();
        extractBackground();
        this.mBackgroundView = new View(context);
        addView(this.mBackgroundView);
        setChildrenDrawingOrderEnabled(true);
        this.mMaxActionButtonWidth = context.getResources().getDimensionPixelSize(R.dimen.action_button_max_width);
    }

    private void extractBackground() {
        if (this.mBackgroundPadding == null) {
            this.mBackgroundPadding = new Rect();
        }
        Drawable drawable = this.mOverflowMenuView == null ? this.mCollapseBackground : this.mExpandBackground;
        if (drawable == null) {
            this.mBackgroundPadding.setEmpty();
        } else {
            drawable.getPadding(this.mBackgroundPadding);
        }
    }

    private OverflowMenuViewAnimator getOverflowMenuViewAnimator() {
        if (this.mOverflowMenuViewAnimator == null) {
            this.mOverflowMenuViewAnimator = new OverflowMenuViewAnimator();
        }
        return this.mOverflowMenuViewAnimator;
    }

    private int getStatusBarHeight() {
        Resources resources = getResources();
        int identifier = resources.getIdentifier("status_bar_height", "dimen", "android");
        if (identifier > 0) {
            return resources.getDimensionPixelSize(identifier);
        }
        return 0;
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mSplitBarDividerY >= 0 && !isCustomViewShowing() && !isOverflowMenuShowing()) {
            canvas.save();
            canvas.translate(0.0f, (float) this.mSplitBarDividerY);
            this.mSplitActionBarDivider.draw(canvas);
            canvas.restore();
        }
    }

    public boolean filterLeftoverView(int i) {
        boolean z;
        View childAt = getChildAt(i);
        if (!(childAt == this.mOverflowMenuView || childAt == this.mBackgroundView || childAt == this.mCustomView)) {
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            if (layoutParams == null || !layoutParams.isOverflowButton) {
                z = true;
                return !z && super.filterLeftoverView(i);
            }
        }
        z = false;
        if (!z) {
        }
    }

    /* access modifiers changed from: protected */
    public boolean fitSystemWindows(Rect rect) {
        this.mBaseInnerInsets.set(ViewCompat.getSystemWindowInsets(this));
        int i = this.mBaseInnerInsets.bottom;
        if (this.mInsetBottom != i) {
            this.mInsetBottom = i;
            requestLayout();
        }
        return super.fitSystemWindows(rect);
    }

    /* access modifiers changed from: protected */
    public int getChildDrawingOrder(int i, int i2) {
        int indexOfChild = indexOfChild(this.mCustomView);
        int indexOfChild2 = indexOfChild(this.mOverflowMenuView);
        int indexOfChild3 = indexOfChild(this.mBackgroundView);
        if (i2 == 0) {
            if (indexOfChild != -1) {
                return indexOfChild;
            }
            if (indexOfChild2 != -1) {
                return indexOfChild2;
            }
            if (indexOfChild3 != -1) {
                return indexOfChild3;
            }
        } else if (i2 == 1) {
            if (indexOfChild != -1) {
                if (indexOfChild2 != -1) {
                    return indexOfChild2;
                }
                if (indexOfChild3 != -1) {
                    return indexOfChild3;
                }
            } else if (!(indexOfChild2 == -1 || indexOfChild3 == -1)) {
                return indexOfChild3;
            }
        } else if (!(i2 != 2 || indexOfChild == -1 || indexOfChild2 == -1 || indexOfChild3 == -1)) {
            return indexOfChild3;
        }
        int i3 = 0;
        while (i3 < i) {
            if (!(i3 == indexOfChild2 || i3 == indexOfChild3 || i3 == indexOfChild)) {
                int i4 = i3 < indexOfChild2 ? i3 + 1 : i3;
                if (i3 < indexOfChild3) {
                    i4++;
                }
                if (i3 < indexOfChild) {
                    i4++;
                }
                if (i4 == i2) {
                    return i3;
                }
            }
            i3++;
        }
        return super.getChildDrawingOrder(i, i2);
    }

    public int getCollapsedHeight() {
        if (this.mMenuItemHeight == 0) {
            return 0;
        }
        return (this.mMenuItemHeight + this.mBackgroundPadding.top) - this.mSplitActionBarOverlayHeight;
    }

    public boolean hasBackgroundView() {
        return getChildAt(0) == this.mBackgroundView;
    }

    public boolean hideOverflowMenu() {
        OverflowMenuState overflowMenuState = this.mOverflowMenuState;
        if (overflowMenuState == OverflowMenuState.Collapsing || overflowMenuState == OverflowMenuState.Collapsed) {
            return false;
        }
        OverflowMenuViewAnimator overflowMenuViewAnimator = getOverflowMenuViewAnimator();
        if (overflowMenuState == OverflowMenuState.Expanded) {
            this.mOverflowMenuState = OverflowMenuState.Collapsing;
            overflowMenuViewAnimator.hide();
        } else if (overflowMenuState == OverflowMenuState.Expanding) {
            overflowMenuViewAnimator.reverse();
        }
        return true;
    }

    public boolean isCustomViewShowing() {
        return this.mCustomView != null && this.mCustomView.getVisibility() == 0;
    }

    public boolean isOverflowMenuShowing() {
        return this.mOverflowMenuState == OverflowMenuState.Expanding || this.mOverflowMenuState == OverflowMenuState.Expanded;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9 = i3 - i;
        int i10 = i4 - i2;
        int measuredHeight = this.mCustomView != null ? this.mCustomView.getMeasuredHeight() : 0;
        int measuredHeight2 = this.mOverflowMenuView != null ? this.mOverflowMenuView.getMeasuredHeight() : 0;
        if (this.mCustomView != null) {
            i6 = measuredHeight > measuredHeight2 ? 0 : measuredHeight2 - measuredHeight;
            i5 = measuredHeight + i6;
            ViewUtils.layoutChildView(this, this.mCustomView, 0, i6, i9, i5);
        } else {
            i6 = 0;
            i5 = 0;
        }
        if (this.mOverflowMenuView != null) {
            i8 = measuredHeight > measuredHeight2 ? measuredHeight - measuredHeight2 : 0;
            i7 = measuredHeight2 + i8;
            ViewUtils.layoutChildView(this, this.mOverflowMenuView, 0, i8, i9, i7);
        } else {
            i8 = i6;
            i7 = i5;
        }
        if (!(this.mCustomView == null && this.mOverflowMenuView == null)) {
            i8 = i7 - this.mBackgroundPadding.top;
        }
        ViewUtils.layoutChildView(this, this.mBackgroundView, 0, i8, i9, i10);
        int i11 = i8 + this.mBackgroundPadding.top;
        int i12 = (i10 - this.mBackgroundPadding.bottom) - this.mInsetBottom;
        if (this.mSplitActionBarDivider != null) {
            this.mSplitBarDividerY = i11;
            this.mSplitActionBarDivider.setBounds(0, 0, i9, this.mSplitActionBarDivider.getIntrinsicHeight());
        } else {
            this.mSplitBarDividerY = -1;
        }
        int childCount = getChildCount();
        int i13 = 0;
        boolean z2 = false;
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = getChildAt(i14);
            if (!(childAt == this.mOverflowMenuView || childAt == this.mBackgroundView || childAt == this.mCustomView)) {
                if (childAt.getMeasuredWidth() >= this.mAverageActionButtonWidth) {
                    z2 = true;
                }
                i13++;
            }
        }
        int i15 = z2 ? (i9 - (this.mAverageActionButtonWidth * i13)) >> 1 : (i9 - this.mMenuItemWidth) >> 1;
        for (int i16 = 0; i16 < childCount; i16++) {
            View childAt2 = getChildAt(i16);
            if (!(childAt2 == this.mOverflowMenuView || childAt2 == this.mBackgroundView || childAt2 == this.mCustomView)) {
                int measuredWidth = childAt2.getMeasuredWidth();
                if (z2) {
                    int i17 = (this.mAverageActionButtonWidth - measuredWidth) >> 1;
                    int i18 = i15 + i17;
                    ViewUtils.layoutChildView(this, childAt2, i18, i11, i18 + measuredWidth, i12);
                    i15 = (i18 - i17) + this.mAverageActionButtonWidth;
                } else {
                    ViewUtils.layoutChildView(this, childAt2, i15, i11, i15 + measuredWidth, i12);
                    i15 += childAt2.getMeasuredWidth();
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int i3;
        int childCount = getChildCount();
        int childCount2 = getChildCount();
        if (indexOfChild(this.mOverflowMenuView) != -1) {
            childCount2--;
        }
        if (indexOfChild(this.mCustomView) != -1) {
            childCount2--;
        }
        if (indexOfChild(this.mBackgroundView) != -1) {
            childCount2--;
        }
        int i4 = 0;
        if (childCount == 0 || childCount2 == 0) {
            this.mMenuItemHeight = 0;
            setMeasuredDimension(0, 0);
            return;
        }
        this.mAverageActionButtonWidth = Math.min(MeasureSpec.getSize(i) / childCount2, this.mMaxActionButtonWidth);
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.mAverageActionButtonWidth, Integer.MIN_VALUE);
        int i5 = 0;
        int i6 = 0;
        for (int i7 = 0; i7 < childCount; i7++) {
            View childAt = getChildAt(i7);
            if (!(childAt == this.mOverflowMenuView || childAt == this.mBackgroundView || childAt == this.mCustomView)) {
                measureChildWithMargins(childAt, makeMeasureSpec, 0, i2, 0);
                i5 += childAt.getMeasuredWidth();
                i6 = Math.max(i6, childAt.getMeasuredHeight());
            }
        }
        this.mMenuItemWidth = i5;
        this.mMenuItemHeight = i6;
        if (this.mOverflowMenuView != null) {
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mOverflowMenuView.getLayoutParams();
            marginLayoutParams.topMargin = getStatusBarHeight();
            marginLayoutParams.bottomMargin = this.mMenuItemHeight;
            measureChildWithMargins(this.mOverflowMenuView, i, 0, i2, 0);
            i5 = Math.max(i5, this.mOverflowMenuView.getMeasuredWidth());
            i3 = this.mOverflowMenuView.getMeasuredHeight();
        } else {
            i3 = 0;
        }
        if (this.mCustomView != null) {
            MarginLayoutParams marginLayoutParams2 = (MarginLayoutParams) this.mCustomView.getLayoutParams();
            marginLayoutParams2.topMargin = getStatusBarHeight();
            marginLayoutParams2.bottomMargin = this.mMenuItemHeight;
            measureChildWithMargins(this.mCustomView, i, 0, i2, 0);
            i5 = Math.max(i5, this.mCustomView.getMeasuredWidth());
            i4 = this.mCustomView.getMeasuredHeight();
        }
        int max = i6 + Math.max(i3, i4);
        if (this.mOverflowMenuView != null) {
            if (this.mOverflowMenuState == OverflowMenuState.Expanded) {
                this.mOverflowMenuView.setTranslationY(0.0f);
            } else if (this.mOverflowMenuState == OverflowMenuState.Collapsed) {
                this.mOverflowMenuView.setTranslationY((float) max);
            }
        }
        if (this.mCustomView == null || this.mOverflowMenuView == null) {
            max += this.mBackgroundPadding.top;
        }
        this.mBackgroundView.setBackground(this.mOverflowMenuState == OverflowMenuState.Collapsed ? this.mCollapseBackground : this.mExpandBackground);
        setMeasuredDimension(Math.max(i5, MeasureSpec.getSize(i)), max + this.mInsetBottom);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return motionEvent.getY() > (this.mOverflowMenuView == null ? 0.0f : this.mOverflowMenuView.getTranslationY()) || super.onTouchEvent(motionEvent);
    }

    public void setBackground(Drawable drawable) {
        if (this.mCollapseBackground != drawable) {
            this.mCollapseBackground = drawable;
            extractBackground();
        }
    }

    public void setCustomView(View view) {
        if (this.mCustomView != view) {
            if (this.mCustomView != null) {
                removeView(this.mCustomView);
            }
            if (view != null) {
                addView(view);
            }
            this.mCustomView = view;
        }
    }

    public void setOverflowMenuView(View view) {
        if (this.mOverflowMenuView != view) {
            if (this.mOverflowMenuView != null) {
                if (this.mOverflowMenuView.getAnimation() != null) {
                    this.mOverflowMenuView.clearAnimation();
                }
                removeView(this.mOverflowMenuView);
            }
            if (view != null) {
                addView(view);
            }
            this.mOverflowMenuView = view;
            extractBackground();
        }
    }

    public void setValue(float f) {
        if (this.mOverflowMenuView != null) {
            this.mOverflowMenuView.setTranslationY(f * ((float) getMeasuredHeight()));
        }
    }

    public boolean showOverflowMenu() {
        OverflowMenuState overflowMenuState = this.mOverflowMenuState;
        if (overflowMenuState == OverflowMenuState.Expanding || overflowMenuState == OverflowMenuState.Expanded || this.mOverflowMenuView == null) {
            return false;
        }
        this.mBackgroundView.setBackground(this.mExpandBackground);
        OverflowMenuViewAnimator overflowMenuViewAnimator = getOverflowMenuViewAnimator();
        if (overflowMenuState == OverflowMenuState.Collapsed) {
            this.mOverflowMenuState = OverflowMenuState.Expanding;
            overflowMenuViewAnimator.show();
        } else if (overflowMenuState == OverflowMenuState.Collapsing) {
            overflowMenuViewAnimator.reverse();
        }
        postInvalidateOnAnimation();
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        return true;
    }
}
