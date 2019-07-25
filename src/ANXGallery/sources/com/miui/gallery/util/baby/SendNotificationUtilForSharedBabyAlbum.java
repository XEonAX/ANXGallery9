package com.miui.gallery.util.baby;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.preference.GalleryPreferences.Baby;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.NotificationHelper;
import java.util.ArrayList;

public class SendNotificationUtilForSharedBabyAlbum {
    protected final int SEND_NOTIFICATION_INTERVAL;
    protected ArrayList<SendNotificationRunnable> mNotificationRunnableList;

    class SendNotificationRunnable implements Runnable {
        /* access modifiers changed from: private */
        public String mAlbumId;
        private long mAlbumLocalId;
        private boolean mIsOtherShared;
        private String mName;

        public SendNotificationRunnable() {
        }

        public void run() {
            CloudUtils.sendBabyAlbumNewPhotoNotification(GalleryApp.sGetAndroidContext(), GalleryApp.sGetAndroidContext().getString(R.string.baby_album_new_photo_remind), NotificationHelper.getBabyAlbumNotificationId(this.mIsOtherShared, (int) this.mAlbumLocalId), null, this.mIsOtherShared ? ShareAlbumManager.getUniformAlbumId(this.mAlbumLocalId) : this.mAlbumLocalId, this.mName, this.mIsOtherShared);
        }

        public void setPathAndName(String str, boolean z, long j, String str2) {
            this.mAlbumId = str;
            this.mIsOtherShared = z;
            this.mAlbumLocalId = j;
            this.mName = str2;
        }
    }

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static final SendNotificationUtilForSharedBabyAlbum mInstance = new SendNotificationUtilForSharedBabyAlbum();
    }

    private SendNotificationUtilForSharedBabyAlbum() {
        this.SEND_NOTIFICATION_INTERVAL = 600000;
        this.mNotificationRunnableList = new ArrayList<>();
    }

    public static final SendNotificationUtilForSharedBabyAlbum getInstance() {
        return SingletonHolder.mInstance;
    }

    private long getUniformAlbumLocalId(long j, boolean z) {
        return z ? ShareAlbumManager.getUniformAlbumId(j) : j;
    }

    public void sendNotification(String str, long j, String str2, boolean z, long j2) {
        SendNotificationRunnable sendNotificationRunnable;
        int i = 0;
        while (true) {
            if (i >= this.mNotificationRunnableList.size()) {
                sendNotificationRunnable = null;
                break;
            } else if (str.equalsIgnoreCase(((SendNotificationRunnable) this.mNotificationRunnableList.get(i)).mAlbumId)) {
                sendNotificationRunnable = (SendNotificationRunnable) this.mNotificationRunnableList.get(i);
                break;
            } else {
                i++;
            }
        }
        if (sendNotificationRunnable == null) {
            sendNotificationRunnable = new SendNotificationRunnable();
            sendNotificationRunnable.setPathAndName(str, z, j, str2);
            this.mNotificationRunnableList.add(sendNotificationRunnable);
        }
        if (Baby.getMinServerTagOfNewPhoto(getUniformAlbumLocalId(j, z)).longValue() == 0) {
            Baby.saveMinServerTagOfNewPhoto(getUniformAlbumLocalId(j, z), Long.valueOf(j2));
        }
        ThreadManager.getMainHandler().postDelayed(sendNotificationRunnable, 600000);
    }
}
