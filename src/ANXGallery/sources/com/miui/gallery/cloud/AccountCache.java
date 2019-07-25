package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.util.SyncLog;

public class AccountCache {
    private static AccountInfo sAccountInfo;

    public static class AccountInfo {
        public final Account mAccount;
        public final GalleryExtendedAuthToken mToken;

        public AccountInfo(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
            this.mAccount = account;
            this.mToken = galleryExtendedAuthToken;
        }
    }

    public static synchronized Account getAccount() {
        synchronized (AccountCache.class) {
            if (sAccountInfo != null) {
                Account account = sAccountInfo.mAccount;
                return account;
            }
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(GalleryApp.sGetAndroidContext());
            return xiaomiAccount;
        }
    }

    public static AccountInfo getAccountInfo() {
        if (sAccountInfo == null) {
            AccountInfo requestAccountInfo = requestAccountInfo();
            if (requestAccountInfo != null) {
                update(requestAccountInfo.mAccount, requestAccountInfo.mToken);
            }
        }
        return sAccountInfo;
    }

    private static AccountInfo requestAccountInfo() {
        if (!CTA.canConnectNetwork()) {
            SyncLog.e("AccountCache", "requestAccount: cta not allowed");
            return null;
        }
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(sGetAndroidContext);
        if (xiaomiAccount == null) {
            SyncLog.e("AccountCache", "requestAccount: get account failed");
            return null;
        }
        GalleryExtendedAuthToken extToken = CloudUtils.getExtToken(sGetAndroidContext, xiaomiAccount);
        if (extToken != null) {
            return new AccountInfo(xiaomiAccount, extToken);
        }
        SyncLog.e("AccountCache", "requestAccount: get ext token failed");
        return null;
    }

    public static synchronized void update(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        synchronized (AccountCache.class) {
            if (account == null || galleryExtendedAuthToken == null) {
                sAccountInfo = null;
            } else {
                sAccountInfo = new AccountInfo(account, galleryExtendedAuthToken);
            }
        }
    }
}
