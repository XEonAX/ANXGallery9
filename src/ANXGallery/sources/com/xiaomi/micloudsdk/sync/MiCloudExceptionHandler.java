package com.xiaomi.micloudsdk.sync;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.SyncResult;
import android.os.Bundle;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.sync.utils.SyncRecordUtils;
import com.xiaomi.micloudsdk.sync.utils.SyncTimeUtils;
import com.xiaomi.micloudsdk.utils.PrefUtils;
import miui.cloud.stat.MiCloudStatUtil;

public class MiCloudExceptionHandler {
    public static void handleException(Context context, Account account, String str, SyncResult syncResult, CloudServerException cloudServerException, String str2, String str3, Bundle bundle) {
        String str4;
        Context context2 = context;
        String str5 = str;
        SyncResult syncResult2 = syncResult;
        CloudServerException cloudServerException2 = cloudServerException;
        int i = cloudServerException2.statusCode;
        boolean z = true;
        if (i == -10001) {
            StringBuilder sb = new StringBuilder();
            sb.append("Non-server error. code: ");
            sb.append(cloudServerException2.code);
            Log.w("MiCloudExceptionHandler", sb.toString());
            switch (cloudServerException2.code) {
                case 0:
                    str4 = "code_sync_success";
                    break;
                case 1:
                    str4 = "sync_soft_error";
                    break;
                case 2:
                    str4 = "sync_hard_error";
                    handleException(context, str, syncResult, (long) SyncTimeUtils.getSyncSuspendTime(context, str));
                    break;
                case 100:
                    handleUnauthorizedException(context, account, str, syncResult, str2, str3, bundle);
                    str4 = "auth_token_error";
                    break;
                case BaiduSceneResult.SHOOTING /*101*/:
                    str4 = "time_unavailable";
                    break;
                case 1000:
                    SyncAdapterBase.setPermissionError(syncResult);
                    str4 = "network_disallowed";
                    break;
                case 1001:
                    SyncAdapterBase.setSimActivatedError(syncResult);
                    str4 = "activated_fail";
                    break;
                default:
                    str4 = "code_sync_unknown";
                    break;
            }
        } else {
            if (i == 403) {
                Log.w("MiCloudExceptionHandler", "Http forbidden error. Suspend sync.");
                SyncAdapterBase.setRequestError(syncResult);
                str4 = "sever_error_forbidden";
                handleException(context, str, syncResult, (long) SyncTimeUtils.getSyncSuspendTime(context, str));
            } else if (i != 406) {
                switch (i) {
                    case 400:
                        Log.w("MiCloudExceptionHandler", "Http bad request error. Suspending sync.");
                        SyncAdapterBase.setRequestError(syncResult);
                        str4 = "sever_error_bad_request";
                        handleException(context, str, syncResult, (long) SyncTimeUtils.getSyncSuspendTime(context, str));
                        break;
                    case 401:
                        Log.w("MiCloudExceptionHandler", "Http unauthorized error.");
                        handleUnauthorizedException(context, account, str, syncResult, str2, str3, bundle);
                        str4 = "sever_error_unauthorized";
                        break;
                    default:
                        if (!cloudServerException.is5xxServerException()) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Unrecognized server error ");
                            sb2.append(cloudServerException2.statusCode);
                            Log.e("MiCloudExceptionHandler", sb2.toString());
                            str4 = "code_sync_unknown";
                            break;
                        } else {
                            str4 = "server_5xx_error";
                            long j = cloudServerException.get5xxServerExceptionRetryTime();
                            if (j == 2147483647L) {
                                j = (long) SyncTimeUtils.getSyncSuspendTime(context, str);
                            }
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Http 5xx error. retryTime: ");
                            sb3.append(j);
                            Log.w("MiCloudExceptionHandler", sb3.toString());
                            SyncAdapterBase.setRequestError(syncResult);
                            handleException(context, str, syncResult, j);
                            break;
                        }
                }
            } else {
                Log.w("MiCloudExceptionHandler", "Http not-acceptable error. Suspend sync.");
                SyncAdapterBase.setRequestError(syncResult);
                str4 = "sever_error_not-acceptable";
                handleException(context, str, syncResult, (long) SyncTimeUtils.getSyncSuspendTime(context, str));
            }
            SyncRecordUtils.recordSyncResult(context, str, cloudServerException2);
            MiCloudStatUtil.wrapErrorBundle(bundle, str, str4, z);
        }
        z = false;
        SyncRecordUtils.recordSyncResult(context, str, cloudServerException2);
        MiCloudStatUtil.wrapErrorBundle(bundle, str, str4, z);
    }

    public static void handleException(Context context, String str, SyncResult syncResult, long j) {
        SyncTimeUtils.suspendSync(context, str, j);
        setSyncRetry(syncResult, j);
    }

    private static void handleUnauthorizedException(Context context, Account account, String str, SyncResult syncResult, String str2, String str3, Bundle bundle) {
        String format = String.format("TokenExpiredDay_%s", new Object[]{str});
        long currentTimeMillis = System.currentTimeMillis() / 86400000;
        if (PrefUtils.getLong(context, format, Long.valueOf(0)).longValue() == currentTimeMillis) {
            Log.w("MiCloudExceptionHandler", "Http unauthorized error. Suspend sync.");
            syncResult.stats.numAuthExceptions++;
            handleException(context, str, syncResult, (long) SyncTimeUtils.getSyncSuspendTime(context, str));
            return;
        }
        Log.w("MiCloudExceptionHandler", "Http unauthorized error. Invalid and retry");
        invalidAuthToken(context, account, str2, str3);
        ContentResolver.requestSync(account, str, bundle);
        PrefUtils.putLong(context, format, Long.valueOf(currentTimeMillis));
    }

    private static void invalidAuthToken(Context context, Account account, String str, String str2) {
        AccountManager accountManager = AccountManager.get(context);
        accountManager.getAuthToken(account, str, true, null, null);
        accountManager.invalidateAuthToken(account.type, str2);
    }

    private static void setSyncRetry(SyncResult syncResult, long j) {
        syncResult.stats.numIoExceptions++;
        syncResult.delayUntil = j;
    }
}
