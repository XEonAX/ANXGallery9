package com.miui.gallery.data;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.UpdateHelper;
import org.json.JSONException;
import org.json.JSONObject;

public class DBShareImage extends DBImage {
    private String mShareId;

    public DBShareImage(Cursor cursor) {
        super(cursor);
    }

    public String getAlbumId() {
        return getShareAlbumId();
    }

    public Uri getBaseUri() {
        return GalleryCloudUtils.SHARE_IMAGE_URI;
    }

    public String getRequestId() {
        return getShareId();
    }

    public String getShareId() {
        return this.mShareId;
    }

    public String getTagId() {
        StringBuilder sb = new StringBuilder();
        sb.append("DBShareImage");
        sb.append(getId());
        return sb.toString();
    }

    public boolean isShareItem() {
        return true;
    }

    public boolean isUbiFocus() {
        return this.mUbiSubImageCount > 0;
    }

    public boolean reloadData(Cursor cursor) {
        boolean reloadData = super.reloadData(cursor);
        UpdateHelper updateHelper = new UpdateHelper();
        this.mCreatorId = (String) updateHelper.update(this.mCreatorId, GalleryDBHelper.getCursorString(cursor, 45));
        this.mShareId = (String) updateHelper.update(this.mShareId, GalleryDBHelper.getCursorString(cursor, 46));
        this.mDownloadFileAddTime = updateHelper.update(this.mDownloadFileAddTime, cursor.getLong(48));
        this.mMixedDateTime = updateHelper.update(this.mMixedDateTime, cursor.getLong(49));
        this.mUbiSubImageCount = updateHelper.update(this.mUbiSubImageCount, cursor.getInt(50));
        this.mUbiFocusIndex = updateHelper.update(this.mUbiFocusIndex, cursor.getInt(51));
        this.mUbiSubIndex = updateHelper.update(this.mUbiSubIndex, cursor.getInt(52));
        this.mLables = updateHelper.update(this.mLables, cursor.getInt(56));
        this.mEditedColumns = (String) updateHelper.update(this.mEditedColumns, cursor.getString(53));
        this.mFromLocalGroupId = (String) updateHelper.update(this.mFromLocalGroupId, cursor.getString(54));
        byte[] update = updateHelper.update(this.mSecretKey, cursor.getBlob(55));
        if (update != null) {
            this.mSecretKey = update;
        }
        this.mSpecialTypeFlags = updateHelper.update(this.mSpecialTypeFlags, cursor.getLong(60));
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
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            if (!TextUtils.isEmpty(getCreatorId())) {
                jSONObject.put("creatorId", getCreatorId());
            }
            if (!TextUtils.isEmpty(getShareId())) {
                jSONObject.put("shareId", getShareId());
            }
        } catch (JSONException unused) {
            Log.e("DBCloud", "toJSONObject: get JSON error");
        }
        return jSONObject;
    }
}
