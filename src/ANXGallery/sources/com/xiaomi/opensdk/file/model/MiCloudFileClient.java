package com.xiaomi.opensdk.file.model;

import android.content.Context;
import android.text.TextUtils;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.exception.NetworkException;
import cn.kuaipan.android.exception.ServerException;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import com.xiaomi.opensdk.file.sdk.KssMasterRef;
import java.io.File;
import org.json.JSONException;
import org.json.JSONObject;

public final class MiCloudFileClient {
    private static volatile MiCloudFileClient sInstance;
    private KssMasterRef mKssMasterRef;

    private MiCloudFileClient(Context context) {
        this.mKssMasterRef = new KssMasterRef(context);
    }

    public static MiCloudFileClient getInstance(Context context) {
        if (sInstance == null) {
            synchronized (MiCloudFileClient.class) {
                if (sInstance == null) {
                    if (context != null) {
                        sInstance = new MiCloudFileClient(context);
                    } else {
                        throw new IllegalArgumentException("context can't be null");
                    }
                }
            }
        }
        return sInstance;
    }

    private void transferException(Exception exc) throws RetriableException, UnretriableException, AuthenticationException {
        if (exc instanceof KscException) {
            String simpleMessage = ((KscException) exc).getSimpleMessage();
            if (exc instanceof NetworkException) {
                throw new RetriableException(simpleMessage, 300000);
            } else if (!(exc instanceof ServerException) || ((ServerException) exc).getStatusCode() / 100 != 5) {
                throw new UnretriableException(simpleMessage);
            } else {
                throw new RetriableException(simpleMessage, 300000);
            }
        } else if (exc instanceof KscRuntimeException) {
            throw new UnretriableException(exc, ((KscRuntimeException) exc).getErrorCode());
        }
    }

    public void download(File file, DownloadParameter downloadParameter, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        if (!TextUtils.isEmpty(downloadParameter.getKssDownloadString())) {
            try {
                this.mKssMasterRef.download(file, downloadParameter, miCloudFileListener, true);
            } catch (KscException e) {
                transferException(e);
            } catch (KscRuntimeException e2) {
                transferException(e2);
            }
        } else {
            throw new IllegalArgumentException("Cannot detect download sdk");
        }
    }

    public CommitParameter getCommitParameter(UploadContext uploadContext) {
        CommitParameter commitParameter = new CommitParameter(uploadContext.getCommitString(), null, uploadContext.getUploadId(), uploadContext.getSha1(), uploadContext.getFileSize());
        return commitParameter;
    }

    public DownloadParameter getDownloadParameterForSFS(JSONObject jSONObject) throws JSONException {
        DownloadParameter downloadParameter = new DownloadParameter();
        downloadParameter.setKssDownloadString(jSONObject.getJSONObject("kss").toString());
        return downloadParameter;
    }

    public RequestUploadParameter getRequestUploadParameter(UploadContext uploadContext) {
        RequestUploadParameter requestUploadParameter = new RequestUploadParameter(uploadContext.getKssString(), null, uploadContext.getSha1(), uploadContext.getFileSize(), uploadContext.getFilePath());
        return requestUploadParameter;
    }

    public UploadParameter getUploadParameterForSFS(JSONObject jSONObject) throws JSONException {
        UploadParameter uploadParameter = new UploadParameter();
        uploadParameter.setUploadId(jSONObject.getString("upload_id"));
        uploadParameter.setKssUploadString(jSONObject.getJSONObject("kss").toString());
        return uploadParameter;
    }

    public void upload(UploadContext uploadContext) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        try {
            this.mKssMasterRef.upload(uploadContext);
        } catch (KscException e) {
            transferException(e);
        } catch (KscRuntimeException e2) {
            transferException(e2);
        }
    }
}
