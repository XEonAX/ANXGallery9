package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.data.DBShareAlbum;
import java.util.ArrayList;
import java.util.List;

public class SyncShareAlbumFromLocal extends SyncFromLocalBase {
    private List<RequestSharerAlbumItem> mEditedItems;

    public SyncShareAlbumFromLocal(Context context, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        super(context, account, galleryExtendedAuthToken);
    }

    private boolean shouldSyncEdit(DBShareAlbum dBShareAlbum) {
        boolean z = false;
        if (dBShareAlbum.getLocalFlag() != 0) {
            return false;
        }
        String editedColumns = dBShareAlbum.getEditedColumns();
        String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(25);
        if (!TextUtils.isEmpty(editedColumns) && editedColumns.contains(transformToEditedColumnsElement)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public DBItem generateDBImage(Cursor cursor) {
        return new DBShareAlbum(cursor);
    }

    /* access modifiers changed from: protected */
    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_ALBUM_URI;
    }

    /* access modifiers changed from: protected */
    public String getSelectionClause() {
        return String.format(" (%s) ", new Object[]{CloudUtils.SELECTION_NOT_SYNCED_OR_EDITED});
    }

    /* access modifiers changed from: protected */
    public void handleRequestCloudItemList() throws Exception {
        if (this.mEditedItems.size() > 0) {
            RetryOperation.doOperation(this.mContext, this.mAccount, this.mExtendedAuthToken, this.mEditedItems, new EditShareAlbum(this.mContext));
        }
    }

    /* access modifiers changed from: protected */
    public void initRequestCloudItemList() {
        this.mEditedItems = new ArrayList();
    }

    /* access modifiers changed from: protected */
    public void putToRequestCloudItemList(DBItem dBItem) {
        DBShareAlbum dBShareAlbum = (DBShareAlbum) dBItem;
        if (shouldSyncEdit(dBShareAlbum)) {
            this.mEditedItems.add(new RequestSharerAlbumItem(0, dBShareAlbum));
        }
    }
}
