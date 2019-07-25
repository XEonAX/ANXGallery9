package com.miui.gallery.share.baby;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap.Config;
import android.text.TextUtils;
import android.view.ViewGroup.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.share.CloudUserCacheEntry;
import com.miui.gallery.share.ShareUserAdapterBase;
import com.miui.gallery.share.UserInfo;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;

public class BabyAlbumShareUserAdapter extends ShareUserAdapterBase {
    private static int sParentIconSize;

    public BabyAlbumShareUserAdapter(Context context, String str) {
        super(context, str, R.layout.baby_album_share_user_item);
        if (sParentIconSize == 0) {
            sParentIconSize = (int) context.getResources().getDimension(R.dimen.baby_album_sharer_parents_icon_size);
        }
    }

    private boolean isSharerParent(CloudUserCacheEntry cloudUserCacheEntry) {
        return cloudUserCacheEntry != null && (TextUtils.equals(cloudUserCacheEntry.mRelation, "father") || TextUtils.equals(cloudUserCacheEntry.mRelation, "mother"));
    }

    /* access modifiers changed from: protected */
    public int getAbsentSharerIcon(CloudUserCacheEntry cloudUserCacheEntry) {
        return isSharerParent(cloudUserCacheEntry) ? R.drawable.baby_album_add_sharer_big : R.drawable.baby_album_add_sharer_small;
    }

    public int getCount() {
        return this.mShareUsers.size();
    }

    /* access modifiers changed from: protected */
    public int getDefaultIcon(CloudUserCacheEntry cloudUserCacheEntry) {
        return isSharerParent(cloudUserCacheEntry) ? R.drawable.baby_album_sharer_default_big : R.drawable.baby_album_sharer_default_small;
    }

    /* access modifiers changed from: protected */
    public String getDisplayName(Resources resources, UserInfo userInfo, CloudUserCacheEntry cloudUserCacheEntry) {
        return (TextUtils.isEmpty(cloudUserCacheEntry.mRelationText) || (userInfo != null && TextUtils.equals(userInfo.getUserId(), GalleryCloudUtils.getAccountName()))) ? super.getDisplayName(resources, userInfo, cloudUserCacheEntry) : cloudUserCacheEntry.mRelationText;
    }

    /* access modifiers changed from: protected */
    public int getIconEffect() {
        return R.drawable.ic_baby_album_sharer_effect;
    }

    public int getItemViewType(int i) {
        CloudUserCacheEntry item = getItem(i);
        if (item != null) {
            if (TextUtils.equals(item.mRelation, "father")) {
                return 0;
            }
            if (TextUtils.equals(item.mRelation, "mother")) {
                return 1;
            }
        }
        return 2;
    }

    public int getViewTypeCount() {
        return 3;
    }

    /* access modifiers changed from: protected */
    public void intialDisplayOptions() {
        this.mDefaultDisplayImageOptions = new Builder().cacheOnDisc().considerExifParams(true).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(true)).showImageOnLoading((int) R.drawable.baby_album_sharer_default_big).build();
    }

    /* access modifiers changed from: protected */
    public void setIconSize(CloudUserCacheEntry cloudUserCacheEntry, LayoutParams layoutParams) {
        if (isSharerParent(cloudUserCacheEntry)) {
            layoutParams.width = sParentIconSize;
            layoutParams.height = sParentIconSize;
            return;
        }
        super.setIconSize(cloudUserCacheEntry, layoutParams);
    }
}
