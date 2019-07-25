package com.miui.gallery.widget.recyclerview.transition;

import android.support.v7.widget.RecyclerView;

public interface TransitionListener {
    void onTransitionEnd(RecyclerView recyclerView, RecyclerView recyclerView2, boolean z);

    TransitionAnchor onTransitionPrepare(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f, float f2);

    void onTransitionUpdate(RecyclerView recyclerView, RecyclerView recyclerView2, float f);
}
