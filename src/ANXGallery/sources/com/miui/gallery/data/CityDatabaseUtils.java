package com.miui.gallery.data;

import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.ByteArrayInputStream;
import java.io.ObjectInputStream;

class CityDatabaseUtils {
    /* access modifiers changed from: private */
    public static String TAG = "CityDatabaseUtils";

    public static class PolygonHelper {
        /* JADX WARNING: Removed duplicated region for block: B:23:0x002e  */
        /* JADX WARNING: Removed duplicated region for block: B:25:0x0033  */
        /* JADX WARNING: Removed duplicated region for block: B:30:0x003d  */
        /* JADX WARNING: Removed duplicated region for block: B:32:0x0042  */
        public static <T> T parseFromByteArray(byte[] bArr) {
            Throwable th;
            ByteArrayInputStream byteArrayInputStream;
            ObjectInputStream objectInputStream;
            ObjectInputStream objectInputStream2 = null;
            if (bArr == null || bArr.length == 0) {
                Log.e(CityDatabaseUtils.TAG, "cannot parse polygon from a byte array, the byte array is null or empty");
                return null;
            }
            try {
                byteArrayInputStream = new ByteArrayInputStream(bArr);
                try {
                    objectInputStream = new ObjectInputStream(byteArrayInputStream);
                } catch (Throwable th2) {
                    th = th2;
                    if (byteArrayInputStream != null) {
                    }
                    if (objectInputStream2 != null) {
                    }
                    throw th;
                }
                try {
                    T readObject = objectInputStream.readObject();
                    MiscUtil.closeSilently(byteArrayInputStream);
                    MiscUtil.closeSilently(objectInputStream);
                    return readObject;
                } catch (Throwable th3) {
                    th = th3;
                    th.printStackTrace();
                    if (byteArrayInputStream != null) {
                    }
                    if (objectInputStream != null) {
                    }
                    return null;
                }
            } catch (Throwable th4) {
                th = th4;
                byteArrayInputStream = null;
                if (byteArrayInputStream != null) {
                    MiscUtil.closeSilently(byteArrayInputStream);
                }
                if (objectInputStream2 != null) {
                    MiscUtil.closeSilently(objectInputStream2);
                }
                throw th;
            }
        }
    }
}
