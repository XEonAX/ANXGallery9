package com.miui.gallery.search.navigationpage;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.Adapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.miui.gallery.R;

public class SuggestionTagView extends LinearLayout {
    private SuggestionTagViewAdapter mAdapter;
    private DataSetObserver mAdapterObserver;
    private int mHorizontalMargin;
    private boolean mInvalid;
    private LayoutParams mItemLayoutParam;
    private int mMaxLines;
    private LayoutParams mRowLayoutParam;
    private int mVerticalMargin;

    public interface SuggestionTagViewAdapter extends Adapter {
        View getMoreItemView(View view, ViewGroup viewGroup);

        boolean hasMoreItem();

        boolean isFixedMoreItem();
    }

    public SuggestionTagView(Context context) {
        this(context, null);
    }

    public SuggestionTagView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SuggestionTagView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mInvalid = false;
        this.mAdapterObserver = new DataSetObserver() {
            public void onChanged() {
                SuggestionTagView.this.onAdapterChanged();
            }

            public void onInvalidated() {
                SuggestionTagView.this.onAdapterChanged();
            }
        };
        initView(context, attributeSet, i);
    }

    private LinearLayout changeToNewLine() {
        LinearLayout linearLayout = new LinearLayout(getContext());
        addView(linearLayout, this.mRowLayoutParam);
        return linearLayout;
    }

    private int getFillWidth(int i) {
        return (i - getPaddingLeft()) - getPaddingRight();
    }

    private int getItemMeasuredWidth(View view) {
        view.measure(0, 0);
        return view.getMeasuredWidth() + this.mHorizontalMargin;
    }

    private void initView(Context context, AttributeSet attributeSet, int i) {
        setOrientation(1);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.SuggestionTagView, i, 0);
        this.mHorizontalMargin = (int) obtainStyledAttributes.getDimension(1, 0.0f);
        this.mVerticalMargin = (int) obtainStyledAttributes.getDimension(2, 0.0f);
        this.mMaxLines = obtainStyledAttributes.getInteger(0, Integer.MAX_VALUE);
        obtainStyledAttributes.recycle();
        this.mRowLayoutParam = new LayoutParams(-1, -2);
        this.mRowLayoutParam.setMargins(0, 0, 0, this.mVerticalMargin);
        this.mItemLayoutParam = new LayoutParams(-2, -2);
        this.mItemLayoutParam.setMargins(0, 0, this.mHorizontalMargin, 0);
    }

    private void layoutTags(int i) {
        removeAllViews();
        int i2 = 0;
        this.mInvalid = false;
        if (this.mMaxLines > 0 && this.mAdapter != null) {
            boolean isFixedMoreItem = this.mAdapter.isFixedMoreItem();
            int count = this.mAdapter.getCount();
            View moreItemView = this.mAdapter.hasMoreItem() ? this.mAdapter.getMoreItemView(null, this) : null;
            int itemMeasuredWidth = moreItemView != null ? getItemMeasuredWidth(moreItemView) : 0;
            int i3 = (this.mMaxLines + -1 != 0 || moreItemView == null) ? 0 : itemMeasuredWidth;
            LinearLayout linearLayout = null;
            int i4 = 0;
            while (true) {
                if (i2 >= count) {
                    break;
                }
                View view = this.mAdapter.getView(i2, null, this);
                int itemMeasuredWidth2 = getItemMeasuredWidth(view);
                i3 += itemMeasuredWidth2;
                if (i3 > i) {
                    i4++;
                    if (i4 < this.mMaxLines) {
                        linearLayout = changeToNewLine();
                        if (i4 != this.mMaxLines - 1 || moreItemView == null) {
                            linearLayout.addView(view, this.mItemLayoutParam);
                        } else {
                            itemMeasuredWidth2 += itemMeasuredWidth;
                            if (itemMeasuredWidth2 <= i) {
                                linearLayout.addView(view, this.mItemLayoutParam);
                            } else {
                                if (i2 != count - 1 || isFixedMoreItem) {
                                    i2--;
                                } else {
                                    linearLayout.addView(view, this.mItemLayoutParam);
                                    moreItemView = null;
                                }
                                i3 = itemMeasuredWidth;
                            }
                        }
                        i3 = itemMeasuredWidth2;
                    } else if (moreItemView == null || i2 != count - 1 || isFixedMoreItem || i3 - itemMeasuredWidth > i) {
                        i2--;
                    } else {
                        linearLayout.addView(view, this.mItemLayoutParam);
                        moreItemView = null;
                    }
                } else {
                    if (linearLayout == null) {
                        linearLayout = changeToNewLine();
                    }
                    linearLayout.addView(view, this.mItemLayoutParam);
                }
                i2++;
            }
            if (moreItemView != null) {
                if (isFixedMoreItem && (linearLayout == null || (i4 < this.mMaxLines - 1 && i3 + itemMeasuredWidth > i))) {
                    linearLayout = changeToNewLine();
                }
                if (isFixedMoreItem || i2 < count - 1) {
                    linearLayout.addView(moreItemView, this.mItemLayoutParam);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void onAdapterChanged() {
        this.mInvalid = true;
        requestLayout();
    }

    public Adapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (this.mInvalid) {
            layoutTags(getFillWidth(MeasureSpec.getSize(i)));
        }
        super.onMeasure(i, i2);
    }

    public void setAdapter(SuggestionTagViewAdapter suggestionTagViewAdapter) {
        if (this.mAdapter != suggestionTagViewAdapter) {
            this.mAdapter = suggestionTagViewAdapter;
            if (this.mAdapter != null) {
                this.mAdapter.registerDataSetObserver(this.mAdapterObserver);
            }
            onAdapterChanged();
        }
    }

    public void setMaxLines(int i) {
        if (i != this.mMaxLines) {
            this.mMaxLines = i;
            this.mInvalid = true;
            requestLayout();
        }
    }
}
