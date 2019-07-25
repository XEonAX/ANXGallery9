package com.miui.gallery.widget.recyclerview;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class BaseViewHolder extends ViewHolder {
    public BaseViewHolder(View view) {
        super(view);
    }

    public static View getView(ViewGroup viewGroup, int i) {
        return LayoutInflater.from(viewGroup.getContext()).inflate(i, viewGroup, false);
    }
}
