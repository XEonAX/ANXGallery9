package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class BabyAlbumDetailFaceHeaderItem extends LinearLayout {
    private static Builder sDisplayImageOptionBuilder;
    private static DisplayImageOptions sDisplayImageOptionsLocalFace;
    private static DisplayImageOptions sDisplayImageOptionsNetFace;
    private TextView mAgeCurrent;
    private ImageView mBackground;
    private ImageView mFace;
    private ImageViewAware mImageAwareFace;

    public BabyAlbumDetailFaceHeaderItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void intialBuilder() {
        if (sDisplayImageOptionBuilder == null) {
            sDisplayImageOptionBuilder = new Builder().considerExifParams(true).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(true)).usingRegionDecoderFace(true).showStubImage(R.drawable.baby_album_sharer_default_big);
        }
    }

    public void bindHeadFacePic(String str, RectF rectF) {
        ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(str), this.mImageAwareFace, sDisplayImageOptionsLocalFace, null, null, null, rectF);
    }

    public void bindHeadFacePicFromNet(String str, RectF rectF) {
        if (sDisplayImageOptionsNetFace == null) {
            intialBuilder();
            sDisplayImageOptionsNetFace = sDisplayImageOptionBuilder.cacheOnDisc().build();
        }
        ImageLoader.getInstance().displayImage(str, this.mImageAwareFace, sDisplayImageOptionsNetFace, null, null, null, rectF);
    }

    public void bindHeaderBackgroundPic(String str, Uri uri, DisplayImageOptions displayImageOptions) {
        BindImageHelper.bindImage(str, uri, DownloadType.THUMBNAIL, this.mBackground, displayImageOptions, (ImageSize) null);
    }

    public Bitmap getHeadFacePic() {
        return this.mImageAwareFace.getBitmap();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mBackground = (ImageView) findViewById(R.id.background);
        this.mFace = (ImageView) findViewById(R.id.face);
        this.mImageAwareFace = new ImageViewAware(this.mFace);
        this.mAgeCurrent = (TextView) findViewById(R.id.age_current);
        if (sDisplayImageOptionsLocalFace == null) {
            intialBuilder();
            sDisplayImageOptionsLocalFace = sDisplayImageOptionBuilder.cacheThumbnail(true).loadFromMicroCache(true).build();
        }
    }

    public void setAge(String str) {
        this.mAgeCurrent.setText(str);
    }

    public void setOnBackgroundClickListener(OnClickListener onClickListener) {
        this.mBackground.setOnClickListener(onClickListener);
    }

    public void setOnFaceClickListener(OnClickListener onClickListener) {
        this.mFace.setOnClickListener(onClickListener);
    }
}
