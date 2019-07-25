package com.miui.gallery.card;

import android.accounts.Account;
import android.content.ContentValues;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.util.MiscUtil;
import java.util.List;
import java.util.Locale;

public class SyncTagUtil {
    public static void ensureAccount(Account account) {
        if (account != null && !MiscUtil.isValid(GalleryEntityManager.getInstance().query(SyncTag.class, getAcountSelection(account), null))) {
            GalleryEntityManager.getInstance().insert((Entity) new SyncTag(account));
        }
    }

    private static String getAcountSelection(Account account) {
        StringBuilder sb = new StringBuilder();
        sb.append("accountName = '");
        sb.append(account.name);
        sb.append("' AND ");
        sb.append("accountType");
        sb.append(" = '");
        sb.append(account.type);
        sb.append("'");
        return sb.toString();
    }

    public static String getCardSyncInfo(Account account) {
        SyncTag syncTagByAccount = getSyncTagByAccount(account);
        return syncTagByAccount != null ? syncTagByAccount.getCardSyncInfo() : "";
    }

    public static long getCardSyncTag(Account account) {
        SyncTag syncTagByAccount = getSyncTagByAccount(account);
        if (syncTagByAccount != null) {
            return syncTagByAccount.getCardSyncTag();
        }
        return 0;
    }

    private static SyncTag getSyncTagByAccount(Account account) {
        if (account != null) {
            Class<SyncTag> cls = SyncTag.class;
            List query = GalleryEntityManager.getInstance().query(cls, getAcountSelection(account), null, null, String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(0), Integer.valueOf(1)}));
            if (MiscUtil.isValid(query)) {
                return (SyncTag) query.get(0);
            }
        }
        return null;
    }

    public static void setCardSyncInfo(Account account, String str) {
        if (account != null) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("cardSyncInfo", str);
            GalleryEntityManager.getInstance().update(SyncTag.class, contentValues, getAcountSelection(account), null);
        }
    }

    public static void setCardSyncTag(Account account, long j) {
        if (account != null) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("cardSyncTag", Long.valueOf(j));
            GalleryEntityManager.getInstance().update(SyncTag.class, contentValues, getAcountSelection(account), null);
        }
    }
}
