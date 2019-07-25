package com.miui.gallery.view.menu;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.miui.gallery.compat.view.ViewCompat;
import com.miui.gallery.view.menu.ActionMenuView.LayoutParams;

public class TabletActionMenuView extends ActionMenuView {
    private Rect mBaseInnerInsets = new Rect();
    private int mInsetBottom;

    public TabletActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public boolean filterLeftoverView(int i) {
        LayoutParams layoutParams = (LayoutParams) getChildAt(i).getLayoutParams();
        if (layoutParams == null || !layoutParams.isOverflowButton) {
            return super.filterLeftoverView(i);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean fitSystemWindows(Rect rect) {
        this.mBaseInnerInsets.set(ViewCompat.getSystemWindowInsets(this));
        int i = this.mBaseInnerInsets.bottom;
        if (this.mInsetBottom != i) {
            this.mInsetBottom = i;
            setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), i);
        }
        return super.fitSystemWindows(rect);
    }

    public int getCollapsedHeight() {
        return getMeasuredHeight();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return true;
    }
}
