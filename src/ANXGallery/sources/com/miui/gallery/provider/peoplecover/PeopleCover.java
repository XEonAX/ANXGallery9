package com.miui.gallery.provider.peoplecover;

import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class PeopleCover extends Entity {
    private int mCoverScore;
    private String mCoverServerId;
    private String mPeopleServerId;
    private String mPeopleServerTag;

    private PeopleCover() {
    }

    public PeopleCover(String str, String str2, String str3, int i) {
        this.mPeopleServerId = str;
        this.mCoverServerId = str2;
        this.mPeopleServerTag = str3;
        this.mCoverScore = i;
    }

    public String getCoverId() {
        return this.mCoverServerId;
    }

    public int getCoverScore() {
        return this.mCoverScore;
    }

    public String getServerTag() {
        return this.mPeopleServerTag;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "peopleServerId", "TEXT");
        addColumn(arrayList, "coverServerId", "TEXT");
        addColumn(arrayList, "peopleServerTag", "TEXT");
        addColumn(arrayList, "coverScore", "INTEGER");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"peopleServerId"};
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("peopleServerId", this.mPeopleServerId);
        contentValues.put("coverServerId", this.mCoverServerId);
        contentValues.put("peopleServerTag", this.mPeopleServerTag);
        contentValues.put("coverScore", Integer.valueOf(this.mCoverScore));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mPeopleServerId = getString(cursor, "peopleServerId");
        this.mCoverServerId = getString(cursor, "coverServerId");
        this.mPeopleServerTag = getString(cursor, "peopleServerTag");
        this.mCoverScore = getInt(cursor, "coverScore");
    }

    public void setCoverId(String str) {
        this.mCoverServerId = str;
    }

    public void setCoverScore(int i) {
        this.mCoverScore = i;
    }

    public void setServerTag(String str) {
        this.mPeopleServerTag = str;
    }
}
