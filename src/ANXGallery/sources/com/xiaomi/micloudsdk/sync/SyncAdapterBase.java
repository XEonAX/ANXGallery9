package com.xiaomi.micloudsdk.sync;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.accounts.AuthenticatorException;
import android.accounts.OperationCanceledException;
import android.content.AbstractThreadedSyncAdapter;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.content.SyncResult;
import android.os.Bundle;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.micloudsdk.data.ExtendedAuthToken;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.provider.GdprUtils;
import com.xiaomi.micloudsdk.sync.utils.SyncRecordUtils;
import com.xiaomi.micloudsdk.sync.utils.SyncTimeUtils;
import com.xiaomi.micloudsdk.utils.ReflectUtils;
import java.io.IOException;
import java.lang.reflect.Field;
import miui.cloud.stat.MiCloudStatUtil;

public abstract class SyncAdapterBase extends AbstractThreadedSyncAdapter {
    protected boolean isForceSync;
    protected boolean isIgnoreBackoff;
    protected boolean isIgnoreBatteryLow;
    protected boolean isIgnoreTemperature;
    protected boolean isIgnoreWifiSettings;
    protected boolean isManualSync;
    protected Account mAccount;
    protected final String mAuthType;
    protected String mAuthority;
    protected Context mContext;
    protected ExtendedAuthToken mExtToken;
    protected String mExtTokenStr;
    protected String[] mNumbers = new String[2];
    protected ContentResolver mResolver;
    protected SyncResult mSyncResult;
    protected String[] mTickets = new String[2];

    public SyncAdapterBase(Context context, boolean z, String str) {
        super(context, z);
        this.mContext = context;
        this.mResolver = context.getContentResolver();
        this.mAuthType = str;
    }

    private static void setMiSyncResultMessage(SyncResult syncResult, String str) {
        Field field = ReflectUtils.getField(syncResult.getClass(), "miSyncResult");
        if (field != null) {
            try {
                Object obj = field.get(syncResult);
                ReflectUtils.getField(obj.getClass(), "resultMessage").set(obj, str);
            } catch (IllegalAccessException unused) {
                throw new RuntimeException("Please file a bug to CloudService!!");
            }
        }
    }

    protected static void setPermissionError(SyncResult syncResult) {
        setMiSyncResultMessage(syncResult, "permission_error");
    }

    protected static void setRequestError(SyncResult syncResult) {
        setMiSyncResultMessage(syncResult, "request_error");
    }

    protected static void setSimActivatedError(SyncResult syncResult) {
        setMiSyncResultMessage(syncResult, "sim_activated_error");
    }

