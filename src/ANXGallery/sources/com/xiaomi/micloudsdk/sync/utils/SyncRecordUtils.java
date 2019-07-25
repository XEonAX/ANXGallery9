package com.xiaomi.micloudsdk.sync.utils;

import android.content.Context;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.provider.GdprUtils;
import com.xiaomi.micloudsdk.sync.utils.SyncContentUtils.Reason;

public class SyncRecordUtils {
    public static void recordSyncResult(Context context, String str, CloudServerException cloudServerException) {
        Reason reason;
        Log.d("SyncRecordUtils", "recordSyncResult");
        if (cloudServerException.statusCode != -10001) {
            SyncContentUtils.recordSyncResult(context, str, cloudServerException.statusCode);
            return;
        }
        int i = cloudServerException.code;
        if (i != 52003) {
            switch (i) {
                case 0:
                    reason = Reason.SUCCESS;
                    break;
                case 1:
                    reason = Reason.SYNC_SOFT_ERROR;
                    break;
                case 2:
                    reason = Reason.SYNC_HARD_ERROR;
                    break;
                default:
                    switch (i) {
                        case 100:
                            reason = Reason.AUTH_TOKEN_ERROR;
                            break;
                        case BaiduSceneResult.SHOOTING /*101*/:
                            reason = Reason.TIME_UNAVAILABLE;
                            break;
                        default:
                            switch (i) {
                                case 1000:
                                    reason = Reason.NETWORK_DISALLOWED;
                                    break;
                                case 1001:
                                    reason = Reason.ACTIVATED_FAIL;
                                    break;
                                case 1002:
                                    reason = Reason.PERMISSION_LIMIT;
                                    break;
                                case 1003:
                                    reason = Reason.SECURE_SPACE_LIMIT;
                                    break;
                                default:
                                    reason = Reason.UNKNOWN;
                                    break;
                            }
                    }
            }
        } else {
            reason = GdprUtils.isGdprAvailable(context) ? Reason.PRIVACY_ERROR : Reason.UNKNOWN;
        }
        SyncContentUtils.recordSyncResult(context, str, reason);
    }

    public static void recordSyncResultSuccess(Context context, String str) {
        Log.d("SyncRecordUtils", "recordSyncResultSuccess");
        SyncContentUtils.recordSyncResult(context, str, Reason.SUCCESS);
    }
}
