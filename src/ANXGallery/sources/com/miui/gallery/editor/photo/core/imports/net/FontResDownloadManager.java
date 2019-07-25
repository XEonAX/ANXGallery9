package com.miui.gallery.editor.photo.core.imports.net;

import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.editor.photo.core.imports.text.model.FontBean;
import com.miui.gallery.net.HttpManager;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.net.download.GalleryDownloadManager;
import com.miui.gallery.net.download.Request;
import com.miui.gallery.net.download.Request.Listener;
import com.miui.gallery.net.download.Verifier.Sha1;
import com.miui.gallery.net.resource.DownloadInfo;
import com.miui.gallery.net.resource.DownloadRequest;
import com.miui.gallery.util.Log;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FontResDownloadManager {
    /* access modifiers changed from: private */
    public List<Request> mRequestList = new ArrayList();

    public void cancelAll() {
        HttpManager.getInstance().cancelAll("ResourceDownloadManager");
        for (Request listener : this.mRequestList) {
            listener.setListener(null);
        }
    }

    public void download(FontBean fontBean, String str, final Listener listener, final boolean z) {
        long id = fontBean.getId();
        Log.d("ResourceDownloadManager", "downloading: %d", (Object) Long.valueOf(id));
        if (TextUtils.isEmpty(str)) {
            Log.d("ResourceDownloadManager", "download path is empty");
            listener.onComplete(-1);
            return;
        }
        final File file = new File(str);
        if (file.exists()) {
            Log.d("ResourceDownloadManager", "file downloaded: %s", (Object) file.getAbsolutePath());
            listener.onComplete(0);
            return;
        }
        DownloadRequest downloadRequest = new DownloadRequest(id);
        downloadRequest.setTag("ResourceDownloadManager");
        downloadRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                DownloadInfo downloadInfo = objArr[0];
                Log.d("ResourceDownloadManager", String.format("download %s, %s", new Object[]{downloadInfo.url, downloadInfo.sha1}));
                Request request = new Request(Uri.parse(downloadInfo.url), file);
                FontResDownloadManager.this.mRequestList.add(request);
                request.setVerifier(new Sha1(downloadInfo.sha1));
                request.setAllowedOverMetered(z);
                request.setListener(listener);
                GalleryDownloadManager.INSTANCE.enqueue(request);
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                listener.onComplete(-1);
                Log.w("ResourceDownloadManager", "errorMessage:%s,errorCode.name:%s", str, errorCode.name());
            }
        });
    }
}
