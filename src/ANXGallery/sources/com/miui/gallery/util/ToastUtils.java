package com.miui.gallery.util;

import android.content.Context;
import android.widget.Toast;
import com.miui.gallery.threadpool.ThreadManager;

public class ToastUtils {
    /* access modifiers changed from: private */
    public static boolean sIsLastCancelable;
    /* access modifiers changed from: private */
    public static Toast sLastToast;
    /* access modifiers changed from: private */
    public static Object sSyncObj = new Object();

    public static void makeText(Context context, int i) {
        makeText(context, i, 0, true);
    }

    public static void makeText(Context context, int i, int i2) {
        makeText(context, (CharSequence) context.getString(i), i2, true);
    }

    public static void makeText(Context context, int i, int i2, boolean z) {
        makeText(context, (CharSequence) context.getString(i), i2, z);
    }

    public static void makeText(Context context, CharSequence charSequence) {
        makeText(context, charSequence, true);
    }

    public static void makeText(Context context, CharSequence charSequence, int i) {
        makeText(context, charSequence, i, true);
    }

    public static void makeText(final Context context, final CharSequence charSequence, final int i, final boolean z) {
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                synchronized (ToastUtils.sSyncObj) {
                    if (ToastUtils.sLastToast != null && ToastUtils.sIsLastCancelable) {
                        ToastUtils.sLastToast.cancel();
                    }
                    ToastUtils.sLastToast = Toast.makeText(context.getApplicationContext(), charSequence, i);
                    ToastUtils.sIsLastCancelable = z;
                    ToastUtils.sLastToast.show();
                }
            }
        });
    }

    public static void makeText(Context context, CharSequence charSequence, boolean z) {
        makeText(context, charSequence, 0, z);
    }

    public static void makeTextLong(Context context, int i) {
        makeText(context, i, 1, true);
    }

    public static void makeTextLong(Context context, CharSequence charSequence) {
        makeText(context, charSequence, true);
    }
}
