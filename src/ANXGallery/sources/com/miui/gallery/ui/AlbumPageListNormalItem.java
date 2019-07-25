package com.miui.gallery.ui;

import android.content.Context;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.SyncUtil;
import com.nostra13.universalimageloader.core.DisplayImageOptions;

public class AlbumPageListNormalItem extends AlbumPageListItemBase {
    private ImageView mAlbumCover;
    private View mAlbumCoverContainer;
    protected View mAlbumIndicatorContainer;
    protected View mAlbumTypeIndicator;
    private View mAutoUploadedInfo;
    private View mHiddenMask;

    public AlbumPageListNormalItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void adjustAlbumCoverContainerPadding(boolean z, boolean z2) {
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.horizontal_spacing_secondary);
        View view = this.mAlbumCoverContainer;
        int paddingStart = this.mAlbumCoverContainer.getPaddingStart();
        int i = 1;
        int i2 = (z ? 2 : 1) * dimensionPixelSize;
        int paddingEnd = this.mAlbumCoverContainer.getPaddingEnd();
        if (z2) {
            i = 2;
        }
        view.setPaddingRelative(paddingStart, i2, paddingEnd, dimensionPixelSize * i);
    }

    public void bindForceTopIcon(boolean z) {
        super.bindForceTopIcon(z);
        if (z && this.mAutoUploadedInfo.getVisibility() == 0) {
            this.mForceTop.setCompoundDrawablesWithIntrinsicBounds(getResources().getDrawable(R.drawable.info_divider), null, null, null);
        }
    }

    public void bindHiddenMask(boolean z) {
        this.mHiddenMask.setVisibility(z ? 0 : 8);
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions) {
        BindImageHelper.bindImage(str, uri, DownloadType.MICRO, this.mAlbumCover, displayImageOptions, ThumbConfig.get().sMicroTargetSize);
    }

    public void bindIndicator(boolean z, boolean z2, boolean z3, boolean z4, boolean z5) {
        if (z) {
            ((ImageView) this.mAlbumTypeIndicator).setImageResource(R.drawable.type_indicator_recent_album);
        } else if (z2) {
            ((ImageView) this.mAlbumTypeIndicator).setImageResource(R.drawable.type_indicator_video_album);
        } else if (z3) {
            ((ImageView) this.mAlbumTypeIndicator).setImageResource(R.drawable.type_indicator_favorites);
        }
        int i = 8;
        this.mAlbumTypeIndicator.setVisibility((z2 || z || z3) ? 0 : 8);
        this.mAlbumIndicatorContainer.setVisibility((z2 || z || z3) ? 0 : 8);
        View view = this.mAutoUploadedInfo;
        if (!z5 && !z4 && SyncUtil.existXiaomiAccount(getContext())) {
            i = 0;
        }
        view.setVisibility(i);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mAlbumCover = (ImageView) findViewById(R.id.album_cover);
        this.mAlbumIndicatorContainer = findViewById(R.id.album_indicator);
        this.mAlbumTypeIndicator = findViewById(R.id.album_type_indicator);
        this.mHiddenMask = findViewById(R.id.hidden_album_mask);
        this.mAutoUploadedInfo = findViewById(R.id.album_auto_upload_info);
        this.mAlbumCoverContainer = findViewById(R.id.album_cover_container);
    }
}
