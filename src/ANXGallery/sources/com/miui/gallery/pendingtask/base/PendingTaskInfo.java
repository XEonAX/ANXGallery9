package com.miui.gallery.pendingtask.base;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class PendingTaskInfo extends Entity {
    private long mCreateTime;
    private byte[] mData;
    private long mExpireTime;
    private long mMinLatency;
    private int mNetType = 0;
    private boolean mRequireCharging;
    private boolean mRequireDeviceIdle;
    private int mRetryTime;
    private String mTaskTag;
    private int mTaskType;

    public long getCreateTime() {
        return this.mCreateTime;
    }

    public byte[] getData() {
        return this.mData;
    }

    public long getExpireTime() {
        return this.mExpireTime;
    }

    public long getMinLatencyMillis() {
        return this.mMinLatency;
    }

    public int getNetType() {
        return this.mNetType;
    }

    public int getRetryTime() {
        return this.mRetryTime;
    }

    /* access modifiers changed from: protected */
    public final List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "taskType", "INTEGER");
        addColumn(arrayList, "taskTag", "TEXT");
        addColumn(arrayList, "netType", "INTEGER");
        addColumn(arrayList, "charging", "INTEGER");
        addColumn(arrayList, "deviceIdle", "INTEGER");
        addColumn(arrayList, "data", "BLOB");
        addColumn(arrayList, "createTime", "INTEGER");
        addColumn((List<TableColumn>) arrayList, "expireTime", "INTEGER", String.valueOf(0));
        addColumn(arrayList, "retryTime", "INTEGER");
        return arrayList;
    }

    public int getTaskType() {
        return this.mTaskType;
    }

    public void increaseRetryTime() {
        this.mRetryTime++;
    }

    public boolean isRequireCharging() {
        return this.mRequireCharging;
    }

    public boolean isRequireDeviceIdle() {
        return this.mRequireDeviceIdle;
    }

    /* access modifiers changed from: protected */
    public final void onConvertToContents(ContentValues contentValues) {
        contentValues.put("taskType", Integer.valueOf(this.mTaskType));
        contentValues.put("taskTag", this.mTaskTag);
        contentValues.put("netType", Integer.valueOf(this.mNetType));
        contentValues.put("charging", Integer.valueOf(this.mRequireCharging ? 1 : 0));
        contentValues.put("deviceIdle", Integer.valueOf(this.mRequireDeviceIdle ? 1 : 0));
        contentValues.put("data", this.mData);
        contentValues.put("createTime", Long.valueOf(this.mCreateTime));
        contentValues.put("expireTime", Long.valueOf(this.mExpireTime));
        contentValues.put("retryTime", Integer.valueOf(this.mRetryTime));
    }

    /* access modifiers changed from: protected */
    public final void onInitFromCursor(Cursor cursor) {
        this.mTaskType = getInt(cursor, "taskType");
        this.mTaskTag = getString(cursor, "taskTag");
        this.mNetType = getInt(cursor, "netType");
        boolean z = false;
        this.mRequireCharging = getInt(cursor, "charging") == 1;
        if (getInt(cursor, "deviceIdle") == 1) {
            z = true;
        }
        this.mRequireDeviceIdle = z;
        this.mData = getBlob(cursor, "data");
        this.mCreateTime = getLong(cursor, "createTime");
        this.mExpireTime = getLong(cursor, "expireTime");
        this.mRetryTime = getInt(cursor, "retryTime");
    }

    public void setCreateTime(long j) {
        this.mCreateTime = j;
    }

    public void setData(byte[] bArr) {
        this.mData = bArr;
    }

    public void setExpireTime(long j) {
        this.mExpireTime = j;
    }

    public void setMinLatencyMillis(long j) {
        this.mMinLatency = j;
    }

    public void setNetType(int i) {
        this.mNetType = i;
    }

    public void setRequireCharging(boolean z) {
        this.mRequireCharging = z;
    }

    public void setRequireDeviceIdle(boolean z) {
        this.mRequireDeviceIdle = z;
    }

    public void setTaskTag(String str) {
        this.mTaskTag = str;
    }

    public void setTaskType(int i) {
        this.mTaskType = i;
    }
}
