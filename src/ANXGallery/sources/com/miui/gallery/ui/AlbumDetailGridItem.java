package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.util.FormatUtil;

public class AlbumDetailGridItem extends MicroThumbGridItem {
    private TextView mFileSize;

    public AlbumDetailGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindFileSize(long j) {
        if (j > 0) {
            this.mFileSize.setVisibility(0);
            this.mFileSize.setText(FormatUtil.formatFileSize(getContext(), j));
            return;
        }
        this.mFileSize.setVisibility(8);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mFileSize = (TextView) findViewById(R.id.file_size);
    }
}
