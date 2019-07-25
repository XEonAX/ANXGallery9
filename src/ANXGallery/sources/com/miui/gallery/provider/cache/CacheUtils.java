package com.miui.gallery.provider.cache;

import android.text.TextUtils;
import com.miui.gallery.util.Numbers;
import java.util.Arrays;

public class CacheUtils {
    public static boolean columnEquals(CacheItem cacheItem, CacheItem cacheItem2, int i) {
        boolean z = true;
        if (cacheItem == cacheItem2) {
            return true;
        }
        if (cacheItem == null || cacheItem2 == null) {
            return false;
        }
        switch (cacheItem.getType(i)) {
            case 0:
                if (cacheItem2.getType(i) != 0) {
                    z = false;
                }
                return z;
            case 1:
                Object obj = cacheItem.get(i, true);
                Object obj2 = cacheItem2.get(i, true);
                if (obj instanceof Long) {
                    return Numbers.equals((Long) obj, obj2 instanceof Long ? ((Long) obj2).longValue() : (long) ((Integer) obj2).intValue());
                }
                return Numbers.equals((Integer) obj, obj2 instanceof Long ? ((Long) obj2).longValue() : (long) ((Integer) obj2).intValue());
            case 2:
                return Numbers.equals((Float) cacheItem.get(i, true), (Float) cacheItem2.get(i, true));
            case 3:
                return TextUtils.equals((String) cacheItem.get(i, true), (String) cacheItem2.get(i, true));
            case 4:
                return Arrays.deepEquals((Byte[]) cacheItem.get(i, true), (Byte[]) cacheItem2.get(i, true));
            default:
                return false;
        }
    }
}
