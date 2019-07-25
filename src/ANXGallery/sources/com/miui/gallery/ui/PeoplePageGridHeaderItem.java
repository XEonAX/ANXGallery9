package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class PeoplePageGridHeaderItem extends RelativeLayout {
    protected TextView mGroupName;

    public PeoplePageGridHeaderItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindData(String str) {
        this.mGroupName.setText(str);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mGroupName = (TextView) findViewById(R.id.groupName);
    }
}
