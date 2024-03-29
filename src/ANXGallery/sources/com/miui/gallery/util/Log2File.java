package com.miui.gallery.util;

import android.os.Process;
import android.util.Log;
import com.miui.os.Rom;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import miui.util.SoftReferenceSingleton;

public class Log2File {
    private static final SoftReferenceSingleton<SimpleDateFormat> DATE_FORMAT = new SoftReferenceSingleton<SimpleDateFormat>() {
        /* access modifiers changed from: protected */
        public SimpleDateFormat createInstance() {
            return new SimpleDateFormat("MM-dd");
        }
    };
    private static final String LOG_FEATURE_OPEN_PATH = StorageUtils.getPathInPrimaryStorage("MIUI/Gallery/cloud/openlog");
    private static final SoftReferenceSingleton<SimpleDateFormat> TIME_FORMAT = new SoftReferenceSingleton<SimpleDateFormat>() {
        /* access modifiers changed from: protected */
        public SimpleDateFormat createInstance() {
            return new SimpleDateFormat("MM-dd HH:mm:ss.SSS");
        }
    };
    private boolean mCanLog;
    private BufferedWriter mOut;
    private StringBuilder mStringBuilder;

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static Log2File instance = new Log2File();
    }

    private Log2File() {
        this.mStringBuilder = new StringBuilder();
        this.mCanLog = false;
        if (Rom.IS_ALPHA || new File(LOG_FEATURE_OPEN_PATH).exists()) {
            this.mCanLog = true;
            initialWriter();
        }
    }

    public static Log2File getInstance() {
        return SingletonHolder.instance;
    }

    private void initialWriter() {
        if (this.mCanLog) {
            String format = ((SimpleDateFormat) DATE_FORMAT.get()).format(new Date());
            StringBuilder sb = new StringBuilder();
            sb.append(format);
            sb.append("_gallery_log");
            try {
                this.mOut = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(StorageUtils.getPathInPrimaryStorage(FileUtils.concat("MIUI/Gallery/cloud", sb.toString())), true)));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean canLog() {
        return this.mCanLog;
    }

    public synchronized void flushLog(String str, String str2, Throwable th) {
        if (this.mCanLog) {
            if (this.mOut == null) {
                initialWriter();
            }
            if (this.mOut != null) {
                this.mStringBuilder.append(((SimpleDateFormat) TIME_FORMAT.get()).format(new Date()));
                this.mStringBuilder.append(' ');
                this.mStringBuilder.append('/');
                this.mStringBuilder.append(str);
                this.mStringBuilder.append('(');
                this.mStringBuilder.append(Process.myPid());
                this.mStringBuilder.append(')');
                this.mStringBuilder.append(':');
                this.mStringBuilder.append(str2);
                if (th != null) {
                    this.mStringBuilder.append(':');
                    this.mStringBuilder.append(Log.getStackTraceString(th));
                }
                this.mStringBuilder.append(10);
                try {
                    if (this.mOut != null) {
                        this.mOut.write(this.mStringBuilder.toString());
                        this.mOut.flush();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                this.mStringBuilder.setLength(0);
            }
        }
    }
}
