package com.miui.gallery.widget.stickyheader.core;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;

public class StickyHeaderUtil {
    public static void extractMargins(View view, Rect rect) {
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams instanceof MarginLayoutParams) {
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) layoutParams;
            rect.set(marginLayoutParams.leftMargin, marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
            return;
        }
        rect.set(0, 0, 0, 0);
    }

    public static int getListTop(RecyclerView recyclerView) {
        if (recyclerView.getLayoutManager().getClipToPadding()) {
            return recyclerView.getPaddingTop();
        }
        return 0;
    }

    public static boolean indexOutOfBounds(Adapter adapter, int i) {
        return i < 0 || i >= adapter.getItemCount();
    }

    public static boolean isValidHeaderId(long j) {
        return j != -1;
    }

    public static boolean isValidHeaderIndex(int i) {
        return i > -1;
    }
}
