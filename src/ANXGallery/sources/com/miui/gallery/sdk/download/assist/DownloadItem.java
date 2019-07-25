package com.miui.gallery.sdk.download.assist;

import android.net.Uri;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.adapter.IUriAdapter;
import com.miui.gallery.sdk.download.downloader.IDownloader;
import com.miui.gallery.sdk.download.listener.DownloadListener;
import com.miui.gallery.sdk.download.listener.DownloadProgressListener;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;

public class DownloadItem {
    private final DownloadListener mDownloadListener;
    private final IDownloader mDownloader;
    private final boolean mManual;
    private final DownloadProgressListener mProgressListener;
    private final boolean mRequireCharging;
    private final boolean mRequireDeviceStorage;
    private final boolean mRequirePower;
    private final boolean mRequireWLAN;
    private AtomicInteger mStatus;
    private final DownloadType mType;
    private final Uri mUri;
    private final IUriAdapter mUriAdapter;
    private final ReentrantLock mUriLock;

    public static class Builder {
        /* access modifiers changed from: private */
        public DownloadListener mDownloadListener;
        /* access modifiers changed from: private */
        public IDownloader mDownloader;
        /* access modifiers changed from: private */
        public boolean mManual;
        /* access modifiers changed from: private */
        public DownloadProgressListener mProgressListener;
        /* access modifiers changed from: private */
        public boolean mRequireCharging;
        /* access modifiers changed from: private */
        public boolean mRequireDeviceStorage;
        /* access modifiers changed from: private */
        public boolean mRequirePower;
        /* access modifiers changed from: private */
        public boolean mRequireWLAN;
        /* access modifiers changed from: private */
        public DownloadType mType;
        /* access modifiers changed from: private */
        public Uri mUri;
        /* access modifiers changed from: private */
        public IUriAdapter mUriAdapter;
        /* access modifiers changed from: private */
        public ReentrantLock mUriLock;

        public DownloadItem build() {
            return new DownloadItem(this);
        }

        public Builder cloneFrom(DownloadItem downloadItem) {
            this.mUri = downloadItem.getUri();
            this.mType = downloadItem.getType();
            this.mUriAdapter = downloadItem.getUriAdapter();
            this.mUriLock = downloadItem.getUriLock();
            this.mDownloadListener = downloadItem.getDownloadListener();
            this.mProgressListener = downloadItem.getProgressListener();
            this.mDownloader = downloadItem.getDownloader();
            this.mRequirePower = downloadItem.isRequirePower();
            this.mRequireCharging = downloadItem.isRequireCharging();
            this.mRequireWLAN = downloadItem.isRequireWLAN();
            this.mRequireDeviceStorage = downloadItem.isRequireDeviceStorage();
            this.mManual = downloadItem.isManual();
            return this;
        }

        public Builder setDownloadListener(DownloadListener downloadListener) {
            this.mDownloadListener = downloadListener;
            return this;
        }

        public Builder setDownloader(IDownloader iDownloader) {
            this.mDownloader = iDownloader;
            return this;
        }

        public Builder setManual(boolean z) {
            this.mManual = z;
            return this;
        }

        public Builder setProgressListener(DownloadProgressListener downloadProgressListener) {
            this.mProgressListener = downloadProgressListener;
            return this;
        }

        public Builder setRequireCharging(boolean z) {
            this.mRequireCharging = z;
            return this;
        }

        public Builder setRequireDeviceStorage(boolean z) {
            this.mRequireDeviceStorage = z;
            return this;
        }

        public Builder setRequirePower(boolean z) {
            this.mRequirePower = z;
            return this;
        }

        public Builder setRequireWLAN(boolean z) {
            this.mRequireWLAN = z;
            return this;
        }

        public Builder setType(DownloadType downloadType) {
            this.mType = downloadType;
            return this;
        }

        public Builder setUri(Uri uri) {
            this.mUri = uri;
            return this;
        }

        public Builder setUriAdapter(IUriAdapter iUriAdapter) {
            this.mUriAdapter = iUriAdapter;
            return this;
        }

        public Builder setUriLock(ReentrantLock reentrantLock) {
            this.mUriLock = reentrantLock;
            return this;
        }
    }

