package com.miui.gallery.ui;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public abstract class TimeLineGridHeaderItem extends LinearLayout implements CheckableView {
    protected TextView mDateTime;
    protected TextView mLocation;
    private View mSelectGroupOrNot;

    public TimeLineGridHeaderItem(Context context) {
        this(context, null);
    }

    public TimeLineGridHeaderItem(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public TimeLineGridHeaderItem(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        setLayoutDirection(3);
    }

    public void bindData(String str, String str2) {
        this.mDateTime.setText(str);
        if (!TextUtils.isEmpty(str2)) {
            this.mLocation.setText(str2);
            this.mLocation.setVisibility(0);
            return;
        }
        this.mLocation.setVisibility(4);
    }

    public boolean isChecked() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mDateTime = (TextView) findViewById(R.id.datetime);
        this.mLocation = (TextView) findViewById(R.id.location);
        this.mSelectGroupOrNot = findViewById(R.id.do_select);
        ((TextView) this.mSelectGroupOrNot).setText(miui.R.string.select_all);
    }

    public void setCheckable(boolean z) {
        if (z) {
            if (this.mSelectGroupOrNot.getBackground() == null) {
                this.mSelectGroupOrNot.setBackgroundResource(R.drawable.select_all_button);
            }
            this.mSelectGroupOrNot.setVisibility(0);
            return;
        }
        this.mSelectGroupOrNot.setVisibility(8);
    }

    public void setCheckableListener(OnClickListener onClickListener) {
        this.mSelectGroupOrNot.setOnClickListener(onClickListener);
    }

    public void setChecked(boolean z) {
        ((TextView) this.mSelectGroupOrNot).setText(getContext().getString(z ? miui.R.string.deselect_all : miui.R.string.select_all));
    }

    public void toggle() {
    }
}
