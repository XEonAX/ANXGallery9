package com.miui.gallery.util.logger;

import android.text.TextUtils;
import android.util.Printer;
import com.miui.gallery.util.Log;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class TimingTracing {
    private static boolean ENABLED;
    private static final Map<String, TimingLogger> mTracings = new ConcurrentHashMap();

    public static void addSplit(String str, String str2) {
        if (ENABLED) {
            if (TextUtils.isEmpty(str)) {
                Log.e("TimingTracing", "addSplit: the trace tag shouldn't be empty");
                return;
            }
            TimingLogger timingLogger = (TimingLogger) mTracings.get(str);
            if (timingLogger != null) {
                timingLogger.addSplit(str2);
            } else {
                Log.e("TimingTracing", "addSplit: Did you have called the beginTracing?");
            }
        }
    }

    public static void beginTracing(String str, String str2) {
        if (ENABLED) {
            if (TextUtils.isEmpty(str)) {
                Log.e("TimingTracing", "beginTracing: the trace tag shouldn't be empty");
                return;
            }
            mTracings.put(str, new TimingLogger(str, str2));
        }
    }

    public static void setEnabled(boolean z) {
        ENABLED = z;
    }

    public static long stopTracing(String str, Printer printer) {
        if (!ENABLED) {
            return -1;
        }
        if (TextUtils.isEmpty(str)) {
            Log.e("TimingTracing", "stopTracing: the trace tag shouldn't be empty");
            return -1;
        }
        TimingLogger timingLogger = (TimingLogger) mTracings.get(str);
        if (timingLogger != null) {
            mTracings.remove(str);
            return timingLogger.dump(printer);
        }
        Log.e("TimingTracing", "stopTracing: Did you have called the beginTracing?");
        return -1;
    }
}
