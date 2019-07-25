package com.miui.gallery.util;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

public class DividerItemDecoration extends ItemDecoration {
    private static final int[] ATTRS = {16843284};
    private int mBottomKeepCount = 0;
    private Drawable mDivider;
    private int mOrientation;
    private int mTopKeepCount = 0;

    public DividerItemDecoration(Drawable drawable, int i, int i2) {
        this.mDivider = drawable;
        setOrientation(1);
        this.mTopKeepCount = i;
        this.mBottomKeepCount = i2;
    }

    private int getAdapterCount(RecyclerView recyclerView) {
        Adapter adapter = recyclerView.getAdapter();
        if (adapter == null) {
            return 0;
        }
        return adapter.getItemCount();
    }

    public void drawHorizontal(Canvas canvas, RecyclerView recyclerView) {
        int paddingTop = recyclerView.getPaddingTop();
        int height = recyclerView.getHeight() - recyclerView.getPaddingBottom();
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            int right = childAt.getRight() + ((LayoutParams) childAt.getLayoutParams()).rightMargin + Math.round(ViewCompat.getTranslationX(childAt));
            this.mDivider.setBounds(right, paddingTop, this.mDivider.getIntrinsicHeight() + right, height);
            this.mDivider.draw(canvas);
        }
    }

    public void drawVertical(Canvas canvas, RecyclerView recyclerView) {
        int paddingLeft = recyclerView.getPaddingLeft();
        int width = recyclerView.getWidth() - recyclerView.getPaddingRight();
        int adapterCount = getAdapterCount(recyclerView);
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            int viewLayoutPosition = layoutParams.getViewLayoutPosition();
            if (viewLayoutPosition >= this.mTopKeepCount && viewLayoutPosition < adapterCount - this.mBottomKeepCount) {
                int bottom = childAt.getBottom() + layoutParams.bottomMargin + Math.round(ViewCompat.getTranslationY(childAt));
                this.mDivider.setBounds(paddingLeft, bottom, width, this.mDivider.getIntrinsicHeight() + bottom);
                this.mDivider.draw(canvas);
            }
        }
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        if (this.mOrientation == 1) {
            int viewLayoutPosition = ((LayoutParams) view.getLayoutParams()).getViewLayoutPosition();
            if (viewLayoutPosition >= this.mTopKeepCount && viewLayoutPosition < getAdapterCount(recyclerView) - this.mBottomKeepCount) {
                rect.set(0, 0, 0, this.mDivider.getIntrinsicHeight());
            }
        } else {
            rect.set(0, 0, this.mDivider.getIntrinsicWidth(), 0);
        }
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView) {
        if (this.mOrientation == 1) {
            drawVertical(canvas, recyclerView);
        } else {
            drawHorizontal(canvas, recyclerView);
        }
    }

    public void setOrientation(int i) {
        if (i == 0 || i == 1) {
            this.mOrientation = i;
            return;
        }
        throw new IllegalArgumentException("invalid orientation");
    }
}
