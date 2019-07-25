package com.miui.gallery.cloud;

import android.content.Context;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.xiaomi.micloudsdk.file.MiCloudFileMaster;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import com.xiaomi.opensdk.file.model.MiCloudFileListener;
import java.io.File;

public class GalleryKssManager {
    private static MiCloudFileMaster<RequestCloudItem>[] sMaster = new MiCloudFileMaster[4];

    private static synchronized MiCloudFileMaster<RequestCloudItem> createRequestor(boolean z, boolean z2) {
        synchronized (GalleryKssManager.class) {
            int i = (z ^ true ? 1 : 0) + (z2 ? 0 : 2);
            if (sMaster[i] == null) {
                AccountInfo accountInfo = AccountCache.getAccountInfo();
                if (accountInfo == null) {
                    return null;
                }
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                CloudUrlProvider urlProvider = CloudUrlProvider.getUrlProvider(z, z2);
                sMaster[i] = new MiCloudFileMaster<>(sGetAndroidContext, z ? new CloudGallerySharerRequestor(accountInfo.mAccount, urlProvider) : new CloudGalleryOwnerRequestor(accountInfo.mAccount, urlProvider));
            }
            MiCloudFileMaster<RequestCloudItem> miCloudFileMaster = sMaster[i];
            return miCloudFileMaster;
        }
    }

    private static void doDownload(MiCloudFileMaster<RequestCloudItem> miCloudFileMaster, RequestCloudItem requestCloudItem, String str, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        if (miCloudFileMaster != null) {
            ApplicationHelper.getMiCloudProvider().doFileSDKDownload(miCloudFileMaster, requestCloudItem, new File(str), miCloudFileListener);
        }
    }

    public static void doOwnerDownload(RequestCloudItem requestCloudItem, String str, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        doDownload(createRequestor(false, requestCloudItem.dbCloud.isVideoType()), requestCloudItem, str, miCloudFileListener);
    }

    public static void doOwnerUpload(RequestCloudItem requestCloudItem, File file) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        MiCloudFileMaster createRequestor = createRequestor(false, requestCloudItem.dbCloud.isVideoType());
        if (createRequestor != null) {
            ApplicationHelper.getMiCloudProvider().doFileSDKUpload(createRequestor, requestCloudItem, file, new UploadTransferLisener(requestCloudItem));
        }
    }

    public static void doSharerDownload(RequestCloudItem requestCloudItem, String str, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        doDownload(createRequestor(true, requestCloudItem.dbCloud.isVideoType()), requestCloudItem, str, miCloudFileListener);
    }

    public static void doSharerUpload(RequestCloudItem requestCloudItem, File file) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        MiCloudFileMaster createRequestor = createRequestor(true, requestCloudItem.dbCloud.isVideoType());
        if (createRequestor != null) {
            ApplicationHelper.getMiCloudProvider().doFileSDKUpload(createRequestor, requestCloudItem, file, new UploadTransferLisener(requestCloudItem));
        }
    }

    public static synchronized void reset() {
        synchronized (GalleryKssManager.class) {
            for (int i = 0; i < sMaster.length; i++) {
                sMaster[i] = null;
            }
        }
    }
}
