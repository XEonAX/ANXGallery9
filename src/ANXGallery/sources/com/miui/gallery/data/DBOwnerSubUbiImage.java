package com.miui.gallery.data;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.data.DBImage.SubUbiImage;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.UbiFocusUtils;
import com.miui.gallery.util.UpdateHelper;
import org.json.JSONObject;

public class DBOwnerSubUbiImage extends DBImage implements SubUbiImage {
    private boolean mHasQuery;
    private String mUbiLocalId;
    private String mUbiServerId;

    public DBOwnerSubUbiImage(Cursor cursor) {
        super(cursor);
    }

    public String getAlbumId() {
        return String.valueOf(getGroupId());
    }

    public Uri getBaseUri() {
        return GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI;
    }

    public String getRequestId() {
        return getUbiServerId();
    }

    public int getSubUbiImageCount() {
        if (super.getSubUbiImageCount() <= 0 && !this.mHasQuery) {
            this.mHasQuery = true;
            setSubUbiImageCount(UbiFocusUtils.getSubUbiCount(false, getRequestId(), getUbiLocalId()));
        }
        return super.getSubUbiImageCount();
    }

    public String getTagId() {
        StringBuilder sb = new StringBuilder();
        sb.append("DBOwnerSubUbiImage");
        sb.append(getId());
        return sb.toString();
    }

    public String getUbiLocalId() {
        return this.mUbiLocalId;
    }

    public String getUbiServerId() {
        if (TextUtils.isEmpty(this.mUbiServerId)) {
            this.mUbiServerId = UbiFocusUtils.getUbiServerIdByUbiLocalId(this.mUbiLocalId, false);
        }
        return this.mUbiServerId;
    }

    public boolean isShareItem() {
        return false;
    }

    public boolean isSubUbiFocus() {
        return true;
    }

    public boolean reloadData(Cursor cursor) {
        boolean reloadData = super.reloadData(cursor);
        UpdateHelper updateHelper = new UpdateHelper();
        this.mDownloadFileAddTime = updateHelper.update(this.mDownloadFileAddTime, cursor.getLong(46));
        this.mMixedDateTime = updateHelper.update(this.mMixedDateTime, cursor.getLong(47));
        this.mUbiServerId = (String) updateHelper.update(this.mUbiServerId, GalleryDBHelper.getCursorString(cursor, 48));
        this.mUbiLocalId = (String) updateHelper.update(this.mUbiLocalId, GalleryDBHelper.getCursorString(cursor, 49));
        this.mUbiSubIndex = updateHelper.update(this.mUbiSubIndex, cursor.getInt(50));
        byte[] update = updateHelper.update(this.mSecretKey, cursor.getBlob(51));
        if (update != null) {
            this.mSecretKey = update;
        }
        return reloadData || updateHelper.isUpdated();
    }

    public void setRequestAlbumId(String str) {
        setGroupId(Long.valueOf(str).longValue());
    }

    public JSONObject toJSONObject() {
        JSONObject jSONObject = super.toJSONObject();
        return jSONObject == null ? new JSONObject() : jSONObject;
    }
}
