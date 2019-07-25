package com.miui.gallery.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class SortByHeader extends LinearLayout {
    private View mDateTimeContainer;
    private View mNameContainer;
    private OnClickListener mOnSortByClickListener;
    private View mSizeContainer;
    private ImageView mSortByDateArrow;
    private TextView mSortByDateTime;
    private TextView mSortByFileName;
    private TextView mSortByFileSize;
    private ImageView mSortByNameArrow;
    private ImageView mSortBySizeArrow;

    public enum SortBy {
        NONE,
        DATE,
        NAME,
        SIZE
    }

    public SortByHeader(Context context) {
        super(context);
    }

    public SortByHeader(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public SortByHeader(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private void setSortByDateSelected(boolean z, int i) {
        if (this.mDateTimeContainer != null) {
            this.mSortByDateTime.setSelected(z);
            this.mSortByDateArrow.setSelected(z);
            this.mSortByDateArrow.setBackgroundResource(i);
        }
    }

    private void setSortByNameSelected(boolean z, int i) {
        if (this.mNameContainer != null) {
            this.mSortByFileName.setSelected(z);
            this.mSortByNameArrow.setSelected(z);
            this.mSortByNameArrow.setBackgroundResource(i);
        }
    }

    private void setSortBySizeSelected(boolean z, int i) {
        if (this.mSizeContainer != null) {
            this.mSortByFileSize.setSelected(z);
            this.mSortBySizeArrow.setSelected(z);
            this.mSortBySizeArrow.setBackgroundResource(i);
        }
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mDateTimeContainer = findViewById(R.id.datetime_container);
        this.mNameContainer = findViewById(R.id.name_container);
        this.mSizeContainer = findViewById(R.id.size_container);
        this.mSortByDateTime = (TextView) findViewById(R.id.datetime);
        this.mSortByDateArrow = (ImageView) findViewById(R.id.datetime_sort_arrow);
        this.mSortByFileName = (TextView) findViewById(R.id.name);
        this.mSortByNameArrow = (ImageView) findViewById(R.id.name_sort_arrow);
        this.mSortByFileSize = (TextView) findViewById(R.id.size);
        this.mSortBySizeArrow = (ImageView) findViewById(R.id.size_sort_arrow);
    }

    public void setOnSortByClickListener(OnClickListener onClickListener) {
        this.mOnSortByClickListener = onClickListener;
        if (this.mDateTimeContainer != null) {
            this.mDateTimeContainer.setOnClickListener(this.mOnSortByClickListener);
        }
        if (this.mNameContainer != null) {
            this.mNameContainer.setOnClickListener(this.mOnSortByClickListener);
        }
        if (this.mSizeContainer != null) {
            this.mSizeContainer.setOnClickListener(this.mOnSortByClickListener);
        }
    }

    public void updateCurrentSortView(SortBy sortBy, int i) {
        switch (sortBy) {
            case SIZE:
                setSortBySizeSelected(true, i);
                setSortByDateSelected(false, R.drawable.sort_by_item_arrow_up);
                setSortByNameSelected(false, R.drawable.sort_by_item_arrow_up);
                return;
            case DATE:
                setSortByDateSelected(true, i);
                setSortBySizeSelected(false, R.drawable.sort_by_item_arrow_up);
                setSortByNameSelected(false, R.drawable.sort_by_item_arrow_up);
                return;
            case NAME:
                setSortByNameSelected(true, i);
                setSortBySizeSelected(false, R.drawable.sort_by_item_arrow_up);
                setSortByDateSelected(false, R.drawable.sort_by_item_arrow_up);
                return;
            default:
                return;
        }
    }
}
