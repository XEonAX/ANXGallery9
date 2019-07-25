package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.RectF;
import android.net.Uri;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.CardUtil;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.BindImageHelper.OnImageLoadingCompleteListener;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.ArrayList;
import java.util.List;

public class CardCoverView extends LinearLayout {
    private ImageView mCoverImageView1;
    private ImageView mCoverImageView2;
    private ImageView mCoverImageView3;
    private ImageView mCoverImageView4;
    private CardNumImageView mCoverImageView5;
    private List<MediaFeatureItem> mMediaFeatureItems;
    private DisplayImageOptions mOptions;
    private LinearLayout mSecondRow;
    private boolean mShouldUpdateViews;
    private LinearLayout mThirdRow;

    public CardCoverView(Context context) {
        this(context, null);
    }

    public CardCoverView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CardCoverView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initViews(context);
    }

    private void bindView(ImageView imageView, String str, Uri uri, DownloadType downloadType, DisplayImageOptions displayImageOptions) {
        BindImageHelper.bindImage(str, uri, downloadType, imageView, displayImageOptions, downloadType == DownloadType.MICRO ? ThumbConfig.get().sMicroTargetSize : null, (RectF) null, false, true, (OnImageLoadingCompleteListener) null);
    }

    private ImageView getCoverImageView(int i, int i2) {
        if (i <= i2) {
            return null;
        }
        switch (i2) {
            case 0:
                return this.mCoverImageView1;
            case 1:
                return this.mCoverImageView2;
            case 2:
                return this.mCoverImageView3;
            case 3:
                if (i == 4) {
                    return null;
                }
                return this.mCoverImageView4;
            case 4:
                return this.mCoverImageView5;
            default:
                return null;
        }
    }

    public static Uri getDownloadUri(int i, long j) {
        if (i == 0) {
            return CloudUriAdapter.getDownloadUri(j);
        }
        return null;
    }

    private static String getImagePath(MediaFeatureItem mediaFeatureItem, DownloadType downloadType) {
        if (mediaFeatureItem == null) {
            return "";
        }
        String originPath = mediaFeatureItem.getOriginPath();
        String thumbnailPath = mediaFeatureItem.getThumbnailPath();
        String microThumbnailPath = mediaFeatureItem.getMicroThumbnailPath();
        if (downloadType == DownloadType.ORIGIN) {
            if (!TextUtils.isEmpty(originPath)) {
                microThumbnailPath = originPath;
            } else if (!TextUtils.isEmpty(thumbnailPath)) {
                microThumbnailPath = thumbnailPath;
            }
            return microThumbnailPath;
        } else if (downloadType == DownloadType.THUMBNAIL) {
            if (!TextUtils.isEmpty(thumbnailPath)) {
                microThumbnailPath = thumbnailPath;
            } else if (!TextUtils.isEmpty(originPath)) {
                microThumbnailPath = originPath;
            }
            return microThumbnailPath;
        } else {
            if (TextUtils.isEmpty(microThumbnailPath)) {
                microThumbnailPath = TextUtils.isEmpty(originPath) ? thumbnailPath : originPath;
            }
            return microThumbnailPath;
        }
    }

    private void initViews(Context context) {
        LinearLayout.inflate(context, R.layout.card_cover_layout, this);
        this.mCoverImageView1 = (ImageView) findViewById(R.id.cover_image1);
        this.mCoverImageView2 = (ImageView) findViewById(R.id.cover_image2);
        this.mCoverImageView3 = (ImageView) findViewById(R.id.cover_image3);
        this.mCoverImageView4 = (ImageView) findViewById(R.id.cover_image4);
        this.mCoverImageView5 = (CardNumImageView) findViewById(R.id.cover_image5);
        this.mSecondRow = (LinearLayout) findViewById(R.id.second_row);
        this.mThirdRow = (LinearLayout) findViewById(R.id.third_row);
        this.mMediaFeatureItems = new ArrayList(5);
    }

    private void updateViews() {
        if (MiscUtil.isValid(this.mMediaFeatureItems) && this.mShouldUpdateViews) {
            this.mShouldUpdateViews = false;
            int size = this.mMediaFeatureItems.size();
            for (int i = 0; i < size; i++) {
                ImageView coverImageView = getCoverImageView(size, i);
                if (coverImageView != null) {
                    MediaFeatureItem mediaFeatureItem = (MediaFeatureItem) this.mMediaFeatureItems.get(i);
                    DownloadType downloadType = CardUtil.getDownloadType(size, i);
                    bindView(coverImageView, getImagePath(mediaFeatureItem, downloadType), getDownloadUri(mediaFeatureItem.getLocalFlag(), mediaFeatureItem.getId()), downloadType, downloadType == DownloadType.THUMBNAIL ? this.mOptions : ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        updateViews();
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, MeasureSpec.makeMeasureSpec((MeasureSpec.getSize(i) - 4) / 2, 1073741824));
    }

    public void setImageCount(int i) {
        if (i <= 1) {
            this.mCoverImageView1.setVisibility(0);
            this.mSecondRow.setVisibility(8);
            this.mThirdRow.setVisibility(8);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).setMargins(0, 0, 0, 0);
        } else if (i == 2) {
            this.mCoverImageView1.setVisibility(0);
            this.mSecondRow.setVisibility(0);
            this.mThirdRow.setVisibility(8);
            this.mCoverImageView3.setVisibility(8);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).setMargins(0, 0, 2, 0);
            ((LayoutParams) this.mCoverImageView2.getLayoutParams()).setMargins(0, 0, 0, 0);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).weight = 1.0f;
            ((LayoutParams) this.mSecondRow.getLayoutParams()).weight = 1.0f;
        } else if (i == 3 || i == 4) {
            this.mCoverImageView1.setVisibility(0);
            this.mSecondRow.setVisibility(0);
            this.mThirdRow.setVisibility(8);
            this.mCoverImageView3.setVisibility(0);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).setMargins(0, 0, 2, 0);
            ((LayoutParams) this.mCoverImageView2.getLayoutParams()).setMargins(0, 0, 0, 2);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).weight = 5.0f;
            ((LayoutParams) this.mSecondRow.getLayoutParams()).weight = 3.0f;
        } else {
            this.mCoverImageView1.setVisibility(0);
            this.mSecondRow.setVisibility(0);
            this.mThirdRow.setVisibility(0);
            this.mCoverImageView3.setVisibility(0);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).setMargins(0, 0, 2, 0);
            ((LayoutParams) this.mCoverImageView2.getLayoutParams()).setMargins(0, 0, 0, 2);
            ((LayoutParams) this.mCoverImageView1.getLayoutParams()).weight = 2.0f;
            ((LayoutParams) this.mSecondRow.getLayoutParams()).weight = 1.0f;
            ((LayoutParams) this.mThirdRow.getLayoutParams()).weight = 1.0f;
            this.mCoverImageView5.setNum(i);
        }
    }

    public void update(int i, DisplayImageOptions displayImageOptions) {
        setImageCount(1);
        this.mCoverImageView1.setImageResource(i);
    }

    public void update(String str, DisplayImageOptions displayImageOptions) {
        setImageCount(1);
        ImageLoader.getInstance().displayImage(str, (ImageAware) new ImageViewAware(this.mCoverImageView1), displayImageOptions);
    }

    public void update(List<MediaFeatureItem> list, DisplayImageOptions displayImageOptions) {
        this.mMediaFeatureItems.clear();
        this.mMediaFeatureItems.addAll(list);
        this.mOptions = displayImageOptions;
        this.mShouldUpdateViews = true;
        requestLayout();
    }
}
