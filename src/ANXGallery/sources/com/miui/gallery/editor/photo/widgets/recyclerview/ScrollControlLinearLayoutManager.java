package com.miui.gallery.editor.photo.widgets.recyclerview;

import android.content.Context;
import android.graphics.PointF;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.SmoothScroller.Action;
import android.support.v7.widget.RecyclerView.State;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import com.miui.gallery.R;
import miui.view.animation.CubicEaseOutInterpolator;

public class ScrollControlLinearLayoutManager extends LinearLayoutManager {
    protected float mMinDistance;
    protected float mSmoothScrollerSpeed = 25.0f;

    public ScrollControlLinearLayoutManager(Context context) {
        super(context);
        init(context);
    }

    public ScrollControlLinearLayoutManager(Context context, int i, boolean z) {
        super(context, i, z);
        init(context);
    }

    public ScrollControlLinearLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        init(context);
    }

    private void init(Context context) {
        this.mMinDistance = context.getResources().getDimension(R.dimen.scroll_control_item_min_scroll_distance);
    }

    public static void onItemClick(RecyclerView recyclerView, int i) {
        int i2;
        LayoutManager layoutManager = recyclerView.getLayoutManager();
        Adapter adapter = recyclerView.getAdapter();
        if (adapter != null && layoutManager != null && (layoutManager instanceof LinearLayoutManager)) {
            LinearLayoutManager linearLayoutManager = (LinearLayoutManager) layoutManager;
            int findLastVisibleItemPosition = linearLayoutManager.findLastVisibleItemPosition();
            int findLastCompletelyVisibleItemPosition = linearLayoutManager.findLastCompletelyVisibleItemPosition();
            int findFirstVisibleItemPosition = linearLayoutManager.findFirstVisibleItemPosition();
            int findFirstCompletelyVisibleItemPosition = linearLayoutManager.findFirstCompletelyVisibleItemPosition();
            if (findLastVisibleItemPosition == i || findLastCompletelyVisibleItemPosition == i) {
                i2 = i + 1;
                if (i2 <= 0 || i2 >= adapter.getItemCount()) {
                    i2 = adapter.getItemCount();
                }
            } else if (findFirstVisibleItemPosition == i || findFirstCompletelyVisibleItemPosition == i) {
                i2 = i - 1;
                if (i2 < 0 || i2 >= adapter.getItemCount()) {
                    i2 = 0;
                }
            } else {
                i2 = -1;
            }
            if (i2 != -1) {
                if (linearLayoutManager instanceof ScrollControlLinearLayoutManager) {
                    ((ScrollControlLinearLayoutManager) linearLayoutManager).setSmoothScrollerSpeed(155.0f);
                }
                recyclerView.smoothScrollToPosition(i2);
            }
        }
    }

    public void setSmoothScrollerSpeed(float f) {
        this.mSmoothScrollerSpeed = f;
    }

    public void smoothScrollToPosition(RecyclerView recyclerView, State state, int i) {
        AnonymousClass1 r2 = new LinearSmoothScroller(recyclerView.getContext()) {
            /* access modifiers changed from: protected */
            public float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
                return ScrollControlLinearLayoutManager.this.mSmoothScrollerSpeed / ((float) displayMetrics.densityDpi);
            }

            public PointF computeScrollVectorForPosition(int i) {
                return ScrollControlLinearLayoutManager.this.computeScrollVectorForPosition(i);
            }

            /* access modifiers changed from: protected */
            public void onTargetFound(View view, State state, Action action) {
                if (getLayoutManager() != null) {
                    int calculateDxToMakeVisible = calculateDxToMakeVisible(view, getHorizontalSnapPreference());
                    int calculateDyToMakeVisible = calculateDyToMakeVisible(view, getVerticalSnapPreference());
                    int leftDecorationWidth = calculateDxToMakeVisible > 0 ? calculateDxToMakeVisible - getLayoutManager().getLeftDecorationWidth(view) : calculateDxToMakeVisible + getLayoutManager().getRightDecorationWidth(view);
                    int topDecorationHeight = calculateDyToMakeVisible > 0 ? calculateDyToMakeVisible - getLayoutManager().getTopDecorationHeight(view) : calculateDyToMakeVisible + getLayoutManager().getBottomDecorationHeight(view);
                    if (((float) ((int) Math.sqrt((double) ((leftDecorationWidth * leftDecorationWidth) + (topDecorationHeight * topDecorationHeight))))) > ScrollControlLinearLayoutManager.this.mMinDistance) {
                        action.update(-leftDecorationWidth, -topDecorationHeight, 300, new CubicEaseOutInterpolator());
                    }
                }
            }
        };
        r2.setTargetPosition(i);
        startSmoothScroll(r2);
    }
}
