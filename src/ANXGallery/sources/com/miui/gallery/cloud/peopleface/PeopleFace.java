package com.miui.gallery.cloud.peopleface;

import android.database.Cursor;
import com.miui.gallery.data.DBItem;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.UpdateHelper;

public class PeopleFace implements DBItem {
    public String _id;
    public double faceHScale;
    public double faceWScale;
    public double faceXScale;
    public double faceYScale;
    public String groupId;
    public double leftEyeXScale;
    public double leftEyeYScale;
    public int localFlag;
    public String localGroupId;
    public String peopleContactJson;
    public String peopleName;
    public int relationType;
    public double rightEyeXScale;
    public double rightEyeYScale;
    public String serverId;
    public String serverStatus;
    public long serverTag;
    public String type;
    public int visibilityType;

    public PeopleFace(Cursor cursor) {
        reloadData(cursor, 0);
    }

    public PeopleFace(String str, String str2, String str3, long j) {
        this.serverId = str;
        this.type = str2;
        this.groupId = str3;
        this.serverTag = j;
    }

    private boolean equalString(String str, String str2) {
        if (str == null && str2 == null) {
            return true;
        }
        if (str == null && str2 != null) {
            return false;
        }
        if (str == null || str2 != null) {
            return str.equalsIgnoreCase(str2);
        }
        return false;
    }

    public boolean equalMainInfoWith(PeopleFace peopleFace) {
        return equalString(this._id, peopleFace._id) && equalString(this.serverId, peopleFace.serverId) && equalString(this.localGroupId, peopleFace.localGroupId) && equalString(this.peopleName, peopleFace.peopleName);
    }

    public String getId() {
        return this._id;
    }

    public boolean reloadData(Cursor cursor, int i) {
        UpdateHelper updateHelper = new UpdateHelper();
        this._id = (String) updateHelper.update(this._id, GalleryDBHelper.getCursorString(cursor, i + 0));
        this.serverId = (String) updateHelper.update(this.serverId, GalleryDBHelper.getCursorString(cursor, i + 1));
        this.type = (String) updateHelper.update(this.type, GalleryDBHelper.getCursorString(cursor, i + 2));
        this.groupId = (String) updateHelper.update(this.groupId, GalleryDBHelper.getCursorString(cursor, i + 3));
        this.localGroupId = (String) updateHelper.update(this.localGroupId, GalleryDBHelper.getCursorString(cursor, i + 4));
        this.localFlag = updateHelper.update(this.localFlag, cursor.getInt(i + 5));
        this.faceXScale = updateHelper.update(this.faceXScale, cursor.getDouble(i + 6));
        this.faceYScale = updateHelper.update(this.faceYScale, cursor.getDouble(i + 7));
        this.faceWScale = updateHelper.update(this.faceWScale, cursor.getDouble(i + 8));
        this.faceHScale = updateHelper.update(this.faceHScale, cursor.getDouble(i + 9));
        this.leftEyeXScale = updateHelper.update(this.leftEyeXScale, cursor.getDouble(i + 10));
        this.leftEyeYScale = updateHelper.update(this.leftEyeYScale, cursor.getDouble(i + 11));
        this.rightEyeXScale = updateHelper.update(this.rightEyeXScale, cursor.getDouble(i + 12));
        this.rightEyeYScale = updateHelper.update(this.rightEyeYScale, cursor.getDouble(i + 13));
        this.serverStatus = (String) updateHelper.update(this.serverStatus, GalleryDBHelper.getCursorString(cursor, i + 14));
        this.peopleName = (String) updateHelper.update(this.peopleName, GalleryDBHelper.getCursorString(cursor, i + 15));
        this.peopleContactJson = (String) updateHelper.update(this.peopleContactJson, GalleryDBHelper.getCursorString(cursor, i + 18));
        this.serverTag = updateHelper.update(this.serverTag, cursor.getLong(i + 20));
        this.relationType = updateHelper.update(this.relationType, cursor.getInt(i + 19));
        this.visibilityType = updateHelper.update(this.visibilityType, cursor.getInt(i + 16));
        StringBuilder sb = new StringBuilder();
        sb.append("reloadData for the face with server id:");
        sb.append(this.serverId);
        Log.i("peopleface", sb.toString());
        return updateHelper.isUpdated();
    }
}
