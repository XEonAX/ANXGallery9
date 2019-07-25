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

public class DBShareSubUbiImage extends DBImage implements SubUbiImage {
    private boolean mHasQuery;
    private String mShareId;
    private String mUbiLocalId;
    private String mUbiServerId;

    public DBShareSubUbiImage(Cursor cursor) {
        super(cursor);
    }

    public String getAlbumId() {
        return getShareAlbumId();
    }

    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI;
    }

    public String getRequestId() {
        return getShareId();
    }

    public String getShareId() {
        return this.mShareId;
    }

    public int getSubUbiImageCount() {
        if (super.getSubUbiImageCount() <= 0 && !this.mHasQuery) {
            this.mHasQuery = true;
            setSubUbiImageCount(UbiFocusUtils.getSubUbiCount(true, getRequestId(), getUbiLocalId()));
        }
        return super.getSubUbiImageCount();
    }

    public String getTagId() {
        StringBuilder sb = new StringBuilder();
        sb.append("DBShareSubUbiImage");
        sb.append(getId());
        return sb.toString();
    }

    public String getUbiLocalId() {
        return this.mUbiLocalId;
    }

    public String getUbiServerId() {
        if (TextUtils.isEmpty(this.mUbiServerId)) {
            this.mUbiServerId = UbiFocusUtils.getUbiServerIdByUbiLocalId(this.mUbiLocalId, true);
        }
        return this.mUbiServerId;
    }

    public boolean isShareItem() {
        return true;
    }

    public boolean isSubUbiFocus() {
        return true;
    }

    public boolean reloadData(Cursor cursor) {
        boolean reloadData = super.reloadData(cursor);
        UpdateHelper updateHelper = new UpdateHelper();
        this.mCreatorId = (String) updateHelper.update(this.mCreatorId, GalleryDBHelper.getCursorString(cursor, 45));
        this.mShareId = (String) updateHelper.update(this.mShareId, GalleryDBHelper.getCursorString(cursor, 46));
        this.mDownloadFileAddTime = updateHelper.update(this.mDownloadFileAddTime, cursor.getLong(48));
        this.mMixedDateTime = updateHelper.update(this.mMixedDateTime, cursor.getLong(49));
        this.mUbiServerId = (String) updateHelper.update(this.mUbiServerId, GalleryDBHelper.getCursorString(cursor, 50));
        this.mUbiLocalId = (String) updateHelper.update(this.mUbiLocalId, GalleryDBHelper.getCursorString(cursor, 51));
        this.mUbiSubIndex = updateHelper.update(this.mUbiSubIndex, cursor.getInt(52));
        byte[] update = updateHelper.update(this.mSecretKey, cursor.getBlob(53));
        if (update != null) {
            this.mSecretKey = update;
        }
        return reloadData || updateHelper.isUpdated();
    }

    public void setRequestAlbumId(String str) {
        setShareAlbumId(str);
    }

    public void setShareId(String str) {
        this.mShareId = str;
    }

    public JSONObject toJSONObject() {
        JSONObject jSONObject = super.toJSONObject();
        return jSONObject == null ? new JSONObject() : jSONObject;
    }
}
