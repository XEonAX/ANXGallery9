package com.miui.gallery.model;

import android.content.Context;
import com.miui.gallery.provider.FavoritesManager;
import com.miui.gallery.util.PhotoOperationsUtil;
import java.io.File;

public class StorageItem extends BaseDataItem {
    public StorageItem() {
        this.mSize = -1;
        this.mCreateTime = -1;
    }

    public long getCreateTime() {
        if (this.mCreateTime == -1) {
            this.mCreateTime = new File(getOriginalPath()).lastModified();
        }
        return this.mCreateTime;
    }

    public PhotoDetailInfo getDetailInfo(Context context) {
        PhotoDetailInfo detailInfo = super.getDetailInfo(context);
        if (isVideo()) {
            PhotoDetailInfo.extractVideoAttr(detailInfo, getOriginalPath());
        } else {
            PhotoDetailInfo.extractExifInfo(detailInfo, getOriginalPath(), true);
        }
        return detailInfo;
    }

    public FavoriteInfo getFavoriteInfo(boolean z) {
        return FavoritesManager.queryFavoriteInfoByFilePath(getOriginalPath(), z);
    }

    public long getSize() {
        if (this.mSize == -1) {
            this.mSize = new File(getOriginalPath()).length();
        }
        return this.mSize;
    }

    public int initSupportOperations() {
        return isVideo() ? PhotoOperationsUtil.getVideoSupportedOperations(getOriginalPath()) : PhotoOperationsUtil.getImageSupportedOperations(getOriginalPath(), getMimeType(), this.mLatitude, this.mLongitude);
    }
}
