package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.data.DBOwnerSubUbiImage;

public class SyncOwnerSubUbiFromLocal extends SyncSubUbifocusFromLocalBase {
    public SyncOwnerSubUbiFromLocal(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, boolean z) {
        super(context, account, galleryExtendedAuthToken, z);
    }

    /* access modifiers changed from: protected */
    public DBItem generateDBImage(Cursor cursor) {
        return new DBOwnerSubUbiImage(cursor);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI;
    }
}
