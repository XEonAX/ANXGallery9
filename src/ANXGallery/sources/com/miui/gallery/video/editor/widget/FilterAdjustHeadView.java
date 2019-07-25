package com.miui.gallery.video.editor.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class FilterAdjustHeadView extends LinearLayout implements OnClickListener {
    private FilterHeadViewClickListener mHeadViewClickListener;
    private TextView mTvAdjust;
    private TextView mTvTitleFilter;

    public interface FilterHeadViewClickListener {
        void onAdjustClick();

        void onFilterClick();
    }

    public FilterAdjustHeadView(Context context) {
        super(context);
        init(context);
    }

    public FilterAdjustHeadView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    private void init(Context context) {
        ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.video_editor_filter_head_view, this);
        this.mTvTitleFilter = (TextView) findViewById(R.id.tv_title_filter);
        this.mTvAdjust = (TextView) findViewById(R.id.tv_title_adjust);
        this.mTvTitleFilter.setOnClickListener(this);
        this.mTvAdjust.setOnClickListener(this);
        selectFilter(true);
    }

    public void onClick(View view) {
        if (view != null) {
            switch (view.getId()) {
                case R.id.tv_title_adjust /*2131297046*/:
                    if (!this.mTvAdjust.isSelected()) {
                        selectFilter(false);
                        if (this.mHeadViewClickListener != null) {
                            this.mHeadViewClickListener.onAdjustClick();
                            return;
                        }
                        return;
                    }
                    return;
                case R.id.tv_title_filter /*2131297047*/:
                    if (!this.mTvTitleFilter.isSelected()) {
                        selectFilter(true);
                        if (this.mHeadViewClickListener != null) {
                            this.mHeadViewClickListener.onFilterClick();
                            return;
                        }
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    public void selectFilter(boolean z) {
        this.mTvTitleFilter.setSelected(z);
        this.mTvAdjust.setSelected(!z);
    }

    public void setHeadViewClickListener(FilterHeadViewClickListener filterHeadViewClickListener) {
        this.mHeadViewClickListener = filterHeadViewClickListener;
    }
}
