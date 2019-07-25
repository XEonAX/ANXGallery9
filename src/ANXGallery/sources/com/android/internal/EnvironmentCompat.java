package com.android.internal;

import android.os.Environment;
import java.io.File;

public class EnvironmentCompat {
    public static final String getLegacyExternalStorageDirectory() {
        File file;
        try {
            file = Environment.getLegacyExternalStorageDirectory();
        } catch (NoSuchMethodError unused) {
            file = null;
        }
        return file == null ? "/sdcard" : file.getPath();
    }
}
