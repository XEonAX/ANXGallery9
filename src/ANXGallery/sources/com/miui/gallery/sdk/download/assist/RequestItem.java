package com.miui.gallery.sdk.download.assist;

import com.miui.gallery.data.DBImage;

public class RequestItem {
    public final DBImage mDBItem;
    public final DownloadItem mDownloadItem;

    public RequestItem(DownloadItem downloadItem, DBImage dBImage) {
        this.mDownloadItem = downloadItem;
        this.mDBItem = dBImage;
    }
}
