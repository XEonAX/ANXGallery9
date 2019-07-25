package com.miui.gallery.assistant.library;

import android.annotation.SuppressLint;
import com.miui.gallery.assistant.library.Library.LibraryStatus;
import com.miui.gallery.assistant.library.LibraryManager.DownloadListener;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.pendingtask.PendingTaskManager;
import com.miui.gallery.pendingtask.base.PendingTask;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.xiaomi.micloudsdk.request.utils.CloudUtils;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class LibraryDownloadTask extends PendingTask<JSONObject> {
    /* access modifiers changed from: private */
    @SuppressLint({"UseSparseArrays"})
    public final Map<Long, Future> mDownloadFutures = Collections.synchronizedMap(new HashMap());
    private final DownloadListener mDownloadListener = new DownloadListener() {
        public void onDownloadProgress(long j, int i) {
        }

        public void onDownloadResult(long j, int i) {
            LibraryDownloadTask.this.mDownloadFutures.remove(Long.valueOf(j));
            if (i == 0 && LibraryDownloadTask.this.mDownloadFutures.size() == 0) {
                Log.d("LibraryDownloadTask", "LibraryDownloadTask download success!");
                PendingTaskManager.getInstance().postTask(LibraryDownloadTask.this.mOriginalType, LibraryDownloadTask.this.mOriginalData);
                if (LibraryManager.getInstance().isLibrarysExist(LibraryConstants.sStoryLibraries) && CloudUtils.getXiaomiAccount() == null) {
                    CardManager.getInstance().triggerGuaranteeScenarios(false);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public JSONObject mOriginalData;
    /* access modifiers changed from: private */
    public int mOriginalType;

    public LibraryDownloadTask(int i) {
        super(i);
    }

    public int getNetworkType() {
        return 1;
    }

    public JSONObject parseData(byte[] bArr) throws Exception {
        return new JSONObject(new String(bArr, "utf-8"));
    }

    public boolean process(JSONObject jSONObject) throws Exception {
        if (jSONObject != null) {
            try {
                this.mOriginalType = jSONObject.getInt("originalType");
                this.mOriginalData = jSONObject.getJSONObject("originalData");
                long[] jArr = (long[]) GsonUtils.fromJson(jSONObject.getString("libraryIds"), long[].class);
                if (jArr != null && jArr.length > 0) {
                    for (long j : jArr) {
                        Library librarySync = LibraryManager.getInstance().getLibrarySync(j);
                        if (librarySync != null && librarySync.getLibraryStatus() == LibraryStatus.STATE_NOT_DOWNLOADED) {
                            this.mDownloadFutures.put(Long.valueOf(j), LibraryManager.getInstance().downloadLibrary(librarySync, false, this.mDownloadListener));
                        }
                    }
                }
            } catch (Exception e) {
                Log.e("LibraryDownloadTask", (Throwable) e);
            }
        }
        return false;
    }

    public boolean requireCharging() {
        return false;
    }

    public boolean requireDeviceIdle() {
        return false;
    }

    public byte[] wrapData(JSONObject jSONObject) throws Exception {
        return jSONObject.toString().getBytes("utf-8");
    }
}
