package com.xiaomi.push.providers;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.xiaomi.channel.commonutils.logger.MyLog;

public class TrafficDatabaseHelper extends SQLiteOpenHelper {
    private static int DATABASE_VERSION = 1;
    public static final Object DataBaseLock = new Object();
    private static final String[] TRAFFIC_Columns = {"package_name", "TEXT", "message_ts", " LONG DEFAULT 0 ", "bytes", " LONG DEFAULT 0 ", "network_type", " INT DEFAULT -1 ", "rcv", " INT DEFAULT -1 ", "imsi", "TEXT"};

    public TrafficDatabaseHelper(Context context) {
        super(context, "traffic.db", null, DATABASE_VERSION);
    }

    private void createTrafficTable(SQLiteDatabase sQLiteDatabase) {
        StringBuilder sb = new StringBuilder("CREATE TABLE traffic(_id INTEGER  PRIMARY KEY ,");
        for (int i = 0; i < TRAFFIC_Columns.length - 1; i += 2) {
            if (i != 0) {
                sb.append(",");
            }
            sb.append(TRAFFIC_Columns[i]);
            sb.append(" ");
            sb.append(TRAFFIC_Columns[i + 1]);
        }
        sb.append(");");
        sQLiteDatabase.execSQL(sb.toString());
    }

    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        synchronized (DataBaseLock) {
            try {
                createTrafficTable(sQLiteDatabase);
            } catch (SQLException e) {
                MyLog.e((Throwable) e);
            }
        }
    }

    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
    }
}
