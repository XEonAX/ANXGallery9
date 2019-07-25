package com.miui.gallery.model;

import android.content.Context;
import com.miui.gallery.provider.FavoritesManager;
import com.miui.gallery.util.PhotoOperationsUtil;

public class MediaItem extends BaseDataItem {
    public PhotoDetailInfo getDetailInfo(Context context) {
        PhotoDetailInfo detailInfo = super.getDetailInfo(context);
        PhotoDetailInfo.extractExifInfo(detailInfo, getOriginalPath(), false);
        return detailInfo;
    }

    public FavoriteInfo getFavoriteInfo(boolean z) {
        return FavoritesManager.queryFavoriteInfoByFilePath(getOriginalPath(), z);
    }

    public int initSupportOperations() {
        return isVideo() ? PhotoOperationsUtil.getVideoSupportedOperations(getOriginalPath()) : PhotoOperationsUtil.getImageSupportedOperations(getOriginalPath(), getMimeType(), this.mLatitude, this.mLongitude);
    }
}
