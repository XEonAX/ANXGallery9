package com.miui.gallery.loader;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.model.BaseCloudDataSet;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.CloudItem;
import com.miui.gallery.model.CursorDataSet;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.util.BurstFilterCursor;
import com.miui.gallery.util.MediaCursorHelper;
import java.util.ArrayList;

public class CloudSetLoader extends CursorSetLoader {
    protected long mAlbumId = -1;
    protected String mAlbumName;
    protected int mInitPos;
    protected String mOrderBy;
    protected String mSelection;
    protected String[] mSelectionArgs;
    protected boolean mUnfoldBurst;
    protected Uri mUri;

    protected static class CloudDataSet extends BaseCloudDataSet {
        public CloudDataSet(Cursor cursor, int i, int i2, long j, String str) {
            super(cursor, i, i2, j, str);
        }

        private void wrapItemByCursor(BaseDataItem baseDataItem, Cursor cursor) {
            long mediaId = MediaCursorHelper.getMediaId(cursor);
            baseDataItem.setKey(mediaId).setMicroPath(MediaCursorHelper.getMicroThumbnailPath(cursor)).setThumbPath(MediaCursorHelper.getThumbnailPath(cursor)).setFilePath(MediaCursorHelper.getFilePath(cursor)).setMimeType(MediaCursorHelper.getMimeType(cursor)).setCreateTime(MediaCursorHelper.getCreateTime(cursor)).setLocation(MediaCursorHelper.getLocation(cursor)).setSize(MediaCursorHelper.getSize(cursor)).setWidth(MediaCursorHelper.getWidth(cursor)).setHeight(MediaCursorHelper.getHeight(cursor)).setDuration(MediaCursorHelper.getDuration(cursor)).setSecretKey(MediaCursorHelper.getSecretKey(cursor)).setLatitude(MediaCursorHelper.getLatitude(cursor)).setLongitude(MediaCursorHelper.getLongitude(cursor)).setOrientation(MediaCursorHelper.getOrientation(cursor)).setTitle(MediaCursorHelper.getTitle(cursor));
            CloudItem cloudItem = (CloudItem) baseDataItem;
            cloudItem.setId(mediaId).setSynced(MediaCursorHelper.isSynced(cursor)).setSha1(MediaCursorHelper.getSha1(cursor)).setShare(ShareMediaManager.isOtherShareMediaId(mediaId)).setCreatorId(MediaCursorHelper.getCreator(cursor)).setIsFavorite(MediaCursorHelper.isFavorite(cursor)).setServerId(MediaCursorHelper.getServerId(cursor));
            cloudItem.setLocalGroupId(MediaCursorHelper.getAlbumId(cursor));
        }

        /* access modifiers changed from: protected */
        public void bindItem(BaseDataItem baseDataItem, int i) {
            if (moveToPosition(i)) {
                wrapItemByCursor(baseDataItem, this.mCursor);
                if (foldBurst()) {
                    BurstFilterCursor burstFilterCursor = (BurstFilterCursor) this.mCursor;
                    if (burstFilterCursor.isBurstPosition(i)) {
                        ArrayList arrayList = new ArrayList();
                        int contentCursorPosition = burstFilterCursor.getContentCursorPosition(i);
                        int burstCount = (burstFilterCursor.getBurstCount(i) + contentCursorPosition) - 1;
                        while (contentCursorPosition <= burstCount) {
                            Cursor contentCursorAtPosition = burstFilterCursor.getContentCursorAtPosition(contentCursorPosition);
                            CloudItem cloudItem = new CloudItem();
                            wrapItemByCursor(cloudItem, contentCursorAtPosition);
                            arrayList.add(cloudItem);
                            contentCursorPosition++;
                        }
                        baseDataItem.setBurstItem(true);
                        baseDataItem.setBurstGroup(arrayList);
                        baseDataItem.setSpecialTypeFlags(64);
                    }
                }
            }
        }

        /* access modifiers changed from: protected */
        public int burstKeyIndex() {
            return 23;
        }

        /* access modifiers changed from: protected */
        public boolean foldBurst() {
            return true;
        }

        public long getItemKey(int i) {
            if (moveToPosition(i)) {
                return MediaCursorHelper.getMediaId(this.mCursor);
            }
            return -1;
        }

        /* access modifiers changed from: protected */
        public String getItemPath(int i) {
            if (moveToPosition(i)) {
                return MediaCursorHelper.getFilePath(this.mCursor);
            }
            return null;
        }
    }

    protected static class UnfoldBurstCloudDataSet extends CloudDataSet {
        public UnfoldBurstCloudDataSet(Cursor cursor, int i, int i2, long j, String str) {
            super(cursor, i, i2, j, str);
        }

        /* access modifiers changed from: protected */
        public int burstKeyIndex() {
            return 0;
        }

        /* access modifiers changed from: protected */
        public boolean foldBurst() {
            return false;
        }
    }

    public CloudSetLoader(Context context, Uri uri, Bundle bundle) {
        super(context);
        this.mUri = uri;
        if (bundle != null) {
            this.mInitPos = bundle.getInt("photo_init_position", 0);
            this.mSelection = bundle.getString("photo_selection", null);
            this.mSelectionArgs = bundle.getStringArray("photo_selection_args");
            this.mOrderBy = bundle.getString("photo_order_by", null);
            this.mAlbumName = bundle.getString("album_name", null);
            this.mAlbumId = bundle.getLong("album_id", -1);
            this.mUnfoldBurst = bundle.getBoolean("unford_burst", false);
        }
    }

    private static boolean isStoryAlbum(long j) {
        return j == 2147483640;
    }

    private static boolean isVirtualAlbum(long j) {
        return j == 2147483647L || j == 2147483645 || j == 2147483642;
    }

    /* access modifiers changed from: protected */
    public int getOperationDupType() {
        if (!this.mUri.getBooleanQueryParameter("remove_duplicate_items", false)) {
            return 0;
        }
        if (isVirtualAlbum(this.mAlbumId) || isStoryAlbum(this.mAlbumId)) {
            return 3;
        }
        return this.mAlbumId != -1 ? 2 : 1;
    }

    /* access modifiers changed from: protected */
    public String getOrder() {
        return TextUtils.isEmpty(this.mOrderBy) ? "alias_create_time DESC " : this.mOrderBy;
    }

    /* access modifiers changed from: protected */
    public String[] getProjection() {
        return MediaCursorHelper.PROJECTION;
    }

    /* access modifiers changed from: protected */
    public String getSelection() {
        return this.mSelection;
    }

    /* access modifiers changed from: protected */
    public String[] getSelectionArgs() {
        return this.mSelectionArgs;
    }

    public String getTAG() {
        return "CloudSetLoader";
    }

    /* access modifiers changed from: protected */
    public Uri getUri() {
        return this.mUri == null ? Media.URI : this.mUri;
    }

    /* access modifiers changed from: protected */
    public CursorDataSet wrapDataSet(Cursor cursor) {
        if (this.mUnfoldBurst) {
            UnfoldBurstCloudDataSet unfoldBurstCloudDataSet = new UnfoldBurstCloudDataSet(cursor, this.mInitPos, getOperationDupType(), this.mAlbumId, this.mAlbumName);
            return unfoldBurstCloudDataSet;
        }
        CloudDataSet cloudDataSet = new CloudDataSet(cursor, this.mInitPos, getOperationDupType(), this.mAlbumId, this.mAlbumName);
        return cloudDataSet;
    }
}
