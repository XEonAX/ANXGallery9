package com.xiaomi.xmsf.push.service;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* compiled from: IStatService */
public interface b extends IInterface {

    /* compiled from: IStatService */
    public static abstract class a extends Binder implements b {

        /* renamed from: com.xiaomi.xmsf.push.service.b$a$a reason: collision with other inner class name */
        /* compiled from: IStatService */
        private static class C0011a implements b {
            private IBinder a;

            C0011a(IBinder iBinder) {
                this.a = iBinder;
            }

            public void a(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.xmsf.push.service.IStatService");
                    obtain.writeString(str);
                    this.a.transact(1, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.a;
            }
        }

        public static b a(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.xiaomi.xmsf.push.service.IStatService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof b)) ? new C0011a(iBinder) : (b) queryLocalInterface;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i == 1) {
                parcel.enforceInterface("com.xiaomi.xmsf.push.service.IStatService");
                a(parcel.readString());
                return true;
            } else if (i != 1598968902) {
                return super.onTransact(i, parcel, parcel2, i2);
            } else {
                parcel2.writeString("com.xiaomi.xmsf.push.service.IStatService");
                return true;
            }
        }
    }

    void a(String str) throws RemoteException;
}
