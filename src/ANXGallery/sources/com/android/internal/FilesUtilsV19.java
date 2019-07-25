package com.android.internal;

import android.os.FileUtils;

class FilesUtilsV19 {
    public static int setPermissions(String str, int i, int i2, int i3) {
        return FileUtils.setPermissions(str, i, i2, i3);
    }
}
