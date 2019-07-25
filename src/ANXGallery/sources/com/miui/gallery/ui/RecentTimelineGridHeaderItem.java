package com.miui.gallery.ui;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class RecentTimelineGridHeaderItem extends RelativeLayout implements CheckableView {
    protected TextView mAlbumFrom;
    protected TextView mDateTime;
    protected TextView mFileCount;
    protected View mSelectGroupOrNot;
    protected View mSelectGroupOrNotContainer;

    public RecentTimelineGridHeaderItem(Context context, AttributeSet attributeSet) {
        super(context);
        setLayoutDirection(3);
    }

    /* access modifiers changed from: protected */
    public void bindAlbumFrom(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            this.mAlbumFrom.setVisibility(8);
            return;
        }
        this.mAlbumFrom.setVisibility(0);
        this.mAlbumFrom.setText(getResources().getString(R.string.album_from_format, new Object[]{str}));
        if (z) {
            this.mAlbumFrom.setCompoundDrawablePadding(0);
            this.mAlbumFrom.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, 0, 0);
        }
    }

    public void bindData(String str, int i, String str2, boolean z) {
        bindTimeLabel(str);
        bindFileCount(i);
        bindAlbumFrom(str2, z);
    }

    /* access modifiers changed from: protected */
    public void bindFileCount(int i) {
        this.mFileCount.setText(getContext().getResources().getQuantityString(R.plurals.photo_count_format, i, new Object[]{Integer.valueOf(i)}));
    }

    /* access modifiers changed from: protected */
    public void bindTimeLabel(String str) {
        if (str != null) {
            this.mDateTime.setText(str);
        } else {
            this.mDateTime.setText("");
        }
    }

    public boolean isChecked() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mDateTime = (TextView) findViewById(R.id.datetime);
        this.mFileCount = (TextView) findViewById(R.id.file_count);
        this.mAlbumFrom = (TextView) findViewById(R.id.album_from);
        this.mSelectGroupOrNot = findViewById(R.id.do_select);
        ((TextView) this.mSelectGroupOrNot).setText(miui.R.string.select_all);
        this.mSelectGroupOrNotContainer = findViewById(R.id.do_select_container);
    }

    public void setAlbumFromClickedListener(OnClickListener onClickListener) {
        this.mAlbumFrom.setOnClickListener(onClickListener);
    }

    public void setCheckable(boolean z) {
        if (z) {
            this.mSelectGroupOrNotContainer.setVisibility(0);
            this.mAlbumFrom.setVisibility(8);
            return;
        }
        this.mSelectGroupOrNotContainer.setVisibility(8);
        this.mAlbumFrom.setVisibility(0);
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
