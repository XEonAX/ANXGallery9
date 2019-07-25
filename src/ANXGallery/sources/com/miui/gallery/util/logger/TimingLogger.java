package com.miui.gallery.util.logger;

import android.os.SystemClock;
import android.util.Printer;
import com.miui.gallery.util.Log;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

public class TimingLogger {
    private String mLabel;
    ArrayList<String> mSplitLabels;
    ArrayList<Long> mSplits;
    private String mTag;

    public TimingLogger(String str, String str2) {
        reset(str, str2);
    }

    private long cost() {
        return ((Long) this.mSplits.get(this.mSplits.size() - 1)).longValue() - ((Long) this.mSplits.get(0)).longValue();
    }

    private String dump() {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        printWriter.println(" ");
        StringBuilder sb = new StringBuilder();
        sb.append(this.mLabel);
        sb.append(": begin");
        printWriter.println(sb.toString());
        long longValue = ((Long) this.mSplits.get(0)).longValue();
        long elapsedRealtime = this.mSplits.size() > 1 ? longValue : SystemClock.elapsedRealtime();
        for (int i = 1; i < this.mSplits.size(); i++) {
            elapsedRealtime = ((Long) this.mSplits.get(i)).longValue();
            String str = (String) this.mSplitLabels.get(i);
            long longValue2 = ((Long) this.mSplits.get(i - 1)).longValue();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.mLabel);
            sb2.append(":      ");
            sb2.append(elapsedRealtime - longValue2);
            sb2.append(" ms, ");
            sb2.append(str);
            printWriter.println(sb2.toString());
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(this.mLabel);
        sb3.append(": end, ");
        sb3.append(elapsedRealtime - longValue);
        sb3.append(" ms");
        printWriter.println(sb3.toString());
        printWriter.flush();
        return stringWriter.toString();
    }

    public void addSplit(String str) {
        this.mSplits.add(Long.valueOf(SystemClock.elapsedRealtime()));
        this.mSplitLabels.add(str);
    }

    public long dump(Printer printer) {
        if (printer == null) {
            return dumpToLog();
        }
        printer.println(dump());
        return cost();
    }

    public long dumpToLog() {
        Log.d(this.mTag, dump());
        return cost();
    }

    public void reset() {
        if (this.mSplits == null) {
            this.mSplits = new ArrayList<>();
            this.mSplitLabels = new ArrayList<>();
        } else {
            this.mSplits.clear();
            this.mSplitLabels.clear();
        }
        addSplit(null);
    }

    public void reset(String str, String str2) {
        this.mTag = str;
        this.mLabel = str2;
        reset();
    }
}
