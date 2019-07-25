package com.miui.gallery.editor.photo.app;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.DisplayMetrics;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.utils.BigBitmapLoadUtils;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.editor.photo.utils.Callback;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.model.SecretInfo;
import com.miui.gallery.provider.CloudUtils;
import com.miui.gallery.sdk.editor.Constants;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery3d.exif.ExifInterface;
import com.miui.gallery3d.exif.ExifTag;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class DraftManager {
    private AsyncTask<Void, Void, Bitmap> mBackgroundTask;
    private Bundle mBundle;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public RenderEngine[] mEngines;
    /* access modifiers changed from: private */
    public ExifInterface mExif;
    private int mExportedHeight;
    private int mExportedWidth;
    /* access modifiers changed from: private */
    public int mInSampleSize;
    private boolean mIsPreviewSameWithOrigin;
    private boolean mIsScreenshot;
    private String mMimeType;
    /* access modifiers changed from: private */
    public OnPreviewRefreshListener mOnPreviewRefreshListener;
    private int mOriginHeight;
    private int mOriginWidth;
    private int mPreferHeight;
    private int mPreferWidth;
    /* access modifiers changed from: private */
    public Bitmap mPreview;
    /* access modifiers changed from: private */
    public volatile boolean mPreviewEnable;
    /* access modifiers changed from: private */
    public Bitmap mPreviewOriginal;
    /* access modifiers changed from: private */
    public List<RenderData> mRenderDataList;
    private SecretInfo mSecretInfo;
    private Uri mSource;
    private volatile boolean mWithWatermark;
    /* access modifiers changed from: private */
    public XmpExtraManager mXmpExtraManager;

    public interface OnPreviewRefreshListener {
        void onRefresh(Bitmap bitmap);
    }

    private class PreviewRenderTask extends AsyncTask<RenderData, Void, Bitmap> {
        private Callback<Bitmap, Void> mCallback;
        private RenderData mRenderData;

        public PreviewRenderTask(Callback<Bitmap, Void> callback, RenderData renderData) {
            this.mCallback = callback;
            this.mRenderData = renderData;
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(RenderData... renderDataArr) {
            this.mCallback.onExecute(null);
            if (DraftManager.this.mPreviewOriginal == DraftManager.this.mPreview) {
                Log.d("DraftManager", "copy process preview start");
                DraftManager.this.mPreview = DraftManager.this.mPreview.copy(Config.ARGB_8888, true);
                Log.d("DraftManager", "copy process preview done");
            }
            return RenderEngine.findEngine(DraftManager.this.mContext, this.mRenderData, DraftManager.this.mEngines).render(DraftManager.this.mPreview, this.mRenderData);
        }

        /* access modifiers changed from: protected */
        public void onCancelled(Bitmap bitmap) {
            this.mCallback.onCancel();
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (bitmap != null) {
                DraftManager.this.mPreview = bitmap;
                DraftManager.this.mRenderDataList.add(this.mRenderData);
                this.mCallback.onDone(DraftManager.this.mPreview);
                return;
            }
            this.mCallback.onError(null);
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            this.mCallback.onPrepare();
        }
    }

    private class ReRenderTask extends AsyncTask<Boolean, Void, Bitmap> {
        private Callback<Bitmap, Void> mCallback;

        public ReRenderTask(Callback<Bitmap, Void> callback) {
            this.mCallback = callback;
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(Boolean... boolArr) {
            InputStream inputStream;
            FileNotFoundException e;
            boolean booleanValue = boolArr[0].booleanValue();
            this.mCallback.onExecute(null);
            Bitmap copy = DraftManager.this.mPreviewOriginal.copy(Config.ARGB_8888, true);
            if (!booleanValue) {
                try {
                    inputStream = DraftManager.this.getInputStream();
                    try {
                        DraftManager.this.mXmpExtraManager.sweepImage(copy, inputStream);
                    } catch (FileNotFoundException e2) {
                        e = e2;
                    }
                } catch (FileNotFoundException e3) {
                    e = e3;
                    inputStream = null;
                    try {
                        e.printStackTrace();
                        IoUtils.close("DraftManager", inputStream);
                        return RenderEngine.render(DraftManager.this.mContext, copy, DraftManager.this.mRenderDataList, DraftManager.this.mEngines);
                    } catch (Throwable th) {
                        th = th;
                        IoUtils.close("DraftManager", inputStream);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    inputStream = null;
                    IoUtils.close("DraftManager", inputStream);
                    throw th;
                }
                IoUtils.close("DraftManager", inputStream);
            }
            return RenderEngine.render(DraftManager.this.mContext, copy, DraftManager.this.mRenderDataList, DraftManager.this.mEngines);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (bitmap != null) {
                DraftManager.this.mPreview = bitmap;
                this.mCallback.onDone(DraftManager.this.mPreview);
                return;
            }
            this.mCallback.onError(null);
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            this.mCallback.onPrepare();
        }
    }

    public DraftManager(Context context, Uri uri, Bundle bundle) {
        this(context, uri, bundle, true);
    }

    public DraftManager(Context context, Uri uri, Bundle bundle, boolean z) {
        this.mEngines = new RenderEngine[Effect.values().length];
        this.mRenderDataList = new ArrayList();
        this.mXmpExtraManager = new XmpExtraManager();
        boolean z2 = true;
        this.mWithWatermark = true;
        this.mBackgroundTask = new AsyncTask<Void, Void, Bitmap>() {
            /* access modifiers changed from: protected */
            public Bitmap doInBackground(Void... voidArr) {
                Options options = new Options();
                options.inSampleSize = DraftManager.this.mInSampleSize;
                try {
                    return DraftManager.this.decodeBitmap(options, ExifUtil.getRotationDegrees(DraftManager.this.mExif));
                } catch (FileNotFoundException e) {
                    Log.w("DraftManager", (Throwable) e);
                    return null;
                } catch (SecurityException e2) {
                    Log.w("DraftManager", (Throwable) e2);
                    return null;
                }
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Bitmap bitmap) {
                super.onPostExecute(bitmap);
                if (bitmap != null) {
                    DraftManager.this.mPreview = bitmap;
                    if (DraftManager.this.mOnPreviewRefreshListener != null) {
                        DraftManager.this.mOnPreviewRefreshListener.onRefresh(DraftManager.this.mPreview);
                    }
                }
                DraftManager.this.mPreviewEnable = true;
            }
        };
        this.mContext = context;
        this.mSource = uri;
        this.mBundle = bundle;
        this.mWithWatermark = z;
        DisplayMetrics displayMetrics = this.mContext.getResources().getDisplayMetrics();
        this.mPreferWidth = displayMetrics.widthPixels;
        this.mPreferHeight = displayMetrics.heightPixels - this.mContext.getResources().getDimensionPixelSize(R.dimen.photo_editor_menu_panel_height);
        if (!FileUtils.isScreenShot(this.mSource) && (bundle == null || !bundle.getBoolean(Constants.EXTRA_IS_SCREENSHOT))) {
            z2 = false;
        }
        this.mIsScreenshot = z2;
        this.mSecretInfo = new SecretInfo();
        this.mSecretInfo.mSecretPath = this.mSource.getPath();
        if (bundle != null) {
            this.mSecretInfo.mIsSecret = bundle.getBoolean("extra_is_secret");
            this.mSecretInfo.mSecretKey = bundle.getByteArray("extra_secret_key");
            this.mSecretInfo.mSecretId = bundle.getLong("photo_secret_id");
        }
    }

    private void checkSecretInfo() {
        if (!FileUtils.isFileExist(this.mSecretInfo.mSecretPath)) {
            this.mSecretInfo = CloudUtils.getSecretInfo(this.mContext, this.mSecretInfo.mSecretId, this.mSecretInfo);
        }
    }

    /* access modifiers changed from: private */
    public Bitmap decodeBitmap(Options options, int i) throws FileNotFoundException {
        return Bitmaps.setConfig(Bitmaps.joinExif(Bitmaps.decodeStream(getInputStream(), options), i, options));
    }

    /* access modifiers changed from: private */
    public InputStream getInputStream() throws FileNotFoundException {
        if (!isSecret()) {
            return IoUtils.openInputStream(this.mContext, this.mSource);
        }
        checkSecretInfo();
        InputStream openInputStream = IoUtils.openInputStream(this.mContext, Uri.fromFile(new File(this.mSecretInfo.mSecretPath)));
        return this.mSecretInfo.mSecretKey != null ? CryptoUtil.getDecryptCipherInputStream(openInputStream, this.mSecretInfo.mSecretKey) : openInputStream;
    }

    private OutputStream getOutputStream(Uri uri) {
        try {
            return IoUtils.openOutputStream("DraftManager", this.mContext, uri);
        } catch (Exception e) {
            Log.w("DraftManager", (Throwable) e);
            IoUtils.close(null);
            return null;
        }
    }

    private void initForBitmapInfo() throws FileNotFoundException {
        InputStream inputStream;
        Log.d("DraftManager", "decoding bitmap size:%d*%d", Integer.valueOf(this.mOriginHeight), Integer.valueOf(this.mOriginWidth));
        if (isSecret()) {
            checkSecretInfo();
            this.mExif = (ExifInterface) ExifUtil.createExifInterface(this.mSource.getPath(), this.mSecretInfo.mSecretKey, ExifUtil.sGallery3DExifCreator);
        } else {
            this.mExif = (ExifInterface) ExifUtil.sGallery3DExifCreator.create(getInputStream());
        }
        Options options = new Options();
        options.inJustDecodeBounds = true;
        Bitmaps.decodeStream(getInputStream(), options);
        int i = options.outWidth;
        int i2 = options.outHeight;
        int rotationDegrees = ExifUtil.getRotationDegrees(this.mExif);
        Bitmaps.joinExif(null, rotationDegrees, options);
        this.mMimeType = options.outMimeType;
        this.mOriginWidth = options.outWidth;
        this.mOriginHeight = options.outHeight;
        Log.d("DraftManager", "decoding bitmap size:%d*%d", Integer.valueOf(this.mOriginHeight), Integer.valueOf(this.mOriginWidth));
        long currentTimeMillis = System.currentTimeMillis();
        try {
            inputStream = getInputStream();
            try {
                this.mXmpExtraManager.decodeXmpData(inputStream, i, i2, rotationDegrees);
                IoUtils.close("DraftManager", inputStream);
                Log.d("DraftManager", "decodeXmpData coast : %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            } catch (Throwable th) {
                th = th;
                IoUtils.close("DraftManager", inputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            IoUtils.close("DraftManager", inputStream);
            throw th;
        }
    }

    public Bitmap decodeOrigin() {
        try {
            Options options = new Options();
            options.inMutable = true;
            options.inSampleSize = BigBitmapLoadUtils.calculateInSampleSize(this.mContext, this.mOriginWidth, this.mOriginHeight);
            return decodeBitmap(options, ExifUtil.getRotationDegrees(this.mExif));
        } catch (FileNotFoundException e) {
            Log.w("DraftManager", (Throwable) e);
            return null;
        } catch (SecurityException e2) {
            Log.w("DraftManager", (Throwable) e2);
            return null;
        }
    }

    public void enqueue(RenderData renderData, Callback callback) {
        new PreviewRenderTask(callback, renderData).execute(new RenderData[0]);
    }

    public boolean export(Bitmap bitmap, Uri uri) {
        boolean z;
        CompressFormat compressFormat;
        if (bitmap == null || uri == null) {
            return false;
        }
        this.mExportedWidth = bitmap.getWidth();
        this.mExportedHeight = bitmap.getHeight();
        OutputStream outputStream = getOutputStream(uri);
        if (outputStream == null) {
            return false;
        }
        List<ExifTag> list = null;
        if (this.mExif != null) {
            list = this.mExif.getAllTags();
        }
        if (list == null || list.isEmpty()) {
            Log.i("DraftManager", "no exif found in source image");
        } else {
            Log.d("DraftManager", "filter exif");
            ExifInterface exifInterface = new ExifInterface();
            for (ExifTag exifTag : list) {
                short tagId = exifTag.getTagId();
                if (tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_ORIENTATION) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_IMAGE_WIDTH) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_IMAGE_LENGTH) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_XIAOMI_COMMENT) || tagId == ExifInterface.getTrueTagKey(ExifInterface.TAG_USER_COMMENT) || tagId == -30576 || tagId == -30568 || tagId == -30569 || tagId == -23293) {
                    Log.d("DraftManager", "skip user comment");
                } else {
                    exifInterface.setTag(exifTag);
                }
            }
            exifInterface.setTag(exifInterface.buildTag(ExifInterface.TAG_ORIENTATION, Short.valueOf(ExifInterface.getOrientationValueForRotation(0))));
            exifInterface.setTag(exifInterface.buildTag(ExifInterface.TAG_IMAGE_WIDTH, Integer.valueOf(bitmap.getWidth())));
            exifInterface.setTag(exifInterface.buildTag(ExifInterface.TAG_IMAGE_LENGTH, Integer.valueOf(bitmap.getHeight())));
            outputStream = exifInterface.getExifWriterStream(outputStream);
        }
        boolean isSavedAsPng = isSavedAsPng();
        long currentTimeMillis = System.currentTimeMillis();
        if (isSavedAsPng) {
            try {
                compressFormat = CompressFormat.PNG;
            } catch (IOException e) {
                Log.w("DraftManager", (Throwable) e);
                IoUtils.close("DraftManager", outputStream);
                z = false;
            } catch (Throwable th) {
                IoUtils.close("DraftManager", outputStream);
                throw th;
            }
        } else {
            compressFormat = CompressFormat.JPEG;
        }
        z = bitmap.compress(compressFormat, 100, outputStream);
        if (z) {
            outputStream.flush();
        }
        IoUtils.close("DraftManager", outputStream);
        Log.d("DraftManager", "saved as png %b, compress cost %d", Boolean.valueOf(isSavedAsPng), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:36:0x0062  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x006e A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x006f  */
    public boolean export(Uri uri) {
        Bitmap bitmap;
        InputStream inputStream;
        FileNotFoundException e;
        Log.d("DraftManager", "exporting");
        if (isEmpty()) {
            return false;
        }
        if (this.mOriginHeight == 0 || this.mOriginWidth == 0) {
            try {
                initForBitmapInfo();
            } catch (FileNotFoundException e2) {
                Log.w("DraftManager", (Throwable) e2);
                return false;
            } catch (SecurityException e3) {
                Log.w("DraftManager", (Throwable) e3);
                return false;
            }
        }
        if (this.mIsPreviewSameWithOrigin) {
            bitmap = this.mPreview;
            Log.d("DraftManager", "origin is preview,bmp is empty:%b", (Object) Boolean.valueOf(bitmap == null));
        } else {
            bitmap = decodeOrigin();
            if (!this.mWithWatermark) {
                try {
                    inputStream = getInputStream();
                    try {
                        this.mXmpExtraManager.sweepImage(bitmap, inputStream);
                    } catch (FileNotFoundException e4) {
                        e = e4;
                    }
                } catch (FileNotFoundException e5) {
                    FileNotFoundException fileNotFoundException = e5;
                    inputStream = null;
                    e = fileNotFoundException;
                    try {
                        e.printStackTrace();
                        IoUtils.close(inputStream);
                        if (!this.mRenderDataList.isEmpty()) {
                        }
                        if (bitmap != null) {
                        }
                    } catch (Throwable th) {
                        th = th;
                        IoUtils.close(inputStream);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    inputStream = null;
                    IoUtils.close(inputStream);
                    throw th;
                }
                IoUtils.close(inputStream);
            }
            if (!this.mRenderDataList.isEmpty()) {
                bitmap = RenderEngine.render(this.mContext, bitmap, this.mRenderDataList, this.mEngines);
            }
        }
        if (bitmap != null) {
            return false;
        }
        return export(bitmap, uri);
    }

    public Bundle getBundle() {
        return this.mBundle;
    }

    public String getExportFileSuffix() {
        return isSavedAsPng() ? "png" : "jpg";
    }

    public int getExportedHeight() {
        return this.mExportedHeight;
    }

    public int getExportedWidth() {
        return this.mExportedWidth;
    }

    public Bitmap getPreview() {
        return this.mPreview;
    }

    public Bitmap getPreviewOriginal() {
        return this.mPreviewOriginal;
    }

    public void getRenderData(List<RenderData> list) {
        list.addAll(this.mRenderDataList);
    }

    public List<RenderData> getRenderDataList() {
        return this.mRenderDataList;
    }

    public int getStepCount() {
        return this.mRenderDataList.size();
    }

    public boolean initializeForPreview(boolean z) throws FileNotFoundException, SecurityException {
        long currentTimeMillis = System.currentTimeMillis();
        initForBitmapInfo();
        this.mInSampleSize = Integer.highestOneBit(Math.max(Math.max(this.mOriginHeight / this.mPreferHeight, this.mOriginWidth / this.mPreferWidth), 1));
        if (z) {
            Bitmap loadFromMemoryCache = ImageLoader.getInstance().loadFromMemoryCache(MemoryCacheUtils.generatePreviewPhotoKey(this.mSource.toString()));
            if (loadFromMemoryCache != null && !loadFromMemoryCache.isRecycled()) {
                if (loadFromMemoryCache.getWidth() >= this.mOriginWidth / this.mInSampleSize && loadFromMemoryCache.getHeight() >= this.mOriginHeight / this.mInSampleSize) {
                    this.mPreviewEnable = true;
                }
                Log.d("DraftManager", "load preview from cache");
                this.mPreview = Bitmaps.copyBitmapInCaseOfRecycle(loadFromMemoryCache);
            }
        }
        if (this.mPreview == null) {
            Options options = new Options();
            options.inSampleSize = this.mInSampleSize;
            this.mPreview = decodeBitmap(options, ExifUtil.getRotationDegrees(this.mExif));
            this.mPreviewEnable = true;
        }
        if (this.mPreview != null && this.mPreview.getWidth() == this.mOriginWidth && this.mPreview.getHeight() == this.mOriginHeight) {
            this.mIsPreviewSameWithOrigin = true;
        }
        this.mPreviewOriginal = this.mPreview;
        Log.d("DraftManager", "initialize costs %dms same:%b, previewEnable:%b", Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(this.mIsPreviewSameWithOrigin), Boolean.valueOf(this.mPreviewEnable));
        if (!this.mPreviewEnable) {
            this.mBackgroundTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        }
        return this.mPreview != null;
    }

    public boolean isEmpty() {
        return this.mRenderDataList.isEmpty() && this.mWithWatermark;
    }

    public boolean isPreviewEnable() {
        return this.mPreviewEnable;
    }

    public boolean isPreviewSameWithOrigin() {
        return this.mIsPreviewSameWithOrigin;
    }

    public boolean isRemoveWatermarkEnable() {
        return this.mXmpExtraManager.isRemoveWatermarkEnable();
    }

    public boolean isRemoveWatermarkShow() {
        return this.mXmpExtraManager.isRemoveWatermarkShow(this.mPreviewOriginal, this.mRenderDataList);
    }

    public boolean isSavedAsPng() {
        return !this.mIsScreenshot && "image/png".equals(this.mMimeType);
    }

    public boolean isSecret() {
        return this.mSecretInfo.mIsSecret;
    }

    public boolean isWithWatermark() {
        return this.mWithWatermark;
    }

    public void reRender(boolean z, Callback<Bitmap, Void> callback) {
        this.mWithWatermark = z;
        new ReRenderTask(callback).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Boolean[]{Boolean.valueOf(z)});
    }

    public void release() {
        RenderEngine[] renderEngineArr;
        for (RenderData release : this.mRenderDataList) {
            release.release();
        }
        for (RenderEngine renderEngine : this.mEngines) {
            if (renderEngine != null) {
                renderEngine.release();
            }
        }
    }

    public void setOnPreviewRefreshListener(OnPreviewRefreshListener onPreviewRefreshListener) {
        this.mOnPreviewRefreshListener = onPreviewRefreshListener;
    }

    public void setRenderDataList(List<RenderData> list) {
        this.mRenderDataList = list;
    }
}
