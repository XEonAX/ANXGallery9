package com.android.systemui.screenshot;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface IBitmapService extends IInterface {

    public static abstract class Stub extends Binder implements IBitmapService {
        public Stub() {
            attachInterface(this, "com.android.systemui.screenshot.IBitmapService");
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = "com.android.systemui.screenshot.IBitmapService";
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        parcel.enforceInterface(str);
                        registerCallback(com.android.systemui.screenshot.IScreenShotCallback.Stub.asInterface(parcel.readStrongBinder()));
                        parcel2.writeNoException();
                        return true;
                    case 2:
                        parcel.enforceInterface(str);
                        unregisterCallback(com.android.systemui.screenshot.IScreenShotCallback.Stub.asInterface(parcel.readStrongBinder()));
                        parcel2.writeNoException();
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel2.writeString(str);
                return true;
            }
        }
    }

    void registerCallback(IScreenShotCallback iScreenShotCallback) throws RemoteException;

    void unregisterCallback(IScreenShotCallback iScreenShotCallback) throws RemoteException;
}
