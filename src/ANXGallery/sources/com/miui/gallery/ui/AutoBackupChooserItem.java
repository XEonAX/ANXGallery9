package com.miui.gallery.ui;

import android.content.Context;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.FormatUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import miui.widget.SlidingButton;

public class AutoBackupChooserItem extends RelativeLayout {
    private ImageView mAlbumCover;
    private TextView mAlbumName;
    private TextView mAlbumPhotoCountAndSize;
    private SlidingButton mCheckBox;

    public AutoBackupChooserItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindCheckBox(OnCheckedChangeListener onCheckedChangeListener, boolean z, boolean z2) {
        this.mCheckBox.setOnPerformCheckedChangeListener(onCheckedChangeListener);
        this.mCheckBox.setEnabled(z);
        this.mCheckBox.setChecked(z2);
    }

    public void bindCommonInfo(String str, int i, long j) {
        this.mAlbumName.setText(str);
        this.mAlbumPhotoCountAndSize.setText(getContext().getResources().getQuantityString(R.plurals.album_count_and_size, i, new Object[]{Integer.valueOf(i), FormatUtil.formatFileSize(getContext(), j)}));
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions) {
        BindImageHelper.bindImage(str, uri, DownloadType.MICRO, this.mAlbumCover, displayImageOptions, ThumbConfig.get().sMicroTargetSize);
    }

    public boolean getCheckBoxCheckedState() {
        return this.mCheckBox.isChecked();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mAlbumName = (TextView) findViewById(R.id.album_name);
        this.mAlbumPhotoCountAndSize = (TextView) findViewById(R.id.album_photo_count_and_size);
        this.mAlbumCover = (ImageView) findViewById(R.id.album_cover);
        this.mCheckBox = findViewById(R.id.check_box);
    }

    public void reverseCheckBoxCheckedState() {
        this.mCheckBox.setChecked(!this.mCheckBox.isChecked());
    }
}
