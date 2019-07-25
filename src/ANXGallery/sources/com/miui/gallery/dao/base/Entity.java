package com.miui.gallery.dao.base;

import android.content.ContentValues;
import android.database.Cursor;
import java.util.List;

public abstract class Entity {
    protected long mId = -1;

    public static void addColumn(List<TableColumn> list, String str, String str2) {
        list.add(new TableColumn(str, str2));
    }

    public static void addColumn(List<TableColumn> list, String str, String str2, String str3) {
        list.add(new TableColumn(str, str2, str3));
    }

    public static void addColumn(List<TableColumn> list, String str, String str2, boolean z) {
        list.add(new TableColumn(str, str2, z));
    }

    public static byte[] getBlob(Cursor cursor, String str) {
        return cursor.getBlob(cursor.getColumnIndexOrThrow(str));
    }

    public static double getDoubleDefault(Cursor cursor, String str, double d) {
        int columnIndex = cursor.getColumnIndex(str);
        return columnIndex != -1 ? cursor.getDouble(columnIndex) : d;
    }

    public static float getFloat(Cursor cursor, String str) {
        return cursor.getFloat(cursor.getColumnIndexOrThrow(str));
    }

    public static float getFloatDefault(Cursor cursor, String str, float f) {
        int columnIndex = cursor.getColumnIndex(str);
        return columnIndex != -1 ? cursor.getFloat(columnIndex) : f;
    }

    public static int getInt(Cursor cursor, String str) {
        return cursor.getInt(cursor.getColumnIndexOrThrow(str));
    }

    public static int getIntDefault(Cursor cursor, String str, int i) {
        int columnIndex = cursor.getColumnIndex(str);
        return columnIndex != -1 ? cursor.getInt(columnIndex) : i;
    }

    public static long getLong(Cursor cursor, String str) {
        return cursor.getLong(cursor.getColumnIndexOrThrow(str));
    }

    public static long getLongDefault(Cursor cursor, String str, long j) {
        int columnIndex = cursor.getColumnIndex(str);
        return columnIndex != -1 ? cursor.getLong(columnIndex) : j;
    }

    public static String getString(Cursor cursor, String str) {
        return cursor.getString(cursor.getColumnIndexOrThrow(str));
    }

    public static String getStringDefault(Cursor cursor, String str, String str2) {
        int columnIndex = cursor.getColumnIndex(str);
        return columnIndex != -1 ? cursor.getString(columnIndex) : str2;
    }

    /* access modifiers changed from: protected */
    public ContentValues convertToContents() {
        ContentValues contentValues = new ContentValues();
        onConvertToContents(contentValues);
        return contentValues;
    }

    public final long getId() {
        return this.mId;
    }

    /* access modifiers changed from: protected */
    public abstract List<TableColumn> getTableColumns();

    /* access modifiers changed from: protected */
    public String getTableName() {
        return getClass().getSimpleName();
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"_id"};
    }

    /* access modifiers changed from: protected */
    public void initFromCursor(Cursor cursor) {
        this.mId = cursor.getLong(cursor.getColumnIndex("_id"));
        onInitFromCursor(cursor);
    }

    /* access modifiers changed from: protected */
    public abstract void onConvertToContents(ContentValues contentValues);

    /* access modifiers changed from: protected */
    public abstract void onInitFromCursor(Cursor cursor);

    public final void setId(long j) {
        this.mId = j;
    }
}
