package com.xiaomi.clientreport.util;

import android.content.Context;
import android.content.SharedPreferences.Editor;

public class SPManager {
    private static volatile SPManager sInstance;
    private Context mContext;

    private SPManager(Context context) {
        this.mContext = context;
    }

    public static SPManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (SPManager.class) {
                if (sInstance == null) {
                    sInstance = new SPManager(context);
                }
            }
        }
        return sInstance;
    }

    public synchronized long getLongValue(String str, String str2, long j) {
        try {
        } catch (Throwable unused) {
            return j;
        }
        return this.mContext.getSharedPreferences(str, 4).getLong(str2, j);
    }

    public synchronized String getStringValue(String str, String str2, String str3) {
        try {
        } catch (Throwable unused) {
            return str3;
        }
        return this.mContext.getSharedPreferences(str, 4).getString(str2, str3);
    }

    public synchronized void setLongValue(String str, String str2, long j) {
        Editor edit = this.mContext.getSharedPreferences(str, 4).edit();
        edit.putLong(str2, j);
        edit.commit();
    }

    public synchronized void setStringnValue(String str, String str2, String str3) {
        Editor edit = this.mContext.getSharedPreferences(str, 4).edit();
        edit.putString(str2, str3);
        edit.commit();
    }
}
