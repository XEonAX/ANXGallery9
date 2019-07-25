package com.miui.gallery.data;

import android.app.Notification;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.service.IntentServiceBase;
import com.miui.gallery.util.BackgroundServiceHelper;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.NotificationHelper;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.io.FilenameFilter;

public class BackgroundJobService extends IntentServiceBase {
    private void deleteSecretThumbnail() {
        deleteSecretThumbnail(StorageUtils.getPathInPrimaryStorage(StorageUtils.DIRECTORY_SECRET_ALBUM_PATH));
        deleteSecretThumbnail(StorageUtils.getPathInSecondaryStorage(StorageUtils.DIRECTORY_SECRET_ALBUM_PATH));
    }

    private void deleteSecretThumbnail(String str) {
        File file = new File(str);
        if (file.exists()) {
            File[] listFiles = file.listFiles(new FilenameFilter() {
                public boolean accept(File file, String str) {
                    return str.length() > 0 && str.endsWith(SecretAlbumUtils.UNENCRYPTED_IMAGE_EXTENSION);
                }
            });
            if (listFiles != null) {
                for (File file2 : listFiles) {
                    MediaFileUtils.deleteFileType(FileType.THUMBNAIL, file2);
                }
            }
        }
    }

    public static void startJobDeleteImageByPath(Context context, String[] strArr) {
        Intent intent = new Intent(context, BackgroundJobService.class);
        intent.putExtra("job", 4);
        intent.putExtra("path_list", strArr);
        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
    }

    public static void startJobDeleteImageBySha1(Context context, String[] strArr, boolean z) {
        Intent intent = new Intent(context, BackgroundJobService.class);
        intent.putExtra("job", 3);
        intent.putExtra("sha1_list", strArr);
        intent.putExtra("keep_dup", z);
        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
    }

    public static void startJobDeleteSecretThumbnail(Context context) {
        Intent intent = new Intent(context, BackgroundJobService.class);
        intent.putExtra("job", 2);
        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
    }

    static void startJobTransferOldThumbnail(Context context) {
        Intent intent = new Intent(context, BackgroundJobService.class);
        intent.putExtra("job", 1);
        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
    }

    /* access modifiers changed from: protected */
    public Notification getNotification() {
        return NotificationHelper.getEmptyNotification(getApplicationContext());
    }

    /* access modifiers changed from: protected */
    public int getNotificationId() {
        return 11;
    }

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        super.onHandleIntent(intent);
        int intExtra = intent.getIntExtra("job", 0);
        switch (intExtra) {
            case 1:
                OldThumbnailTransferer.getInstance().transfer();
                return;
            case 2:
                deleteSecretThumbnail();
                return;
            case 3:
                CloudUtils.deleteBySha1(this, intent.getBooleanExtra("keep_dup", true), 54, intent.getStringArrayExtra("sha1_list"));
                return;
            case 4:
                CloudUtils.deleteByPath(this, 54, intent.getStringArrayExtra("path_list"));
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("unsupported job: ");
                sb.append(intExtra);
                throw new IllegalArgumentException(sb.toString());
        }
    }
}
