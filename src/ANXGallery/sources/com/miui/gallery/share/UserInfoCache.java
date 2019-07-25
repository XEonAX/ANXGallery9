package com.miui.gallery.share;

import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;

public class UserInfoCache extends DBCache<String, UserInfo> {
    private static final UserInfoCache sInstance = new UserInfoCache();

    private UserInfoCache() {
    }

    public static UserInfoCache getInstance() {
        return sInstance;
    }

    public Uri getUri() {
        return GalleryCloudUtils.USER_INFO_URI;
    }

    /* access modifiers changed from: protected */
    public String newKey(Cursor cursor) {
        return cursor.getString(2);
    }

    /* access modifiers changed from: protected */
    public UserInfo newValue(Cursor cursor) {
        String string = cursor.getString(2);
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        UserInfo userInfo = new UserInfo(string);
        userInfo.setAliasNick(cursor.getString(3));
        userInfo.setMiliaoNick(cursor.getString(4));
        userInfo.setMiliaoIconUrl(cursor.getString(5));
        return userInfo;
    }
}
