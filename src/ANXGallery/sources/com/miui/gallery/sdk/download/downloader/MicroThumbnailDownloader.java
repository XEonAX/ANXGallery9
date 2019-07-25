package com.miui.gallery.sdk.download.downloader;

import android.accounts.Account;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.RequestItem;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.Log;
import java.io.File;
import java.util.List;

public class MicroThumbnailDownloader extends AbsThumbnailDownloader {
    /* access modifiers changed from: protected */
    public String checkAndReturnValidPath(RequestItem requestItem) {
        String checkAndReturnValidFilePathForType = DownloadUtil.checkAndReturnValidFilePathForType(requestItem.mDBItem, DownloadType.MICRO);
        if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType)) {
            Log.d("MicroThumbnailDownloader", "already exist micro thumbnail file");
            return checkAndReturnValidFilePathForType;
        }
        String checkAndReturnValidFilePathForType2 = DownloadUtil.checkAndReturnValidFilePathForType(requestItem.mDBItem, DownloadType.THUMBNAIL);
        if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType2)) {
            Log.d("MicroThumbnailDownloader", "already exist thumbnail file");
            return checkAndReturnValidFilePathForType2;
        }
        String checkAndReturnValidOriginalFilePath = DownloadUtil.checkAndReturnValidOriginalFilePath(requestItem.mDBItem, DownloadType.ORIGIN);
        if (TextUtils.isEmpty(checkAndReturnValidOriginalFilePath)) {
            return null;
        }
        Log.d("MicroThumbnailDownloader", "already exist original file");
        return checkAndReturnValidOriginalFilePath;
    }

    public /* bridge */ /* synthetic */ void download(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List list) {
        super.download(account, galleryExtendedAuthToken, list);
    }

    /* access modifiers changed from: protected */
    public int getRequestHeight() {
        return 250;
    }

    /* access modifiers changed from: protected */
    public int getRequestWidth() {
        return 250;
    }

    /* access modifiers changed from: protected */
    public String getTag() {
        return "MicroThumbnailDownloader";
    }

    /* access modifiers changed from: protected */
    public boolean updateDataBase(RequestItem requestItem, String str) {
        File file = new File(str);
        file.setLastModified(requestItem.mDBItem.getDateModified());
        return CloudUtils.updateMicroThumbPath(requestItem.mDBItem.getBaseUri(), file.getAbsolutePath(), requestItem.mDBItem.getId(), true);
    }
}
