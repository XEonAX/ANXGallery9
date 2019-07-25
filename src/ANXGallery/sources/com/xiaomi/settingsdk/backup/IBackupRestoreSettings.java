package com.xiaomi.settingsdk.backup;

import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface IBackupRestoreSettings extends IInterface {

    public static abstract class Stub extends Binder implements IBackupRestoreSettings {
        public Stub() {
            attachInterface(this, "com.xiaomi.settingsdk.backup.IBackupRestoreSettings");
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = "com.xiaomi.settingsdk.backup.IBackupRestoreSettings";
            if (i == 1) {
                parcel.enforceInterface(str);
                handleSettingsIntent(parcel.readInt() != 0 ? (Intent) Intent.CREATOR.createFromParcel(parcel) : null);
                return true;
            } else if (i != 1598968902) {
                return super.onTransact(i, parcel, parcel2, i2);
            } else {
                parcel2.writeString(str);
                return true;
            }
        }
    }

    void handleSettingsIntent(Intent intent) throws RemoteException;
}
