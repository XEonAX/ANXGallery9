package com.miui.gallery.editor.photo.core.imports.text.typeface;

import android.os.AsyncTask;
import com.miui.gallery.util.UnzipUtils;

public class UnzipFontTask extends AsyncTask<Void, Void, Boolean> {
    private DownloadCallback mCallBack;
    private TextStyle mResource;

    public UnzipFontTask(TextStyle textStyle, DownloadCallback downloadCallback) {
        this.mResource = textStyle;
        this.mCallBack = downloadCallback;
    }

    /* access modifiers changed from: protected */
    public Boolean doInBackground(Void... voidArr) {
        return isCancelled() ? Boolean.valueOf(false) : Boolean.valueOf(UnzipUtils.unZipFile(this.mResource.getDownloadFilePath()));
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(Boolean bool) {
        if (!isCancelled() && this.mCallBack != null) {
            this.mCallBack.onCompleted(bool.booleanValue());
        }
    }

    public void release() {
        cancel(true);
        this.mCallBack = null;
    }
}
