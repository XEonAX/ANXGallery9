package com.miui.gallery.util;

import android.text.TextUtils;
import com.miui.gallery.base.R;
import com.miui.gallery.threadpool.ThreadManager;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import miui.date.DateUtils;
import miui.util.Pools;
import miui.util.Pools.Manager;
import miui.util.Pools.Pool;
import miui.util.cache.LruCache;

public class GalleryDateUtils {
    private static final Pool<Calendar> CALENDAR_POOL = Pools.createSoftReferencePool(new Manager<Calendar>() {
        public Calendar createInstance() {
            return Calendar.getInstance();
        }
    }, 1);
    private static LruCache<Long, String> sDateCache = new LruCache<>(50);
    private static String sLocalLanguage = Locale.getDefault().toString();
    private static String sToday;
    private static String sYesterday;

    public static Calendar acquire() {
        return (Calendar) CALENDAR_POOL.acquire();
    }

    /* access modifiers changed from: private */
    public static void clearCache() {
        sToday = null;
        sYesterday = null;
        sDateCache.clear();
    }

    public static long daysBeforeToday(long j) {
        long currentTimeMillis = System.currentTimeMillis();
        if (j >= currentTimeMillis) {
            return 0;
        }
        Calendar acquire = acquire();
        acquire.setTimeInMillis(currentTimeMillis);
        acquire.set(11, 0);
        acquire.set(12, 0);
        acquire.set(13, 0);
        acquire.set(14, 0);
        long timeInMillis = acquire.getTimeInMillis();
        if (timeInMillis <= j) {
            return 0;
        }
        long daysBetween = daysBetween(j, timeInMillis) + 1;
        release(acquire);
        return daysBetween;
    }

    public static long daysBetween(long j, long j2) {
        return TimeUnit.MILLISECONDS.toDays(Math.abs(j2 - j));
    }

    public static int format(long j) {
        Calendar acquire = acquire();
        acquire.setTimeInMillis(j);
        int i = (((acquire.get(1) << 4) | (acquire.get(2) + 1)) << 5) | acquire.get(5);
        release(acquire);
        return i;
    }

    public static long format(int i) {
        Calendar acquire = acquire();
        int i2 = i >> 5;
        acquire.set(5, i - (i2 << 5));
        int i3 = i2 >> 4;
        acquire.set(2, (i2 - (i3 << 4)) - 1);
        acquire.set(1, i3);
        long timeInMillis = acquire.getTimeInMillis();
        release(acquire);
        return timeInMillis;
    }

    public static String formatRelativeDate(long j) {
        String str;
        String locale = Locale.getDefault().toString();
        if (TextUtils.equals(sLocalLanguage, locale)) {
            str = (String) sDateCache.get(Long.valueOf(j));
        } else {
            clearCache();
            sLocalLanguage = locale;
            str = null;
        }
        if (str != null) {
            return str;
        }
        StringBuilder sb = (StringBuilder) Pools.getStringBuilderPool().acquire();
        Calendar calendar = (Calendar) CALENDAR_POOL.acquire();
        long currentTimeMillis = System.currentTimeMillis();
        calendar.setTimeInMillis(currentTimeMillis);
        int i = calendar.get(1);
        int i2 = calendar.get(6);
        calendar.setTimeInMillis(j);
        boolean z = i == calendar.get(1);
        if (z && i2 == calendar.get(6)) {
            sb.append(getTodayTip());
        } else if (z && Math.abs(calendar.get(6) - i2) < 2 && j < currentTimeMillis) {
            sb.append(getYesterdayTip());
        } else if (z) {
            DateUtils.formatDateTime(sb, j, 4480);
        } else {
            DateUtils.formatDateTime(sb, j, 4992);
        }
        CALENDAR_POOL.release(calendar);
        String sb2 = sb.toString();
        Pools.getStringBuilderPool().release(sb);
        sDateCache.put(Long.valueOf(j), sb2, 1);
        return sb2;
    }

    public static String formatRelativeMonth(long j) {
        StringBuilder sb = (StringBuilder) Pools.getStringBuilderPool().acquire();
        Calendar calendar = (Calendar) CALENDAR_POOL.acquire();
        calendar.setTimeInMillis(System.currentTimeMillis());
        boolean z = true;
        int i = calendar.get(1);
        calendar.setTimeInMillis(j);
        if (i != calendar.get(1)) {
            z = false;
        }
        if (z) {
            DateUtils.formatDateTime(sb, j, 4352);
        } else {
            DateUtils.formatDateTime(sb, j, 4864);
        }
        CALENDAR_POOL.release(calendar);
        String sb2 = sb.toString();
        Pools.getStringBuilderPool().release(sb);
        return sb2;
    }

    private static String getTodayTip() {
        if (sToday == null) {
            sToday = StaticContext.sGetAndroidContext().getResources().getString(R.string.today);
        }
        return sToday;
    }

    private static String getYesterdayTip() {
        if (sYesterday == null) {
            sYesterday = StaticContext.sGetAndroidContext().getResources().getString(R.string.yesterday);
        }
        return sYesterday;
    }

    public static void invalidateCache() {
        ThreadManager.runOnMainThread(new Runnable() {
            public void run() {
                GalleryDateUtils.clearCache();
            }
        });
    }

    public static boolean isSameDate(Date date, Date date2) {
        boolean z = true;
        if (date == date2) {
            return true;
        }
        if (date == null || date2 == null) {
            return false;
        }
        if (Math.abs(date.getTime() - date2.getTime()) > 86400000 || date.getDate() != date2.getDate()) {
            z = false;
        }
        return z;
    }

    public static boolean isSameDay(int i, int i2) {
        return i == i2;
    }

    public static boolean isSameMonth(int i, int i2) {
        return (i & -32) == (i2 & -32);
    }

    public static void release(Calendar calendar) {
        CALENDAR_POOL.release(calendar);
    }
}
