package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.RectF;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miui.gallery.people.PeopleDisplayHelper;
import com.miui.gallery.sdk.download.DownloadType;
import com.nostra13.universalimageloader.core.DisplayImageOptions;

public class FaceDisplayItemPreferFromThumbnailSource extends RelativeLayout {
    protected ImageView mCover;

    public FaceDisplayItemPreferFromThumbnailSource(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF, DownloadType downloadType) {
        PeopleDisplayHelper.bindImage(this.mCover, str, uri, displayImageOptions, rectF, downloadType);
    }
}
