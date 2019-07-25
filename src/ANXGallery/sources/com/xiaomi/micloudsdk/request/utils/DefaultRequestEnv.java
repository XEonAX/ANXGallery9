package com.xiaomi.micloudsdk.request.utils;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.xiaomi.micloudsdk.data.ExtendedAuthToken;
import com.xiaomi.micloudsdk.remote.XiaomiAccountRemoteMethodInvoker;
import com.xiaomi.micloudsdk.request.utils.Request.RequestEnv;
import com.xiaomi.micloudsdk.utils.IXiaomiAccountServiceProxy;
import java.io.IOException;

public class DefaultRequestEnv implements RequestEnv {
    private static final int[] RETRY_INTERVALS = {5000, 10000};
    private ThreadLocal<ExtendedAuthToken> mExtendedAuthToken = new ThreadLocal<>();
    private String mUserAgent;

    public String getAccountName() {
        Account xiaomiAccount = CloudUtils.getXiaomiAccount();
        if (xiaomiAccount != null) {
            return xiaomiAccount.name;
        }
        Log.e("DefaultRequestEnv", "no account in system");
        return null;
    }

    public synchronized String getUserAgent() {
        if (this.mUserAgent == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(Build.MODEL);
            sb.append("; MIUI/");
            sb.append(VERSION.INCREMENTAL);
            try {
                if (((Boolean) Class.forName("miui.os.Build").getField("IS_ALPHA_BUILD").get(null)).booleanValue()) {
                    sb.append(' ');
                    sb.append("ALPHA");
                }
            } catch (ClassNotFoundException unused) {
                Log.d("DefaultRequestEnv", "Not in MIUI in getUserAgent");
            } catch (NoSuchFieldException unused2) {
                Log.d("DefaultRequestEnv", "Not in MIUI in getUserAgent");
            } catch (IllegalAccessException unused3) {
                Log.d("DefaultRequestEnv", "Not in MIUI in getUserAgent");
            } catch (IllegalArgumentException unused4) {
                Log.d("DefaultRequestEnv", "Not in MIUI in getUserAgent");
            }
            this.mUserAgent = sb.toString();
        }
        return this.mUserAgent;
    }

    public void invalidateAuthToken() {
        if (this.mExtendedAuthToken.get() != null) {
            Log.d("DefaultRequestEnv", "invalidateAuthToken");
            AccountManager.get(Request.getContext()).invalidateAuthToken("com.xiaomi", ((ExtendedAuthToken) this.mExtendedAuthToken.get()).toPlain());
            this.mExtendedAuthToken.set(null);
        }
    }

    public ExtendedAuthToken queryAuthToken() {
        int i = 0;
        boolean z = false;
        while (i < 3) {
            try {
                Account xiaomiAccount = CloudUtils.getXiaomiAccount();
                if (xiaomiAccount == null) {
                    Log.e("DefaultRequestEnv", "no account in system");
                    return null;
                }
                String string = ((Bundle) AccountManager.get(Request.getContext()).getAuthToken(xiaomiAccount, "micloud", true, null, null).getResult()).getString("authtoken");
                if (string == null) {
                    return null;
                }
                this.mExtendedAuthToken.set(ExtendedAuthToken.parse(string));
                return (ExtendedAuthToken) this.mExtendedAuthToken.get();
            } catch (IOException e) {
                Log.e("DefaultRequestEnv", "IOException when getting service token", e);
                if (i < 2) {
                    try {
                        Thread.sleep((long) RETRY_INTERVALS[i]);
                    } catch (InterruptedException unused) {
                        Log.e("DefaultRequestEnv", "InterruptedException when sleep", e);
                    }
                }
                i++;
            } catch (OperationCanceledException e2) {
                Log.e("DefaultRequestEnv", "OperationCanceledException when getting service token", e2);
                return null;
            } catch (AuthenticatorException e3) {
                Log.e("DefaultRequestEnv", "AuthenticatorException when getting service token", e3);
                if (z) {
                    break;
                }
                invalidateAuthToken();
                z = true;
                i++;
            }
        }
        return null;
    }

    public String queryEncryptedAccountName() {
        final Account xiaomiAccount = CloudUtils.getXiaomiAccount();
        if (xiaomiAccount != null) {
            return (String) new XiaomiAccountRemoteMethodInvoker<String>(Request.getContext()) {
                /* access modifiers changed from: protected */
                public String invokeRemoteMethod(IBinder iBinder) throws RemoteException {
                    return IXiaomiAccountServiceProxy.getEncryptedUserId(iBinder, xiaomiAccount);
                }
            }.invoke();
        }
        Log.e("DefaultRequestEnv", "no account in system");
        return null;
    }
}
