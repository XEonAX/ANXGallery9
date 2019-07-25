package com.xiaomi.mistatistic.sdk;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.xiaomi.mistatistic.sdk.data.StatEventPojo;
import java.util.List;

/* compiled from: IBaseService */
public interface a extends IInterface {

    /* renamed from: com.xiaomi.mistatistic.sdk.a$a reason: collision with other inner class name */
    /* compiled from: IBaseService */
    public static abstract class C0006a extends Binder implements a {

        /* renamed from: com.xiaomi.mistatistic.sdk.a$a$a reason: collision with other inner class name */
        /* compiled from: IBaseService */
        private static class C0007a implements a {
            private IBinder a;

            C0007a(IBinder iBinder) {
                this.a = iBinder;
            }

            public int a(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    obtain.writeInt(i);
                    this.a.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public StatEventPojo a(String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    this.a.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (StatEventPojo) StatEventPojo.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public List<StatEventPojo> a(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    obtain.writeLong(j);
                    this.a.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(StatEventPojo.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean a() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    boolean z = false;
                    this.a.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.a;
            }

            public boolean b(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    obtain.writeLong(j);
                    boolean z = false;
                    this.a.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public List<StatEventPojo> c(long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.xiaomi.mistatistic.sdk.IBaseService");
                    obtain.writeLong(j);
                    this.a.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(StatEventPojo.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public static a a(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.xiaomi.mistatistic.sdk.IBaseService");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof a)) ? new C0007a(iBinder) : (a) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        StatEventPojo a = a(parcel.readString(), parcel.readString());
                        parcel2.writeNoException();
                        if (a != null) {
                            parcel2.writeInt(1);
                            a.writeToParcel(parcel2, 1);
                        } else {
                            parcel2.writeInt(0);
                        }
                        return true;
                    case 2:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        List a2 = a(parcel.readLong());
                        parcel2.writeNoException();
                        parcel2.writeTypedList(a2);
                        return true;
                    case 3:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        int a3 = a(parcel.readInt());
                        parcel2.writeNoException();
                        parcel2.writeInt(a3);
                        return true;
                    case 4:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        boolean b = b(parcel.readLong());
                        parcel2.writeNoException();
                        parcel2.writeInt(b ? 1 : 0);
                        return true;
                    case 5:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        List c = c(parcel.readLong());
                        parcel2.writeNoException();
                        parcel2.writeTypedList(c);
                        return true;
                    case 6:
                        parcel.enforceInterface("com.xiaomi.mistatistic.sdk.IBaseService");
                        boolean a4 = a();
                        parcel2.writeNoException();
                        parcel2.writeInt(a4 ? 1 : 0);
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel2.writeString("com.xiaomi.mistatistic.sdk.IBaseService");
                return true;
            }
        }
    }

    int a(int i) throws RemoteException;

    StatEventPojo a(String str, String str2) throws RemoteException;

    List<StatEventPojo> a(long j) throws RemoteException;

    boolean a() throws RemoteException;

    boolean b(long j) throws RemoteException;

    List<StatEventPojo> c(long j) throws RemoteException;
}
