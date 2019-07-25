package com.miui.gallery.data;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudTableUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.UpdateHelper;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.Iterator;
import miui.os.ExtraFileUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class DBImage implements DBItem {
    public static final ArrayList<ExifDataConst> sExifDataConst = new ArrayList<>();
    private static final Object sSecretKeyLock = new Object();
    protected String mAppKey;
    protected long mAttributes;
    protected String mBabyInfoJson;
    protected String mCreatorId;
    private long mDateModified;
    private long mDatetaken;
    private String mDescription;
    @Deprecated
    private String mDownloadFile;
    protected long mDownloadFileAddTime;
    private int mDuration;
    protected String mEditedColumns;
    private JSONObject mExifInfo = new JSONObject();
    private String mFileName;
    protected String mFromLocalGroupId;
    protected JSONObject mGeoInfo = new JSONObject();
    private long mGroupId;
    private String mId;
    protected boolean mIsFavorite;
    protected int mLables;
    protected String mLatitudeStr;
    protected String mLatitudeStrRef;
    private String mLocalFile;
    private int mLocalFlag;
    private String mLocalGroupId;
    private String mLocalImageId;
    protected String mLongitudeStr;
    protected String mLongitudeStrRef;
    private String mMicroThumbFile;
    private String mMimeType;
    protected long mMixedDateTime;
    protected String mPeopleFaceId;
    protected byte[] mSecretKey;
    private String mServerId;
    private String mServerStatus;
    private long mServerTag;
    private int mServerType;
    private String mSha1;
    private String mShareAlbumId;
    private long mSize;
    protected long mSpecialTypeFlags;
    private String mThumbnailFile;
    private String mTitle;
    protected int mUbiFocusIndex;
    protected int mUbiSubImageCount;
    protected int mUbiSubIndex;

    public static class ExifDataConst {
        public final String cloudTagName;
        public final int columnIndex;
        public final String exifTagName;
        public final int exifValueType;

        public ExifDataConst(int i, String str, String str2, int i2) {
            this.columnIndex = i;
            this.cloudTagName = str;
            this.exifTagName = str2;
            this.exifValueType = i2;
        }
    }

    public interface SubUbiImage {
        String getUbiLocalId();
    }

    static {
        sExifDataConst.add(new ExifDataConst(14, "imageWidth", "ImageWidth", 0));
        sExifDataConst.add(new ExifDataConst(15, "imageLength", "ImageLength", 0));
        sExifDataConst.add(new ExifDataConst(16, "orientation", "Orientation", 0));
        sExifDataConst.add(new ExifDataConst(17, "GPSLatitude", "GPSLatitude", 1));
        sExifDataConst.add(new ExifDataConst(18, "GPSLongitude", "GPSLongitude", 1));
        sExifDataConst.add(new ExifDataConst(19, "make", "Make", 1));
        sExifDataConst.add(new ExifDataConst(20, "model", "Model", 1));
        sExifDataConst.add(new ExifDataConst(21, "flash", "Flash", 0));
        sExifDataConst.add(new ExifDataConst(22, "GPSLatitudeRef", "GPSLatitudeRef", 1));
        sExifDataConst.add(new ExifDataConst(23, "GPSLongitudeRef", "GPSLongitudeRef", 1));
        sExifDataConst.add(new ExifDataConst(24, "exposureTime", "ExposureTime", 1));
        sExifDataConst.add(new ExifDataConst(25, "FNumber", "FNumber", 1));
        sExifDataConst.add(new ExifDataConst(26, "ISOSpeedRatings", "ISOSpeedRatings", 1));
        sExifDataConst.add(new ExifDataConst(27, "GPSAltitude", "GPSAltitude", 1));
        sExifDataConst.add(new ExifDataConst(28, "GPSAltitudeRef", "GPSAltitudeRef", 0));
        sExifDataConst.add(new ExifDataConst(29, "GPSTimeStamp", "GPSTimeStamp", 1));
        sExifDataConst.add(new ExifDataConst(30, "GPSDateStamp", "GPSDateStamp", 1));
        sExifDataConst.add(new ExifDataConst(31, "whiteBalance", "WhiteBalance", 0));
        sExifDataConst.add(new ExifDataConst(32, "focalLength", "FocalLength", 1));
        sExifDataConst.add(new ExifDataConst(33, "GPSProcessingMethod", "GPSProcessingMethod", 1));
        sExifDataConst.add(new ExifDataConst(34, "dateTime", "DateTime", 1));
    }

    public DBImage(Cursor cursor) {
        reloadData(cursor);
    }

    public DBImage(String str) {
        this.mServerId = str;
    }

    private void generateSecretKey() {
        synchronized (sSecretKeyLock) {
            Uri baseUri = getBaseUri();
            StringBuilder sb = new StringBuilder();
            sb.append("_id = '");
            sb.append(getId());
            sb.append("'");
            String sb2 = sb.toString();
            byte[] bArr = (byte[]) GalleryUtils.safeQuery(baseUri, new String[]{"secretKey"}, sb2, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<byte[]>() {
                public byte[] handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToFirst()) {
                        return null;
                    }
                    return cursor.getBlob(0);
                }
            });
            if (bArr == null) {
                bArr = CryptoUtil.generateRandomKey();
                ContentValues contentValues = new ContentValues();
                contentValues.put("secretKey", bArr);
                GalleryUtils.safeUpdate(baseUri, contentValues, sb2, null);
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("generateSecretKey  secret key exists:");
                sb3.append(bArr);
                Log.d("DBImage", sb3.toString());
            }
            this.mSecretKey = bArr;
        }
    }

    public abstract String getAlbumId();

    public String getAppKey() {
        return this.mAppKey;
    }

    public long getAttributes() {
        return this.mAttributes;
    }

    public String getBabyInfoJson() {
        return this.mBabyInfoJson;
    }

    public abstract Uri getBaseUri();

    /* access modifiers changed from: protected */
    public void getBasicValues(JSONObject jSONObject) throws JSONException {
        jSONObject.put("fileName", getFileName());
        jSONObject.put("dateTaken", getDatetaken());
        jSONObject.put("dateModified", getDateModified());
        int serverType = getServerType();
        String str = serverType == 0 ? CloudUtils.collectAlbumDescription(this) : (serverType == 1 || serverType == 2) ? CloudUtils.collectMediaDescription(this) : getDescription();
        if (!TextUtils.isEmpty(str)) {
            jSONObject.put("description", str);
        }
        switch (getServerType()) {
            case 0:
                jSONObject.put(nexExportFormat.TAG_FORMAT_TYPE, "group");
                if (ApplicationHelper.isAutoUploadFeatureOpen() && !TextUtils.isEmpty(getAppKey())) {
                    jSONObject.put("appKey", getAppKey());
                }
                if (ApplicationHelper.isBabyAlbumFeatureOpen() && !TextUtils.isEmpty(this.mBabyInfoJson)) {
                    JSONObject jSONObject2 = new JSONObject(this.mBabyInfoJson);
                    if (jSONObject2.has("localFlag")) {
                        jSONObject2.remove("localFlag");
                    }
                    JSONArray jSONArray = new JSONArray();
                    jSONArray.put(0, jSONObject2);
                    jSONObject.put("renderInfos", jSONArray);
                    break;
                }
            case 1:
                jSONObject.put(nexExportFormat.TAG_FORMAT_TYPE, "image");
                jSONObject.put("size", getSize());
                jSONObject.put("mimeType", getMimeType());
                jSONObject.put("title", getTitle());
                jSONObject.put("sha1", getSha1());
                break;
            case 2:
                jSONObject.put(nexExportFormat.TAG_FORMAT_TYPE, "video");
                jSONObject.put("size", getSize());
                jSONObject.put("mimeType", getMimeType());
                jSONObject.put("title", getTitle());
                jSONObject.put("sha1", getSha1());
                jSONObject.put("duration", getDuration());
                break;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("type is invalid:");
                sb.append(getServerType());
                Log.e("DBImage", sb.toString());
                break;
        }
        if (getExifInfo().length() > 0) {
            jSONObject.put("exifInfo", getExifInfo());
        }
    }

    public String getCreatorId() {
        return this.mCreatorId;
    }

    public long getDateModified() {
        return this.mDateModified;
    }

    public long getDatetaken() {
        return this.mDatetaken;
    }

    public String getDescription() {
        return this.mDescription;
    }

    public int getDuration() {
        return this.mDuration;
    }

    public String getEditedColumns() {
        return this.mEditedColumns;
    }

    public String getEncodedFileName() {
        return SecretAlbumUtils.getEncryptedFileName(this.mFileName, getMD5Key(), isVideoType());
    }

    public JSONObject getExifInfo() {
        return this.mExifInfo;
    }

    public String getFileName() {
        return this.mFileName;
    }

    public String getFromLocalGroupId() {
        return this.mFromLocalGroupId;
    }

    public JSONObject getGeoInfo() {
        return this.mGeoInfo;
    }

    public long getGroupId() {
        return this.mGroupId;
    }

    public String getId() {
        return this.mId;
    }

    public String getJsonExifString(String str) {
        try {
            if (getExifInfo().has(str)) {
                return getExifInfo().getString(str);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getLocalFile() {
        return this.mLocalFile;
    }

    public int getLocalFlag() {
        return this.mLocalFlag;
    }

    public String getLocalGroupId() {
        return this.mLocalGroupId;
    }

    public String getLocalImageId() {
        return this.mLocalImageId;
    }

    public String getMD5Key() {
        return SecretAlbumUtils.getMD5Key(getSecretKey());
    }

    public String getMicroThumbnailFile() {
        return this.mMicroThumbFile;
    }

    public String getMimeType() {
        return this.mMimeType;
    }

    public long getMixedDateTime() {
        return this.mMixedDateTime;
    }

    public String getOriginSha1() {
        return "";
    }

    public abstract String getRequestId();

    public byte[] getSecretKey() {
        if (SecretAlbumUtils.isEmpty(this.mSecretKey)) {
            generateSecretKey();
        }
        return this.mSecretKey;
    }

    public byte[] getSecretKeyNoGenerate() {
        return this.mSecretKey;
    }

    public String getServerId() {
        return this.mServerId;
    }

    public String getServerStatus() {
        return this.mServerStatus;
    }

    public long getServerTag() {
        return this.mServerTag;
    }

    public int getServerType() {
        return this.mServerType;
    }

    public String getSha1() {
        return this.mSha1;
    }

    public String getSha1FileName() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mSha1);
        sb.append(".");
        sb.append(ExtraFileUtils.getExtension(this.mFileName));
        return sb.toString();
    }

    public String getSha1Thumbnail() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mSha1);
        sb.append(".");
        sb.append("jpg");
        return sb.toString();
    }

    public String getSha1ThumbnailSA() {
        return SecretAlbumUtils.getSha1ThumbnailSA(this.mSha1, getMD5Key(), isVideoType());
    }

    public String getShareAlbumId() {
        return this.mShareAlbumId;
    }

    public long getSize() {
        return this.mSize;
    }

    public long getSpecialTypeFlags() {
        return this.mSpecialTypeFlags;
    }

    public int getSubUbiImageCount() {
        return this.mUbiSubImageCount;
    }

    public int getSubUbiIndex() {
        return this.mUbiSubIndex;
    }

    public abstract String getTagId();

    public String getThumbnailFile() {
        return this.mThumbnailFile;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public String getUbiServerId() {
        return "";
    }

    public boolean isFavorite() {
        return this.mIsFavorite;
    }

    public boolean isImageType() {
        return getServerType() == 1;
    }

    public boolean isItemType() {
        return getServerType() == 1 || getServerType() == 2;
    }

    public boolean isSecretItem() {
        if (!ApplicationHelper.isSecretAlbumFeatureOpen()) {
            return false;
        }
        return CloudTableUtils.isSecretAlbum(String.valueOf(getGroupId()), getLocalGroupId());
    }

    public boolean isShareItem() {
        return false;
    }

    public boolean isSubUbiFocus() {
        return false;
    }

    public boolean isUbiFocus() {
        return false;
    }

    public boolean isVideoType() {
        return getServerType() == 2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:28:0x020f, code lost:
        r4 = true;
     */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x025c  */
    /* JADX WARNING: Removed duplicated region for block: B:55:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    public boolean reloadData(Cursor cursor) {
        boolean z;
        UpdateHelper updateHelper = new UpdateHelper();
        this.mId = (String) updateHelper.update(this.mId, GalleryDBHelper.getCursorString(cursor, 0));
        this.mGroupId = updateHelper.update(this.mGroupId, cursor.getLong(1));
        this.mSize = updateHelper.update(this.mSize, cursor.getLong(2));
        this.mDateModified = updateHelper.update(this.mDateModified, cursor.getLong(3));
        this.mMimeType = (String) updateHelper.update(this.mMimeType, GalleryDBHelper.getCursorString(cursor, 4));
        this.mTitle = (String) updateHelper.update(this.mTitle, GalleryDBHelper.getCursorString(cursor, 5));
        this.mDescription = (String) updateHelper.update(this.mDescription, GalleryDBHelper.getCursorString(cursor, 6));
        this.mFileName = (String) updateHelper.update(this.mFileName, GalleryDBHelper.getCursorString(cursor, 7));
        this.mDatetaken = updateHelper.update(this.mDatetaken, cursor.getLong(8));
        this.mDuration = updateHelper.update(this.mDuration, cursor.getInt(9));
        this.mServerId = (String) updateHelper.update(this.mServerId, GalleryDBHelper.getCursorString(cursor, 10));
        this.mServerType = updateHelper.update(this.mServerType, cursor.getInt(11));
        this.mServerTag = updateHelper.update(this.mServerTag, cursor.getLong(13));
        this.mServerStatus = (String) updateHelper.update(this.mServerStatus, GalleryDBHelper.getCursorString(cursor, 12));
        this.mLocalFlag = updateHelper.update(this.mLocalFlag, cursor.getInt(35));
        this.mThumbnailFile = (String) updateHelper.update(this.mThumbnailFile, GalleryDBHelper.getCursorString(cursor, 36));
        this.mDownloadFile = (String) updateHelper.update(this.mDownloadFile, GalleryDBHelper.getCursorString(cursor, 37));
        this.mMicroThumbFile = (String) updateHelper.update(this.mMicroThumbFile, GalleryDBHelper.getCursorString(cursor, 41));
        this.mLocalFile = (String) updateHelper.update(this.mLocalFile, GalleryDBHelper.getCursorString(cursor, 38));
        this.mSha1 = (String) updateHelper.update(this.mSha1, GalleryDBHelper.getCursorString(cursor, 39));
        this.mLocalGroupId = (String) updateHelper.update(this.mLocalGroupId, GalleryDBHelper.getCursorString(cursor, 42));
        this.mLocalImageId = (String) updateHelper.update(this.mLocalImageId, GalleryDBHelper.getCursorString(cursor, 43));
        this.mShareAlbumId = (String) updateHelper.update(this.mShareAlbumId, GalleryDBHelper.getCursorString(cursor, 44));
        this.mLongitudeStr = (String) updateHelper.update(this.mLongitudeStr, cursor.getString(18));
        this.mLatitudeStr = (String) updateHelper.update(this.mLatitudeStr, cursor.getString(17));
        this.mLongitudeStrRef = (String) updateHelper.update(this.mLongitudeStrRef, cursor.getString(23));
        this.mLatitudeStrRef = (String) updateHelper.update(this.mLatitudeStrRef, cursor.getString(22));
        try {
            Iterator it = sExifDataConst.iterator();
            z = false;
            while (it.hasNext()) {
                try {
                    ExifDataConst exifDataConst = (ExifDataConst) it.next();
                    switch (exifDataConst.exifValueType) {
                        case 0:
                            if (cursor.isNull(exifDataConst.columnIndex)) {
                                if (!this.mExifInfo.has(exifDataConst.cloudTagName)) {
                                    break;
                                } else {
                                    this.mExifInfo.put(exifDataConst.cloudTagName, null);
                                    break;
                                }
                            } else {
                                int i = cursor.getInt(exifDataConst.columnIndex);
                                if (this.mExifInfo.has(exifDataConst.cloudTagName)) {
                                    i = updateHelper.update(this.mExifInfo.getInt(exifDataConst.cloudTagName), i);
                                } else {
                                    z = true;
                                }
                                this.mExifInfo.put(exifDataConst.cloudTagName, i);
                                break;
                            }
                        case 1:
                            String string = cursor.getString(exifDataConst.columnIndex);
                            if (string == null) {
                                if (!this.mExifInfo.has(exifDataConst.cloudTagName)) {
                                    break;
                                } else {
                                    try {
                                        this.mExifInfo.put(exifDataConst.cloudTagName, null);
                                        break;
                                    } catch (JSONException unused) {
                                        z = true;
                                        break;
                                    }
                                }
                            } else {
                                if (this.mExifInfo.has(exifDataConst.cloudTagName)) {
                                    string = (String) updateHelper.update(this.mExifInfo.getString(exifDataConst.cloudTagName), string);
                                } else {
                                    z = true;
                                }
                                this.mExifInfo.put(exifDataConst.cloudTagName, string);
                                break;
                            }
                        default:
                            String str = "DBImage";
                            StringBuilder sb = new StringBuilder();
                            sb.append("exifDataConst.exifValueType is wrong: ");
                            sb.append(exifDataConst.exifValueType);
                            Log.e(str, sb.toString());
                            break;
                    }
                } catch (JSONException unused2) {
                    Log.e("DBCloud", "DBCloud(Cursor c): put JSON error");
                    return !z ? true : true;
                }
            }
        } catch (JSONException unused3) {
            z = false;
            Log.e("DBCloud", "DBCloud(Cursor c): put JSON error");
            if (!z) {
            }
        }
        if (!z && !updateHelper.isUpdated()) {
            return false;
        }
    }

    public void setFileName(String str) {
        this.mFileName = str;
    }

    public void setGroupId(long j) {
        this.mGroupId = j;
    }

    public void setLocalFile(String str) {
        this.mLocalFile = str;
    }

    public void setMicroThumbFile(String str) {
        this.mMicroThumbFile = str;
    }

    public void setOriginInfo(String str, String str2) {
    }

    public abstract void setRequestAlbumId(String str);

    public void setSecretKey(byte[] bArr) {
        this.mSecretKey = bArr;
    }

    public void setServerId(String str) {
        this.mServerId = str;
    }

    public void setServerType(int i) {
        this.mServerType = i;
    }

    public void setSha1(String str) {
        this.mSha1 = str;
    }

    public void setShareAlbumId(String str) {
        this.mShareAlbumId = str;
    }

    public void setShareId(String str) {
    }

    public void setSubUbiImageCount(int i) {
        this.mUbiSubImageCount = i;
    }

    public void setThumbnailFile(String str) {
        this.mThumbnailFile = str;
    }

    public void setTitle(String str) {
        this.mTitle = str;
    }

    public JSONObject toJSONObject() {
        JSONObject jSONObject = new JSONObject();
        try {
            getBasicValues(jSONObject);
            if (getGroupId() != 0) {
                jSONObject.put("groupId", getGroupId());
            }
            if (!TextUtils.isEmpty(getServerId())) {
                jSONObject.put("id", getServerId());
            }
            if (!TextUtils.isEmpty(getServerStatus())) {
                jSONObject.put("status", getServerStatus());
            }
            if (getServerTag() != 0) {
                jSONObject.put(nexExportFormat.TAG_FORMAT_TAG, getServerTag());
            }
            if (this.mUbiSubImageCount > 0) {
                jSONObject.put("ubiSubImageCount", this.mUbiSubImageCount);
                jSONObject.put("currentFocusIndex", this.mUbiFocusIndex);
                jSONObject.put("ubiDefaultIndex", this.mUbiSubIndex);
            }
            if (!TextUtils.isEmpty(getOriginSha1())) {
                jSONObject.put("originSha1", getOriginSha1());
            }
        } catch (JSONException unused) {
            Log.e("DBCloud", "toJSONObject: get JSON error");
        }
        return jSONObject;
    }

    public JSONObject toJsonObjectForSubUbi() {
        String str;
        JSONObject jSONObject = new JSONObject();
        try {
            getBasicValues(jSONObject);
        } catch (JSONException unused) {
            Log.e("DBCloud", "toJsonObjectForSubUbi: get JSON error");
        } finally {
            try {
                jSONObject.put(nexExportFormat.TAG_FORMAT_TYPE, null);
            } catch (JSONException unused2) {
                Log.e("DBCloud", "put null JSON_TAG_TYPE failed");
            }
        }
        try {
            jSONObject.put(str, null);
        } catch (JSONException unused3) {
            Log.e("DBCloud", "put null JSON_TAG_TYPE failed");
        }
        return jSONObject;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("[ _id = ");
        sb.append(getId());
        sb.append(", albumId = ");
        sb.append(getAlbumId());
        sb.append("]");
        return sb.toString();
    }
}
