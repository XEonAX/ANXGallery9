package com.miui.gallery.provider.cloudmanager;

import android.app.Notification;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.service.ServiceBase;
import com.miui.gallery.util.BackgroundServiceHelper;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.NotificationHelper;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.StringUtils;
import com.miui.gallery.util.SyncUtil;
import java.util.HashMap;
import java.util.List;

public class FileHandleService extends ServiceBase implements FileHandleListener {
    private boolean mNeedNotifyUri = false;
    private volatile ServiceHandler mServiceHandler;
    private volatile Looper mServiceLooper;
    private FileTaskExecutor mTaskExecutor = null;

    private final class ServiceHandler extends Handler {
        public ServiceHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            Intent intent = (Intent) message.obj;
            String action = intent.getAction();
            if ("check_unhandled_media_ids".equals(action)) {
                long[] loadFileHandleMediaIds = MediaRemarkManager.loadFileHandleMediaIds();
                if (loadFileHandleMediaIds != null && loadFileHandleMediaIds.length > 0) {
                    FileHandleService.this.handleRecords(loadFileHandleMediaIds);
                    HashMap hashMap = new HashMap();
                    hashMap.put("batch_count", String.valueOf(loadFileHandleMediaIds.length));
                    GallerySamplingStatHelper.recordCountEvent("file_handle", "restore_unhandled_file_operations", hashMap);
                }
            } else if ("dispatch_media_ids".equals(action)) {
                long[] longArrayExtra = intent.getLongArrayExtra("ids");
                if (longArrayExtra != null && longArrayExtra.length > 0) {
                    MediaRemarkManager.addFileHandleMediaIds(longArrayExtra);
                    FileHandleService.this.handleRecords(longArrayExtra);
                }
            }
            FileHandleService.this.stopSelfIfComplete();
        }
    }

    public static void checkUnhandledMedias(Context context) {
        Intent intent = new Intent("check_unhandled_media_ids");
        intent.setClass(context, FileHandleService.class);
        BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
    }

    public static boolean dispatchTask(Context context, List<Long> list) {
        if (!needNotifyUri(new FileHandleTask(context, Numbers.toArray(list)).run(null, null))) {
            return false;
        }
        notifyUri(context);
        return true;
    }

    public static void execute(Context context, boolean z, List<Long> list) {
        if (!z) {
            Intent intent = new Intent("dispatch_media_ids");
            intent.setClass(context, FileHandleService.class);
            intent.putExtra("ids", Numbers.toArray(list));
            BackgroundServiceHelper.startForegroundServiceIfNeed(context, intent);
        } else if (dispatchTask(context, list)) {
            SyncUtil.requestSync(context, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(561).build());
        }
    }

    /* access modifiers changed from: private */
    public void handleRecords(long[] jArr) {
        if (this.mTaskExecutor == null) {
            this.mTaskExecutor = new FileTaskExecutor(this, this);
        }
        this.mTaskExecutor.submit(jArr);
    }

    private static boolean needNotifyUri(long[] jArr) {
        if (jArr == null || jArr.length <= 0) {
            return false;
        }
        boolean z = false;
        for (int i = 0; i < jArr.length; i++) {
            z |= jArr[i] == 1;
        }
        return z;
    }

    private static void notifyUri(Context context) {
        ContentResolver contentResolver = context.getContentResolver();
        contentResolver.notifyChange(Cloud.CLOUD_URI, null, false);
        contentResolver.notifyChange(Media.URI, null, false);
        contentResolver.notifyChange(Media.URI_OWNER_ALBUM_MEDIA, null, false);
        contentResolver.notifyChange(Media.URI_OTHER_ALBUM_MEDIA, null, false);
    }

    /* access modifiers changed from: private */
    public void stopSelfIfComplete() {
        if (this.mTaskExecutor == null || this.mTaskExecutor.isCompleted()) {
            if (this.mNeedNotifyUri) {
                Log.d("CloudManager.FileHandleService", "Stop self and request sync");
                SyncUtil.requestSync(this, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(561).build());
            }
            stopSelf();
        }
    }

    /* access modifiers changed from: protected */
    public Notification getNotification() {
        return NotificationHelper.getEmptyNotification(getApplicationContext());
    }

    /* access modifiers changed from: protected */
    public int getNotificationId() {
        return 9;
    }

    public void onAllTaskExecuted() {
        stopSelfIfComplete();
    }

    public void onCancel() {
        stopSelfIfComplete();
    }

    public void onCreate() {
        super.onCreate();
        HandlerThread handlerThread = new HandlerThread("CloudManager.FileHandleService");
        handlerThread.start();
        this.mServiceLooper = handlerThread.getLooper();
        this.mServiceHandler = new ServiceHandler(this.mServiceLooper);
    }

    public void onDestroy() {
        super.onDestroy();
        this.mServiceLooper.quit();
        if (this.mTaskExecutor != null) {
            FileTaskExecutor fileTaskExecutor = this.mTaskExecutor;
            this.mTaskExecutor = null;
            fileTaskExecutor.shutdown();
        }
    }

    public void onRecordsHandled(long[] jArr, long[] jArr2) {
        if (jArr == null || jArr2 == null || jArr.length != jArr2.length) {
            Log.e("CloudManager.FileHandleService", "Invalid results ids:%s, results:%s", jArr, jArr2);
            return;
        }
        MediaRemarkManager.doneHandleFileForMediaIds(jArr);
        Log.d("CloudManager.FileHandleService", "On receive results [%s]", (Object) StringUtils.join(",", jArr2));
        if (needNotifyUri(jArr2)) {
            Log.d("CloudManager.FileHandleService", "Need notify uri");
            notifyUri(this);
            this.mNeedNotifyUri = true;
        }
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        super.onStartCommand(intent, i, i2);
        Message obtainMessage = this.mServiceHandler.obtainMessage();
        obtainMessage.arg1 = i2;
        obtainMessage.obj = intent;
        this.mServiceHandler.sendMessage(obtainMessage);
        return 3;
    }
}
