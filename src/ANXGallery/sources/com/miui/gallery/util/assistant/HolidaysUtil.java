package com.miui.gallery.util.assistant;

import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import miui.date.Calendar;

public class HolidaysUtil {
    private static final int[][] CHINESE_CALENDAR_HOLIDAYS = {new int[]{-1, 100}, new int[]{BaiduSceneResult.SHOOTING, BaiduSceneResult.SHOOTING}, new int[]{BaiduSceneResult.BUILDING_OTHER, BaiduSceneResult.TAEKWONDO}, new int[]{505, BaiduSceneResult.MOUNTAINEERING}, new int[]{707, BaiduSceneResult.SPORTS_OTHER}, new int[]{815, BaiduSceneResult.TEMPLE}};
    private static final int[][] HOLIDAYS = {new int[]{BaiduSceneResult.SHOOTING, 200}, new int[]{214, 201}, new int[]{501, 202}, new int[]{601, 203}, new int[]{1001, 204}, new int[]{1225, 205}};

    private static int daysInChineseYear(Calendar calendar) {
        Calendar calendar2 = (Calendar) calendar.clone();
        calendar2.set(2, calendar.get(2) + 1);
        calendar2.set(6, 0);
        calendar2.set(10, 1);
        calendar2.setTimeInMillis(calendar2.getTimeInMillis() - 86400000);
        return calendar2.get(13);
    }

    public static int getChineseHoliday(long j) {
        Calendar calendar = new Calendar();
        calendar.setTimeInMillis(j);
        return getChineseHoliday(calendar);
    }

    public static int getChineseHoliday(Calendar calendar) {
        int[][] iArr;
        if (!calendar.outOfChineseCalendarRange()) {
            int i = ((calendar.get(6) + 1) * 100) + calendar.get(10);
            for (int[] iArr2 : CHINESE_CALENDAR_HOLIDAYS) {
                if (iArr2[0] != -1) {
                    if (!calendar.isChineseLeapMonth() && i == iArr2[0]) {
                        return iArr2[1];
                    }
                } else if (daysInChineseYear(calendar) == calendar.get(13)) {
                    return iArr2[1];
                }
            }
        }
        return -1;
    }

    public static long getChineseHolidayDatetimeOfPastYear(Calendar calendar, int i) {
        if (getChineseHoliday(calendar) == -1) {
            return -1;
        }
        Calendar calendar2 = (Calendar) calendar.clone();
        calendar2.set(2, calendar.get(2) - i);
        int daysInChineseYear = daysInChineseYear(calendar2);
        if (daysInChineseYear == calendar.get(13)) {
            calendar2.set(13, daysInChineseYear);
        }
        calendar2.set(18, 0);
        calendar2.set(20, 0);
        calendar2.set(21, 0);
        calendar2.set(22, 0);
        return calendar2.getTimeInMillis();
    }

    public static String getChineseHolidayNameForStory(int i, int i2) {
        int i3 = i2 - 100;
        if (i > 1) {
            String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.chinese_holiday_past_year);
            if (stringArray.length > 0 && stringArray.length > i3) {
                return stringArray[i3];
            }
        } else {
            String[] stringArray2 = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.chinese_holiday_last_year);
            if (stringArray2.length > 0 && stringArray2.length > i3) {
                return stringArray2[i3];
            }
        }
        return "";
    }

    public static int getHoliday(long j) {
        Calendar calendar = new Calendar();
        calendar.setTimeInMillis(j);
        return getHoliday(calendar);
    }

    public static int getHoliday(Calendar calendar) {
        int[][] iArr;
        int i = ((calendar.get(5) + 1) * 100) + calendar.get(9);
        for (int[] iArr2 : HOLIDAYS) {
            if (iArr2[0] == i) {
                return iArr2[1];
            }
        }
        return -1;
    }

    public static String getHolidayNameForStory(int i, int i2) {
        int i3 = i2 - 200;
        if (i > 1) {
            String[] stringArray = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.holiday_past_year);
            if (stringArray.length > 0 && stringArray.length > i3) {
                return stringArray[i3];
            }
        } else {
            String[] stringArray2 = GalleryApp.sGetAndroidContext().getResources().getStringArray(R.array.holiday_last_year);
            if (stringArray2.length > 0 && stringArray2.length > i3) {
                return stringArray2[i3];
            }
        }
        return "";
    }
}
