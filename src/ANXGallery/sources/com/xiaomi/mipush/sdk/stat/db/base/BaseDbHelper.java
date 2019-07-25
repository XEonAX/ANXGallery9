package com.xiaomi.mipush.sdk.stat.db.base;

import android.database.sqlite.SQLiteOpenHelper;

public abstract class BaseDbHelper extends SQLiteOpenHelper {
    public abstract String getTableName();
}
