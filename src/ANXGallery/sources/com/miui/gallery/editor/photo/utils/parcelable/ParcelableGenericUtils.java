package com.miui.gallery.editor.photo.utils.parcelable;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class ParcelableGenericUtils {
    public static <T extends Parcelable> T[] readArray(Parcel parcel) {
        T[] tArr;
        int readInt = parcel.readInt();
        if (readInt == -1) {
            return null;
        }
        try {
            Class cls = Class.forName(parcel.readString());
            tArr = (Parcelable[]) Array.newInstance(cls, readInt);
            int i = 0;
            while (i < readInt) {
                try {
                    tArr[i] = parcel.readParcelable(cls.getClassLoader());
                    i++;
                } catch (ClassNotFoundException e) {
                    e = e;
                    e.printStackTrace();
                    return tArr;
                }
            }
        } catch (ClassNotFoundException e2) {
            e = e2;
            tArr = null;
            e.printStackTrace();
            return tArr;
        }
        return tArr;
    }

    public static <T extends Parcelable> List<T> readList(Parcel parcel) {
        int readInt = parcel.readInt();
        if (readInt == -1) {
            return null;
        }
        ArrayList arrayList = new ArrayList(readInt);
        for (int i = 0; i < readInt; i++) {
            try {
                arrayList.add(parcel.readParcelable(Class.forName(parcel.readString()).getClassLoader()));
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return arrayList;
    }

    public static <T extends Parcelable> T readObject(Parcel parcel) {
        try {
            String readString = parcel.readString();
            if (!TextUtils.equals(readString, "NULL")) {
                return parcel.readParcelable(Class.forName(readString).getClassLoader());
            }
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T extends Parcelable> void writeArray(Parcel parcel, int i, T[] tArr, Class<T> cls) {
        if (tArr == null) {
            parcel.writeInt(-1);
            return;
        }
        parcel.writeInt(tArr.length);
        parcel.writeString(cls.getName());
        for (T writeParcelable : tArr) {
            parcel.writeParcelable(writeParcelable, i);
        }
    }

    public static <T extends Parcelable> void writeList(Parcel parcel, int i, List<T> list) {
        if (list == null) {
            parcel.writeInt(-1);
        }
        parcel.writeInt(list.size());
        for (T t : list) {
            parcel.writeString(t.getClass().getName());
            parcel.writeParcelable(t, i);
        }
    }

    public static <T extends Parcelable> void writeObject(Parcel parcel, int i, T t) {
        if (t == null) {
            parcel.writeString("NULL");
            return;
        }
        parcel.writeString(t.getClass().getName());
        parcel.writeParcelable(t, i);
    }
}
