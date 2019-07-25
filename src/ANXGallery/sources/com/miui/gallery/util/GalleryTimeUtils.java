package com.miui.gallery.util;

import android.text.TextUtils;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class GalleryTimeUtils {
    private static ThreadLocal<SimpleDateFormat> sDefaultFormatter = new ThreadLocal<>();
    private static ThreadLocal<SimpleDateFormat> sUTCFormatter = new ThreadLocal<>();

    private static SimpleDateFormat createSimpleDateFormat(boolean z) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
        if (z) {
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        } else {
            simpleDateFormat.setTimeZone(TimeZone.getDefault());
        }
        return simpleDateFormat;
    }

    public static Date getDate(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return getDefaultDateFormat().parse(str, new ParsePosition(0));
        } catch (IllegalArgumentException unused) {
            return null;
        }
    }

    public static long getDateTime(String str) {
        Date date = getDate(str);
        if (date != null) {
            return date.getTime();
        }
        return -1;
    }

    public static long getDateTime(String str, String str2) {
        Date date = getDate(str);
        if (date == null) {
            return -1;
        }
        long time = date.getTime();
        if (str2 != null) {
            if (str2.length() > 3) {
                str2 = str2.substring(0, 3);
            }
            try {
                time += Long.parseLong(str2);
            } catch (NumberFormatException unused) {
            }
        }
        return time;
    }

    public static SimpleDateFormat getDefaultDateFormat() {
        if (sDefaultFormatter.get() == null) {
            sDefaultFormatter.set(createSimpleDateFormat(false));
        }
        return (SimpleDateFormat) sDefaultFormatter.get();
    }

    public static Date getGpsDate(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(' ');
        sb.append(str2);
        String sb2 = sb.toString();
        if (sb2 == null) {
            return null;
        }
        try {
            return getUTCDateFormat().parse(sb2, new ParsePosition(0));
        } catch (IllegalArgumentException unused) {
            return null;
        }
    }

    public static long getGpsDateTime(String str, String str2) {
        Date gpsDate = getGpsDate(str, str2);
        if (gpsDate != null) {
            return gpsDate.getTime();
        }
        return -1;
    }

    public static long getTakenDateTime(String str, String str2, String str3, long j, long j2) {
        Date gpsDate = getGpsDate(str, str2);
        if (gpsDate == null) {
            long dateTime = getDateTime(str3);
            return dateTime == -1 ? j > 0 ? j : j2 : dateTime;
        }
        Date date = getDate(str3);
        return (date == null || GalleryDateUtils.isSameDate(date, gpsDate)) ? gpsDate.getTime() : date.getTime();
    }

    public static SimpleDateFormat getUTCDateFormat() {
        if (sUTCFormatter.get() == null) {
            sUTCFormatter.set(createSimpleDateFormat(true));
        }
        return (SimpleDateFormat) sUTCFormatter.get();
    }
}
