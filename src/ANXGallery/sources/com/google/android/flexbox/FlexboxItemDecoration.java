package com.google.android.flexbox;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import java.util.List;

public class FlexboxItemDecoration extends ItemDecoration {
    private static final int[] LIST_DIVIDER_ATTRS = {16843284};
    private Drawable mDrawable;
    private int mOrientation;

    public FlexboxItemDecoration(Context context) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(LIST_DIVIDER_ATTRS);
        this.mDrawable = obtainStyledAttributes.getDrawable(0);
        obtainStyledAttributes.recycle();
        setOrientation(3);
    }

    private void drawHorizontalDecorations(Canvas canvas, RecyclerView recyclerView) {
        int i;
        int i2;
        int i3;
        int i4;
        if (needsHorizontalDecoration()) {
            FlexboxLayoutManager flexboxLayoutManager = (FlexboxLayoutManager) recyclerView.getLayoutManager();
            int flexDirection = flexboxLayoutManager.getFlexDirection();
            int left = recyclerView.getLeft() - recyclerView.getPaddingLeft();
            int right = recyclerView.getRight() + recyclerView.getPaddingRight();
            int childCount = recyclerView.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = recyclerView.getChildAt(i5);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (flexDirection == 3) {
                    i2 = childAt.getBottom() + layoutParams.bottomMargin;
                    i = this.mDrawable.getIntrinsicHeight() + i2;
                } else {
                    i = childAt.getTop() - layoutParams.topMargin;
                    i2 = i - this.mDrawable.getIntrinsicHeight();
                }
                if (!flexboxLayoutManager.isMainAxisDirectionHorizontal()) {
                    i3 = childAt.getLeft() - layoutParams.leftMargin;
                    i4 = childAt.getRight() + layoutParams.rightMargin;
                } else if (flexboxLayoutManager.isLayoutRtl()) {
                    int min = Math.min(childAt.getRight() + layoutParams.rightMargin + this.mDrawable.getIntrinsicWidth(), right);
                    i3 = childAt.getLeft() - layoutParams.leftMargin;
                    i4 = min;
                } else {
                    i3 = Math.max((childAt.getLeft() - layoutParams.leftMargin) - this.mDrawable.getIntrinsicWidth(), left);
                    i4 = childAt.getRight() + layoutParams.rightMargin;
                }
                this.mDrawable.setBounds(i3, i2, i4, i);
                this.mDrawable.draw(canvas);
            }
        }
    }

    private void drawVerticalDecorations(Canvas canvas, RecyclerView recyclerView) {
        int i;
        int i2;
        int i3;
        int i4;
        if (needsVerticalDecoration()) {
            FlexboxLayoutManager flexboxLayoutManager = (FlexboxLayoutManager) recyclerView.getLayoutManager();
            int top = recyclerView.getTop() - recyclerView.getPaddingTop();
            int bottom = recyclerView.getBottom() + recyclerView.getPaddingBottom();
            int childCount = recyclerView.getChildCount();
            int flexDirection = flexboxLayoutManager.getFlexDirection();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = recyclerView.getChildAt(i5);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (flexboxLayoutManager.isLayoutRtl()) {
                    i2 = childAt.getRight() + layoutParams.rightMargin;
                    i = this.mDrawable.getIntrinsicWidth() + i2;
                } else {
                    i = childAt.getLeft() - layoutParams.leftMargin;
                    i2 = i - this.mDrawable.getIntrinsicWidth();
                }
                if (flexboxLayoutManager.isMainAxisDirectionHorizontal()) {
                    i3 = childAt.getTop() - layoutParams.topMargin;
                    i4 = childAt.getBottom() + layoutParams.bottomMargin;
                } else if (flexDirection == 3) {
                    int min = Math.min(childAt.getBottom() + layoutParams.bottomMargin + this.mDrawable.getIntrinsicHeight(), bottom);
                    i3 = childAt.getTop() - layoutParams.topMargin;
                    i4 = min;
                } else {
                    i3 = Math.max((childAt.getTop() - layoutParams.topMargin) - this.mDrawable.getIntrinsicHeight(), top);
                    i4 = childAt.getBottom() + layoutParams.bottomMargin;
                }
                this.mDrawable.setBounds(i2, i3, i, i4);
                this.mDrawable.draw(canvas);
            }
        }
    }

    private boolean isFirstItemInLine(int i, List<FlexLine> list, FlexboxLayoutManager flexboxLayoutManager) {
        int positionToFlexLineIndex = flexboxLayoutManager.getPositionToFlexLineIndex(i);
        if ((positionToFlexLineIndex != -1 && positionToFlexLineIndex < flexboxLayoutManager.getFlexLinesInternal().size() && ((FlexLine) flexboxLayoutManager.getFlexLinesInternal().get(positionToFlexLineIndex)).mFirstIndex == i) || i == 0) {
            return true;
        }
        boolean z = false;
        if (list.size() == 0) {
            return false;
        }
        if (((FlexLine) list.get(list.size() - 1)).mLastIndex == i - 1) {
            z = true;
        }
        return z;
    }

    private boolean needsHorizontalDecoration() {
        return (this.mOrientation & 1) > 0;
    }

    private boolean needsVerticalDecoration() {
        return (this.mOrientation & 2) > 0;
    }

    private void setOffsetAlongCrossAxis(Rect rect, int i, FlexboxLayoutManager flexboxLayoutManager, List<FlexLine> list) {
        if (list.size() != 0 && flexboxLayoutManager.getPositionToFlexLineIndex(i) != 0) {
            if (flexboxLayoutManager.isMainAxisDirectionHorizontal()) {
                if (!needsHorizontalDecoration()) {
                    rect.top = 0;
                    rect.bottom = 0;
                    return;
                }
                rect.top = this.mDrawable.getIntrinsicHeight();
                rect.bottom = 0;
            } else if (needsVerticalDecoration()) {
                if (flexboxLayoutManager.isLayoutRtl()) {
                    rect.right = this.mDrawable.getIntrinsicWidth();
                    rect.left = 0;
                } else {
                    rect.left = this.mDrawable.getIntrinsicWidth();
                    rect.right = 0;
                }
            }
        }
    }

    private void setOffsetAlongMainAxis(Rect rect, int i, FlexboxLayoutManager flexboxLayoutManager, List<FlexLine> list, int i2) {
        if (!isFirstItemInLine(i, list, flexboxLayoutManager)) {
            if (flexboxLayoutManager.isMainAxisDirectionHorizontal()) {
                if (!needsVerticalDecoration()) {
                    rect.left = 0;
                    rect.right = 0;
                } else if (flexboxLayoutManager.isLayoutRtl()) {
                    rect.right = this.mDrawable.getIntrinsicWidth();
                    rect.left = 0;
                } else {
                    rect.left = this.mDrawable.getIntrinsicWidth();
                    rect.right = 0;
                }
            } else if (!needsHorizontalDecoration()) {
                rect.top = 0;
                rect.bottom = 0;
            } else if (i2 == 3) {
                rect.bottom = this.mDrawable.getIntrinsicHeight();
                rect.top = 0;
            } else {
                rect.top = this.mDrawable.getIntrinsicHeight();
                rect.bottom = 0;
            }
        }
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
        if (childAdapterPosition != 0) {
            if (needsHorizontalDecoration() || needsVerticalDecoration()) {
                FlexboxLayoutManager flexboxLayoutManager = (FlexboxLayoutManager) recyclerView.getLayoutManager();
                List flexLines = flexboxLayoutManager.getFlexLines();
                setOffsetAlongMainAxis(rect, childAdapterPosition, flexboxLayoutManager, flexLines, flexboxLayoutManager.getFlexDirection());
                setOffsetAlongCrossAxis(rect, childAdapterPosition, flexboxLayoutManager, flexLines);
                return;
            }
            rect.set(0, 0, 0, 0);
        }
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, State state) {
        drawHorizontalDecorations(canvas, recyclerView);
        drawVerticalDecorations(canvas, recyclerView);
    }

    public void setDrawable(Drawable drawable) {
        if (drawable != null) {
            this.mDrawable = drawable;
            return;
        }
        throw new IllegalArgumentException("Drawable cannot be null.");
    }

    public void setOrientation(int i) {
        this.mOrientation = i;
    }
}
