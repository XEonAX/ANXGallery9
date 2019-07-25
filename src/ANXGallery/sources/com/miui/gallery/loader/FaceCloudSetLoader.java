package com.miui.gallery.loader;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.data.LocationUtil;
import com.miui.gallery.model.BaseCloudDataSet;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.CloudItem;
import com.miui.gallery.model.CursorDataSet;

public class FaceCloudSetLoader extends CloudSetLoader {
    private static final String[] PROJECTION = {"photo_id", "microthumbfile", "thumbnailFile", "localFile", "mimeType", " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ", "location", "size", "exifImageWidth", "exifImageLength", "duration", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "localGroupId", "secretKey", "sha1", "photo_server_id", "exifOrientation", "isFavorite"};

    private static class CloudDataSet extends BaseCloudDataSet {
        public CloudDataSet(Cursor cursor, int i, int i2, long j, String str) {
            super(cursor, i, i2, j, str);
        }

        /* access modifiers changed from: protected */
        public void bindItem(BaseDataItem baseDataItem, int i) {
            if (isValidate(i)) {
                this.mCursor.moveToPosition(i);
                baseDataItem.setKey(this.mCursor.getLong(0)).setMicroPath(this.mCursor.getString(1)).setThumbPath(this.mCursor.getString(2)).setFilePath(this.mCursor.getString(3)).setMimeType(this.mCursor.getString(4)).setCreateTime(this.mCursor.getLong(5)).setLocation(this.mCursor.getString(6)).setSize(this.mCursor.getLong(7)).setWidth(this.mCursor.getInt(8)).setHeight(this.mCursor.getInt(9)).setDuration(this.mCursor.getInt(10)).setSecretKey(this.mCursor.getBlob(16));
                String string = this.mCursor.getString(11);
                if (!TextUtils.isEmpty(string)) {
                    String string2 = this.mCursor.getString(12);
                    String string3 = this.mCursor.getString(13);
                    String string4 = this.mCursor.getString(14);
                    baseDataItem.setLatitude(LocationUtil.convertRationalLatLonToDouble(string, string2));
                    baseDataItem.setLongitude(LocationUtil.convertRationalLatLonToDouble(string3, string4));
                }
                CloudItem cloudItem = (CloudItem) baseDataItem;
                cloudItem.setId(this.mCursor.getLong(0)).setSynced(true).setSha1(this.mCursor.getString(17)).setLocalGroupId(this.mCursor.getLong(15));
                String string5 = this.mCursor.getString(18);
                cloudItem.setServerId(string5);
                cloudItem.setHasFace(!TextUtils.isEmpty(string5));
                cloudItem.setOrientation(this.mCursor.getInt(19));
                cloudItem.setIsFavorite(this.mCursor.getInt(20));
            }
        }

        /* access modifiers changed from: protected */
        public boolean foldBurst() {
            return false;
        }

        public long getItemKey(int i) {
            if (!isValidate(i)) {
                return -1;
            }
            this.mCursor.moveToPosition(i);
            return this.mCursor.getLong(0);
        }

        /* access modifiers changed from: protected */
        public String getItemPath(int i) {
            if (!isValidate(i)) {
                return null;
            }
            this.mCursor.moveToPosition(i);
            return this.mCursor.getString(3);
        }

        /* access modifiers changed from: protected */
        public boolean isAlbumRemovable() {
            return false;
        }
    }

    public FaceCloudSetLoader(Context context, Uri uri, Bundle bundle) {
        super(context, uri, bundle);
        this.mUnfoldBurst = true;
    }

    /* access modifiers changed from: protected */
    public String[] getProjection() {
        return PROJECTION;
    }

    public String getTAG() {
        return "FaceCloudSetLoader";
    }

    /* access modifiers changed from: protected */
    public CursorDataSet wrapDataSet(Cursor cursor) {
        CloudDataSet cloudDataSet = new CloudDataSet(cursor, this.mInitPos, getOperationDupType(), this.mAlbumId, this.mAlbumName);
        return cloudDataSet;
    }
}
