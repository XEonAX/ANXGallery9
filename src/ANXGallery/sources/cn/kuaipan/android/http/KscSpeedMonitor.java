package cn.kuaipan.android.http;

public class KscSpeedMonitor {
    private final String mHost;
    private long mLatestUpdate = KscSpeedManager.current();
    private final KscSpeedManager mManager;

    public KscSpeedMonitor(KscSpeedManager kscSpeedManager, String str) {
        this.mManager = kscSpeedManager;
        this.mHost = str;
    }

    public void recode(long j) {
        if (this.mManager != null) {
            long current = KscSpeedManager.current();
            this.mManager.recoder(this.mHost, this.mLatestUpdate, current, (float) j);
            this.mLatestUpdate = current;
        }
    }

    public void recode(long j, long j2, long j3) {
        if (this.mManager != null) {
            this.mManager.recoder(this.mHost, j, j2, (float) j3);
            if (j2 > this.mLatestUpdate) {
                this.mLatestUpdate = j2;
            }
        }
    }
}
