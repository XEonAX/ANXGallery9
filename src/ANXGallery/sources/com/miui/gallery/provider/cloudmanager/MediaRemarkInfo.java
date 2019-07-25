package com.miui.gallery.provider.cloudmanager;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class MediaRemarkInfo extends Entity {
    private long mCloudId;
    private int mOperationType = 0;

    public long getCloudId() {
        return this.mCloudId;
    }

    /* access modifiers changed from: protected */
    public final List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "mediaId", "INTEGER");
        addColumn(arrayList, "operationType", "INTEGER");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public final void onConvertToContents(ContentValues contentValues) {
        contentValues.put("mediaId", Long.valueOf(this.mCloudId));
        contentValues.put("operationType", Integer.valueOf(this.mOperationType));
    }

    /* access modifiers changed from: protected */
    public final void onInitFromCursor(Cursor cursor) {
        this.mCloudId = getLong(cursor, "mediaId");
        this.mOperationType = getInt(cursor, "operationType");
    }

    public void setCloudId(long j) {
        this.mCloudId = j;
    }

    public void setOperationType(int i) {
        this.mOperationType = i;
    }
}
