package com.miui.gallery.editor.photo.app.filter;

import android.graphics.drawable.ColorDrawable;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.common.model.FilterData;
import com.miui.gallery.editor.ui.view.RoundImageView;

class FilterMenuItem extends ViewHolder {
    private ColorDrawable mColorDrawable = ((ColorDrawable) new ColorDrawable().mutate());
    private View mConfigIndicator;
    private FilterData mData;
    private ImageView mPreviewView;
    boolean mSelected;
    private ImageView mSelector;
    private TextView mTitleView;
    private TextView mValueIndicator;

    FilterMenuItem(View view) {
        super(view);
        this.mPreviewView = (ImageView) view.findViewById(R.id.preview);
        this.mTitleView = (TextView) view.findViewById(R.id.title);
        this.mValueIndicator = (TextView) view.findViewById(R.id.value_indicator);
        this.mConfigIndicator = view.findViewById(R.id.configable_indicator);
        this.mSelector = (ImageView) view.findViewById(R.id.selector);
    }

    /* access modifiers changed from: 0000 */
    public void bindData(FilterData filterData) {
        this.mData = filterData;
        this.mPreviewView.setImageResource(filterData.icon);
        this.mPreviewView.setContentDescription(filterData.name);
        this.mTitleView.setText(filterData.name);
    }

    /* access modifiers changed from: 0000 */
    public void setForegroundColor(int i) {
        this.mColorDrawable.setColor(i);
        if (this.mSelected) {
            this.mColorDrawable.setAlpha((int) (this.mData.isNone() ? 153.0d : 229.5d));
        }
        ((RoundImageView) RoundImageView.class.cast(this.mSelector)).setTopCorner(this.mSelected);
        this.mSelector.setImageDrawable(this.mColorDrawable);
    }

    /* access modifiers changed from: 0000 */
    public void setState(boolean z, boolean z2) {
        LayoutParams layoutParams = (LayoutParams) this.mSelector.getLayoutParams();
        this.mSelected = z;
        int[] rules = layoutParams.getRules();
        if (!z) {
            this.mValueIndicator.setVisibility(8);
            this.mConfigIndicator.setVisibility(8);
            if (rules[6] != R.id.title) {
                layoutParams.removeRule(10);
                layoutParams.addRule(6, R.id.title);
                return;
            }
            return;
        }
        if (!z2) {
            this.mValueIndicator.setVisibility(8);
            if (!this.mData.isNone()) {
                this.mConfigIndicator.setVisibility(0);
            }
        } else {
            this.mValueIndicator.setVisibility(0);
            this.mConfigIndicator.setVisibility(8);
        }
        if (rules[10] != -1) {
            layoutParams.addRule(10, -1);
            layoutParams.removeRule(6);
        }
    }

    /* access modifiers changed from: 0000 */
    public void updateIndicator(int i) {
        this.mValueIndicator.setText(String.valueOf(i));
    }
}
