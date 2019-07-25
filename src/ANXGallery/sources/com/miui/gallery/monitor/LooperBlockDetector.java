package com.miui.gallery.monitor;

import android.os.Looper;
import android.util.Printer;

public class LooperBlockDetector {

    private static class MessageLoggingPrinter implements Printer {
        private LogMonitor mMonitor;

        public MessageLoggingPrinter(LogMonitor logMonitor) {
            this.mMonitor = logMonitor;
        }

        public void println(String str) {
            if (str.startsWith(">>>>> Dispatching to")) {
                this.mMonitor.startMonitor(str);
            } else if (str.startsWith("<<<<< Finished to")) {
                this.mMonitor.stopMonitor(str);
            }
        }
    }

    public static void start(Looper looper, long j) {
        looper.setMessageLogging(new MessageLoggingPrinter(new LogMonitor(looper, j)));
    }
}
