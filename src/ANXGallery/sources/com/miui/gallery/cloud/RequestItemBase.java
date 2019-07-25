package com.miui.gallery.cloud;

import android.os.SystemClock;
import com.google.common.collect.Maps;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.Utils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class RequestItemBase {
    public static final long DELAY_UPLOAD_TIME = SyncConditionManager.sGetSyncConfig().getDelayUploadTime();
    public static final Map<Integer, Boolean> PRI_THREAD;
    public static boolean isUpload;
    public int commitRetryTimes;
    public int createRetryTimes;
    public final long delayInMillis;
    public int kssRetryTimes;
    public long mDownloadedSize;
    public long mTotalSize;
    public boolean needReRequest;
    public int otherRetryTimes;
    public final int priority;
    public String requestId;
    public String requestIds;
    public GallerySyncCode result;
    public long retryAfter;
    public final long startInMillis;
    private AtomicInteger status;

    static {
        HashMap newHashMap = Maps.newHashMap();
        newHashMap.put(Integer.valueOf(0), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(1), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(2), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(3), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(4), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(5), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(6), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(7), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(8), Boolean.valueOf(true));
        newHashMap.put(Integer.valueOf(9), Boolean.valueOf(false));
        newHashMap.put(Integer.valueOf(10), Boolean.valueOf(false));
        newHashMap.put(Integer.valueOf(11), Boolean.valueOf(false));
        newHashMap.put(Integer.valueOf(12), Boolean.valueOf(false));
        newHashMap.put(Integer.valueOf(13), Boolean.valueOf(false));
        PRI_THREAD = Collections.unmodifiableMap(newHashMap);
    }

    public RequestItemBase(int i) {
        this(i, 0);
    }

    public RequestItemBase(int i, long j) {
        this.needReRequest = false;
        this.status = new AtomicInteger(0);
        this.priority = i;
        this.startInMillis = SystemClock.uptimeMillis();
        this.delayInMillis = j;
        init();
    }

    protected static long getDelay(DBImage dBImage) {
        if (dBImage.getLocalFlag() != 7 || isUpload) {
            return 0;
        }
        return Utils.clamp(DELAY_UPLOAD_TIME - (System.currentTimeMillis() - new File(dBImage.getLocalFile()).lastModified()), 0, DELAY_UPLOAD_TIME);
    }

    public static int getDownloadTypeByPriority(int i) {
        switch (i) {
            case 6:
            case 7:
            case 12:
                return 2;
            case 8:
            case 13:
                return 1;
            case 9:
                return 4;
            case 10:
            case 11:
                return 3;
            default:
                return 0;
        }
    }

    public static boolean isBackgroundPriority(int i) {
        return ((Boolean) PRI_THREAD.get(Integer.valueOf(i))).booleanValue();
    }

    public static boolean isCancellablePriority(int i) {
        return (i == 0 || i == 1) ? false : true;
    }

    public boolean compareAndSetStatus(int i, int i2) {
        return this.status.compareAndSet(i, i2);
    }

    public long getDelayToExecuteInMillis(long j) {
        return (this.startInMillis + this.delayInMillis) - j;
    }

    public int getDownloadType() {
        return getDownloadTypeByPriority(this.priority);
    }

    public abstract ArrayList<RequestItemBase> getItems();

    public abstract int getRequestLimitAGroup();

    public int getStatus() {
        return this.status.get();
    }

    /* access modifiers changed from: protected */
    public void init() {
        this.createRetryTimes = 0;
        this.commitRetryTimes = 0;
        this.kssRetryTimes = 0;
        this.otherRetryTimes = 0;
        this.retryAfter = 0;
        this.needReRequest = false;
        this.requestId = null;
        this.requestIds = null;
        this.mDownloadedSize = 0;
        this.mTotalSize = 0;
        this.result = null;
    }

    public abstract boolean isInSameAlbum(RequestItemBase requestItemBase);

    public void setStatus(int i) {
        this.status.set(i);
    }

    public abstract boolean supportMultiRequest();
}
