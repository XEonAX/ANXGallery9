package com.miui.gallery.provider;

import android.accounts.Account;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import com.miui.account.AccountHelper;
import com.miui.gallery.R;

public class ShareAlbumManager {
    public static long getOriginalAlbumId(long j) {
        return j - 2147383647;
    }

    public static long getUniformAlbumId(long j) {
        return j + 2147383647;
    }

    public static boolean isOtherShareAlbumId(long j) {
        return j >= 2147383647 && j < 2147483637;
    }

    public static Cursor query(Context context, SQLiteDatabase sQLiteDatabase, String[] strArr, String str, String[] strArr2, String str2) {
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(context);
        if (xiaomiAccount == null) {
            return null;
        }
        return sQLiteDatabase.query(String.format("(SELECT * FROM (SELECT 2147383647+_id AS _id, creatorId, albumId, serverId, nickname FROM shareAlbum LEFT JOIN (SELECT user_id AS creatorId, miliao_nick AS nickname FROM userInfo) USING (creatorId)) LEFT JOIN (SELECT COUNT(*) AS count, albumId FROM shareUser GROUP BY albumId) USING (albumId) UNION SELECT * FROM (SELECT * FROM (SELECT _id, '%s' AS creatorId, serverId AS albumId, serverId FROM cloud WHERE (serverType=0)) LEFT JOIN (SELECT user_id AS creatorId, %s AS nickname FROM userInfo) USING (creatorId)) LEFT JOIN (SELECT COUNT(*) AS count, albumId FROM cloudUser GROUP BY albumId) USING (albumId))", new Object[]{xiaomiAccount.name, DatabaseUtils.sqlEscapeString(context.getResources().getString(R.string.album_owner_share))}), strArr, str, strArr2, null, null, str2);
    }
}
