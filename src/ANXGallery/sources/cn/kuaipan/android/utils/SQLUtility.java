package cn.kuaipan.android.utils;

import android.database.sqlite.SQLiteDatabase;

public class SQLUtility {
    private static final String[] CONFLICT_VALUES = {"", "ROLLBACK", "ABORT", "FAIL", "IGNORE", "REPLACE"};

    public static void createTable(SQLiteDatabase sQLiteDatabase, String str, String str2) {
        sQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s);", new Object[]{str, str2}));
    }

    public static String getSelection(String str) {
        return String.format("%s=?", new Object[]{str});
    }

    public static String getSelectionWithTemplete(String str, String... strArr) {
        return String.format(str, (Object[]) strArr);
    }
}
