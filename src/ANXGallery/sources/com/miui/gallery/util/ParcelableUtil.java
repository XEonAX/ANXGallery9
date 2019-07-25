package com.miui.gallery.util;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ParcelableUtil {
    public static byte[] marshall(Parcelable parcelable) {
        Parcel obtain = Parcel.obtain();
        try {
            parcelable.writeToParcel(obtain, 0);
            return obtain.marshall();
        } finally {
            obtain.recycle();
        }
    }

    public static Parcel unmarshall(byte[] bArr) {
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(bArr, 0, bArr.length);
        obtain.setDataPosition(0);
        return obtain;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0016  */
    public static <T extends Parcelable> T unmarshall(byte[] bArr, Creator<T> creator) {
        Parcel parcel;
        try {
            parcel = unmarshall(bArr);
            try {
                T t = (Parcelable) creator.createFromParcel(parcel);
                if (parcel != null) {
                    parcel.recycle();
                }
                return t;
            } catch (Throwable th) {
                th = th;
                if (parcel != null) {
                    parcel.recycle();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            parcel = null;
            if (parcel != null) {
            }
            throw th;
        }
    }
}
