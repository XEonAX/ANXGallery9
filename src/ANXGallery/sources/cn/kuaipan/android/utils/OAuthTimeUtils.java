package cn.kuaipan.android.utils;

import android.os.SystemClock;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class OAuthTimeUtils {
    private static final SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final StringBuffer sFormatBuffer = new StringBuffer();
    private static final FieldPosition sFormatFieldPos = new FieldPosition(0);
    private static final ParsePosition sFormatPosition = new ParsePosition(0);
    private static long sTimeDiff;

    static {
        sFormat.setTimeZone(TimeZone.getTimeZone("GMT+0800"));
    }

    public static long currentTime() {
        return sTimeDiff == 0 ? System.currentTimeMillis() : SystemClock.elapsedRealtime() + sTimeDiff;
    }
}
