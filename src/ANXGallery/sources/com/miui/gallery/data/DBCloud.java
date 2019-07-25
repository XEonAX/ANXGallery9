package com.miui.gallery.data;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.ThumbnailInfo;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.UpdateHelper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DBCloud extends DBImage {
    private String mAddress;
    private boolean mCanModified;
    protected String mExtraGps;
    private boolean mIsPublic;
    private String mOriginFileName;
    private String mOriginSha1;
    private String mPublicUrl;
    private String mShareUrl;
    private String mThumbnailInfo;

    public DBCloud(Cursor cursor) {
        super(cursor);
    }

    public DBCloud(String str) {
        super(str);
    }

    public String getAlbumId() {
        return String.valueOf(getGroupId());
    }

    public Uri getBaseUri() {
        return GalleryCloudUtils.CLOUD_URI;
    }

    /* access modifiers changed from: protected */
    public void getBasicValues(JSONObject jSONObject) throws JSONException {
        super.getBasicValues(jSONObject);
        if (getServerType() == 0 && !TextUtils.isEmpty(this.mThumbnailInfo) && !TextUtils.isEmpty(getThumbnailInfo().getFaceId())) {
            jSONObject.put("faceId", getThumbnailInfo().getFaceId());
        }
        if (getServerType() == 1 || getServerType() == 2) {
            jSONObject.put("isFavorite", isFavorite());
        }
    }

    public String getOriginSha1() {
        return this.mOriginSha1;
    }

    public String getPublicUrl() {
        return this.mPublicUrl;
    }

    public String getRequestId() {
        return getServerId();
    }

    public String getShareUrl() {
        return this.mShareUrl;
    }

    public String getTagId() {
        StringBuilder sb = new StringBuilder();
        sb.append("DBCloud");
        sb.append(getId());
        return sb.toString();
    }

    public ThumbnailInfo getThumbnailInfo() {
        return new ThumbnailInfo(Integer.valueOf(getId()).intValue(), false, this.mThumbnailInfo);
    }

    public boolean isPublic() {
        return this.mIsPublic;
    }

    public boolean isUbiFocus() {
        return this.mUbiSubImageCount > 0;
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(2:24|25) */
    /* JADX WARNING: Code restructure failed: missing block: B:25:?, code lost:
        r12 = r11.mAddress;
     */
    /* JADX WARNING: Missing exception handler attribute for start block: B:24:0x01a7 */
    public boolean reloadData(Cursor cursor) {
        boolean reloadData = super.reloadData(cursor);
        UpdateHelper updateHelper = new UpdateHelper();
        this.mCanModified = updateHelper.update(this.mCanModified ? 1 : 0, cursor.getInt(45)) == 1;
        this.mShareUrl = (String) updateHelper.update(this.mShareUrl, GalleryDBHelper.getCursorString(cursor, 46));
        this.mCreatorId = (String) updateHelper.update(this.mCreatorId, GalleryDBHelper.getCursorString(cursor, 50));
        this.mIsPublic = updateHelper.update(this.mIsPublic ? 1 : 0, cursor.getInt(51)) == 1;
        this.mPublicUrl = (String) updateHelper.update(this.mPublicUrl, GalleryDBHelper.getCursorString(cursor, 52));
        this.mDownloadFileAddTime = updateHelper.update(this.mDownloadFileAddTime, cursor.getLong(54));
        this.mMixedDateTime = updateHelper.update(this.mMixedDateTime, cursor.getLong(55));
        this.mUbiSubImageCount = updateHelper.update(this.mUbiSubImageCount, cursor.getInt(56));
        this.mUbiFocusIndex = updateHelper.update(this.mUbiFocusIndex, cursor.getInt(57));
        this.mUbiSubIndex = updateHelper.update(this.mUbiSubIndex, cursor.getInt(58));
        this.mLables = updateHelper.update(this.mLables, cursor.getInt(65));
        this.mEditedColumns = (String) updateHelper.update(this.mEditedColumns, cursor.getString(59));
        this.mFromLocalGroupId = (String) updateHelper.update(this.mFromLocalGroupId, cursor.getString(60));
        byte[] update = updateHelper.update(this.mSecretKey, cursor.getBlob(61));
        if (update != null) {
            this.mSecretKey = update;
        }
        this.mAppKey = (String) updateHelper.update(this.mAppKey, cursor.getString(62));
        this.mBabyInfoJson = (String) updateHelper.update(this.mBabyInfoJson, GalleryDBHelper.getCursorString(cursor, 63));
        this.mPeopleFaceId = (String) updateHelper.update(this.mPeopleFaceId, GalleryDBHelper.getCursorString(cursor, 64));
        this.mThumbnailInfo = (String) updateHelper.update(this.mThumbnailInfo, GalleryDBHelper.getCursorString(cursor, 66));
        this.mAttributes = updateHelper.update(this.mAttributes, cursor.getLong(68));
        this.mAddress = (String) updateHelper.update(this.mAddress, cursor.getString(70));
        this.mExtraGps = (String) updateHelper.update(this.mExtraGps, cursor.getString(69));
        this.mSpecialTypeFlags = updateHelper.update(this.mSpecialTypeFlags, cursor.getLong(71));
        try {
            if (!TextUtils.isEmpty(this.mAddress)) {
                boolean isEmpty = TextUtils.isEmpty(this.mExtraGps);
                String str = this.mExtraGps;
                if (isEmpty) {
                    str = LocationManager.formatExifGpsString(this.mLatitudeStr, this.mLongitudeStr, this.mLatitudeStrRef, this.mLongitudeStrRef);
                }
                this.mGeoInfo.put("isAccurate", isEmpty);
                this.mGeoInfo.put("gps", str);
                String str2 = null;
                JSONArray jSONArray = new JSONArray(this.mAddress);
                this.mGeoInfo.put("addressList", jSONArray);
                if (jSONArray.length() > 0) {
                    str2 = jSONArray.optString(0);
                }
                if (!TextUtils.isEmpty(str2)) {
                    try {
                        this.mGeoInfo.put("address", new JSONObject(str2));
                    } catch (Exception e) {
                        Log.w("DBCloud", "Failed to convert Address info, %s", e);
                    }
                }
            }
        } catch (JSONException unused) {
            Log.e("DBCloud", "DBCloud(Cursor c): put JSON error");
        }
        if (!TextUtils.isEmpty(getSha1())) {
            Boolean bool = (Boolean) GalleryUtils.safeQuery("favorites", new String[]{"isFavorite"}, "sha1 = ?", new String[]{getSha1()}, (String) null, (QueryHandler<T>) new QueryHandler<Boolean>() {
                public Boolean handle(Cursor cursor) {
                    boolean z = false;
                    if (cursor != null && cursor.moveToFirst() && cursor.getInt(0) > 0) {
                        z = true;
                    }
                    return Boolean.valueOf(z);
                }
            });
            this.mIsFavorite = ((Boolean) updateHelper.update(Boolean.valueOf(this.mIsFavorite), Boolean.valueOf(bool != null && bool.booleanValue()))).booleanValue();
        }
        return reloadData || updateHelper.isUpdated();
    }

    public void setOriginInfo(String str, String str2) {
        this.mOriginSha1 = str;
        this.mOriginFileName = str2;
    }

    public void setRequestAlbumId(String str) {
        setGroupId(Long.valueOf(str).longValue());
    }

    public JSONObject toJSONObject() {
        JSONObject jSONObject = super.toJSONObject();
        return jSONObject == null ? new JSONObject() : jSONObject;
    }
}
