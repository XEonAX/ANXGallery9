package com.miui.gallery.util.deleterecorder;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class DeleteRecord extends Entity {
    private String mFilePath;
    private int mReason;
    private String mTag;
    private long mTimestamp;

    public DeleteRecord() {
    }

    public DeleteRecord(int i, String str, String str2) {
        this(System.currentTimeMillis(), i, str, str2);
    }

    public DeleteRecord(long j, int i, String str, String str2) {
        this.mTimestamp = j;
        this.mReason = i;
        this.mFilePath = str;
        this.mTag = str2;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof DeleteRecord)) {
            return false;
        }
        DeleteRecord deleteRecord = (DeleteRecord) obj;
        return this.mTimestamp == deleteRecord.mTimestamp && this.mReason == deleteRecord.mReason && TextUtils.equals(this.mFilePath, deleteRecord.mFilePath) && TextUtils.equals(this.mTag, deleteRecord.mTag);
    }

    public String getFilePath() {
        return this.mFilePath;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "timestamp", "INTEGER");
        addColumn(arrayList, "filePath", "TEXT");
        addColumn(arrayList, "reason", "INTEGER");
        addColumn(arrayList, nexExportFormat.TAG_FORMAT_TAG, "TEXT");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("timestamp", Long.valueOf(this.mTimestamp));
        contentValues.put("filePath", this.mFilePath);
        contentValues.put("reason", Integer.valueOf(this.mReason));
        contentValues.put(nexExportFormat.TAG_FORMAT_TAG, this.mTag);
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mTimestamp = getLong(cursor, "timestamp");
        this.mFilePath = getString(cursor, "filePath");
        this.mReason = getInt(cursor, "reason");
        this.mTag = getString(cursor, nexExportFormat.TAG_FORMAT_TAG);
    }

    public String toString() {
        return String.format(Locale.US, "DeleteRecord [timestamp=%d, reason=%d, filePath=%s, tag=%s]", new Object[]{Long.valueOf(this.mTimestamp), Integer.valueOf(this.mReason), this.mFilePath, this.mTag});
    }
}
