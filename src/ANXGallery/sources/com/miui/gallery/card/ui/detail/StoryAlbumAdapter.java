package com.miui.gallery.card.ui.detail;

import android.content.Context;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.google.android.flexbox.FlexboxLayoutManager.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.adapter.BaseMediaAdapter;
import com.miui.gallery.card.core.LayoutParamsHelper;
import com.miui.gallery.card.core.LayoutParamsHelper.Size;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.util.List;

public class StoryAlbumAdapter extends BaseMediaAdapter<BaseViewHolder> {
    public static final String[] PROJECTION = {"_id", "alias_micro_thumbnail", "thumbnailFile", "localFile", "mimeType", "alias_create_time", "location", "size", "exifImageWidth", "exifImageLength", "duration", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "sha1", "alias_sync_state", "alias_clear_thumbnail", "alias_is_favorite", "exifOrientation"};
    private DisplayImageOptions mDisplayImageOptions = new Builder().cacheInMemory(true).cacheOnDisk(true).loadFromMicroCache(true).considerExifParams(true).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).showImageOnLoading((int) R.drawable.image_default_cover).build();
    private LayoutParamsHelper mLayoutParamsHelper;

    public StoryAlbumAdapter(Context context) {
        super(context);
    }

    private void updateLayoutParams(LayoutParams layoutParams, ImageSize imageSize) {
        if (imageSize != null) {
            layoutParams.setHeight(imageSize.getHeight());
            layoutParams.setWidth(imageSize.getWidth());
        }
        layoutParams.setFlexGrow(1.0f);
    }

    public void doBindViewHolder(BaseViewHolder baseViewHolder, int i) {
        StoryRecyclerViewItem storyRecyclerViewItem = (StoryRecyclerViewItem) baseViewHolder.itemView;
        storyRecyclerViewItem.setTag(R.id.tag_item_position, Integer.valueOf(i));
        ImageSize layoutSize = this.mLayoutParamsHelper.getLayoutSize(i);
        storyRecyclerViewItem.setImageSize(layoutSize);
        storyRecyclerViewItem.bindImage(getClearThumbFilePath(i), getDownloadUri(i), DownloadType.THUMBNAIL, this.mDisplayImageOptions);
        ViewGroup.LayoutParams layoutParams = storyRecyclerViewItem.getLayoutParams();
        if (layoutParams instanceof LayoutParams) {
            updateLayoutParams((LayoutParams) layoutParams, layoutSize);
        }
    }

    public String getClearThumbFilePath(int i) {
        String originFilePath = getOriginFilePath(i);
        if (TextUtils.isEmpty(originFilePath)) {
            originFilePath = getThumbFilePath(i);
        }
        return TextUtils.isEmpty(originFilePath) ? getMicroThumbFilePath(i) : originFilePath;
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(moveCursorToPosition(i), 16, 0);
    }

    public long getFileLength(int i) {
        return moveCursorToPosition(i).getLong(7);
    }

    public RectF getItemDecodeRectF(int i) {
        return null;
    }

    public long getItemKey(int i) {
        return moveCursorToPosition(i).getLong(0);
    }

    public String getLocalPath(int i) {
        return getMicroPath(moveCursorToPosition(i), 1, 15);
    }

    public String getMicroThumbFilePath(int i) {
        return moveCursorToPosition(i).getString(1);
    }

    public String getMimeType(int i) {
        return moveCursorToPosition(i).getString(4);
    }

    public String getOriginFilePath(int i) {
        return moveCursorToPosition(i).getString(3);
    }

    public String getSha1(int i) {
        return moveCursorToPosition(i).getString(15);
    }

    public String getThumbFilePath(int i) {
        return moveCursorToPosition(i).getString(2);
    }

    public BaseViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new StoryAlbumViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.story_album_item, viewGroup, false));
    }

    public void onViewRecycled(BaseViewHolder baseViewHolder) {
        super.onViewRecycled(baseViewHolder);
    }

    public void updateLayoutSizes(List<Size> list, int i, int i2) {
        if (this.mLayoutParamsHelper == null) {
            this.mLayoutParamsHelper = new LayoutParamsHelper();
        }
        this.mLayoutParamsHelper.updateLayoutSizes(list, i, i2);
        notifyDataSetChanged();
    }
}
