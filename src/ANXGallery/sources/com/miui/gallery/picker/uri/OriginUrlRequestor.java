package com.miui.gallery.picker.uri;

import android.net.Uri;
import android.os.AsyncTask;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.cloud.CloudGalleryOwnerRequestor;
import com.miui.gallery.cloud.CloudGallerySharerRequestor;
import com.miui.gallery.cloud.CloudUrlProvider;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.adapter.BaseUriAdapter;
import com.miui.gallery.util.Log;
import com.xiaomi.micloudsdk.file.MiCloudFileRequestor;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

public class OriginUrlRequestor {
    /* access modifiers changed from: private */
    public ProgressListener mProgressListener;
    private AsyncTask mRequestAsyncTask;
    /* access modifiers changed from: private */
    public final List<OriginUrlRequestTask> mTasks;

    public static class OriginInfo {
        private static String FILE_SHA1 = "sha1";
        private static String FILE_URI = "file_uri";
        private static String ORIGIN_DOWNLOAD_INFO = "origin_download_info";
        private static String ORIGIN_HEIGHT = "origin_height";
        private static String ORIGIN_WIDTH = "origin_width";
        private Uri mFileUri;
        private int mHeight;
        private JSONObject mOriginDownloadInfo;
        private String mSha1;
        private int mWidth;

        public OriginInfo(Uri uri, String str) {
            this.mFileUri = uri;
            this.mSha1 = str;
        }

        public void setOriginDownloadInfo(JSONObject jSONObject, int i, int i2) {
            this.mOriginDownloadInfo = jSONObject;
            this.mHeight = i;
            this.mWidth = i2;
        }

