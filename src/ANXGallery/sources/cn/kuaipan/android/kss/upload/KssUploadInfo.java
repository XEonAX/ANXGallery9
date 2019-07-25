package cn.kuaipan.android.kss.upload;

import android.util.Log;
import cn.kuaipan.android.kss.IKssUploadRequestResult;
import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.utils.OAuthTimeUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class KssUploadInfo implements KssDef {
    boolean mBroken;
    ServerExpect mExpectInfo;
    private final UploadFileInfo mFileInfo;
    private final long mGenerateTime;
    private long mMaxChunkSize;
    private final IKssUploadRequestResult mRequestResult;
    private String mUploadId;

    public KssUploadInfo(UploadFileInfo uploadFileInfo, IKssUploadRequestResult iKssUploadRequestResult) {
        this(uploadFileInfo, iKssUploadRequestResult, OAuthTimeUtils.currentTime());
    }

    public KssUploadInfo(UploadFileInfo uploadFileInfo, IKssUploadRequestResult iKssUploadRequestResult, long j) {
        this.mBroken = false;
        this.mMaxChunkSize = 4194304;
        this.mExpectInfo = null;
        this.mFileInfo = uploadFileInfo;
        this.mRequestResult = iKssUploadRequestResult;
        this.mGenerateTime = j;
    }

    public String getCommitString() {
        JSONObject jSONObject;
        try {
            jSONObject = new JSONObject();
            jSONObject.put("file_meta", this.mRequestResult.getFileMeta());
            int blockCount = this.mRequestResult.getBlockCount();
            JSONArray jSONArray = new JSONArray();
            if (this.mRequestResult != null && blockCount > 0) {
                for (int i = 0; i < blockCount; i++) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("commit_meta", this.mRequestResult.getBlock(i).meta);
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.put("commit_metas", jSONArray);
        } catch (JSONException unused) {
            Log.w("KssUploadInfo", "Failed generate Json String for UploadRequestResult");
            jSONObject = null;
        }
        return String.valueOf(jSONObject);
    }

    public UploadFileInfo getFileInfo() {
        return this.mFileInfo;
    }

    public long getGenerateTime() {
        return this.mGenerateTime;
    }

    public long getMaxChunkSize() {
        return this.mMaxChunkSize;
    }

    public IKssUploadRequestResult getRequestResult() {
        return this.mRequestResult;
    }

    public String getUploadId() {
        return this.mUploadId;
    }

    public boolean isBroken() {
        return this.mBroken;
    }

    public boolean isCompleted() {
        return this.mRequestResult != null && this.mRequestResult.isCompleted();
    }

    public void markBroken() {
        this.mBroken = true;
    }

    public void setMaxChunkSize(long j) {
        this.mMaxChunkSize = j;
    }

    public void setUploadId(String str) {
        this.mUploadId = str;
    }
}
