package com.miui.gallery.editor.photo.core.imports.text.typeface;

import android.app.Activity;
import android.app.DialogFragment;
import android.content.Context;
import android.os.AsyncTask;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.editor.photo.core.imports.net.FontResDownloadManager;
import com.miui.gallery.net.download.Request.Listener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;

public class FontDownloadManager {
    private FontResDownloadManager mFontResDownloadManager;
    private UnzipFontTask mUnzipFontTask;

    /* access modifiers changed from: private */
    public void downloadResource(final TextStyle textStyle, final DownloadCallback downloadCallback, boolean z) {
        if (this.mFontResDownloadManager == null) {
            this.mFontResDownloadManager = new FontResDownloadManager();
        }
        if (downloadCallback != null) {
            Log.d("FontDownloadManager", "font is ready to download.");
            downloadCallback.onStart();
        }
        this.mFontResDownloadManager.download(textStyle, textStyle.getDownloadFilePath(), new Listener() {
            public void onComplete(int i) {
                Log.d("FontDownloadManager", "download %s, resultCode: %d", textStyle.getDownloadFilePath(), Integer.valueOf(i));
                if (i == 0) {
                    FontDownloadManager.this.unZipDownloadFile(textStyle, downloadCallback);
                } else {
                    ThreadManager.runOnMainThread(new Runnable() {
                        public void run() {
                            if (downloadCallback != null) {
                                downloadCallback.onCompleted(false);
                            }
                        }
                    });
                }
            }

            public void onProgressUpdate(int i) {
                Log.d("FontDownloadManager", "download progress :%d", (Object) Integer.valueOf(i));
            }

            public void onStart() {
                Log.d("FontDownloadManager", "font start download.");
            }
        }, z);
    }

    /* access modifiers changed from: private */
    public void unZipDownloadFile(TextStyle textStyle, DownloadCallback downloadCallback) {
        this.mUnzipFontTask = new UnzipFontTask(textStyle, downloadCallback);
        this.mUnzipFontTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public void cancelAll() {
        if (this.mFontResDownloadManager != null) {
            this.mFontResDownloadManager.cancelAll();
            this.mFontResDownloadManager = null;
        }
        if (this.mUnzipFontTask != null) {
            this.mUnzipFontTask.release();
            this.mUnzipFontTask = null;
        }
    }

    public void downloadFontResource(Context context, final TextStyle textStyle, final DownloadCallback downloadCallback) {
        if (!NetworkUtils.isNetworkConnected()) {
            ToastUtils.makeText(context, (int) R.string.photo_font_download_failed_for_notwork);
            Log.d("FontDownloadManager", "download resource no network");
        } else if (NetworkUtils.isActiveNetworkMetered()) {
            ConfirmDialog.showConfirmDialog(((Activity) context).getFragmentManager(), context.getResources().getString(R.string.photo_font_download_without_wifi_title), context.getResources().getString(R.string.photo_font_download_without_wifi_msg), context.getResources().getString(R.string.photo_font_cancel_download), context.getResources().getString(R.string.photo_font_download), new ConfirmDialogInterface() {
                public void onCancel(DialogFragment dialogFragment) {
                }

                public void onConfirm(DialogFragment dialogFragment) {
                    FontDownloadManager.this.downloadResource(textStyle, downloadCallback, true);
                }
            });
        } else {
            downloadResource(textStyle, downloadCallback, false);
        }
    }
}
