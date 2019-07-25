package com.miui.gallery.editor.photo.origin;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface EditorOriginFunc extends IInterface {

    public static abstract class Stub extends Binder implements EditorOriginFunc {

        private static class Proxy implements EditorOriginFunc {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public boolean handlerOrigin(OriginRenderData originRenderData) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken("com.miui.gallery.editor.photo.origin.EditorOriginFunc");
                    boolean z = true;
                    if (originRenderData != null) {
                        obtain.writeInt(1);
                        originRenderData.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() == 0) {
                        z = false;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, "com.miui.gallery.editor.photo.origin.EditorOriginFunc");
        }

        public static EditorOriginFunc asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface("com.miui.gallery.editor.photo.origin.EditorOriginFunc");
            return (queryLocalInterface == null || !(queryLocalInterface instanceof EditorOriginFunc)) ? new Proxy(iBinder) : (EditorOriginFunc) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = "com.miui.gallery.editor.photo.origin.EditorOriginFunc";
            if (i == 1) {
                parcel.enforceInterface(str);
                boolean handlerOrigin = handlerOrigin(parcel.readInt() != 0 ? (OriginRenderData) OriginRenderData.CREATOR.createFromParcel(parcel) : null);
                parcel2.writeNoException();
                parcel2.writeInt(handlerOrigin ? 1 : 0);
                return true;
            } else if (i != 1598968902) {
                return super.onTransact(i, parcel, parcel2, i2);
            } else {
                parcel2.writeString(str);
                return true;
            }
        }
    }

    boolean handlerOrigin(OriginRenderData originRenderData) throws RemoteException;
}
