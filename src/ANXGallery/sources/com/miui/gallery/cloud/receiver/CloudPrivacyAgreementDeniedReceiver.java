package com.miui.gallery.cloud.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.DeleteDataUtil;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.Log;
import java.util.concurrent.atomic.AtomicBoolean;

public class CloudPrivacyAgreementDeniedReceiver extends BroadcastReceiver {
    /* access modifiers changed from: private */
    public static AtomicBoolean sRunning = new AtomicBoolean(false);

    public static void onCloudPrivacyAgreementDenied(Context context) {
        final Context applicationContext = context.getApplicationContext();
        if (sRunning.compareAndSet(false, true)) {
            ThreadManager.getMiscPool().submit(new Job<Void>() {
                /* JADX INFO: finally extract failed */
                public Void run(JobContext jobContext) {
                    try {
                        if (SyncStateUtil.hasSyncedData(applicationContext)) {
                            Log.w("CloudPrivacyAgreementDeniedReceiver", "delete synced data");
                            DeleteDataUtil.delete(applicationContext, 1);
                            GalleryStatHelper.recordCountEvent("sync", "cloud_privacy_agreement_denied");
                        }
                        CloudPrivacyAgreementDeniedReceiver.sRunning.set(false);
                        return null;
                    } catch (Throwable th) {
                        CloudPrivacyAgreementDeniedReceiver.sRunning.set(false);
                        throw th;
                    }
                }
            });
        }
    }

    public void onReceive(Context context, Intent intent) {
        Log.w("CloudPrivacyAgreementDeniedReceiver", "cloud privacy denied");
        onCloudPrivacyAgreementDenied(context);
    }
}
