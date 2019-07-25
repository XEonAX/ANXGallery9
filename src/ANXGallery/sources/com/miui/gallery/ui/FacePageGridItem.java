package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.RectF;
import android.net.Uri;
import android.util.AttributeSet;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.nostra13.universalimageloader.core.DisplayImageOptions;

public class FacePageGridItem extends MicroThumbGridItem {
    public FacePageGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF) {
        BindImageHelper.bindImage(str, uri, NetworkUtils.isActiveNetworkMetered() ? DownloadType.MICRO : DownloadType.THUMBNAIL, this.mImageView, displayImageOptions, this.mImageSize, rectF, true, true);
    }
}
