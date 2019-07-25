package com.miui.gallery.search.core.display;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;

public class BaseSuggestionViewHolder extends ViewHolder {
    protected View mClickView;
    protected ImageView mIconView;
    protected TextView mSubTitle;
    protected TextView mTitle;
    protected String mViewType;

    public BaseSuggestionViewHolder(View view) {
        super(view);
        this.mClickView = view.findViewById(R.id.click_view);
        this.mIconView = (ImageView) view.findViewById(R.id.icon);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        this.mSubTitle = (TextView) view.findViewById(R.id.subtitle);
    }

    public View getClickView() {
        return this.mClickView;
    }

    public ImageView getIconView() {
        return this.mIconView;
    }

    public TextView getSubTitle() {
        return this.mSubTitle;
    }

    public TextView getTitle() {
        return this.mTitle;
    }

    public String getViewType() {
        return this.mViewType;
    }

    public void setViewType(String str) {
        this.mViewType = str;
    }
}
