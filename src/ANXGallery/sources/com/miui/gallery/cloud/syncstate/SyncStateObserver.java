package com.miui.gallery.cloud.syncstate;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SyncStatusObserver;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.control.BatteryMonitor;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.ShareImage;
import com.miui.gallery.provider.deprecated.GalleryCloudProvider;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;

class SyncStateObserver {
    private BroadcastReceiver mCtaReceiver;
    private BroadcastReceiver mDeviceStorageReceiver;
    private BroadcastReceiver mFirstPulledReceiver;
    private ContentObserver mMediaObserver;
    private BroadcastReceiver mNetworkReceiver;
    private BroadcastReceiver mPowerStatusReceiver;
    private int mRegisterCount = 0;
    private BroadcastReceiver mSyncCommandDispatchedReceiver;
    private ContentObserver mSyncOnlyWifiObeserver;
    private Object mSyncSettingObserver;
    private ContentObserver mUploadingObserver;

    private class CTAReceiver extends BroadcastReceiver {
        private CTAReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            SyncStateManager.getInstance().updateSyncStatus();
        }
    }

    private class DeviceStorageStateReceiver extends BroadcastReceiver {
        private DeviceStorageStateReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            Log.i("SyncStateObserver", "DeviceStorageStateReceiver %s", (Object) action);
            if ("android.intent.action.DEVICE_STORAGE_LOW".equals(action)) {
                Sync.setDeviceStorageLow(true);
                SyncStateManager.getInstance().setIsLocalSpaceFull(true);
            } else if ("android.intent.action.DEVICE_STORAGE_OK".equals(action)) {
                Sync.setDeviceStorageLow(false);
                SyncStateManager.getInstance().setIsLocalSpaceFull(false);
            }
        }
    }

    private class FirstPulledReceiver extends BroadcastReceiver {
        private FirstPulledReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            SyncStateManager.getInstance().updateSyncStatus();
        }
    }

    private class MediaObserver extends SyncContentObserver {
        public MediaObserver(Handler handler) {
            super(handler);
        }

        public void onChange(boolean z) {
            SyncStateManager.getInstance().triggerMediaChanged();
        }
    }

    private class NetworkReceiver extends BroadcastReceiver {
        private boolean mIsNetConnected = NetworkUtils.isNetworkConnected();
        private boolean mIsWifiConnected = (!NetworkUtils.isActiveNetworkMetered());

        public NetworkReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            boolean z;
            boolean z2 = false;
            boolean z3 = !intent.getBooleanExtra("noConnectivity", false);
            if (this.mIsNetConnected != z3) {
                Log.d("SyncStateObserver", "NetworkReceiver mLastConnected: %s, connect: %s", Boolean.valueOf(this.mIsNetConnected), Boolean.valueOf(z3));
                this.mIsNetConnected = z3;
                z = true;
            } else {
                z = false;
            }
            if (this.mIsNetConnected && !NetworkUtils.isActiveNetworkMetered()) {
                z2 = true;
            }
            if (this.mIsWifiConnected != z2) {
                Log.d("SyncStateObserver", "NetworkReceiver mLastWifiConnect: %s, wifiConnect: %s", Boolean.valueOf(this.mIsWifiConnected), Boolean.valueOf(z2));
                this.mIsWifiConnected = z2;
                z = true;
            }
            if (z) {
                SyncStateManager.getInstance().updateSyncStatus();
            }
        }
    }

    private class PowerChangedReceiver extends BroadcastReceiver {
        private boolean mIsBatteryLow = (!Sync.getPowerCanSync());

        public PowerChangedReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                BatteryMonitor.getInstance();
                boolean isPowerCanSync = BatteryMonitor.isPowerCanSync(context, intent);
                boolean z = true;
                boolean z2 = !isPowerCanSync;
                if (z2 != this.mIsBatteryLow) {
                    this.mIsBatteryLow = z2;
                    if (z2) {
                        z = false;
                    }
                    Sync.setPowerCanSync(z);
                    Log.d("SyncStateObserver", "battery status changed: %s", (Object) Boolean.valueOf(z2));
                }
                SyncStateManager.getInstance().setIsBatteryLow(z2);
            }
        }
    }

    private class SyncContentObserver extends ContentObserver {
        public SyncContentObserver(Handler handler) {
            super(handler);
        }

        public void onChange(boolean z) {
            SyncStateManager.getInstance().updateSyncStatus();
        }

        public void onChange(boolean z, Uri uri) {
            Log.d("SyncStateObserver", "SyncContentObserver %s", (Object) uri);
            super.onChange(z, uri);
        }
    }

    private class SyncRequestDispatchedReceiver extends BroadcastReceiver {
        private SyncRequestDispatchedReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            Log.d("SyncStateObserver", "SyncRequestDispatchedReceiver: %s", (Object) intent.getAction());
            if ("com.miui.gallery.SYNC_COMMAND_DISPATCHED".equals(intent.getAction())) {
                SyncStateManager.getInstance().onSyncCommandDispatched();
            }
        }
    }

    private class SyncSettingObserver implements SyncStatusObserver {
        private SyncSettingObserver() {
        }

        public void onStatusChanged(int i) {
            if (i == 1) {
                Log.d("SyncStateObserver", "SyncSettingObserver");
                SyncStateManager.getInstance().updateSyncStatus();
            }
        }
    }

    private class UploadingObserver extends ContentObserver {
        public UploadingObserver(Handler handler) {
            super(handler);
        }

        public void onChange(boolean z) {
            Log.d("SyncStateObserver", "UploadingObserver");
            SyncStateManager.getInstance().updateSyncStatus();
        }
    }

    SyncStateObserver() {
    }

    /* access modifiers changed from: private */
    public void doRegister(Context context) {
        ensureObservers();
        initState(context);
        LocalBroadcastManager.getInstance(context).registerReceiver(this.mCtaReceiver, new IntentFilter("com.miui.gallery.action.CTA_CHANGED"));
        IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE");
        context.registerReceiver(this.mNetworkReceiver, intentFilter, null, ThreadManager.getWorkHandler());
        context.registerReceiver(this.mPowerStatusReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"), null, ThreadManager.getWorkHandler());
        IntentFilter intentFilter2 = new IntentFilter("android.intent.action.DEVICE_STORAGE_LOW");
        intentFilter2.addAction("android.intent.action.DEVICE_STORAGE_OK");
        context.registerReceiver(this.mDeviceStorageReceiver, intentFilter2, null, ThreadManager.getWorkHandler());
        LocalBroadcastManager.getInstance(context).registerReceiver(this.mSyncCommandDispatchedReceiver, new IntentFilter("com.miui.gallery.SYNC_COMMAND_DISPATCHED"));
        context.getContentResolver().registerContentObserver(GalleryCloudProvider.UPLOAD_STATE_URI, true, this.mUploadingObserver);
        context.getContentResolver().registerContentObserver(Media.URI, true, this.mMediaObserver);
        context.getContentResolver().registerContentObserver(ShareImage.SHARE_URI, true, this.mMediaObserver);
        context.getContentResolver().registerContentObserver(GalleryCloudProvider.SYNC_SETTINGS_URI, false, this.mSyncOnlyWifiObeserver);
        this.mSyncSettingObserver = ContentResolver.addStatusChangeListener(1, new SyncSettingObserver());
        LocalBroadcastManager.getInstance(context).registerReceiver(this.mFirstPulledReceiver, new IntentFilter("com.miui.gallery.action.FIRST_SYNC_FINISHED"));
    }

    /* access modifiers changed from: private */
    public void doUnregister(Context context) {
        if (this.mCtaReceiver != null) {
            LocalBroadcastManager.getInstance(context).unregisterReceiver(this.mCtaReceiver);
            this.mCtaReceiver = null;
        }
        if (this.mNetworkReceiver != null) {
            context.unregisterReceiver(this.mNetworkReceiver);
            this.mNetworkReceiver = null;
        }
        if (this.mPowerStatusReceiver != null) {
            context.unregisterReceiver(this.mPowerStatusReceiver);
            this.mPowerStatusReceiver = null;
        }
        if (this.mDeviceStorageReceiver != null) {
            context.unregisterReceiver(this.mDeviceStorageReceiver);
            this.mDeviceStorageReceiver = null;
        }
        if (this.mSyncCommandDispatchedReceiver != null) {
            LocalBroadcastManager.getInstance(context).unregisterReceiver(this.mSyncCommandDispatchedReceiver);
            this.mSyncCommandDispatchedReceiver = null;
        }
        if (this.mUploadingObserver != null) {
            context.getContentResolver().unregisterContentObserver(this.mUploadingObserver);
            this.mUploadingObserver = null;
        }
        if (this.mMediaObserver != null) {
            context.getContentResolver().unregisterContentObserver(this.mMediaObserver);
            this.mMediaObserver = null;
        }
        if (this.mSyncOnlyWifiObeserver != null) {
            context.getContentResolver().unregisterContentObserver(this.mSyncOnlyWifiObeserver);
            this.mSyncOnlyWifiObeserver = null;
        }
        if (this.mSyncSettingObserver != null) {
            ContentResolver.removeStatusChangeListener(this.mSyncSettingObserver);
            this.mSyncSettingObserver = null;
        }
        if (this.mFirstPulledReceiver != null) {
            LocalBroadcastManager.getInstance(context).unregisterReceiver(this.mFirstPulledReceiver);
            this.mFirstPulledReceiver = null;
        }
    }

    private void ensureObservers() {
        if (this.mNetworkReceiver == null) {
            this.mCtaReceiver = new CTAReceiver();
            this.mNetworkReceiver = new NetworkReceiver();
            this.mPowerStatusReceiver = new PowerChangedReceiver();
            this.mDeviceStorageReceiver = new DeviceStorageStateReceiver();
            this.mSyncCommandDispatchedReceiver = new SyncRequestDispatchedReceiver();
            this.mUploadingObserver = new UploadingObserver(ThreadManager.getWorkHandler());
            this.mMediaObserver = new MediaObserver(ThreadManager.getWorkHandler());
            this.mSyncOnlyWifiObeserver = new SyncContentObserver(ThreadManager.getWorkHandler());
            this.mSyncSettingObserver = new SyncSettingObserver();
            this.mFirstPulledReceiver = new FirstPulledReceiver();
        }
    }

    private void initState(Context context) {
        Intent registerReceiver = context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        if (registerReceiver != null) {
            Sync.setPowerCanSync(BatteryMonitor.isPowerCanSync(context, registerReceiver));
        }
        this.mMediaObserver.onChange(false);
    }

    /* access modifiers changed from: 0000 */
    public void register(Context context) {
        Log.i("SyncStateObserver", "register %s", (Object) context);
        int i = this.mRegisterCount;
        this.mRegisterCount = i + 1;
        if (i == 0) {
            final Context applicationContext = context.getApplicationContext();
            ThreadManager.getWorkHandler().post(new Runnable() {
                public void run() {
                    Log.d("SyncStateObserver", "do register");
                    SyncStateObserver.this.doRegister(applicationContext);
                }
            });
        }
    }

    /* access modifiers changed from: 0000 */
    public void unregister(Context context) {
        Log.i("SyncStateObserver", "unregister %s", (Object) context);
        int i = this.mRegisterCount - 1;
        this.mRegisterCount = i;
        if (i <= 0) {
            final Context applicationContext = context.getApplicationContext();
            ThreadManager.getWorkHandler().post(new Runnable() {
                public void run() {
                    Log.d("SyncStateObserver", "do unregister");
                    SyncStateObserver.this.doUnregister(applicationContext);
                }
            });
        }
    }
}
