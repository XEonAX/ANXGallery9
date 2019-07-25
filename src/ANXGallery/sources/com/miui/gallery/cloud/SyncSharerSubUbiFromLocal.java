package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.data.DBShareSubUbiImage;

public class SyncSharerSubUbiFromLocal extends SyncSubUbifocusFromLocalBase {
    public SyncSharerSubUbiFromLocal(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken, false);
    }

    /* access modifiers changed from: protected */
    public DBItem generateDBImage(Cursor cursor) {
        return new DBShareSubUbiImage(cursor);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI;
    }
}
