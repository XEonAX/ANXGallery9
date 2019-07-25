package com.miui.gallery.data;

public class UbiIndexMapper {
    public static int cloudToLocal(int i, int i2) {
        return i == 0 ? i2 - 1 : i - 1;
    }

    public static int localToCloud(int i, int i2) {
        if (i == i2 - 1) {
            return 0;
        }
        return i + 1;
    }
}
