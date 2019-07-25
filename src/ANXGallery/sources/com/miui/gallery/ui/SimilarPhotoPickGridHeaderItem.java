package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import java.text.SimpleDateFormat;

public class SimilarPhotoPickGridHeaderItem extends LinearLayout {
    private static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    private TextView mDateTime;

    public SimilarPhotoPickGridHeaderItem(Context context) {
        this(context, null);
    }

    public SimilarPhotoPickGridHeaderItem(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SimilarPhotoPickGridHeaderItem(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void bindData(long j) {
        this.mDateTime.setText(SIMPLE_DATE_FORMAT.format(Long.valueOf(j)));
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mDateTime = (TextView) findViewById(R.id.create_time);
    }
}
