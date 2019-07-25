package com.xiaomi.settingsdk.backup;

import android.app.IntentService;
import android.content.Intent;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.util.Log;
import com.xiaomi.settingsdk.backup.IBackupRestoreSettings.Stub;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public abstract class CloudBackupServiceBase extends IntentService {
    /* access modifiers changed from: private */
    public static final ExecutorService sSettingsExecutor = Executors.newSingleThreadExecutor();
    private final Stub mBackupRestoreSettingsBinder = new Stub() {
        public void handleSettingsIntent(Intent intent) throws RemoteException {
            CloudBackupServiceBase.sSettingsExecutor.submit(new SettingsIntentRunner(intent, null));
        }
    };

    private class SettingsIntentRunner implements Runnable {
        private final Intent mIntent;
        private final Integer mStartId;

        public SettingsIntentRunner(Intent intent, Integer num) {
            this.mIntent = intent;
            this.mStartId = num;
        }

        public void run() {
            CloudBackupServiceBase.this.handleIntent(this.mIntent, this.mStartId);
        }
    }

    public CloudBackupServiceBase() {
        super("SettingsBackup");
    }

    private Bundle backupSettings() {
        Log.d("SettingsBackup", prependPackageName("SettingsBackupServiceBase:backupSettings"));
        ICloudBackup checkAndGetBackuper = checkAndGetBackuper();
        DataPackage dataPackage = new DataPackage();
        checkAndGetBackuper.onBackupSettings(getApplicationContext(), dataPackage);
        Bundle bundle = new Bundle();
        dataPackage.appendToWrappedBundle(bundle);
        bundle.putInt("version", checkAndGetBackuper.getCurrentVersion(getApplicationContext()));
        return bundle;
    }

    private ICloudBackup checkAndGetBackuper() {
        ICloudBackup backupImpl = getBackupImpl();
        if (backupImpl != null) {
            return backupImpl;
        }
        throw new IllegalArgumentException("backuper must not be null");
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x00f3  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x00fc  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0129  */
    public void handleIntent(Intent intent, Integer num) {
        Parcel obtain;
        Parcel obtain2;
        boolean z;
        if (intent == null) {
            if (num != null) {
                stopSelf(num.intValue());
            }
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("myPid: ");
        sb.append(Process.myPid());
        Log.d("SettingsBackup", prependPackageName(sb.toString()));
        StringBuilder sb2 = new StringBuilder();
        sb2.append("intent: ");
        sb2.append(intent);
        Log.d("SettingsBackup", prependPackageName(sb2.toString()));
        StringBuilder sb3 = new StringBuilder();
        sb3.append("extras: ");
        sb3.append(intent.getExtras());
        Log.d("SettingsBackup", prependPackageName(sb3.toString()));
        String action = intent.getAction();
        ResultReceiver resultReceiver = (ResultReceiver) intent.getParcelableExtra("result_receiver");
        if ("miui.action.CLOUD_BACKUP_SETTINGS".equals(action)) {
            if (resultReceiver != null) {
                Bundle backupSettings = backupSettings();
                if (backupSettings == null) {
                    Log.e("SettingsBackup", prependPackageName("bundle result is null after backupSettings"));
                }
                resultReceiver.send(0, backupSettings);
            }
        } else if ("miui.action.CLOUD_RESTORE_SETTINGS".equals(action) && resultReceiver != null) {
            IBinder binder = intent.getExtras().getBinder("data_package");
            obtain = Parcel.obtain();
            obtain2 = Parcel.obtain();
            try {
                binder.transact(2, obtain, obtain2, 0);
                z = restoreSettings((DataPackage) obtain2.readParcelable(getClass().getClassLoader()), intent.getIntExtra("version", -1));
                obtain.recycle();
                obtain2.recycle();
            } catch (RemoteException e) {
                Log.e("SettingsBackup", "RemoteException in onHandleIntent()", e);
            } catch (BadParcelableException e2) {
                Log.e("SettingsBackup", "BadParcelableException when read readParcelable", e2);
            } catch (ClassCastException unused) {
                Log.e("SettingsBackup", "ClassCastException when cast DataPackage");
            } catch (Throwable th) {
                obtain.recycle();
                obtain2.recycle();
                throw th;
            }
            if (!z) {
                resultReceiver.send(0, new Bundle());
            } else {
                resultReceiver.send(1, null);
            }
            StringBuilder sb4 = new StringBuilder();
            sb4.append("r.send()");
            sb4.append(Thread.currentThread());
            Log.d("SettingsBackup", prependPackageName(sb4.toString()));
        }
        if (num != null) {
            stopSelf(num.intValue());
        }
        obtain.recycle();
        obtain2.recycle();
        z = false;
        if (!z) {
        }
        StringBuilder sb42 = new StringBuilder();
        sb42.append("r.send()");
        sb42.append(Thread.currentThread());
        Log.d("SettingsBackup", prependPackageName(sb42.toString()));
        if (num != null) {
        }
    }

    private String prependPackageName(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(getPackageName());
        sb.append(": ");
        sb.append(str);
        return sb.toString();
    }

    private boolean restoreSettings(DataPackage dataPackage, int i) {
        Log.d("SettingsBackup", prependPackageName("SettingsBackupServiceBase:restoreSettings"));
        ICloudBackup checkAndGetBackuper = checkAndGetBackuper();
        int currentVersion = checkAndGetBackuper.getCurrentVersion(getApplicationContext());
        if (i > currentVersion) {
            StringBuilder sb = new StringBuilder();
            sb.append("drop restore data because dataVersion is higher than currentAppVersion, dataVersion: ");
            sb.append(i);
            sb.append(", currentAppVersion: ");
            sb.append(currentVersion);
            Log.w("SettingsBackup", sb.toString());
            return false;
        }
        checkAndGetBackuper.onRestoreSettings(getApplicationContext(), dataPackage, i);
        return true;
    }

    /* access modifiers changed from: protected */
    public abstract ICloudBackup getBackupImpl();

    public IBinder onBind(Intent intent) {
        return this.mBackupRestoreSettingsBinder;
    }

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        StringBuilder sb = new StringBuilder();
        sb.append("@Deprecated :: onHandleIntent(");
        sb.append(intent);
        sb.append(")");
        Log.d("SettingsBackup", sb.toString());
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        sSettingsExecutor.submit(new SettingsIntentRunner(intent, Integer.valueOf(i2)));
        return 2;
    }
}
