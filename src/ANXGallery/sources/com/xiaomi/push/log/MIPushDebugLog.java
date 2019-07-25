package com.xiaomi.push.log;

import com.xiaomi.channel.commonutils.logger.LoggerInterface;

public class MIPushDebugLog implements LoggerInterface {
    private LoggerInterface sPushLogFileInterface = null;
    private LoggerInterface sUserLogInterface = null;

    public MIPushDebugLog(LoggerInterface loggerInterface, LoggerInterface loggerInterface2) {
        this.sUserLogInterface = loggerInterface;
        this.sPushLogFileInterface = loggerInterface2;
    }

    public void log(String str) {
        if (this.sUserLogInterface != null) {
            this.sUserLogInterface.log(str);
        }
        if (this.sPushLogFileInterface != null) {
            this.sPushLogFileInterface.log(str);
        }
    }

    public void log(String str, Throwable th) {
        if (this.sUserLogInterface != null) {
            this.sUserLogInterface.log(str, th);
        }
        if (this.sPushLogFileInterface != null) {
            this.sPushLogFileInterface.log(str, th);
        }
    }
}
