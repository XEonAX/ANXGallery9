package com.miui.gallery.ui;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public abstract class AlbumPageListItemBase extends RelativeLayout {
    protected TextView mAlbumName;
    protected TextView mAlbumPhotoCount;
    protected TextView mForceTop;
    protected TextView mShareInfo;

    public enum AlbumType {
        NORMAL,
        BABY,
        SHARE,
        OWNER,
        SYSTEM
    }

    public AlbumPageListItemBase(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindCommonInfo(String str, int i, boolean z) {
        String str2;
        this.mAlbumName.setText(str);
        TextView textView = this.mAlbumPhotoCount;
        if (z) {
            str2 = "";
        } else {
            str2 = String.format("%d", new Object[]{Integer.valueOf(i)});
        }
        textView.setText(str2);
    }

    public void bindForceTopIcon(boolean z) {
        this.mForceTop.setVisibility(z ? 0 : 8);
        if (!z) {
            return;
        }
        if (this.mShareInfo.getVisibility() == 0) {
            this.mForceTop.setCompoundDrawablesWithIntrinsicBounds(getResources().getDrawable(R.drawable.info_divider), null, null, null);
        } else {
            this.mForceTop.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
        }
    }

    public void bindType(AlbumType albumType, String str) {
        if (albumType == AlbumType.NORMAL || albumType == AlbumType.SYSTEM || TextUtils.isEmpty(str)) {
            this.mShareInfo.setVisibility(8);
            return;
        }
        this.mShareInfo.setVisibility(0);
        this.mShareInfo.setText(str);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mAlbumName = (TextView) findViewById(R.id.album_name);
        this.mShareInfo = (TextView) findViewById(R.id.album_share_info);
        this.mAlbumPhotoCount = (TextView) findViewById(R.id.album_photo_count);
        this.mForceTop = (TextView) findViewById(R.id.album_force_top_info);
    }
}
