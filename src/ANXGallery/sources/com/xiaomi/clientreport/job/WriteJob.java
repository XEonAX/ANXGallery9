package com.xiaomi.clientreport.job;

import android.content.Context;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.clientreport.processor.IWrite;

public class WriteJob implements Runnable {
    private Context mContext;
    private IWrite mWriter;

    public WriteJob(Context context, IWrite iWrite) {
        this.mContext = context;
        this.mWriter = iWrite;
    }

    public void run() {
        try {
            if (this.mWriter != null) {
                this.mWriter.process();
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }
}
