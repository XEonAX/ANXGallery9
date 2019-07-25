package com.miui.gallery.cloud.download;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.control.BatteryMonitor;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

final class DownloadObserver {
    private BroadcastReceiver mCtaReceiver;
    private BroadcastReceiver mDeviceStorageReceiver;
    private final CopyOnWriteArraySet<OnConditionChangeListener> mListeners;
    private BroadcastReceiver mNetworkReceiver;
    private BroadcastReceiver mPowerStatusReceiver;
    private final AtomicInteger mRegisterCount;

    private class CTAReceiver extends BroadcastReceiver {
        private CTAReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            DownloadObserver.this.notifyConditionChanged(context);
        }
    }

    private class DeviceStorageStateReceiver extends BroadcastReceiver {
        private DeviceStorageStateReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            Log.i("DownloadObserver", "DeviceStorageStateReceiver %s", (Object) action);
            if ("android.intent.action.DEVICE_STORAGE_LOW".equals(action)) {
                Sync.setDeviceStorageLow(true);
                DownloadObserver.this.notifyConditionChanged(context);
            } else if ("android.intent.action.DEVICE_STORAGE_OK".equals(action)) {
                Sync.setDeviceStorageLow(false);
                DownloadObserver.this.notifyConditionChanged(context);
            }
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
                Log.d("DownloadObserver", "NetworkReceiver mLastConnect: %s, netConnect: %s", Boolean.valueOf(this.mIsNetConnected), Boolean.valueOf(z3));
                this.mIsNetConnected = z3;
                z = true;
            } else {
                z = false;
            }
            if (this.mIsNetConnected && !NetworkUtils.isActiveNetworkMetered()) {
                z2 = true;
            }
            if (this.mIsWifiConnected != z2) {
                Log.d("DownloadObserver", "NetworkReceiver mLastWifiConnect: %s, wifiConnect: %s", Boolean.valueOf(this.mIsWifiConnected), Boolean.valueOf(z2));
                this.mIsWifiConnected = z2;
                z = true;
            }
            if (z) {
                DownloadObserver.this.notifyConditionChanged(context);
            }
        }
    }

    interface OnConditionChangeListener {
        void onConditionChanged(Context context);
    }

    private class PowerChangedReceiver extends BroadcastReceiver {
        private boolean mIsBatteryLow = (!Sync.getPowerCanSync());

        public PowerChangedReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                boolean isPlugged = Sync.getIsPlugged();
                BatteryMonitor.getInstance();
                boolean z = true;
                boolean z2 = !BatteryMonitor.isPowerCanSync(context, intent);
                if (z2 != this.mIsBatteryLow) {
                    this.mIsBatteryLow = z2;
                    if (z2) {
                        z = false;
                    }
                    Sync.setPowerCanSync(z);
                    DownloadObserver.this.notifyConditionChanged(context);
                    Log.d("DownloadObserver", "battery status changed: %s", (Object) Boolean.valueOf(z2));
                } else if (isPlugged != Sync.getIsPlugged()) {
                    DownloadObserver.this.notifyConditionChanged(context);
                    Log.d("DownloadObserver", "charging state changed: %s", (Object) Boolean.valueOf(!isPlugged));
                }
            }
        }
    }

    private static final class SingletonHolder {
        /* access modifiers changed from: private */
        public static final DownloadObserver INSTANCE = new DownloadObserver();
    }

    private DownloadObserver() {
        this.mRegisterCount = new AtomicInteger(0);
        this.mListeners = new CopyOnWriteArraySet<>();
    }

    /* access modifiers changed from: private */
    public void doRegister(Context context) {
        ensureObservers();
        LocalBroadcastManager.getInstance(context).registerReceiver(this.mCtaReceiver, new IntentFilter("com.miui.gallery.action.CTA_CHANGED"));
        IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE");
        context.registerReceiver(this.mNetworkReceiver, intentFilter, null, ThreadManager.getWorkHandler());
        context.registerReceiver(this.mPowerStatusReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"), null, ThreadManager.getWorkHandler());
        IntentFilter intentFilter2 = new IntentFilter("android.intent.action.DEVICE_STORAGE_LOW");
        intentFilter2.addAction("android.intent.action.DEVICE_STORAGE_OK");
        context.registerReceiver(this.mDeviceStorageReceiver, intentFilter2, null, ThreadManager.getWorkHandler());
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
    }

    private void ensureObservers() {
        this.mCtaReceiver = new CTAReceiver();
        this.mNetworkReceiver = new NetworkReceiver();
        this.mPowerStatusReceiver = new PowerChangedReceiver();
        this.mDeviceStorageReceiver = new DeviceStorageStateReceiver();
    }

    static DownloadObserver getInstance() {
        return SingletonHolder.INSTANCE;
    }

    /* access modifiers changed from: private */
    public void notifyConditionChanged(Context context) {
        Iterator it = this.mListeners.iterator();
        while (it.hasNext()) {
            ((OnConditionChangeListener) it.next()).onConditionChanged(context);
        }
    }

    /* access modifiers changed from: 0000 */
    public void register(Context context, OnConditionChangeListener onConditionChangeListener) {
        Log.i("DownloadObserver", "register %s", (Object) onConditionChangeListener);
        if (this.mListeners.add(onConditionChangeListener) && this.mRegisterCount.getAndIncrement() == 0) {
            final Context applicationContext = context.getApplicationContext();
            ThreadManager.getWorkHandler().post(new Runnable() {
                public void run() {
                    Log.d("DownloadObserver", "do register");
                    DownloadObserver.this.doRegister(applicationContext);
                }
            });
        }
    }

    /* access modifiers changed from: 0000 */
    public void unregister(Context context, OnConditionChangeListener onConditionChangeListener) {
        Log.i("DownloadObserver", "unregister %s", (Object) onConditionChangeListener);
        if (this.mListeners.remove(onConditionChangeListener) && this.mRegisterCount.decrementAndGet() <= 0) {
            final Context applicationContext = context.getApplicationContext();
            ThreadManager.getWorkHandler().post(new Runnable() {
                public void run() {
                    Log.d("DownloadObserver", "do unregister");
                    DownloadObserver.this.doUnregister(applicationContext);
                }
            });
        }
    }
}
