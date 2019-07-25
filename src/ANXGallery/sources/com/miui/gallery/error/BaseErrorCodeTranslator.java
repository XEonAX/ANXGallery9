package com.miui.gallery.error;

import android.content.Context;
import android.os.AsyncTask;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorCodeTranslator;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.error.core.ErrorTranslateCallback;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.StorageUtils;
import java.util.Iterator;
import java.util.List;

public class BaseErrorCodeTranslator implements ErrorCodeTranslator {
    /* access modifiers changed from: private */
    public AsyncTask<ErrorCode, Void, ErrorTip> mTask;

    /* access modifiers changed from: private */
    public ErrorTip translateInternal(Context context, ErrorCode errorCode) {
        switch (errorCode) {
            case NO_CTA_PERMISSION:
                return new ErrorNoCTAPermissionTip(ErrorCode.NO_CTA_PERMISSION);
            case NO_NETWORK:
                return new ErrorNoNetworkTip(ErrorCode.NO_NETWORK);
            case NO_WIFI_CONNECTED:
                return new ErrorNoWifiTip(ErrorCode.NO_WIFI_CONNECTED);
            case SYNC_OFF:
                return new ErrorSyncOffTip(ErrorCode.SYNC_OFF);
            case STORAGE_FULL:
                boolean z = false;
                if (StorageUtils.hasExternalSDCard(context)) {
                    List mountedVolumePaths = StorageUtils.getMountedVolumePaths(context);
                    if (mountedVolumePaths != null && mountedVolumePaths.size() > 0) {
                        Iterator it = mountedVolumePaths.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                if (StorageUtils.getAvailableBytes((String) it.next()) > 104857600) {
                                    z = true;
                                }
                            }
                        }
                    }
                }
                return z ? new ErrorChangeStorageTip(ErrorCode.STORAGE_FULL) : new ErrorStorageFullTip(ErrorCode.STORAGE_FULL);
            case STORAGE_LOW:
                return new ErrorStorageFullTip(ErrorCode.STORAGE_LOW);
            case PRIMARY_STORAGE_WRITE_ERROR:
                return new ErrorPrimaryStorageWriteTip(ErrorCode.PRIMARY_STORAGE_WRITE_ERROR);
            case SECONDARY_STORAGE_WRITE_ERROR:
                return new ErrorSecondaryStorageWriteTip(ErrorCode.SECONDARY_STORAGE_WRITE_ERROR);
            case DECODE_ERROR:
                return new ErrorDecodeTip(ErrorCode.DECODE_ERROR);
            case NETWORK_RESTRICT:
                return new ErrorNetworkRestrictTip(ErrorCode.NETWORK_RESTRICT);
            case NO_ACCOUNT:
                return new ErrorNoAccountTip(ErrorCode.NO_ACCOUNT);
            case CONNECT_TIMEOUT:
                return new ErrorConnectTimeoutTip(ErrorCode.CONNECT_TIMEOUT);
            case SOCKET_TIMEOUT:
                return new ErrorSocketTimeoutTip(ErrorCode.SOCKET_TIMEOUT);
            case OVER_QUOTA:
                return new ErrorOverQuotaTip(ErrorCode.OVER_QUOTA);
            case THUMBNAIL_BUILD_ERROR:
                return new ErrorBuildThumbnailTip(ErrorCode.THUMBNAIL_BUILD_ERROR);
            case NOT_SYNCED:
                return new ErrorNotSyncedTip(ErrorCode.NOT_SYNCED);
            case WRITE_EXIF_ERROR:
                return new ErrorWriteExifTip(ErrorCode.WRITE_EXIF_ERROR);
            default:
                return new ErrorUnknownTip(ErrorCode.UNKNOWN);
        }
    }

    public void translate(final Context context, final ErrorCode errorCode, final ErrorTranslateCallback errorTranslateCallback) {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                if (BaseErrorCodeTranslator.this.mTask != null) {
                    BaseErrorCodeTranslator.this.mTask.cancel(true);
                    BaseErrorCodeTranslator.this.mTask = null;
                }
                BaseErrorCodeTranslator.this.mTask = new AsyncTask<ErrorCode, Void, ErrorTip>() {
                    /* access modifiers changed from: protected */
                    public ErrorTip doInBackground(ErrorCode... errorCodeArr) {
                        return BaseErrorCodeTranslator.this.translateInternal(context, errorCodeArr[0]);
                    }

                    /* access modifiers changed from: protected */
                    public void onPostExecute(ErrorTip errorTip) {
                        if (!isCancelled() && errorTranslateCallback != null) {
                            errorTranslateCallback.onTranslate(errorTip);
                        }
                    }
                }.execute(new ErrorCode[]{errorCode});
            }
        });
    }
}
