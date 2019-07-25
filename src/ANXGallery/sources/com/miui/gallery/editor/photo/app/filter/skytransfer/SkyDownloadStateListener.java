package com.miui.gallery.editor.photo.app.filter.skytransfer;

public interface SkyDownloadStateListener {
    void onDownloadStart(int i);

    void onDownloading(int i, int i2);

    void onFinish(int i, boolean z, int i2);
}