    /* access modifiers changed from: 0000 */
    public String getExtTokenStr(Context context, Account account, String str) {
        String str2 = "MiCloudSyncAdapterBase";
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("onPerformSync: getting auth token. authority: ");
            sb.append(str);
            Log.v(str2, sb.toString());
            AccountManagerFuture authToken = AccountManager.get(context).getAuthToken(account, this.mAuthType, true, null, null);
            if (authToken == null) {
                Log.e("MiCloudSyncAdapterBase", "onPerformSync: Null future.");
                return null;
            } else if (authToken.getResult() != null) {
                return ((Bundle) authToken.getResult()).getString("authtoken");
            } else {
                Log.e("MiCloudSyncAdapterBase", "onPerformSync: Null future result.");
                return null;
            }
        } catch (OperationCanceledException e) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync", e);
            return null;
        } catch (AuthenticatorException e2) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync", e2);
            return null;
        } catch (IOException e3) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync", e3);
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public abstract void onPerformMiCloudSync(Bundle bundle) throws CloudServerException;

    public void onPerformSync(Account account, Bundle bundle, String str, ContentProviderClient contentProviderClient, SyncResult syncResult) {
        Account account2 = account;
        Bundle bundle2 = bundle;
        String str2 = str;
        SyncResult syncResult2 = syncResult;
        if (!GdprUtils.isPermissionGranted(this.mContext)) {
            syncResult2.stats.numAuthExceptions++;
            StringBuilder sb = new StringBuilder();
            sb.append("Gdpr Permission deny: ");
            sb.append(str2);
            Log.i("MiCloudSyncAdapterBase", sb.toString());
            return;
        }
        this.mAccount = account2;
        this.mAuthority = str2;
        this.mSyncResult = syncResult2;
        long currentTimeMillis = System.currentTimeMillis();
        bundle.putBoolean("stat_key_sync_start", true);
        MiCloudStatUtil.performSyncPhoneStateStat(this.mContext, bundle);
        Log.d("MiCloudSyncAdapterBase", "onPerformSync: ---sync start---");
        StringBuilder sb2 = new StringBuilder();
        sb2.append("authority: ");
        sb2.append(str2);
        sb2.append(", ");
        sb2.append("extras: ");
        sb2.append(bundle.toString());
        Log.d("MiCloudSyncAdapterBase", sb2.toString());
        if (!ContentResolver.getMasterSyncAutomatically()) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync: master sync automatically is off. do not sync!!");
        } else if (!ContentResolver.getSyncAutomatically(account, str2)) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync: sync automatically is off. do not sync!!");
        } else if (MiCloudResolver.isSyncPausing(this.mContext, this.mAccount, this.mAuthority)) {
            Log.e("MiCloudSyncAdapterBase", "onPerformSync: sync is set to pause. do not sync!!");
        } else {
            this.isIgnoreTemperature = bundle.getBoolean("micloud_ignore_temperature", false);
            this.isIgnoreWifiSettings = bundle.getBoolean("micloud_ignore_wifi_settings", false);
            this.isIgnoreBatteryLow = bundle.getBoolean("micloud_ignore_battery_low", false);
            this.isForceSync = bundle.getBoolean("micloud_force", false);
            this.isManualSync = bundle.getBoolean("force", false);
            this.isIgnoreBackoff = bundle.getBoolean("ignore_backoff", false);
            if (this.isForceSync || this.isManualSync || this.isIgnoreBackoff || SyncTimeUtils.isSyncTimeAvailable(this.mContext, str2)) {
                if (this.isManualSync || this.isIgnoreBackoff) {
                    SyncTimeUtils.resetBackoffStatus(this.mContext, str2);
                }
                this.mExtTokenStr = getExtTokenStr(this.mContext, this.mAccount, this.mAuthority);
                if (this.mExtTokenStr == null) {
                    Log.e("MiCloudSyncAdapterBase", "onPerformSync: No ext token string.");
                    MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, new CloudServerException(-10001, 100), this.mAuthType, this.mExtTokenStr, bundle);
                    return;
                }
                this.mExtToken = ExtendedAuthToken.parse(this.mExtTokenStr);
                onTransformExtAuthToken(this.mExtToken);
                if (this.mExtToken == null) {
                    Log.e("MiCloudSyncAdapterBase", "onPerformSync: Cannot parse ext token.");
                    MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, new CloudServerException(-10001, 100), this.mAuthType, this.mExtTokenStr, bundle);
                    return;
                }
                try {
                    onPerformMiCloudSync(bundle);
                    if (this.mSyncResult.hasError()) {
                        Log.d("MiCloudSyncAdapterBase", "onPerformSync: hasError");
                        if (this.mSyncResult.hasSoftError()) {
                            Log.d("MiCloudSyncAdapterBase", "onPerformSync: softError");
                            MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, new CloudServerException(-10001, 1), this.mAuthType, this.mExtTokenStr, bundle);
                        } else if (this.mSyncResult.hasHardError()) {
                            Log.d("MiCloudSyncAdapterBase", "onPerformSync: hardError");
                            MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, new CloudServerException(-10001, 2), this.mAuthType, this.mExtTokenStr, bundle);
                        }
                        MiCloudStatUtil.performSyncErrorStat(this.mContext, currentTimeMillis, bundle);
                    } else {
                        Log.d("MiCloudSyncAdapterBase", "onPerformSync: NoError");
                        SyncTimeUtils.resetBackoffStatus(this.mContext, str2);
                        SyncRecordUtils.recordSyncResultSuccess(this.mContext, str2);
                        MiCloudStatUtil.performSyncSuccessStat(this.mContext, str2, currentTimeMillis, bundle);
                    }
                } catch (CloudServerException e) {
                    CloudServerException cloudServerException = e;
                    Log.e("MiCloudSyncAdapterBase", "onPerformSync", cloudServerException);
                    MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, cloudServerException, this.mAuthType, this.mExtTokenStr, bundle);
                    MiCloudStatUtil.performSyncErrorStat(this.mContext, currentTimeMillis, bundle);
                }
            } else {
                Log.e("MiCloudSyncAdapterBase", "onPerformSync: sync time is not available. do not sync!!");
                MiCloudExceptionHandler.handleException(this.mContext, account, str, syncResult, new CloudServerException(-10001, (int) BaiduSceneResult.SHOOTING), this.mAuthType, this.mExtTokenStr, bundle);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onTransformExtAuthToken(ExtendedAuthToken extendedAuthToken) {
    }
}
