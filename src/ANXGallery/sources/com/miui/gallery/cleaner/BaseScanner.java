package com.miui.gallery.cleaner;

import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

public abstract class BaseScanner {
    CopyOnWriteArraySet<OnScanResultUpdateListener> mListeners = new CopyOnWriteArraySet<>();
    protected int mType;

    public interface OnScanResultUpdateListener {
        void onUpdate(int i, long j, ScanResult scanResult);
    }

    protected BaseScanner(int i) {
        this.mType = i;
    }

    public final void addListener(OnScanResultUpdateListener onScanResultUpdateListener) {
        if (onScanResultUpdateListener != null) {
            this.mListeners.add(onScanResultUpdateListener);
        }
    }

    public void onMediaItemDeleted(long j) {
    }

    /* access modifiers changed from: protected */
    public abstract void onReset();

    public final void removeListener(OnScanResultUpdateListener onScanResultUpdateListener) {
        if (onScanResultUpdateListener != null) {
            this.mListeners.remove(onScanResultUpdateListener);
        }
    }

    public final void reset() {
        this.mListeners.clear();
        onReset();
    }

    public abstract ScanResult scan();

    /* access modifiers changed from: protected */
    public final void updateScanResult(long j, ScanResult scanResult) {
        Iterator it = this.mListeners.iterator();
        while (it.hasNext()) {
            OnScanResultUpdateListener onScanResultUpdateListener = (OnScanResultUpdateListener) it.next();
            if (onScanResultUpdateListener != null) {
                onScanResultUpdateListener.onUpdate(this.mType, j, scanResult);
            }
        }
    }

    /* access modifiers changed from: protected */
    public final void updateScanResult(ScanResult scanResult) {
        updateScanResult(0, scanResult);
    }
}
