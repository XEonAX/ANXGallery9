package com.miui.gallery.search.core.display.icon;

import android.content.Context;
import android.database.Cursor;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import com.miui.gallery.search.SearchContract.Icon;
import com.miui.gallery.search.core.Consumer;
import com.miui.gallery.search.core.context.PriorityTaskExecutor.PriorityTask;
import com.miui.gallery.search.core.display.icon.IconLoaderTask.IconLoaderResult;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.face.FaceRegionRectF;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;

public class IconLoaderTask extends PriorityTask {
    /* access modifiers changed from: private */
    public static final RectF DEFAULT_RECT = new RectF(0.0f, 0.0f, 1.0f, 1.0f);
    private static final String[] PROJECTION = {"file_path", "download_uri", "decode_region_orientation", "decode_region_x", "decode_region_y", "decode_region_w", "decode_region_h"};
    private final boolean mCacheToDisk;
    private final Consumer<IconLoaderResult> mConsumer;
    private final Context mContext;
    private final Handler mHandler;
    private final boolean mHighAccuracy;
    private final Uri mIconUri;
    private final AtomicBoolean mIsCancelled;
    private final boolean mUseDiskCache;

    public static class IconLoaderResult {
        public Uri downloadUri;
        public RectF facePositionRect;
        public Uri iconUri;
        /* access modifiers changed from: private */
        public boolean isFromUnreliableCache;
        public String localFilePath;

        public IconLoaderResult(Uri uri, String str, Uri uri2) {
            this.facePositionRect = IconLoaderTask.DEFAULT_RECT;
            this.isFromUnreliableCache = false;
            this.iconUri = uri;
            this.localFilePath = str;
            this.downloadUri = uri2;
        }

        public IconLoaderResult(Uri uri, String str, Uri uri2, RectF rectF) {
            this(uri, str, uri2);
            if (rectF != null) {
                this.facePositionRect = rectF;
            }
        }

        public IconLoaderResult(Uri uri, String str, Uri uri2, RectF rectF, boolean z) {
            this(uri, str, uri2);
            if (rectF != null) {
                this.facePositionRect = rectF;
            }
            this.isFromUnreliableCache = z;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof IconLoaderResult)) {
                return false;
            }
            IconLoaderResult iconLoaderResult = (IconLoaderResult) obj;
            if (!Objects.equals(this.iconUri, iconLoaderResult.iconUri) || !Objects.equals(this.localFilePath, iconLoaderResult.localFilePath) || !Objects.equals(this.downloadUri, iconLoaderResult.downloadUri) || !Objects.equals(this.facePositionRect, iconLoaderResult.facePositionRect)) {
                z = false;
            }
            return z;
        }

        public int hashCode() {
            return Objects.hash(new Object[]{this.iconUri, this.localFilePath, this.downloadUri, this.facePositionRect});
        }

        public boolean isFromUnreliableCache() {
            return this.isFromUnreliableCache;
        }

        public boolean isValid() {
            return (this.localFilePath == null && this.downloadUri == null) ? false : true;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("IconLoaderResult{iconUri=");
            sb.append(this.iconUri);
            sb.append(", localFilePath='");
            sb.append(this.localFilePath);
            sb.append('\'');
            sb.append(", downloadUri=");
            sb.append(this.downloadUri);
            sb.append(", facePositionRect=");
            sb.append(this.facePositionRect);
            sb.append(", isFromUnreliableCache=");
            sb.append(this.isFromUnreliableCache);
            sb.append('}');
            return sb.toString();
        }
    }

    public IconLoaderTask(Context context, Uri uri, Consumer<IconLoaderResult> consumer, Handler handler, boolean z, boolean z2, boolean z3) {
        this.mContext = context;
        this.mIconUri = uri;
        this.mConsumer = consumer;
        this.mHandler = handler;
        this.mUseDiskCache = z;
        this.mCacheToDisk = z2;
        this.mHighAccuracy = z3;
        this.mPriority = z ? 1 : 2;
        this.mIsCancelled = new AtomicBoolean(false);
    }

    private void consumeResult(IconLoaderResult iconLoaderResult) {
        if (this.mHandler == null) {
            this.mConsumer.consume(iconLoaderResult);
        } else {
            this.mHandler.post(new Runnable(iconLoaderResult) {
                private final /* synthetic */ IconLoaderResult f$1;

                {
                    this.f$1 = r2;
                }

                public final void run() {
                    IconLoaderTask.this.mConsumer.consume(this.f$1);
                }
            });
        }
    }

    public boolean isCancelled() {
        return this.mIsCancelled.get();
    }

    public boolean isUseDiskCache() {
        return this.mUseDiskCache;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x00c6  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00f0  */
    public Void run(JobContext jobContext) {
        IconLoaderResult iconLoaderResult;
        FaceRegionRectF faceRegionRectF;
        Cursor cursor = null;
        if ((jobContext != null && jobContext.isCancelled()) || this.mIsCancelled.get()) {
            return null;
        }
        try {
            Cursor query = this.mContext.getContentResolver().query(Icon.URI.buildUpon().appendQueryParameter("icon_uri", this.mIconUri.toString()).appendQueryParameter("use_disk_cache", String.valueOf(this.mUseDiskCache)).appendQueryParameter("cache_to_disk", String.valueOf(this.mCacheToDisk)).appendQueryParameter("high_accuracy", String.valueOf(this.mHighAccuracy)).build(), PROJECTION, null, null, null);
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        String string = query.getString(0);
                        String string2 = query.getString(1);
                        if (!query.isNull(5)) {
                            faceRegionRectF = new FaceRegionRectF(query.getFloat(3), query.getFloat(4), query.getFloat(5) + query.getFloat(3), query.getFloat(4) + query.getFloat(6), query.getInt(2));
                        } else {
                            faceRegionRectF = null;
                        }
                        iconLoaderResult = new IconLoaderResult(this.mIconUri, string, string2 == null ? null : Uri.parse(string2), faceRegionRectF);
                        Bundle extras = query.getExtras();
                        if (extras != null) {
                            iconLoaderResult.isFromUnreliableCache = extras.getBoolean("from_unreliable_cache", false);
                        }
                        if (query != null) {
                            query.close();
                        }
                        if ((jobContext != null || !jobContext.isCancelled()) && !this.mIsCancelled.get()) {
                            consumeResult(iconLoaderResult);
                        } else {
                            SearchLog.d("IconLoaderTask", "task [%s] is cancelled during running", Integer.toHexString(hashCode()));
                        }
                        return null;
                    }
                } catch (Throwable th) {
                    th = th;
                    cursor = query;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            }
            iconLoaderResult = null;
            if (query != null) {
            }
            if (jobContext != null) {
            }
            consumeResult(iconLoaderResult);
            return null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor != null) {
            }
            throw th;
        }
    }

    public void setCancelled() {
        this.mIsCancelled.set(true);
    }
}
