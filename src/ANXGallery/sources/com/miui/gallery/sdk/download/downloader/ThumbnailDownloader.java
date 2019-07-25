package com.miui.gallery.sdk.download.downloader;

import android.accounts.Account;
import android.content.ContentValues;
import android.text.TextUtils;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.ThumbnailMetaWriter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.RequestItem;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import java.io.File;
import java.util.List;

public class ThumbnailDownloader extends AbsThumbnailDownloader {
    /* access modifiers changed from: protected */
    public String checkAndReturnValidPath(RequestItem requestItem) {
        String checkAndReturnValidFilePathForType = DownloadUtil.checkAndReturnValidFilePathForType(requestItem.mDBItem, DownloadType.THUMBNAIL);
        if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType)) {
            Log.d("ThumbnailDownloader", "already exist thumbnail file");
        } else {
            checkAndReturnValidFilePathForType = DownloadUtil.checkAndReturnValidOriginalFilePath(requestItem.mDBItem, DownloadType.ORIGIN);
            Log.d("ThumbnailDownloader", "already exist original file");
        }
        if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType)) {
            if (!(!requestItem.mDownloadItem.isManual() || !CloudControlStrategyHelper.getSyncStrategy().isFrontForManualDownload())) {
                Log.d("ThumbnailDownloader", "front for manual downloading %s", (Object) requestItem.mDBItem.getFileName());
            } else if (requestItem.mDBItem.getMixedDateTime() > 0) {
                FileUtils.setLastModified(checkAndReturnValidFilePathForType, requestItem.mDBItem.getMixedDateTime());
            }
        }
        return checkAndReturnValidFilePathForType;
    }

    public /* bridge */ /* synthetic */ void download(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List list) {
        super.download(account, galleryExtendedAuthToken, list);
    }

    /* access modifiers changed from: protected */
    public int getRequestHeight() {
        return ScreenConfig.getScreenHeight();
    }

    /* access modifiers changed from: protected */
    public int getRequestWidth() {
        return ScreenConfig.getScreenWidth();
    }

    /* access modifiers changed from: protected */
    public String getTag() {
        return "ThumbnailDownloader";
    }

    /* access modifiers changed from: protected */
    public boolean handleDownloadTempFile(RequestItem requestItem, String str) {
        return new ThumbnailMetaWriter(requestItem.mDBItem).write(str);
    }

    /* access modifiers changed from: protected */
    public boolean updateDataBase(RequestItem requestItem, String str) {
        File file = new File(str);
        file.setLastModified(requestItem.mDBItem.getDateModified());
        ContentValues contentValues = new ContentValues();
        contentValues.put("thumbnailFile", file.getAbsolutePath());
        contentValues.put("localFile", Cloud.INVALID_FILE_PATH_NULL_MARK);
        CloudUtils.updateToLocalDB(requestItem.mDBItem.getBaseUri(), contentValues, requestItem.mDBItem.getId());
        GalleryApp.sGetAndroidContext().getContentResolver().notifyChange(Album.URI, null, false);
        if (!requestItem.mDBItem.isSecretItem() && !requestItem.mDBItem.isSubUbiFocus()) {
            MediaFileUtils.triggerMediaScan(true, file);
        }
        return true;
    }
}