    private DownloadItem(Builder builder) {
        this.mStatus = new AtomicInteger(0);
        this.mUri = builder.mUri;
        this.mUriAdapter = builder.mUriAdapter;
        this.mUriLock = builder.mUriLock;
        this.mType = builder.mType;
        this.mDownloadListener = builder.mDownloadListener;
        this.mProgressListener = builder.mProgressListener;
        this.mDownloader = builder.mDownloader;
        this.mRequirePower = builder.mRequirePower;
        this.mRequireCharging = builder.mRequireCharging;
        this.mRequireWLAN = builder.mRequireWLAN;
        this.mRequireDeviceStorage = builder.mRequireDeviceStorage;
        this.mManual = builder.mManual;
    }

    public DownloadItem(DownloadItem downloadItem) {
        this(new Builder().cloneFrom(downloadItem));
    }

    public static void callbackCancel(DownloadItem downloadItem) {
        DownloadListener downloadListener = downloadItem.getDownloadListener();
        if (downloadListener != null) {
            downloadListener.onDownloadCancel(downloadItem.getUri(), downloadItem.getType());
        }
    }

    public static void callbackError(DownloadItem downloadItem, DownloadFailReason downloadFailReason) {
        DownloadListener downloadListener = downloadItem.getDownloadListener();
        if (downloadListener != null) {
            downloadListener.onDownloadFail(downloadItem.getUri(), downloadItem.getType(), downloadFailReason);
        }
    }

    public static void callbackProgress(DownloadItem downloadItem, long j, long j2) {
        DownloadProgressListener progressListener = downloadItem.getProgressListener();
        if (progressListener != null) {
            progressListener.onDownloadProgress(downloadItem.getUri(), downloadItem.getType(), j, j2);
        }
    }

    public static void callbackStarted(DownloadItem downloadItem) {
        DownloadListener downloadListener = downloadItem.getDownloadListener();
        if (downloadListener != null) {
            downloadListener.onDownloadStarted(downloadItem.getUri(), downloadItem.getType());
        }
    }

    public static void callbackSuccess(DownloadItem downloadItem, DownloadedItem downloadedItem) {
        DownloadListener downloadListener = downloadItem.getDownloadListener();
        if (downloadListener != null) {
            downloadListener.onDownloadSuccess(downloadItem.getUri(), downloadItem.getType(), downloadedItem);
        }
    }

    public boolean compareAnsSetStatus(int i, int i2) {
        return this.mStatus.compareAndSet(i, i2);
    }

    public DownloadListener getDownloadListener() {
        return this.mDownloadListener;
    }

    public IDownloader getDownloader() {
        return this.mDownloader;
    }

    public String getKey() {
        return DownloadUtil.generateKey(this.mUri, this.mType);
    }

    public int getPriority() {
        int i = !isManual() ? 999 : 1000;
        if (isRequireWLAN()) {
            i -= 3;
        }
        if (isRequirePower()) {
            i -= 5;
        }
        if (isRequireDeviceStorage()) {
            i -= 11;
        }
        return isRequireCharging() ? i - 21 : i;
    }

    public DownloadProgressListener getProgressListener() {
        return this.mProgressListener;
    }

    public int getStatus() {
        return this.mStatus.get();
    }

    public DownloadType getType() {
        return this.mType;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public IUriAdapter getUriAdapter() {
        return this.mUriAdapter;
    }

    public ReentrantLock getUriLock() {
        return this.mUriLock;
    }

    public boolean isCancelled() {
        return getStatus() == 1;
    }

    public boolean isManual() {
        return this.mManual;
    }

    public boolean isRequireCharging() {
        return this.mRequireCharging;
    }

    public boolean isRequireDeviceStorage() {
        return this.mRequireDeviceStorage;
    }

    public boolean isRequirePower() {
        return this.mRequirePower;
    }

    public boolean isRequireWLAN() {
        return this.mRequireWLAN;
    }

    public boolean isStatusOk() {
        return getStatus() == 0;
    }

    public String toString() {
        return String.format(Locale.US, "uri[%s], type[%s]", new Object[]{this.mUri, this.mType.name()});
    }
}
