package com.miui.gallery.util;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.View;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.miui.gallery.util.uil.CloudImageLoadingListenerAdapter;
import com.miui.gallery.util.uil.CloudImageLoadingProgressListener;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class BulkDownloadHelper {
    /* access modifiers changed from: private */
    public long mCurSize;
    /* access modifiers changed from: private */
    public BulkDownloadListener mDownloadListener;
    private List<BulkDownloadItem> mExcutingList = new LinkedList();
    private List<BulkDownloadItem> mFailList = new LinkedList();
    /* access modifiers changed from: private */
    public List<BulkDownloadItem> mSuccessList = new LinkedList();
    /* access modifiers changed from: private */
    public long mTotalSize;

    public static class BulkDownloadItem implements Parcelable {
        public static final Creator<BulkDownloadItem> CREATOR = new Creator<BulkDownloadItem>() {
            public BulkDownloadItem createFromParcel(Parcel parcel) {
                return new BulkDownloadItem(parcel);
            }

            public BulkDownloadItem[] newArray(int i) {
                return new BulkDownloadItem[i];
            }
        };
        private String mDownloadPath;
        private Uri mDownloadUri;
        private ErrorCode mErrorCode;
        private long mSize;
        private DownloadType mType;

        public BulkDownloadItem(Uri uri, DownloadType downloadType, long j) {
            this.mDownloadUri = uri;
            this.mType = downloadType;
            this.mSize = j;
        }

        protected BulkDownloadItem(Parcel parcel) {
            this.mDownloadUri = (Uri) parcel.readParcelable(Uri.class.getClassLoader());
            this.mType = (DownloadType) parcel.readParcelable(DownloadType.class.getClassLoader());
            this.mSize = parcel.readLong();
        }

        public int describeContents() {
            return 0;
        }

        public String getDownloadPath() {
            return this.mDownloadPath;
        }

        public Uri getDownloadUri() {
            return this.mDownloadUri;
        }

        public ErrorCode getErrorCode() {
            return this.mErrorCode;
        }

        public long getSize() {
            return this.mSize;
        }

        public DownloadType getType() {
            return this.mType;
        }

        /* access modifiers changed from: 0000 */
        public void setDownloadPath(String str) {
            this.mDownloadPath = str;
        }

        /* access modifiers changed from: 0000 */
        public void setErrorCode(ErrorCode errorCode) {
            this.mErrorCode = errorCode;
        }

        public String toString() {
            return String.format(Locale.US, "Uri[%s], ImageType[%s]", new Object[]{this.mDownloadUri, this.mType.name()});
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mDownloadUri, i);
            parcel.writeParcelable(this.mType, i);
            parcel.writeLong(this.mSize);
        }
    }

    public interface BulkDownloadListener {
        void onDownloadEnd(List<BulkDownloadItem> list, List<BulkDownloadItem> list2);

        void onDownloadProgress(float f);
    }

    private static abstract class BulkItemLoadingListener extends CloudImageLoadingListenerAdapter implements CloudImageLoadingProgressListener {
        private WeakReference<BulkDownloadItem> mDownloadItemRef;

        BulkItemLoadingListener(BulkDownloadItem bulkDownloadItem) {
            this.mDownloadItemRef = new WeakReference<>(bulkDownloadItem);
        }

        private boolean isValidate() {
            return (this.mDownloadItemRef == null || this.mDownloadItemRef.get() == null) ? false : true;
        }

        public void onDownloadComplete(Uri uri, DownloadType downloadType, View view, String str) {
            if (isValidate()) {
                ((BulkDownloadItem) this.mDownloadItemRef.get()).setDownloadPath(str);
            }
        }

        public void onLoadingComplete(Uri uri, DownloadType downloadType, View view, Bitmap bitmap) {
            if (isValidate()) {
                onLoadingSuccess((BulkDownloadItem) this.mDownloadItemRef.get());
            } else {
                Log.i("BulkDownloadHelper", "onLoadingComplete not validate");
            }
        }

        public void onLoadingFailed(Uri uri, DownloadType downloadType, View view, ErrorCode errorCode) {
            if (isValidate()) {
                ((BulkDownloadItem) this.mDownloadItemRef.get()).setErrorCode(errorCode);
                onLoadingFailed((BulkDownloadItem) this.mDownloadItemRef.get(), errorCode);
                return;
            }
            Log.i("BulkDownloadHelper", "onLoadingFailed not validate");
        }

        public abstract void onLoadingFailed(BulkDownloadItem bulkDownloadItem, ErrorCode errorCode);

        public abstract void onLoadingProgress(BulkDownloadItem bulkDownloadItem, long j, long j2);

        public abstract void onLoadingSuccess(BulkDownloadItem bulkDownloadItem);

        public void onProgressUpdate(Uri uri, DownloadType downloadType, View view, int i, int i2) {
            if (!isValidate()) {
                Log.i("BulkDownloadHelper", "onProgressUpdate not validate");
            } else if (i <= i2) {
                float f = (((float) i) * 1.0f) / ((float) i2);
                long size = ((BulkDownloadItem) this.mDownloadItemRef.get()).getSize();
                onLoadingProgress((BulkDownloadItem) this.mDownloadItemRef.get(), (long) (((float) size) * f), size);
            }
        }
    }

    public BulkDownloadHelper() {
        reset();
    }

    /* access modifiers changed from: private */
    public boolean contains(BulkDownloadItem bulkDownloadItem) {
        return this.mExcutingList.contains(bulkDownloadItem);
    }

    private BulkItemLoadingListener generatorItemListener(BulkDownloadItem bulkDownloadItem) {
        return new BulkItemLoadingListener(bulkDownloadItem) {
            public void onLoadingFailed(BulkDownloadItem bulkDownloadItem, ErrorCode errorCode) {
                Log.i("BulkDownloadHelper", "onLoadingFailed %s", (Object) bulkDownloadItem);
                if (BulkDownloadHelper.this.contains(bulkDownloadItem)) {
                    BulkDownloadHelper.this.onItemLoadingFail(bulkDownloadItem);
                }
            }

            public void onLoadingProgress(BulkDownloadItem bulkDownloadItem, long j, long j2) {
                if (BulkDownloadHelper.this.contains(bulkDownloadItem) && BulkDownloadHelper.this.mDownloadListener != null) {
                    BulkDownloadHelper.this.mDownloadListener.onDownloadProgress((((float) (BulkDownloadHelper.this.mCurSize + j)) * 1.0f) / ((float) BulkDownloadHelper.this.mTotalSize));
                }
            }

            public void onLoadingSuccess(BulkDownloadItem bulkDownloadItem) {
                Log.i("BulkDownloadHelper", "onLoadingSuccess %s", (Object) bulkDownloadItem);
                if (BulkDownloadHelper.this.contains(bulkDownloadItem)) {
                    BulkDownloadHelper.this.mCurSize = BulkDownloadHelper.this.mCurSize + bulkDownloadItem.getSize();
                    BulkDownloadHelper.this.mSuccessList.add(bulkDownloadItem);
                    if (BulkDownloadHelper.this.isDownloadEnd()) {
                        BulkDownloadHelper.this.onDownloadEnd();
                    }
                }
            }
        };
    }

    /* access modifiers changed from: private */
    public boolean isDownloadEnd() {
        return this.mSuccessList.size() + this.mFailList.size() == this.mExcutingList.size();
    }

    /* access modifiers changed from: private */
    public void onDownloadEnd() {
        if (this.mDownloadListener != null) {
            this.mDownloadListener.onDownloadEnd(this.mSuccessList, this.mFailList);
        }
        reset();
    }

    /* access modifiers changed from: private */
    public void onItemLoadingFail(BulkDownloadItem bulkDownloadItem) {
        this.mTotalSize -= bulkDownloadItem.getSize();
        this.mFailList.add(bulkDownloadItem);
        if (isDownloadEnd()) {
            onDownloadEnd();
        }
    }

    private void reset() {
        this.mExcutingList.clear();
        this.mSuccessList.clear();
        this.mFailList.clear();
        this.mCurSize = 0;
        this.mTotalSize = 0;
        this.mDownloadListener = null;
    }

    public void cancel() {
        if (this.mExcutingList.size() > 0) {
            for (BulkDownloadItem bulkDownloadItem : this.mExcutingList) {
                CloudImageLoader.getInstance().cancel(bulkDownloadItem.getDownloadUri(), bulkDownloadItem.getType());
            }
        }
        reset();
    }

    public void download(List<BulkDownloadItem> list, boolean z, BulkDownloadListener bulkDownloadListener) {
        if (MiscUtil.isValid(list)) {
            if (z) {
                cancel();
            }
            reset();
            this.mExcutingList.addAll(list);
            for (BulkDownloadItem size : this.mExcutingList) {
                this.mTotalSize += size.getSize();
            }
            this.mDownloadListener = bulkDownloadListener;
            ArrayList arrayList = new ArrayList(list.size());
            ArrayList arrayList2 = new ArrayList(list.size());
            ArrayList arrayList3 = new ArrayList(list.size());
            ArrayList arrayList4 = new ArrayList(list.size());
            for (BulkDownloadItem bulkDownloadItem : list) {
                if (bulkDownloadItem.getDownloadUri() == null) {
                    Log.w("BulkDownloadHelper", "Null download uri for item %s", bulkDownloadItem);
                    onItemLoadingFail(bulkDownloadItem);
                } else {
                    arrayList.add(bulkDownloadItem.getDownloadUri());
                    arrayList2.add(bulkDownloadItem.getType());
                    BulkItemLoadingListener generatorItemListener = generatorItemListener(bulkDownloadItem);
                    arrayList3.add(generatorItemListener);
                    arrayList4.add(generatorItemListener);
                }
            }
            CloudImageLoader.getInstance().loadImages(arrayList, arrayList2, arrayList3, arrayList4);
        }
    }
}
