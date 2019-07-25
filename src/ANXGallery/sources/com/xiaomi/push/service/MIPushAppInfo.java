package com.xiaomi.push.service;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.string.XMStringUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MIPushAppInfo {
    private static MIPushAppInfo sInstance;
    private Context appContext;
    private final List<String> disabledPushPkg = new ArrayList();
    private final List<String> disabledPushPkgCache = new ArrayList();
    private List<String> unRegisteredPkg = new ArrayList();

    private MIPushAppInfo(Context context) {
        String[] split;
        String[] split2;
        String[] split3;
        this.appContext = context.getApplicationContext();
        if (this.appContext == null) {
            this.appContext = context;
        }
        SharedPreferences sharedPreferences = this.appContext.getSharedPreferences("mipush_app_info", 0);
        for (String str : sharedPreferences.getString("unregistered_pkg_names", "").split(",")) {
            if (TextUtils.isEmpty(str)) {
                this.unRegisteredPkg.add(str);
            }
        }
        for (String str2 : sharedPreferences.getString("disable_push_pkg_names", "").split(",")) {
            if (!TextUtils.isEmpty(str2)) {
                this.disabledPushPkg.add(str2);
            }
        }
        for (String str3 : sharedPreferences.getString("disable_push_pkg_names_cache", "").split(",")) {
            if (!TextUtils.isEmpty(str3)) {
                this.disabledPushPkgCache.add(str3);
            }
        }
    }

    public static MIPushAppInfo getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new MIPushAppInfo(context);
        }
        return sInstance;
    }

    public void addDisablePushPkg(String str) {
        synchronized (this.disabledPushPkg) {
            if (!this.disabledPushPkg.contains(str)) {
                this.disabledPushPkg.add(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("disable_push_pkg_names", XMStringUtils.join((Collection<?>) this.disabledPushPkg, ",")).commit();
            }
        }
    }

    public void addDisablePushPkgCache(String str) {
        synchronized (this.disabledPushPkgCache) {
            if (!this.disabledPushPkgCache.contains(str)) {
                this.disabledPushPkgCache.add(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("disable_push_pkg_names_cache", XMStringUtils.join((Collection<?>) this.disabledPushPkgCache, ",")).commit();
            }
        }
    }

    public void addUnRegisteredPkg(String str) {
        synchronized (this.unRegisteredPkg) {
            if (!this.unRegisteredPkg.contains(str)) {
                this.unRegisteredPkg.add(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("unregistered_pkg_names", XMStringUtils.join((Collection<?>) this.unRegisteredPkg, ",")).commit();
            }
        }
    }

    public boolean isPushDisabled(String str) {
        boolean contains;
        synchronized (this.disabledPushPkg) {
            contains = this.disabledPushPkg.contains(str);
        }
        return contains;
    }

    public boolean isPushDisabled4User(String str) {
        boolean contains;
        synchronized (this.disabledPushPkgCache) {
            contains = this.disabledPushPkgCache.contains(str);
        }
        return contains;
    }

    public boolean isUnRegistered(String str) {
        boolean contains;
        synchronized (this.unRegisteredPkg) {
            contains = this.unRegisteredPkg.contains(str);
        }
        return contains;
    }

    public void removeDisablePushPkg(String str) {
        synchronized (this.disabledPushPkg) {
            if (this.disabledPushPkg.contains(str)) {
                this.disabledPushPkg.remove(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("disable_push_pkg_names", XMStringUtils.join((Collection<?>) this.disabledPushPkg, ",")).commit();
            }
        }
    }

    public void removeDisablePushPkgCache(String str) {
        synchronized (this.disabledPushPkgCache) {
            if (this.disabledPushPkgCache.contains(str)) {
                this.disabledPushPkgCache.remove(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("disable_push_pkg_names_cache", XMStringUtils.join((Collection<?>) this.disabledPushPkgCache, ",")).commit();
            }
        }
    }

    public void removeUnRegisteredPkg(String str) {
        synchronized (this.unRegisteredPkg) {
            if (this.unRegisteredPkg.contains(str)) {
                this.unRegisteredPkg.remove(str);
                this.appContext.getSharedPreferences("mipush_app_info", 0).edit().putString("unregistered_pkg_names", XMStringUtils.join((Collection<?>) this.unRegisteredPkg, ",")).commit();
            }
        }
    }
}
