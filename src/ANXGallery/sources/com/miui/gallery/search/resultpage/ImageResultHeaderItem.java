package com.miui.gallery.search.resultpage;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.ui.CheckableView;

public class ImageResultHeaderItem extends RelativeLayout implements CheckableView {
    private ImageView mExpandIcon;
    private boolean mExpandable;
    protected View mSelectGroupOrNot;
    protected View mSelectGroupOrNotContainer;
    protected TextView mSubTitle;
    protected TextView mTitle;

    public ImageResultHeaderItem(Context context, AttributeSet attributeSet) {
        super(context);
        setLayoutDirection(3);
    }

    public void bindData(String str, String str2, boolean z, int i, OnClickListener onClickListener) {
        this.mTitle.setText(str);
        if (!TextUtils.isEmpty(str2)) {
            this.mSubTitle.setText(str2);
            this.mSubTitle.setVisibility(0);
        } else {
            this.mSubTitle.setVisibility(4);
        }
        this.mExpandable = z;
        if (this.mExpandable) {
            this.mExpandIcon.setVisibility(0);
            this.mExpandIcon.setImageResource(i);
            this.mExpandIcon.setOnClickListener(onClickListener);
            return;
        }
        this.mExpandIcon.setVisibility(8);
        this.mExpandIcon.setOnClickListener(null);
    }

    public boolean isChecked() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mTitle = (TextView) findViewById(R.id.header_title);
        this.mSubTitle = (TextView) findViewById(R.id.header_sub_title);
        this.mSelectGroupOrNot = findViewById(R.id.do_select);
        ((TextView) this.mSelectGroupOrNot).setText(miui.R.string.select_all);
        this.mSelectGroupOrNotContainer = findViewById(R.id.do_select_container);
        this.mExpandIcon = (ImageView) findViewById(R.id.expand_icon);
    }

    public void setCheckable(boolean z) {
        int i = 0;
        if (z) {
            this.mSelectGroupOrNotContainer.setVisibility(0);
            this.mExpandIcon.setVisibility(8);
            return;
        }
        this.mSelectGroupOrNotContainer.setVisibility(8);
        ImageView imageView = this.mExpandIcon;
        if (!this.mExpandable) {
            i = 8;
        }
        imageView.setVisibility(i);
    }

    public void setCheckableListener(OnClickListener onClickListener) {
        this.mSelectGroupOrNotContainer.setOnClickListener(onClickListener);
    }

    public void setChecked(boolean z) {
        ((TextView) this.mSelectGroupOrNot).setText(getContext().getString(z ? miui.R.string.deselect_all : miui.R.string.select_all));
    }

    public void toggle() {
    }
}
