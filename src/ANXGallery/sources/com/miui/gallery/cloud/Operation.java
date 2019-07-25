package com.miui.gallery.cloud;

import android.accounts.Account;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncResult;

public interface Operation<T> {
    GallerySyncResult<T> execute(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str, RequestItemBase requestItemBase) throws Exception;
}
