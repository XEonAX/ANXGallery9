package com.miui.gallery.hybrid.hybridclient;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import android.os.Bundle;
import com.miui.account.AccountHelper;
import com.miui.gallery.hybrid.hybridclient.HybridClient.ActualPathCallback;

public class LoginHybridClient extends DeviceIdHybridClient {
    public LoginHybridClient(Context context, String str) {
        super(context, str);
    }

    public void getActualPath(final ActualPathCallback actualPathCallback) {
        if (actualPathCallback != null) {
            if (this.mContext == null) {
                actualPathCallback.onGetActualPath(null);
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("weblogin:");
            sb.append(this.mUrl);
            String sb2 = sb.toString();
            Account xiaomiAccount = AccountHelper.getXiaomiAccount(this.mContext);
            if (xiaomiAccount != null) {
                AccountManager.get(this.mContext).getAuthToken(xiaomiAccount, sb2, null, false, new AccountManagerCallback<Bundle>() {
                    public void run(AccountManagerFuture<Bundle> accountManagerFuture) {
                        try {
                            actualPathCallback.onGetActualPath(((Bundle) accountManagerFuture.getResult()).getString("authtoken"));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }, null);
            }
        }
    }
}
