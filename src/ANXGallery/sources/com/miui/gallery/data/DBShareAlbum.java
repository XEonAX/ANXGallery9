package com.miui.gallery.data;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.baby.BabyAlbumUtils;
import com.miui.gallery.cloud.baby.BabyInfo;
import com.miui.gallery.provider.GalleryDBHelper;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DBShareAlbum implements DBItem {
    private String albumId;
    private String albumStatus;
    private String babyInfoJson;
    private int canModified;
    private String creatorId;
    private long dateModified;
    private long datetaken;
    private String description;
    private String editedColumns;
    private String fileName;
    private long groupId;
    private String id;
    private boolean isPublic;
    private int localFlag;
    private String peopleId;
    private String publicUrl;
    private String serverId;
    private String serverStatus;
    private long serverTag;
    private int serverType;
    private String shareUrl;
    private String shareUrlLong;
    private String sharerInfo;
    private int sortBy;

    public DBShareAlbum(Cursor cursor) {
        boolean z = false;
        this.id = GalleryDBHelper.getCursorString(cursor, 0);
        this.groupId = cursor.getLong(1);
        this.dateModified = cursor.getLong(2);
        this.description = GalleryDBHelper.getCursorString(cursor, 3);
        this.fileName = GalleryDBHelper.getCursorString(cursor, 4);
        this.datetaken = cursor.getLong(5);
        this.serverId = GalleryDBHelper.getCursorString(cursor, 6);
        this.serverType = cursor.getInt(7);
        this.serverStatus = GalleryDBHelper.getCursorString(cursor, 8);
        this.serverTag = cursor.getLong(9);
        this.localFlag = cursor.getInt(10);
        this.sortBy = cursor.getInt(11);
        this.canModified = cursor.getInt(12);
        this.albumId = GalleryDBHelper.getCursorString(cursor, 13);
        this.creatorId = GalleryDBHelper.getCursorString(cursor, 14);
        this.shareUrl = GalleryDBHelper.getCursorString(cursor, 15);
        if (cursor.getInt(22) == 1) {
            z = true;
        }
        this.isPublic = z;
        this.publicUrl = GalleryDBHelper.getCursorString(cursor, 23);
        this.peopleId = GalleryDBHelper.getCursorString(cursor, 26);
        this.babyInfoJson = GalleryDBHelper.getCursorString(cursor, 25);
        this.editedColumns = GalleryDBHelper.getCursorString(cursor, 28);
        this.sharerInfo = GalleryDBHelper.getCursorString(cursor, 27);
        this.albumStatus = GalleryDBHelper.getCursorString(cursor, 16);
        this.shareUrlLong = GalleryDBHelper.getCursorString(cursor, 20);
    }

    public static ContentValues getContentValue(JSONObject jSONObject, DBShareAlbum dBShareAlbum) throws JSONException {
        ContentValues contentValues = new ContentValues();
        contentValues.put("albumId", jSONObject.getString("sharedId"));
        if (jSONObject.has("status")) {
            contentValues.put("albumStatus", jSONObject.getString("status"));
        }
        contentValues.put("albumTag", jSONObject.getString(nexExportFormat.TAG_FORMAT_TAG));
        contentValues.put("creatorId", jSONObject.getString("creatorId"));
        JSONObject jSONObject2 = jSONObject.getJSONObject("content");
        contentValues.put("serverId", Long.valueOf(CloudUtils.getLongAttributeFromJson(jSONObject2, "id")));
        contentValues.put("serverStatus", jSONObject2.getString("status"));
        contentValues.put("serverTag", jSONObject2.getString(nexExportFormat.TAG_FORMAT_TAG));
        contentValues.put("serverType", jSONObject2.getString(nexExportFormat.TAG_FORMAT_TYPE));
        contentValues.put("fileName", jSONObject2.getString("fileName"));
        if (jSONObject2.has("dateModified")) {
            contentValues.put("dateModified", jSONObject2.getString("dateModified"));
        }
        int i = 0;
        if (jSONObject2.has("isPublic")) {
            if (jSONObject2.getBoolean("isPublic")) {
                contentValues.put("isPublic", Integer.valueOf(1));
                if (jSONObject2.has("publicUrl")) {
                    contentValues.put("publicUrl", jSONObject2.getString("publicUrl"));
                }
            } else {
                contentValues.put("isPublic", Integer.valueOf(0));
                contentValues.putNull("publicUrl");
            }
        }
        if (jSONObject2.has("renderInfos")) {
            JSONArray jSONArray = jSONObject2.getJSONArray("renderInfos");
            if (jSONArray != null) {
                while (true) {
                    if (i >= jSONArray.length()) {
                        break;
                    }
                    JSONObject jSONObject3 = jSONArray.getJSONObject(i);
                    if (!jSONObject3.has(nexExportFormat.TAG_FORMAT_TYPE) || !jSONObject3.getString(nexExportFormat.TAG_FORMAT_TYPE).equalsIgnoreCase(BabyAlbumUtils.BABY_BABY)) {
                        i++;
                    } else {
                        String jSONObject4 = jSONObject3.toString();
                        String str = null;
                        if (dBShareAlbum != null) {
                            BabyInfo fromJSON = BabyInfo.fromJSON(jSONObject4);
                            BabyInfo fromJSON2 = BabyInfo.fromJSON(dBShareAlbum.babyInfoJson);
                            if (!(fromJSON == null || fromJSON2 == null)) {
                                str = dBShareAlbum.peopleId;
                                fromJSON.mPeopleId = dBShareAlbum.peopleId;
                                fromJSON.mAutoupdate = fromJSON2.mAutoupdate;
                                jSONObject4 = fromJSON.toJSON();
                            }
                        }
                        contentValues.put("babyInfoJson", jSONObject4);
                        contentValues.put("peopleId", str);
                    }
                }
            }
        }
        if (jSONObject2.has("dateTaken")) {
            if (contentValues.containsKey("babyInfoJson")) {
                contentValues.put("dateTaken", Long.valueOf(-996));
            } else {
                contentValues.put("dateTaken", jSONObject2.getString("dateTaken"));
            }
        }
        return contentValues;
    }

    public static boolean isNormalStatus(String str, String str2) {
        return "normal".equals(str2) && "custom".equals(str);
    }

    public String getAlbumId() {
        return this.albumId;
    }

    public String getAlbumStatus() {
        return this.albumStatus;
    }

    public String getBabyInfoJson() {
        return this.babyInfoJson;
    }

    public String getCreatorId() {
        return this.creatorId;
    }

    public String getEditedColumns() {
        return this.editedColumns;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getId() {
        return this.id;
    }

    public boolean getIsPublic() {
        return this.isPublic;
    }

    public int getLocalFlag() {
        return this.localFlag;
    }

    public String getPeopleId() {
        return this.peopleId;
    }

    public String getPublicUri() {
        return this.publicUrl;
    }

    public long getServerTag() {
        return this.serverTag;
    }

    public String getShareUrl() {
        return this.shareUrl;
    }

    public String getShareUrlLong() {
        return this.shareUrlLong;
    }

    public String getSharerInfo() {
        return this.sharerInfo;
    }
}
