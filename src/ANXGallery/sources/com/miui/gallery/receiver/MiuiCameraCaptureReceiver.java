package com.miui.gallery.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.provider.MediaStore.Files;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import com.android.internal.CompatHandler;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.activity.ExternalPhotoPageActivity;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.permission.core.PermissionUtils;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.ProcessingMediaHelper;
import com.miui.os.Rom;
import java.util.HashMap;

public class MiuiCameraCaptureReceiver extends BroadcastReceiver {
    private static long sLastPreloadTime;
    private static PreloadBigPhotoRunnable sPreloadBigPhotoRunnable = new PreloadBigPhotoRunnable();

    private static class PreloadBigPhotoRunnable implements Runnable {
        private String mFilePath;
        /* access modifiers changed from: private */
        public boolean mIsTempFile;
        /* access modifiers changed from: private */
        public long mMediaStoreId;

        private PreloadBigPhotoRunnable() {
            this.mMediaStoreId = -1;
        }

        /* access modifiers changed from: private */
        public boolean isCanceled(String str) {
            return !TextUtils.equals(this.mFilePath, str);
        }

        public void run() {
            if (!TextUtils.isEmpty(this.mFilePath) || this.mMediaStoreId > 0) {
                final String str = this.mFilePath;
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        if (PreloadBigPhotoRunnable.this.isCanceled(str)) {
                            return null;
                        }
                        if (!PermissionUtils.checkPermission(GalleryApp.sGetAndroidContext(), "android.permission.READ_EXTERNAL_STORAGE")) {
                            Log.w("MiuiCameraCaptureReceiver", "Can't access external storage, relate permission is ungranted");
                            return null;
                        }
                        Uri contentUri = PreloadBigPhotoRunnable.this.mMediaStoreId > 0 ? Files.getContentUri("external", PreloadBigPhotoRunnable.this.mMediaStoreId) : MediaStoreUtils.getFileMediaUri(str);
                        if (!PreloadBigPhotoRunnable.this.isCanceled(str) && contentUri != null) {
                            ExternalPhotoPageActivity.preloadThumbnail(contentUri.toString(), PreloadBigPhotoRunnable.this.mIsTempFile);
                        }
                        return null;
                    }
                });
            }
        }

        public void setData(String str, long j, boolean z) {
            this.mFilePath = str;
            this.mMediaStoreId = j;
            this.mIsTempFile = z;
        }
    }

    public void onReceive(final Context context, final Intent intent) {
        String action = intent.getAction();
        if ("com.miui.gallery.SAVE_TO_CLOUD".equals(action)) {
            final String stringExtra = intent.getStringExtra("extra_file_path");
            long longExtra = intent.getLongExtra("extra_media_store_id", -1);
            boolean booleanExtra = intent.getBooleanExtra("extra_is_temp_file", false);
            LocalBroadcastManager.getInstance(context).sendBroadcast(intent);
            if (intent.hasExtra("extra_is_temp_file")) {
                if (booleanExtra) {
                    ProcessingMediaHelper.getInstance().addProcessingItem(longExtra, stringExtra);
                } else {
                    ProcessingMediaHelper.getInstance().removeProcessingItem(longExtra, stringExtra);
                }
            }
            if (!TextUtils.isEmpty(stringExtra)) {
                Log.d("MiuiCameraCaptureReceiver", "ACTION_SAVE_TO_CLOUD start, path: [%s] mediaId: [%d], temp: [%b]", stringExtra, Long.valueOf(longExtra), Boolean.valueOf(booleanExtra));
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        long uptimeMillis = SystemClock.uptimeMillis();
                        LocationManager.getInstance().recordMediaLocation(stringExtra, intent);
                        MediaScannerUtil.scanSingleFile(context, stringExtra, 0, true);
                        if (Rom.IS_DEV) {
                            HashMap hashMap = new HashMap(1);
                            hashMap.put("recordLocationAndTriggerScan", String.valueOf(SystemClock.uptimeMillis() - uptimeMillis));
                            GallerySamplingStatHelper.recordCountEvent("media_scanner", "camera_capture_receiver_time_consuming", hashMap);
                        }
                        return null;
                    }
                });
                CompatHandler mainHandler = ThreadManager.getMainHandler();
                mainHandler.removeCallbacks(sPreloadBigPhotoRunnable);
                long j = 0;
                long elapsedRealtime = SystemClock.elapsedRealtime();
                if (elapsedRealtime - sLastPreloadTime < 400) {
                    j = 400;
                }
                sLastPreloadTime = elapsedRealtime;
                sPreloadBigPhotoRunnable.setData(stringExtra, longExtra, booleanExtra);
                mainHandler.postDelayed(sPreloadBigPhotoRunnable, j);
            }
        } else if ("com.miui.gallery.DELETE_FROM_CLOUD".equals(action)) {
            final String stringExtra2 = intent.getStringExtra("extra_file_path");
            if (!TextUtils.isEmpty(stringExtra2)) {
                Log.d("MiuiCameraCaptureReceiver", "ACTION_DELETE_FROM_CLOUD start %s", (Object) stringExtra2);
                ThreadManager.getMiscPool().submit(new Job<Void>() {
                    public Void run(JobContext jobContext) {
                        long uptimeMillis = SystemClock.uptimeMillis();
                        MediaScannerUtil.scanSingleFile(context, stringExtra2, 0, true);
                        if (Rom.IS_DEV) {
                            HashMap hashMap = new HashMap(1);
                            hashMap.put("triggerScan", String.valueOf(SystemClock.uptimeMillis() - uptimeMillis));
                            GallerySamplingStatHelper.recordCountEvent("media_scanner", "camera_capture_receiver_time_consuming", hashMap);
                        }
                        return null;
                    }
                });
            }
        }
    }
}
