package com.miui.gallery.data;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.provider.GalleryDBHelper;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import org.json.JSONException;
import org.json.JSONObject;

public class DBShareUser {
    private String albumId;
    private long createTime;
    private String id;
    private String localAlbumId;
    private int localFlag;
    private String mRelation;
    private String mRelationText;
    private int requestType;
    private String requestValue;
    private String serverStatus;
    private long serverTag;
    private String shareText;
    private String shareUrl;
    private String userId;
    private String userName;

    public DBShareUser(Cursor cursor) {
        this.id = GalleryDBHelper.getCursorString(cursor, 0);
        this.userId = GalleryDBHelper.getCursorString(cursor, 1);
        this.userName = GalleryDBHelper.getCursorString(cursor, 2);
        if (TextUtils.isEmpty(this.userName)) {
            this.userName = this.userId;
        }
        this.createTime = cursor.getLong(3);
        this.requestType = cursor.getInt(4);
        this.requestValue = GalleryDBHelper.getCursorString(cursor, 5);
        this.serverStatus = cursor.getString(6);
        this.serverTag = (long) cursor.getInt(7);
        this.albumId = GalleryDBHelper.getCursorString(cursor, 8);
        this.localFlag = cursor.getInt(9);
        this.shareUrl = GalleryDBHelper.getCursorString(cursor, 10);
        this.shareText = GalleryDBHelper.getCursorString(cursor, 11);
        this.localAlbumId = GalleryDBHelper.getCursorString(cursor, 12);
        this.mRelation = GalleryDBHelper.getCursorString(cursor, 13);
        this.mRelationText = GalleryDBHelper.getCursorString(cursor, 14);
    }

    public static ContentValues getContentValues(JSONObject jSONObject) throws JSONException {
        ContentValues contentValues = new ContentValues();
        contentValues.put("userId", jSONObject.getString("userId"));
        contentValues.put("serverStatus", jSONObject.getString("status"));
        contentValues.put("serverTag", Long.valueOf(CloudUtils.getLongAttributeFromJson(jSONObject, nexExportFormat.TAG_FORMAT_TAG)));
        contentValues.put("createTime", jSONObject.getString("createTime"));
        contentValues.put("requestType", jSONObject.getString("requestType"));
        contentValues.put("requestValue", jSONObject.getString("requestValue"));
        if (jSONObject.has("relation")) {
            contentValues.put("relation", jSONObject.getString("relation"));
        }
        if (jSONObject.has("relationText")) {
            contentValues.put("relationText", jSONObject.getString("relationText"));
        }
        return contentValues;
    }

    public String getId() {
        return this.id;
    }

    public long getServerTag() {
        return this.serverTag;
    }
}
