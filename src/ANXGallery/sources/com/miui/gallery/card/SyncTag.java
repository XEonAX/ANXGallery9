package com.miui.gallery.card;

import android.accounts.Account;
import android.content.ContentValues;
import android.database.Cursor;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import java.util.ArrayList;
import java.util.List;

public class SyncTag extends Entity {
    private String mAccountName;
    private String mAccountType;
    private String mCardSyncInfo;
    private long mCardSyncTag;

    public SyncTag() {
    }

    public SyncTag(Account account) {
        this.mAccountName = account.name;
        this.mAccountType = account.type;
    }

    public String getCardSyncInfo() {
        return this.mCardSyncInfo;
    }

    public long getCardSyncTag() {
        return this.mCardSyncTag;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "accountName", "TEXT");
        addColumn(arrayList, "accountType", "TEXT");
        addColumn(arrayList, "cardSyncTag", "INTEGER");
        addColumn(arrayList, "cardSyncInfo", "TEXT");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("accountName", this.mAccountName);
        contentValues.put("accountType", this.mAccountType);
        contentValues.put("cardSyncTag", Long.valueOf(this.mCardSyncTag));
        contentValues.put("cardSyncInfo", this.mCardSyncInfo);
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mAccountName = getString(cursor, "accountName");
        this.mAccountType = getString(cursor, "accountType");
        this.mCardSyncTag = getLong(cursor, "cardSyncTag");
        this.mCardSyncInfo = getString(cursor, "cardSyncInfo");
    }
}
