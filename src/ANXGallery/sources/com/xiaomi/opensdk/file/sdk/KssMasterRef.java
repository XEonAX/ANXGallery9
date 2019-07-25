package com.xiaomi.opensdk.file.sdk;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.exception.ServerMsgException;
import cn.kuaipan.android.http.IKscTransferListener;
import cn.kuaipan.android.http.KscHttpTransmitter;
import cn.kuaipan.android.kss.IKssDownloadRequestResult;
import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.kss.download.KssDownloader;
import cn.kuaipan.android.kss.upload.KssUploadInfo;
import cn.kuaipan.android.kss.upload.KssUploader;
import cn.kuaipan.android.kss.upload.UploadFileInfo;
import cn.kuaipan.android.kss.upload.UploadTaskStore;
import cn.kuaipan.android.utils.ContextUtils;
import com.xiaomi.opensdk.file.model.DownloadParameter;
import com.xiaomi.opensdk.file.model.MiCloudFileListener;
import com.xiaomi.opensdk.file.model.UploadContext;
import com.xiaomi.opensdk.file.model.UploadParameter;
import com.xiaomi.opensdk.file.utils.FileSDKUtils;
import java.io.File;
import org.json.JSONException;

public class KssMasterRef implements KssDef {
    private final String TAG = "KssMasterRef";
    private final KssDownloader mDownloader;
    private final UploadTaskStore mTaskStore;
    private final KssUploader mUploader;

    private class KscTransferListener extends cn.kuaipan.android.http.IKscTransferListener.KscTransferListener {
        public MiCloudFileListener mMiCloudFileListener;

        public KscTransferListener(MiCloudFileListener miCloudFileListener) {
            this.mMiCloudFileListener = miCloudFileListener;
        }

        public void onDataReceived(long j, long j2) {
            if (this.mMiCloudFileListener != null) {
                this.mMiCloudFileListener.onDataReceived(j, j2);
            }
        }

        public void onDataSended(long j, long j2) {
            if (this.mMiCloudFileListener != null) {
                this.mMiCloudFileListener.onDataSended(j, j2);
            }
        }
    }

    public KssMasterRef(Context context) {
        this.mTaskStore = new UploadTaskStore(context, new FileDataFactory());
        KscHttpTransmitter kscHttpTransmitter = new KscHttpTransmitter(context);
        kscHttpTransmitter.setUserAgent(4, getUserAgent(context));
        this.mUploader = new KssUploader(kscHttpTransmitter, this.mTaskStore);
        this.mDownloader = new KssDownloader(kscHttpTransmitter);
    }

    private void deleteUploadInfo(int i) throws InterruptedException {
        if (this.mTaskStore != null) {
            this.mTaskStore.removeUploadInfo(i);
        }
    }

    private static int getUploadHash(File file, String str, UploadFileInfo uploadFileInfo) {
        String sha1 = uploadFileInfo == null ? "" : uploadFileInfo.getSha1();
        StringBuilder sb = new StringBuilder();
        sb.append(file);
        sb.append(":");
        sb.append(str);
        sb.append(":");
        sb.append(sha1);
        return sb.toString().hashCode();
    }

    private KssUploadInfo getUploadInfo(UploadFileInfo uploadFileInfo, UploadContext uploadContext, int i) throws KscException, InterruptedException {
        KssUploadInfo uploadInfo = this.mTaskStore == null ? null : this.mTaskStore.getUploadInfo(i);
        if (uploadInfo == null) {
            UploadParameter uploadParam = uploadContext.getUploadParam();
            if (uploadParam != null) {
                try {
                    KssUploadInfo kssUploadInfo = new KssUploadInfo(uploadFileInfo, new FileUploadRequestResult(FileSDKUtils.contentKssJsonToMap(uploadParam.toJsonObject())));
                    kssUploadInfo.setUploadId(uploadParam.getUploadId());
                    if (this.mTaskStore != null) {
                        this.mTaskStore.putUploadInfo(i, kssUploadInfo);
                    }
                    uploadInfo = kssUploadInfo;
                } catch (JSONException e) {
                    throw KscException.newException(e, "getUploadInfo failed");
                }
            } else {
                throw new KscRuntimeException(500003, "uploadParam null");
            }
        }
        uploadInfo.setMaxChunkSize(uploadContext.getMaxChunkSize());
        StringBuilder sb = new StringBuilder();
        sb.append("KssUploadInfo Return:");
        sb.append(uploadInfo.getUploadId());
        Log.w("KssMasterRef", sb.toString());
        return uploadInfo;
    }

