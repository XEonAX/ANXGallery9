package com.miui.gallery.widget.recyclerview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.widget.DividerTypeProvider;

public class SectionedDividerItemDecoration extends ItemDecoration {
    private DividerTypeProvider mDividerTypeProvider;
    private Drawable mItemDivider;
    private int mItemDividerHeight;
    private Rect mItemDividerPadding = new Rect(0, 0, 0, 0);
    private Drawable mSectionDivider;
    private int mSectionDividerHeight;

    public SectionedDividerItemDecoration(Context context, int i, int i2, DividerTypeProvider dividerTypeProvider) {
        this.mSectionDivider = context.getResources().getDrawable(i);
        this.mItemDivider = context.getResources().getDrawable(i2);
        this.mSectionDividerHeight = context.getResources().getDimensionPixelSize(R.dimen.section_divider_height);
        this.mItemDividerHeight = context.getResources().getDimensionPixelSize(R.dimen.item_divider_height);
        this.mDividerTypeProvider = dividerTypeProvider;
    }

    private void drawBottomDivider(Canvas canvas, View view, int i, int i2, int i3) {
        int bottom = view.getBottom() + ((LayoutParams) view.getLayoutParams()).bottomMargin + Math.round(ViewCompat.getTranslationY(view));
        switch (i) {
            case 1:
                if (this.mSectionDivider != null && this.mSectionDividerHeight > 0) {
                    this.mSectionDivider.setBounds(i2, bottom, i3, this.mSectionDividerHeight + bottom);
                    this.mSectionDivider.draw(canvas);
                    break;
                } else {
                    return;
                }
            case 2:
                if (this.mItemDivider != null && this.mItemDividerHeight > 0) {
                    int i4 = this.mItemDividerHeight + bottom;
                    if (1 == view.getLayoutDirection()) {
                        this.mItemDivider.setBounds(i2 + this.mItemDividerPadding.right, bottom + this.mItemDividerPadding.top, i3 - this.mItemDividerPadding.left, i4 - this.mItemDividerPadding.bottom);
                    } else {
                        this.mItemDivider.setBounds(i2 + this.mItemDividerPadding.left, bottom + this.mItemDividerPadding.top, i3 - this.mItemDividerPadding.right, i4 - this.mItemDividerPadding.bottom);
                    }
                    this.mItemDivider.draw(canvas);
                    break;
                } else {
                    return;
                }
            case 3:
                if (this.mItemDivider != null && this.mItemDividerHeight > 0) {
                    this.mItemDivider.setBounds(i2, bottom + this.mItemDividerPadding.top, i3, (this.mItemDividerHeight + bottom) - this.mItemDividerPadding.bottom);
                    this.mItemDivider.draw(canvas);
                    break;
                } else {
                    return;
                }
        }
    }

    private void drawTopDivider(Canvas canvas, View view, int i, int i2, int i3) {
        int top = view.getTop() + ((LayoutParams) view.getLayoutParams()).topMargin + Math.round(ViewCompat.getTranslationY(view));
        if (i == 3 && this.mItemDivider != null && this.mItemDividerHeight > 0) {
            this.mItemDivider.setBounds(i2, top + this.mItemDividerPadding.top, i3, (this.mItemDividerHeight + top) - this.mItemDividerPadding.bottom);
            this.mItemDivider.draw(canvas);
        }
    }

    private int getBottomDividerType(int i) {
        if (this.mDividerTypeProvider != null) {
            return this.mDividerTypeProvider.getBottomDividerType(i);
        }
        return 0;
    }

    private int getTopDividerType(int i) {
        if (this.mDividerTypeProvider != null) {
            return this.mDividerTypeProvider.getTopDividerType(i);
        }
        return 0;
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
        int i = getTopDividerType(childAdapterPosition) != 3 ? 0 : this.mItemDividerHeight;
        int bottomDividerType = getBottomDividerType(childAdapterPosition);
        int i2 = bottomDividerType != 1 ? bottomDividerType != 3 ? 0 : this.mItemDividerHeight : this.mSectionDividerHeight;
        rect.set(0, i, 0, i2);
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            int round = Math.round(ViewCompat.getTranslationX(childAt));
            int left = childAt.getLeft() + round;
            int right = childAt.getRight() + round;
            int childAdapterPosition = recyclerView.getChildAdapterPosition(childAt);
            Canvas canvas2 = canvas;
            View view = childAt;
            int i2 = left;
            int i3 = right;
            drawTopDivider(canvas2, view, getTopDividerType(childAdapterPosition), i2, i3);
            drawBottomDivider(canvas2, view, getBottomDividerType(childAdapterPosition), i2, i3);
        }
        super.onDrawOver(canvas, recyclerView, state);
    }

    public void setItemDividerPadding(Rect rect) {
        if (rect != null) {
            this.mItemDividerPadding.set(rect);
        } else {
            this.mItemDividerPadding.setEmpty();
        }
    }
}
