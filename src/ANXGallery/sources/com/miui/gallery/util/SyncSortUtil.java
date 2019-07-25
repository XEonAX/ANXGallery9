package com.miui.gallery.util;

public class SyncSortUtil {
    private static int partition(int[] iArr, long[] jArr, int i, int i2) {
        long j = jArr[i];
        int i3 = iArr[i];
        while (i < i2) {
            while (jArr[i2] >= j && i2 > i) {
                i2--;
            }
            jArr[i] = jArr[i2];
            iArr[i] = iArr[i2];
            while (jArr[i] <= j && i2 > i) {
                i++;
            }
            jArr[i2] = jArr[i];
            iArr[i2] = iArr[i];
        }
        jArr[i2] = j;
        iArr[i2] = i3;
        return i2;
    }

    private static int partition(long[] jArr, long[] jArr2, int i, int i2) {
        long j = jArr2[i];
        long j2 = jArr[i];
        while (i < i2) {
            while (jArr2[i2] >= j && i2 > i) {
                i2--;
            }
            jArr2[i] = jArr2[i2];
            jArr[i] = jArr[i2];
            while (jArr2[i] <= j && i2 > i) {
                i++;
            }
            jArr2[i2] = jArr2[i];
            jArr[i2] = jArr[i];
        }
        jArr2[i2] = j;
        jArr[i2] = j2;
        return i2;
    }

    public static void sort(int[] iArr, long[] jArr, int i, int i2) {
        if (i < i2) {
            int partition = partition(iArr, jArr, i, i2);
            sort(iArr, jArr, i, partition - 1);
            sort(iArr, jArr, partition + 1, i2);
        }
    }

    public static void sort(long[] jArr, long[] jArr2, int i, int i2) {
        if (i < i2) {
            int partition = partition(jArr, jArr2, i, i2);
            sort(jArr, jArr2, i, partition - 1);
            sort(jArr, jArr2, partition + 1, i2);
        }
    }
}