    private static String getUserAgent(Context context) {
        return String.format("KssRC4/1.0 %s/%s S3SDK/%s", new Object[]{context.getPackageName(), ContextUtils.getAppVersion(context), "0.9.0a"});
    }

    public void download(File file, DownloadParameter downloadParameter, MiCloudFileListener miCloudFileListener, boolean z) throws KscException, InterruptedException {
        if (file != null) {
            KscTransferListener kscTransferListener = new KscTransferListener(miCloudFileListener);
            try {
                FileDownloadRequestResult fileDownloadRequestResult = new FileDownloadRequestResult(FileSDKUtils.contentKssJsonToMap(downloadParameter.toJsonObject()));
                if (fileDownloadRequestResult.getStatus() != 0) {
                    String message = fileDownloadRequestResult.getMessage();
                    if (TextUtils.isEmpty(message)) {
                        throw new KscException(503000, "Unknow error when requestDownload.");
                    }
                    throw new ServerMsgException(200, message, "Failed on requestDownload");
                }
                this.mDownloader.download(file, z, (IKscTransferListener) kscTransferListener, (IKssDownloadRequestResult) fileDownloadRequestResult);
            } catch (JSONException e) {
                throw KscException.newException(e, "download failed");
            }
        } else {
            throw new KscRuntimeException(500003, "Save path can't be null.");
        }
    }

    public boolean hasStoredUploadInfo(int i) throws InterruptedException {
        Boolean bool;
        if (this.mTaskStore == null) {
            bool = null;
        } else {
            bool = Boolean.valueOf(this.mTaskStore.getUploadInfo(i) != null);
        }
        return bool.booleanValue();
    }

    public void upload(UploadContext uploadContext) throws KscException, InterruptedException {
        File localFile = uploadContext.getLocalFile();
        if (localFile == null || !localFile.isFile() || !localFile.canRead() || localFile.length() <= 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(localFile);
            sb.append(" is not a exist file.");
            throw new KscRuntimeException(500003, sb.toString());
        }
        KscTransferListener kscTransferListener = new KscTransferListener(uploadContext.getListener());
        UploadFileInfo fileInfo = UploadFileInfo.getFileInfo(localFile);
        int uploadHash = getUploadHash(localFile, localFile.getAbsolutePath(), fileInfo);
        if (hasStoredUploadInfo(uploadHash) || uploadContext.getUploadParam() != null) {
            KssUploadInfo kssUploadInfo = null;
            while (!Thread.interrupted()) {
                if (kssUploadInfo == null) {
                    kssUploadInfo = getUploadInfo(fileInfo, uploadContext, uploadHash);
                }
                if (kssUploadInfo == null) {
                    kscTransferListener.setSendTotal(localFile.length());
                    kscTransferListener.setSendPos(localFile.length());
                } else if (kssUploadInfo.isBroken()) {
                    uploadContext.setNeedRequestUpload(true);
                    uploadContext.setUploadParam(null);
                    return;
                } else if (kssUploadInfo.isCompleted()) {
                    kscTransferListener.setSendTotal(localFile.length());
                    kscTransferListener.setSendPos(localFile.length());
                    deleteUploadInfo(uploadHash);
                    uploadContext.setNeedRequestUpload(false);
                    uploadContext.setCommitString(kssUploadInfo.getCommitString());
                    uploadContext.setUploadId(kssUploadInfo.getUploadId());
                    uploadContext.setSha1(kssUploadInfo.getFileInfo().getSha1());
                } else {
                    this.mUploader.upload(localFile, kscTransferListener, uploadHash, kssUploadInfo);
                }
                return;
            }
            throw new InterruptedException();
        }
        uploadContext.setNeedRequestUpload(true);
        uploadContext.setKssString(fileInfo.getKssString());
        uploadContext.setSha1(fileInfo.getSha1());
    }
}
