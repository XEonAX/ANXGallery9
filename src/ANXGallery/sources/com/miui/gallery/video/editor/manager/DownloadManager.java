package com.miui.gallery.video.editor.manager;

import android.net.Uri;
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
import com.miui.gallery.video.editor.interfaces.IVideoEditorListener.IDownloadListener;
import com.miui.gallery.video.editor.model.VideoEditorBaseModel;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class DownloadManager {
    /* access modifiers changed from: private */
    public List<Request> mRequestList = new ArrayList();

    public void cancelAll() {
        HttpManager.getInstance().cancelAll("DownloadManager");
        for (Request listener : this.mRequestList) {
            listener.setListener(null);
        }
    }

    public void download(VideoEditorBaseModel videoEditorBaseModel, IDownloadListener iDownloadListener, Listener listener, boolean z) {
        long id = videoEditorBaseModel.getId();
        Log.d("DownloadManager", "downloading: %d", (Object) Long.valueOf(id));
        DownloadRequest downloadRequest = new DownloadRequest(id);
        downloadRequest.setTag("DownloadManager");
        final IDownloadListener iDownloadListener2 = iDownloadListener;
        final VideoEditorBaseModel videoEditorBaseModel2 = videoEditorBaseModel;
        final boolean z2 = z;
        final Listener listener2 = listener;
        AnonymousClass1 r3 = new ResponseListener() {
            public void onResponse(Object... objArr) {
                DownloadInfo downloadInfo = objArr[0];
                Log.d("DownloadManager", String.format("download %s, %s", new Object[]{downloadInfo.url, downloadInfo.sha1}));
                File file = new File(iDownloadListener2.getDownloadPath(videoEditorBaseModel2));
                if (file.exists()) {
                    Log.d("DownloadManager", "the file already exist and its path is : %s", (Object) file.getAbsolutePath());
                    file.delete();
                }
                Request request = new Request(Uri.parse(downloadInfo.url), file);
                DownloadManager.this.mRequestList.add(request);
                request.setVerifier(new Sha1(downloadInfo.sha1));
                request.setAllowedOverMetered(z2);
                request.setListener(listener2);
                GalleryDownloadManager.INSTANCE.enqueue(request);
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                listener2.onComplete(-1);
                Log.w("DownloadManager", "errorMessage:%s,errorCode.name:5s", str, errorCode.name());
            }
        };
        downloadRequest.execute(r3);
    }
}
