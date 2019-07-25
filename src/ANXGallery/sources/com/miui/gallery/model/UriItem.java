package com.miui.gallery.model;

import android.app.Activity;
import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.SaveUriDialogFragment;
import com.miui.gallery.ui.SaveUriDialogFragment.OnCompleteListener;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.UriUtil;
import com.miui.gallery.util.gifdecoder.NSGifDecode;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class UriItem extends BaseDataItem {
    private File mCacheFile;
    private transient Uri mUri;

    public UriItem(Uri uri) {
        this.mUri = uri;
    }

    private boolean isCacheValidate() {
        return this.mCacheFile != null && this.mCacheFile.exists();
    }

    private ParcelFileDescriptor openOrDownloadInner() {
        String scheme = this.mUri.getScheme();
        if ("content".equals(scheme) || "android.resource".equals(scheme) || "file".equals(scheme)) {
            try {
                return GalleryApp.sGetAndroidContext().getContentResolver().openFileDescriptor(this.mUri, "r");
            } catch (Exception e) {
                Log.w("UriItem", "fail to open %s %s", this.mUri, e);
            }
        }
        return null;
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        this.mUri = Uri.parse((String) objectInputStream.readObject());
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeObject(this.mUri.toString());
    }

    public boolean checkOriginalFileExist() {
        if (isCacheValidate()) {
            return true;
        }
        if (this.mUri != null) {
            ParcelFileDescriptor openOrDownloadInner = openOrDownloadInner();
            if (openOrDownloadInner != null) {
                try {
                    openOrDownloadInner.close();
                } catch (Exception unused) {
                    Log.e("UriItem", "File descriptor close failed");
                }
                return true;
            }
        }
        return false;
    }

    public NSGifDecode createNSGifDecoder(JobContext jobContext) {
        if (isCacheValidate()) {
            return NSGifDecode.create(this.mCacheFile.getAbsolutePath());
        }
        ParcelFileDescriptor openOrDownloadInner = openOrDownloadInner();
        if (openOrDownloadInner == null) {
            return null;
        }
        try {
            if (jobContext.isCancelled()) {
                return null;
            }
            NSGifDecode create = NSGifDecode.create(openOrDownloadInner.getFileDescriptor(), null);
            MiscUtil.closeSilently(openOrDownloadInner);
            return create;
        } finally {
            MiscUtil.closeSilently(openOrDownloadInner);
        }
    }

    public PhotoDetailInfo getDetailInfo(Context context) {
        PhotoDetailInfo detailInfo = super.getDetailInfo(context);
        InputStream inputStream = null;
        CharSequence charSequence = "file".equals(this.mUri.getScheme()) ? this.mUri.getPath() : isCacheValidate() ? this.mCacheFile.getAbsolutePath() : null;
        if (!TextUtils.isEmpty(charSequence)) {
            if (isVideo()) {
                PhotoDetailInfo.extractVideoAttr(detailInfo, getOriginalPath());
            } else {
                PhotoDetailInfo.extractExifInfo(detailInfo, getOriginalPath(), true);
            }
        } else if (!isVideo()) {
            try {
                InputStream inputStream2 = context.getContentResolver().openInputStream(this.mUri);
                try {
                    long available = (long) inputStream2.available();
                    Options options = new Options();
                    options.inSampleSize = 1;
                    options.inJustDecodeBounds = true;
                    BitmapFactory.decodeStream(inputStream2, null, options);
                    detailInfo.addDetail(3, Long.valueOf(available));
                    detailInfo.addDetail(4, Integer.valueOf(options.outWidth));
                    detailInfo.addDetail(5, Integer.valueOf(options.outHeight));
                    MiscUtil.closeSilently(inputStream2);
                } catch (Exception e) {
                    e = e;
                    inputStream = inputStream2;
                    try {
                        Log.w("UriItem", (Throwable) e);
                        MiscUtil.closeSilently(inputStream);
                        return detailInfo;
                    } catch (Throwable th) {
                        th = th;
                        inputStream2 = inputStream;
                        MiscUtil.closeSilently(inputStream2);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    MiscUtil.closeSilently(inputStream2);
                    throw th;
                }
            } catch (Exception e2) {
                e = e2;
                Log.w("UriItem", (Throwable) e);
                MiscUtil.closeSilently(inputStream);
                return detailInfo;
            }
        }
        return detailInfo;
    }

    public String getOriginalPath() {
        return isCacheValidate() ? this.mCacheFile.getAbsolutePath() : this.mUri.toString();
    }

    public String getViewSubTitle(Context context) {
        return UriUtil.isNetUri(this.mUri) ? context.getString(R.string.view_by_gallery_tip) : super.getViewSubTitle(context);
    }

    public String getViewTitle(Context context) {
        return UriUtil.isNetUri(this.mUri) ? context.getString(R.string.photo) : super.getViewTitle(context);
    }

    public int initSupportOperations() {
        if (BitmapUtils.isSupportedByRegionDecoder(getMimeType())) {
            return 524352;
        }
        return nexEngine.ExportHEVCHighTierLevel52;
    }

    public void save(Activity activity, OnCompleteListener onCompleteListener) {
        SaveUriDialogFragment.show(activity, this.mUri, onCompleteListener);
    }
}
