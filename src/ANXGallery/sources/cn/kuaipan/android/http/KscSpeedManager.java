package cn.kuaipan.android.http;

import android.os.SystemClock;
import android.util.SparseArray;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map.Entry;

public class KscSpeedManager {
    private long mLatestEraseTime = 0;
    private final int mRecodeDuration;
    private final HashMap<String, SparseArray<Float>> mRecordMap = new HashMap<>();

    KscSpeedManager(int i) {
        if (i < 0) {
            i = 600;
        }
        this.mRecodeDuration = Math.min(3600, Math.max(300, i));
    }

    private void appendRecoder(String str, int i, float f) {
        SparseArray sparseArray = (SparseArray) this.mRecordMap.get(str);
        if (sparseArray == null) {
            sparseArray = new SparseArray();
            this.mRecordMap.put(str, sparseArray);
        }
        sparseArray.put(i, Float.valueOf(((Float) sparseArray.get(i, Float.valueOf(0.0f))).floatValue() + f));
        if (str != null) {
            appendRecoder(null, i, f);
        }
    }

    private void appendRecoders(String str, int i, int i2, float f) {
        if (i2 >= i) {
            while (i <= i2) {
                appendRecoder(str, i, f);
                i++;
            }
            return;
        }
        while (i < 3600000) {
            appendRecoder(str, i, f);
            i++;
        }
        for (int i3 = 0; i3 <= i2; i3++) {
            appendRecoder(str, i3, f);
        }
    }

    private static int computeKey(long j) {
        return (int) ((j / 1000) % 3600000);
    }

    public static long current() {
        return SystemClock.elapsedRealtime();
    }

    private void eraseExpired() {
        long current = current();
        if (current - this.mLatestEraseTime > 300000) {
            int computeKey = computeKey(current);
            int i = computeKey - this.mRecodeDuration;
            boolean z = computeKey < i;
            LinkedList linkedList = new LinkedList();
            for (Entry entry : this.mRecordMap.entrySet()) {
                String str = (String) entry.getKey();
                SparseArray sparseArray = (SparseArray) entry.getValue();
                if (z) {
                    int i2 = 0;
                    while (i2 < sparseArray.size()) {
                        int keyAt = sparseArray.keyAt(i2);
                        if (keyAt > computeKey && keyAt < i) {
                            sparseArray.delete(keyAt);
                        } else if (keyAt >= i) {
                            break;
                        } else {
                            i2++;
                        }
                    }
                } else {
                    int i3 = 0;
                    while (i3 < sparseArray.size()) {
                        int keyAt2 = sparseArray.keyAt(i3);
                        if (keyAt2 > computeKey || keyAt2 < i) {
                            sparseArray.delete(keyAt2);
                        } else {
                            i3++;
                        }
                    }
                }
                if (sparseArray.size() <= 0) {
                    linkedList.add(str);
                }
            }
            Iterator it = linkedList.iterator();
            while (it.hasNext()) {
                this.mRecordMap.remove((String) it.next());
            }
            this.mLatestEraseTime = current;
        }
    }

    public KscSpeedMonitor getMoniter(String str) {
        return new KscSpeedMonitor(this, str);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0084, code lost:
        return;
     */
    public synchronized void recoder(String str, long j, long j2, float f) {
        String str2 = str;
        float f2 = f;
        synchronized (this) {
            if (j2 >= j && f2 >= 0.0f) {
                long j3 = j / 1000;
                long j4 = j2 / 1000;
                if (j4 == j3) {
                    appendRecoder(str2, computeKey(j), f2);
                } else {
                    long j5 = j4 - j3;
                    if (j5 <= 1) {
                        float f3 = (float) (j2 - j);
                        float f4 = (((float) (1000 - (j % 1000))) * f2) / f3;
                        float f5 = (f2 * ((float) (j2 % 1000))) / f3;
                        int computeKey = computeKey(j);
                        int computeKey2 = computeKey(j2);
                        appendRecoder(str2, computeKey, f4);
                        appendRecoder(str2, computeKey2, f5);
                    } else {
                        float f6 = (float) (j2 - j);
                        float f7 = (((float) (1000 - (j % 1000))) * f2) / f6;
                        float f8 = (((float) (j2 % 1000)) * f2) / f6;
                        float f9 = ((f2 - f7) - f8) / ((float) (j5 - 1));
                        int computeKey3 = computeKey(j);
                        int computeKey4 = computeKey(j2);
                        appendRecoder(str2, computeKey3, f7);
                        appendRecoder(str2, computeKey4, f8);
                        appendRecoders(str2, computeKey3 + 1, computeKey4 - 1, f9);
                    }
                }
                eraseExpired();
            }
        }
    }
}
