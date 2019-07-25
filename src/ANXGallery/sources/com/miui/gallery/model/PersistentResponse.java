package com.miui.gallery.model;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class PersistentResponse extends Entity implements Parcelable {
    public static final Creator<PersistentResponse> CREATOR = new Creator<PersistentResponse>() {
        public PersistentResponse createFromParcel(Parcel parcel) {
            return new PersistentResponse(parcel);
        }

        public PersistentResponse[] newArray(int i) {
            return new PersistentResponse[i];
        }
    };
    private long mExpireMillis;
    private long mLastVisitTime;
    private String mResponse;
    private long mUpdateTime;
    private String mUrl;

    public PersistentResponse() {
    }

    protected PersistentResponse(Parcel parcel) {
        this.mUrl = parcel.readString();
        this.mResponse = parcel.readString();
        this.mUpdateTime = parcel.readLong();
        this.mLastVisitTime = parcel.readLong();
        this.mId = parcel.readLong();
        this.mExpireMillis = parcel.readLong();
    }

    public PersistentResponse(String str, String str2, long j, long j2, long j3) {
        this.mUrl = str;
        this.mResponse = str2;
        this.mUpdateTime = j;
        this.mLastVisitTime = j2;
        this.mExpireMillis = j3;
    }

    public int describeContents() {
        return 0;
    }

    public long getExpireMillis() {
        return this.mExpireMillis;
    }

    public String getResponse() {
        return this.mResponse;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn((List<TableColumn>) arrayList, "url", "TEXT", true);
        addColumn(arrayList, "response", "TEXT");
        addColumn(arrayList, "updateTime", "INTEGER");
        addColumn(arrayList, "lastVisitTime", "INTEGER");
        addColumn(arrayList, "expireMillis", "INTEGER");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"url"};
    }

    public long getUpdateTime() {
        return this.mUpdateTime;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("url", this.mUrl);
        contentValues.put("response", this.mResponse);
        contentValues.put("updateTime", Long.valueOf(this.mUpdateTime));
        contentValues.put("lastVisitTime", Long.valueOf(this.mLastVisitTime));
        contentValues.put("expireMillis", Long.valueOf(this.mExpireMillis));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mUrl = getString(cursor, "url");
        this.mResponse = getString(cursor, "response");
        this.mUpdateTime = getLong(cursor, "updateTime");
        this.mLastVisitTime = getLong(cursor, "lastVisitTime");
        this.mExpireMillis = getLong(cursor, "expireMillis");
    }

    public void setLastVisitTime(long j) {
        this.mLastVisitTime = j;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.mUrl);
        parcel.writeString(this.mResponse);
        parcel.writeLong(this.mUpdateTime);
        parcel.writeLong(this.mLastVisitTime);
        parcel.writeLong(this.mId);
        parcel.writeLong(this.mExpireMillis);
    }
}
