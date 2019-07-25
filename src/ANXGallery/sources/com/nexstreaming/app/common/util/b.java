package com.nexstreaming.app.common.util;

import android.util.Log;
import java.io.Closeable;
import java.io.IOException;

/* compiled from: CloseUtil */
public class b {
    public static void a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
                Log.w("CloseUtil", "Error closing resource", e);
            }
        }
    }
}
