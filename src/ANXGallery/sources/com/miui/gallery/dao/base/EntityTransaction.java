package com.miui.gallery.dao.base;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class EntityTransaction {
    private SQLiteDatabase db;

    public EntityTransaction(SQLiteOpenHelper sQLiteOpenHelper) {
        this.db = sQLiteOpenHelper.getWritableDatabase();
    }

    public void begin() {
        this.db.beginTransaction();
    }

    public void commit() {
        this.db.setTransactionSuccessful();
    }

    public void end() {
        this.db.endTransaction();
        this.db = null;
    }
}
