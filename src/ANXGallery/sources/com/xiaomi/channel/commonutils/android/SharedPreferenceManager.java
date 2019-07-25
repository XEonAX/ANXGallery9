package com.xiaomi.channel.commonutils.android;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public class SharedPreferenceManager {
    private static volatile SharedPreferenceManager sInstance;
    private Map<String, Map<String, String>> mCaches = new HashMap();
    /* access modifiers changed from: private */
    public Context mContext;
    private Handler mHandler = new Handler(Looper.getMainLooper());

    private SharedPreferenceManager(Context context) {
        this.mContext = context;
    }

    private synchronized String getDataFromCache(String str, String str2) {
        if (this.mCaches == null || TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return "";
        }
        try {
            Map map = (Map) this.mCaches.get(str);
            if (map != null) {
                return (String) map.get(str2);
            }
            return "";
        } catch (Throwable unused) {
            return "";
        }
    }

    public static SharedPreferenceManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (SharedPreferenceManager.class) {
                if (sInstance == null) {
                    sInstance = new SharedPreferenceManager(context);
                }
            }
        }
        return sInstance;
    }

    private synchronized void putData2Cache(String str, String str2, String str3) {
        if (this.mCaches == null) {
            this.mCaches = new HashMap();
        }
        Map map = (Map) this.mCaches.get(str);
        if (map == null) {
            map = new HashMap();
        }
        map.put(str2, str3);
        this.mCaches.put(str, map);
    }

    public synchronized String getStringValue(String str, String str2, String str3) {
        String dataFromCache = getDataFromCache(str, str2);
        if (!TextUtils.isEmpty(dataFromCache)) {
            return dataFromCache;
        }
        return this.mContext.getSharedPreferences(str, 4).getString(str2, str3);
    }

    public synchronized void setStringnValue(final String str, final String str2, final String str3) {
        putData2Cache(str, str2, str3);
        this.mHandler.post(new Runnable() {
            public void run() {
                Editor edit = SharedPreferenceManager.this.mContext.getSharedPreferences(str, 4).edit();
                edit.putString(str2, str3);
                edit.commit();
            }
        });
    }
}
