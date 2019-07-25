package com.xiaomi.channel.commonutils.logger;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class MyLog {
    private static int LOG_LEVEL = 2;
    private static final Integer NEGATIVE_CODE = Integer.valueOf(-1);
    private static LoggerInterface logger = new DefaultAndroidLogger();
    private static final HashMap<Integer, String> mActionNames = new HashMap<>();
    private static AtomicInteger mCodeGenerator = new AtomicInteger(1);
    private static final HashMap<Integer, Long> mStartTimes = new HashMap<>();

    public static void e(String str) {
        log(4, str);
    }

    public static void e(String str, Throwable th) {
        log(4, str, th);
    }

    public static void e(Throwable th) {
        log(4, th);
    }

    public static int getLogLevel() {
        return LOG_LEVEL;
    }

    public static void i(String str) {
        log(0, str);
    }

    public static void log(int i, String str) {
        if (i >= LOG_LEVEL) {
            logger.log(str);
        }
    }

    public static void log(int i, String str, Throwable th) {
        if (i >= LOG_LEVEL) {
            logger.log(str, th);
        }
    }

    public static void log(int i, Throwable th) {
        if (i >= LOG_LEVEL) {
            logger.log("", th);
        }
    }

    public static void pe(Integer num) {
        if (LOG_LEVEL <= 1 && mStartTimes.containsKey(num)) {
            long longValue = ((Long) mStartTimes.remove(num)).longValue();
            String str = (String) mActionNames.remove(num);
            long currentTimeMillis = System.currentTimeMillis() - longValue;
            LoggerInterface loggerInterface = logger;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" ends in ");
            sb.append(currentTimeMillis);
            sb.append(" ms");
            loggerInterface.log(sb.toString());
        }
    }

    public static Integer ps(String str) {
        if (LOG_LEVEL > 1) {
            return NEGATIVE_CODE;
        }
        Integer valueOf = Integer.valueOf(mCodeGenerator.incrementAndGet());
        mStartTimes.put(valueOf, Long.valueOf(System.currentTimeMillis()));
        mActionNames.put(valueOf, str);
        LoggerInterface loggerInterface = logger;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" starts");
        loggerInterface.log(sb.toString());
        return valueOf;
    }

    public static void setLogLevel(int i) {
        if (i < 0 || i > 5) {
            StringBuilder sb = new StringBuilder();
            sb.append("set log level as ");
            sb.append(i);
            log(2, sb.toString());
        }
        LOG_LEVEL = i;
    }

    public static void setLogger(LoggerInterface loggerInterface) {
        logger = loggerInterface;
    }

    public static void v(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("[Thread:");
        sb.append(Thread.currentThread().getId());
        sb.append("] ");
        sb.append(str);
        log(1, sb.toString());
    }

    public static void w(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("[Thread:");
        sb.append(Thread.currentThread().getId());
        sb.append("] ");
        sb.append(str);
        log(2, sb.toString());
    }
}
