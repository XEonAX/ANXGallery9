package com.xiaomi.micloudsdk.sync.utils;

import android.content.Context;
import android.util.Log;
import com.xiaomi.micloudsdk.utils.PrefUtils;
import java.util.Random;

public class SyncTimeUtils {
    private static int getFullJitterTime(short s, short s2, int i) {
        Random random = new Random();
        double d = (double) s;
        double d2 = (double) s2;
        double pow = Math.pow(2.0d, (double) i);
        Double.isNaN(d2);
        return random.nextInt((int) Math.min(d, d2 * pow));
    }

    private static String getResumeSyncTimeKey(String str) {
        return String.format("ResumeSyncTime_%s", new Object[]{str});
    }

    public static int getSyncSuspendTime(Context context, String str) {
        String format = String.format("AttemptNumber_%s", new Object[]{str});
        int intValue = PrefUtils.getInt(context, format, Integer.valueOf(1)).intValue();
        int fullJitterTime = getFullJitterTime(7200, 300, intValue);
        PrefUtils.putInt(context, format, Integer.valueOf(intValue + 1));
        return fullJitterTime;
    }

    public static boolean isSyncTimeAvailable(Context context, String str) {
        long longValue = PrefUtils.getLong(context, getResumeSyncTimeKey(str), Long.valueOf(0)).longValue();
        long currentTimeMillis = longValue - System.currentTimeMillis();
        if (currentTimeMillis > 86400000) {
            StringBuilder sb = new StringBuilder();
            sb.append("isSyncTimeAvailable: Remaining time of ");
            sb.append(str);
            sb.append("is not right and reset.");
            Log.d("SyncTimeUtils", sb.toString());
            PrefUtils.putLong(context, getResumeSyncTimeKey(str), Long.valueOf(0));
            return true;
        } else if (currentTimeMillis > 0) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("isSyncTimeAvailable: ");
            sb2.append(str);
            sb2.append(" sync suspended. ");
            sb2.append(currentTimeMillis / 1000);
            sb2.append(" seconds to resume.");
            Log.d("SyncTimeUtils", sb2.toString());
            return false;
        } else if (longValue == 0) {
            return true;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("isSyncTimeAvailable: The suspension of ");
            sb3.append(str);
            sb3.append(" sync is expired now.");
            Log.d("SyncTimeUtils", sb3.toString());
            PrefUtils.putLong(context, getResumeSyncTimeKey(str), Long.valueOf(0));
            return true;
        }
    }

    public static void resetBackoffStatus(Context context, String str) {
        PrefUtils.putInt(context, String.format("AttemptNumber_%s", new Object[]{str}), Integer.valueOf(1));
    }

    public static void suspendSync(Context context, String str, long j) {
        PrefUtils.putLong(context, getResumeSyncTimeKey(str), Long.valueOf(System.currentTimeMillis() + j));
    }
}
