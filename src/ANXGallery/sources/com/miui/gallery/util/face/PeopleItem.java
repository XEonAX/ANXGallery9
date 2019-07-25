package com.miui.gallery.util.face;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class PeopleItem extends Entity {
    public static final String[] COMPAT_PROJECTION = {"localId as _id", "peopleName", "serverId", "imageCloudId as photo_id", "sha1", "microthumbfile", "thumbnailFile", "localFile", "exifOrientation", "faceXScale", "faceYScale", "faceWScale", "faceHScale", "relationType", "relationText", "visibilityType", "faceCount", "size"};
    public static final String[] Columns = {"localId", "peopleName", "serverId", "imageCloudId", "sha1", "microthumbfile", "thumbnailFile", "localFile", "exifOrientation", "faceXScale", "faceYScale", "faceWScale", "faceHScale", "relationType", "relationText", "visibilityType", "faceCount", "size"};
    private long mCloudId;
    private int mExifOrientation;
    private int mFaceCount;
    private float mFaceHScale;
    private float mFaceWScale;
    private float mFaceXScale;
    private float mFaceYScale;
    private String mLocalFile;
    private long mLocalId;
    private String mMicroThumbFile;
    private String mName;
    private String mRelationText;
    private int mRelationType;
    private String mServerId;
    private String mSha1;
    private long mSize;
    private String mThumbFile;
    private int mVisibilityType;

    public static PeopleItem fromCursor(Cursor cursor) {
        if (cursor == null || cursor.isClosed()) {
            return null;
        }
        PeopleItem peopleItem = new PeopleItem();
        peopleItem.mLocalId = getLong(cursor, PeopleCursorHelper.PROJECTION[0]);
        peopleItem.mName = getString(cursor, PeopleCursorHelper.PROJECTION[1]);
        peopleItem.mServerId = getString(cursor, PeopleCursorHelper.PROJECTION[2]);
        peopleItem.mCloudId = getLong(cursor, PeopleCursorHelper.PROJECTION[3]);
        peopleItem.mSha1 = getString(cursor, PeopleCursorHelper.PROJECTION[4]);
        peopleItem.mMicroThumbFile = getString(cursor, PeopleCursorHelper.PROJECTION[5]);
        peopleItem.mThumbFile = getString(cursor, PeopleCursorHelper.PROJECTION[6]);
        peopleItem.mLocalFile = getString(cursor, PeopleCursorHelper.PROJECTION[7]);
        peopleItem.mExifOrientation = getInt(cursor, PeopleCursorHelper.PROJECTION[8]);
        peopleItem.mFaceXScale = getFloat(cursor, PeopleCursorHelper.PROJECTION[9]);
        peopleItem.mFaceYScale = getFloat(cursor, PeopleCursorHelper.PROJECTION[10]);
        peopleItem.mFaceWScale = getFloat(cursor, PeopleCursorHelper.PROJECTION[11]);
        peopleItem.mFaceHScale = getFloat(cursor, PeopleCursorHelper.PROJECTION[12]);
        peopleItem.mRelationType = getInt(cursor, PeopleCursorHelper.PROJECTION[13]);
        peopleItem.mRelationText = getString(cursor, PeopleCursorHelper.PROJECTION[14]);
        peopleItem.mVisibilityType = getInt(cursor, PeopleCursorHelper.PROJECTION[15]);
        peopleItem.mFaceCount = getInt(cursor, PeopleCursorHelper.PROJECTION[16]);
        peopleItem.mSize = getLong(cursor, PeopleCursorHelper.PROJECTION[17]);
        return peopleItem;
    }

    public long getCloudId() {
        return this.mCloudId;
    }

    public int getExifOrientation() {
        return this.mExifOrientation;
    }

    public float getFaceHScale() {
        return this.mFaceHScale;
    }

    public float getFaceWScale() {
        return this.mFaceWScale;
    }

    public float getFaceXScale() {
        return this.mFaceXScale;
    }

    public float getFaceYScale() {
        return this.mFaceYScale;
    }

    public String getLocalFile() {
        return this.mLocalFile;
    }

    public String getMicroThumbFile() {
        return this.mMicroThumbFile;
    }

    public String getName() {
        return this.mName;
    }

    public int getRelationType() {
        return this.mRelationType;
    }

    public String getSha1() {
        return this.mSha1;
    }

    public long getSize() {
        return this.mSize;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, Columns[0], "INTEGER");
        addColumn(arrayList, Columns[1], "TEXT");
        addColumn(arrayList, Columns[2], "TEXT");
        addColumn(arrayList, Columns[3], "INTEGER");
        addColumn(arrayList, Columns[4], "TEXT");
        addColumn(arrayList, Columns[5], "TEXT");
        addColumn(arrayList, Columns[6], "TEXT");
        addColumn(arrayList, Columns[7], "TEXT");
        addColumn(arrayList, Columns[8], "INTEGER");
        addColumn(arrayList, Columns[9], "REAL");
        addColumn(arrayList, Columns[10], "REAL");
        addColumn(arrayList, Columns[11], "REAL");
        addColumn(arrayList, Columns[12], "REAL");
        addColumn(arrayList, Columns[13], "INTEGER");
        addColumn(arrayList, Columns[14], "TEXT");
        addColumn(arrayList, Columns[15], "INTEGER");
        addColumn(arrayList, Columns[16], "INTEGER");
        addColumn(arrayList, Columns[17], "INTEGER");
        return arrayList;
    }

    public String getThumbFile() {
        return this.mThumbFile;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put(Columns[0], Long.valueOf(this.mLocalId));
        contentValues.put(Columns[1], this.mName);
        contentValues.put(Columns[2], this.mServerId);
        contentValues.put(Columns[3], Long.valueOf(this.mCloudId));
        contentValues.put(Columns[4], this.mSha1);
        contentValues.put(Columns[5], this.mMicroThumbFile);
        contentValues.put(Columns[6], this.mThumbFile);
        contentValues.put(Columns[7], this.mLocalFile);
        contentValues.put(Columns[8], Integer.valueOf(this.mExifOrientation));
        contentValues.put(Columns[9], Float.valueOf(this.mFaceXScale));
        contentValues.put(Columns[10], Float.valueOf(this.mFaceYScale));
        contentValues.put(Columns[11], Float.valueOf(this.mFaceWScale));
        contentValues.put(Columns[12], Float.valueOf(this.mFaceHScale));
        contentValues.put(Columns[13], Integer.valueOf(this.mRelationType));
        contentValues.put(Columns[14], this.mRelationText);
        contentValues.put(Columns[15], Integer.valueOf(this.mVisibilityType));
        contentValues.put(Columns[16], Integer.valueOf(this.mFaceCount));
        contentValues.put(Columns[17], Long.valueOf(this.mSize));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mLocalId = getLong(cursor, Columns[0]);
        this.mName = getString(cursor, Columns[1]);
        this.mServerId = getString(cursor, Columns[2]);
        this.mCloudId = getLong(cursor, Columns[3]);
        this.mSha1 = getString(cursor, Columns[4]);
        this.mMicroThumbFile = getString(cursor, Columns[5]);
        this.mThumbFile = getString(cursor, Columns[6]);
        this.mLocalFile = getString(cursor, Columns[7]);
        this.mExifOrientation = getInt(cursor, Columns[8]);
        this.mFaceXScale = getFloat(cursor, Columns[9]);
        this.mFaceYScale = getFloat(cursor, Columns[10]);
        this.mFaceWScale = getFloat(cursor, Columns[11]);
        this.mFaceHScale = getFloat(cursor, Columns[12]);
        this.mRelationType = getInt(cursor, Columns[13]);
        this.mRelationText = getString(cursor, Columns[14]);
        this.mVisibilityType = getInt(cursor, Columns[15]);
        this.mFaceCount = getInt(cursor, Columns[16]);
        this.mSize = getLong(cursor, Columns[17]);
    }
}
