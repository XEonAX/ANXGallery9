package com.miui.gallery.card.scenario;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtils {
    public static long getCurrentTimeMillis() {
        return System.currentTimeMillis();
    }

    public static String getDateFormat(long j) {
        return new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date(j));
    }

    public static String getDatePeriodGraceful(long j, long j2) {
        String str;
        String str2;
        if (isSameDay(j, j2)) {
            return getYearMonthDayLocale(j);
        }
        if (j <= 0 || j2 <= j) {
            return "";
        }
        String language = Locale.getDefault().getLanguage();
        boolean isSameYear = isSameYear(j, j2);
        boolean z = isSameYear && isSameMonth(j, j2);
        if (new Locale("zh").getLanguage().equals(language)) {
            str2 = getYearMonthDayLocale(j);
            str = z ? getDayLocale(j2) : isSameYear ? getMonthDayLocale(j2) : getYearMonthDayLocale(j2);
        } else if (!new Locale("en").getLanguage().equals(language)) {
            return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_description_from_to, new Object[]{getYearMonthDayLocale(j), getYearMonthDayLocale(j2)});
        } else if (z) {
            str2 = getMonthDayLocale(j);
            StringBuilder sb = new StringBuilder();
            sb.append(getDayLocale(j2));
            sb.append(", ");
            sb.append(getYearLocale(j2));
            str = sb.toString();
        } else if (isSameYear) {
            str2 = getMonthDayLocale(j);
            str = getYearMonthDayLocale(j2);
        } else {
            str2 = getYearMonthDayLocale(j);
            str = getYearMonthDayLocale(j2);
        }
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_description_from_to, new Object[]{str2, str});
    }

    public static long getDateTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static String getDayLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 128);
    }

    public static long getEndDayOfYearTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        instance.set(2, 11);
        instance.set(5, 31);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getFirstDayOfMonthTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        instance.set(5, 1);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getFirstDayOfYearTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        instance.set(2, 0);
        instance.set(5, 1);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getLastDayEndOfMonthTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        int i = instance.get(2);
        if (i == 11) {
            instance.set(1, instance.get(1) + 1);
            instance.set(2, 0);
            instance.set(5, 1);
        } else {
            instance.set(2, i + 1);
            instance.set(5, 1);
        }
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getLastNYearDateTime(int i, long j) {
        if (i < 1) {
            i = 1;
        }
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        int i2 = instance.get(5);
        instance.set(1, instance.get(1) - i);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        if (i2 != instance.get(5)) {
            return -1;
        }
        return instance.getTimeInMillis();
    }

    private static long getLastNYearMonthTime(int i, int i2, boolean z) {
        if (i < 0) {
            i = 0;
        }
        if (i2 < 0) {
            i2 = 0;
        }
        if (i2 > 11) {
            i2 = 11;
        }
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(getCurrentTimeMillis());
        instance.set(1, instance.get(1) - i);
        if (z) {
            instance.set(2, i2);
            instance.set(5, 1);
        } else if (i2 == 11) {
            instance.set(1, instance.get(1) + 1);
            instance.set(2, 0);
            instance.set(5, 1);
        } else {
            instance.set(2, i2 + 1);
            instance.set(5, 1);
        }
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getLastNYearMonthTime(int i, long j, boolean z) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        try {
            return getLastNYearMonthTime(i, instance.get(2), z);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("getLastNYearMonthTime fail:");
            sb.append(e);
            Log.e("DateUtils", sb.toString());
            return -1;
        }
    }

    public static long getLastWeekDayTime(int i, long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j - 604800000);
        if (i < 1 || i > 7) {
            i = 7;
        }
        instance.set(7, i);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static int getMonth(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        return instance.get(2);
    }

    public static String getMonthDayLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 384);
    }

    public static String getMonthLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 256);
    }

    public static String getMonthPeriodGraceful(long j, long j2) {
        String str;
        String str2;
        if (isSameMonth(j, j2)) {
            return getYearMonthLocale(j);
        }
        if (j <= 0 || j2 <= j) {
            return "";
        }
        String language = Locale.getDefault().getLanguage();
        boolean isSameYear = isSameYear(j, j2);
        if (new Locale("zh").getLanguage().equals(language)) {
            if (isSameYear) {
                str2 = getYearMonthLocale(j);
                str = getMonthLocale(j2);
            } else {
                str2 = getYearMonthLocale(j);
                str = getYearMonthLocale(j2);
            }
        } else if (!new Locale("en").getLanguage().equals(language)) {
            return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_description_from_to, new Object[]{getYearMonthLocale(j), getYearMonthLocale(j2)});
        } else if (isSameYear) {
            str2 = getMonthLocale(j);
            str = getYearMonthLocale(j2);
        } else {
            str2 = getYearMonthLocale(j);
            str = getYearMonthLocale(j2);
        }
        return GalleryApp.sGetAndroidContext().getResources().getString(R.string.card_description_from_to, new Object[]{str2, str});
    }

    public static long getNextMonthTime(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        int i = instance.get(2);
        if (i < 11) {
            instance.set(2, i + 1);
        } else {
            instance.set(1, instance.get(1) + 1);
            instance.set(2, 0);
        }
        return instance.getTimeInMillis();
    }

    public static int getSeason(long j) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        switch (instance.get(2)) {
            case 2:
            case 3:
            case 4:
                return 0;
            case 5:
            case 6:
            case 7:
                return 1;
            case 8:
            case 9:
            case 10:
                return 2;
            default:
                return 3;
        }
    }

    public static long getSeasonEndTime(long j) {
        int i;
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        int i2 = instance.get(2);
        int i3 = instance.get(1);
        switch (i2) {
            case 2:
            case 3:
            case 4:
                i = 4;
                break;
            case 5:
            case 6:
            case 7:
                i = 7;
                break;
            case 8:
            case 9:
            case 10:
                i = 10;
                break;
            case 11:
                i3++;
                break;
        }
        i = 1;
        instance.set(1, i3);
        instance.set(2, i + 1);
        instance.set(5, 1);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static long getSeasonStartTime(long j) {
        int i;
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        int i2 = instance.get(2);
        int i3 = instance.get(1);
        switch (i2) {
            case 0:
            case 1:
                i3--;
                break;
            case 2:
            case 3:
            case 4:
                i = 2;
                break;
            case 5:
            case 6:
            case 7:
                i = 5;
                break;
            case 8:
            case 9:
            case 10:
                i = 8;
                break;
        }
        i = 11;
        instance.set(1, i3);
        instance.set(2, i);
        instance.set(5, 1);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTimeInMillis();
    }

    public static String getYearLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 512);
    }

    public static String getYearMonthDayLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 896);
    }

    public static String getYearMonthLocale(long j) {
        return miui.date.DateUtils.formatDateTime(j, 768);
    }

    public static boolean isSameDay(long j, long j2) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTimeInMillis(j2);
        return instance.get(1) == instance2.get(1) && instance.get(2) == instance2.get(2) && instance.get(5) == instance2.get(5);
    }

    public static boolean isSameMonth(long j, long j2) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTimeInMillis(j2);
        return instance.get(1) == instance2.get(1) && instance.get(2) == instance2.get(2);
    }

    public static boolean isSameYear(long j, long j2) {
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(j);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTimeInMillis(j2);
        return instance.get(1) == instance2.get(1);
    }

    public static boolean withinTime(long j, long j2, long j3) {
        return Math.abs(j - j2) <= j3;
    }
}
