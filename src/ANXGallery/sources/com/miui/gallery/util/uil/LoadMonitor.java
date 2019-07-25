package com.miui.gallery.util.uil;

import com.miui.gallery.util.Log;
import java.text.DecimalFormat;

public class LoadMonitor {
    private static final Recorder[] RECORDERS = new Recorder[2];

    private static class Recorder {
        private static final DecimalFormat TIME_FORMAT = new DecimalFormat("#.00");
        private final int mAssertLine = (this.mBadLine * 5);
        private final int mBadLine;
        private int mCount;
        private final int mFrequency;
        private final int mGoodLine;
        private volatile boolean mIsSync;
        private long mSum;
        private final int mType;
        private int mWarnCount;
        private final int mWarnLine = (this.mBadLine * 2);

        public Recorder(int i, boolean z, int i2, int i3, int i4) {
            this.mType = i;
            this.mIsSync = z;
            this.mFrequency = i2;
            this.mGoodLine = i3;
            this.mBadLine = i4;
        }

        private void resetValues() {
            this.mCount = 0;
            this.mSum = 0;
        }

        private void setAsync(String str) {
            this.mIsSync = false;
            this.mWarnCount = 0;
            Log.w("LoadMonitor", "%s sync->async | %s", Integer.valueOf(this.mType), str);
        }

        private void setSync() {
            this.mIsSync = true;
            Log.w("LoadMonitor", "%s async->sync", Integer.valueOf(this.mType));
        }

        public boolean isSync() {
            return this.mIsSync;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:35:0x007f, code lost:
            return;
         */
        public synchronized void record(long j) {
            boolean z = this.mIsSync;
            if (z) {
                if (j > ((long) this.mAssertLine)) {
                    setAsync("assert");
                    resetValues();
                    return;
                } else if (j > ((long) this.mWarnLine)) {
                    int i = this.mWarnCount + 1;
                    this.mWarnCount = i;
                    if (i == 3) {
                        setAsync("warnings");
                        resetValues();
                        return;
                    }
                } else {
                    this.mWarnCount = 0;
                }
            }
            int i2 = z ? this.mBadLine : this.mGoodLine;
            this.mSum += j - ((long) i2);
            int i3 = this.mCount + 1;
            this.mCount = i3;
            if (i3 == this.mFrequency) {
                long j2 = this.mSum / ((long) this.mFrequency);
                Log.d("LoadMonitor", "%s average: %s+ %s nanos", Integer.valueOf(this.mType), Integer.valueOf(i2), Long.valueOf(j2));
                if (z) {
                    if (j2 > 0) {
                        setAsync("avg");
                    }
                } else if (j2 < 0) {
                    setSync();
                }
                resetValues();
            }
        }
    }

    static {
        Recorder[] recorderArr = RECORDERS;
        Recorder recorder = new Recorder(0, false, 4, 800000, 1500000);
        recorderArr[0] = recorder;
        Recorder[] recorderArr2 = RECORDERS;
        Recorder recorder2 = new Recorder(1, false, 1, 8000000, 16000000);
        recorderArr2[1] = recorder2;
    }

    public static boolean isSyncLoadMicro() {
        return RECORDERS[0].isSync();
    }

    public static boolean isSyncLoadThumb() {
        return RECORDERS[1].isSync();
    }

    public static void record(int i, long j) {
        RECORDERS[i].record(j);
    }
}