        public String toJson() {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put(FILE_URI, this.mFileUri);
                jSONObject.put(FILE_SHA1, this.mSha1);
                if (this.mOriginDownloadInfo != null) {
                    jSONObject.put(ORIGIN_DOWNLOAD_INFO, this.mOriginDownloadInfo);
                    jSONObject.put(ORIGIN_HEIGHT, this.mHeight);
                    jSONObject.put(ORIGIN_WIDTH, this.mWidth);
                }
                return jSONObject.toString();
            } catch (Exception unused) {
                Log.e("OriginUrlRequestor", "originInfo to json error");
                return null;
            }
        }
    }

    public static class OriginUrlRequestTask {
        Uri mDownloadUri;
        int mMediaType;
        int mOriginHeight;
        int mOriginWidth;
        int mPosition;

        public OriginUrlRequestTask(int i, Uri uri, int i2, int i3, int i4) {
            this.mPosition = i;
            this.mDownloadUri = uri;
            this.mOriginHeight = i2;
            this.mOriginWidth = i3;
            this.mMediaType = i4;
        }
    }

    public interface ProgressListener {
        void onCancelled();

        void onEnd(ArrayList<OriginInfo> arrayList, boolean z);

        void onStart(int i);

        void onUpdate(int i);
    }

    public OriginUrlRequestor(ArrayList<OriginUrlRequestTask> arrayList, ProgressListener progressListener) {
        this.mTasks = (List) arrayList.clone();
        this.mProgressListener = progressListener;
    }

    public void cancel() {
        if (this.mRequestAsyncTask != null) {
            this.mRequestAsyncTask.cancel(true);
        }
    }

    public void destroy() {
        if (this.mRequestAsyncTask != null) {
            this.mRequestAsyncTask.cancel(true);
            this.mRequestAsyncTask = null;
        }
        if (this.mProgressListener != null) {
            this.mProgressListener = null;
        }
    }

    public void start(Uri[] uriArr, String[] strArr) {
        final ArrayList arrayList = new ArrayList(uriArr != null ? uriArr.length : 0);
        if (uriArr == null || strArr == null || uriArr.length != strArr.length) {
            if (this.mProgressListener != null) {
                this.mProgressListener.onEnd(arrayList, false);
            }
            return;
        }
        for (int i = 0; i < uriArr.length; i++) {
            arrayList.add(new OriginInfo(uriArr[i], strArr[i]));
        }
        this.mProgressListener.onStart(this.mTasks.size());
        this.mRequestAsyncTask = new AsyncTask<Void, Integer, Boolean>() {
            /* access modifiers changed from: protected */
            public Boolean doInBackground(Void... voidArr) {
                if (OriginUrlRequestor.this.mTasks.isEmpty()) {
                    return Boolean.valueOf(true);
                }
                if (!NetworkUtils.isNetworkConnected() || !CTA.canConnectNetwork()) {
                    return Boolean.valueOf(false);
                }
                AccountInfo accountInfo = AccountCache.getAccountInfo();
                if (accountInfo == null) {
                    return Boolean.valueOf(false);
                }
                BaseUriAdapter baseUriAdapter = new BaseUriAdapter();
                MiCloudFileRequestor cloudGalleryOwnerRequestor = new CloudGalleryOwnerRequestor(accountInfo.mAccount, CloudUrlProvider.getUrlProvider(false, false));
                MiCloudFileRequestor cloudGallerySharerRequestor = new CloudGallerySharerRequestor(accountInfo.mAccount, CloudUrlProvider.getUrlProvider(true, false));
                MiCloudFileRequestor cloudGalleryOwnerRequestor2 = new CloudGalleryOwnerRequestor(accountInfo.mAccount, CloudUrlProvider.getUrlProvider(false, true));
                MiCloudFileRequestor cloudGallerySharerRequestor2 = new CloudGallerySharerRequestor(accountInfo.mAccount, CloudUrlProvider.getUrlProvider(true, true));
                for (OriginUrlRequestTask originUrlRequestTask : OriginUrlRequestor.this.mTasks) {
                    if (isCancelled()) {
                        return Boolean.valueOf(false);
                    }
                    if (originUrlRequestTask.mMediaType != 0) {
                        DBImage dBItemForUri = baseUriAdapter.getDBItemForUri(originUrlRequestTask.mDownloadUri);
                        RequestCloudItem requestCloudItem = new RequestCloudItem(DownloadType.ORIGIN.getPriority(), dBItemForUri);
                        MiCloudFileRequestor miCloudFileRequestor = dBItemForUri.isShareItem() ? originUrlRequestTask.mMediaType == 1 ? cloudGallerySharerRequestor : cloudGallerySharerRequestor2 : originUrlRequestTask.mMediaType == 1 ? cloudGalleryOwnerRequestor : cloudGalleryOwnerRequestor2;
                        try {
                            JSONObject requestDownload = miCloudFileRequestor.requestDownload(requestCloudItem);
                            if (requestDownload != null && requestDownload.optString("result").equals("ok")) {
                                ((OriginInfo) arrayList.get(originUrlRequestTask.mPosition)).setOriginDownloadInfo(requestDownload.getJSONObject("data"), originUrlRequestTask.mOriginHeight, originUrlRequestTask.mOriginWidth);
                            }
                        } catch (Exception e) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("request origin download info error");
                            sb.append(e);
                            Log.e("OriginUrlRequestor", sb.toString());
                        }
                        publishProgress(new Integer[]{Integer.valueOf(OriginUrlRequestor.this.mTasks.indexOf(originUrlRequestTask) + 1)});
                    }
                }
                return Boolean.valueOf(true);
            }

            /* access modifiers changed from: protected */
            public void onCancelled() {
                if (OriginUrlRequestor.this.mProgressListener != null) {
                    OriginUrlRequestor.this.mProgressListener.onCancelled();
                }
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Boolean bool) {
                if (OriginUrlRequestor.this.mProgressListener != null) {
                    OriginUrlRequestor.this.mProgressListener.onEnd(arrayList, bool.booleanValue());
                }
            }

            /* access modifiers changed from: protected */
            public void onProgressUpdate(Integer... numArr) {
                if (OriginUrlRequestor.this.mProgressListener != null) {
                    OriginUrlRequestor.this.mProgressListener.onUpdate(numArr[0].intValue());
                }
            }
        }.execute(new Void[0]);
    }
}
