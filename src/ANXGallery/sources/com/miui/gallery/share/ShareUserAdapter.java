package com.miui.gallery.share;

import android.content.Context;
import android.graphics.Bitmap.Config;
import com.miui.gallery.R;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.display.RoundedBitmapDisplayer;

public class ShareUserAdapter extends ShareUserAdapterBase {
    private final boolean mAddSahrer;

    public ShareUserAdapter(Context context, boolean z, String str) {
        super(context, str, R.layout.share_user_item);
        this.mAddSahrer = z;
    }

    /* access modifiers changed from: protected */
    public int getAbsentSharerIcon(CloudUserCacheEntry cloudUserCacheEntry) {
        return R.drawable.add_sharer;
    }

    public int getCount() {
        return this.mShareUsers.size() + (this.mAddSahrer ? 1 : 0);
    }

    /* access modifiers changed from: protected */
    public int getDefaultIcon(CloudUserCacheEntry cloudUserCacheEntry) {
        return R.drawable.ic_contact_photo_default;
    }

    /* access modifiers changed from: protected */
    public int getIconEffect() {
        return R.drawable.ic_contact_photo_effect;
    }

    /* access modifiers changed from: protected */
    public void intialDisplayOptions() {
        this.mDefaultDisplayImageOptions = new Builder().cacheThumbnail(true).considerExifParams(true).loadFromMicroCache(true).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new RoundedBitmapDisplayer(10, 0)).showImageOnLoading((int) R.drawable.ic_contact_photo_default).build();
    }
}
