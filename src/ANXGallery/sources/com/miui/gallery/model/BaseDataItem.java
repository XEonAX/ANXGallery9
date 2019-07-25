package com.miui.gallery.model;

import android.app.Activity;
import android.content.Context;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import com.miui.gallery.Config.BigPhotoConfig;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.SaveUriDialogFragment.OnCompleteListener;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StringUtils;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.util.gifdecoder.NSGifDecode;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import miui.date.DateUtils;
import miui.graphics.BitmapFactory;

public class BaseDataItem implements Serializable {
    private static String TAG = "BaseDataItem";
    protected List<BaseDataItem> mBurstGroup;
    private transient ReentrantLock mCacheLock = new ReentrantLock();
    protected String mContentDescription;
    protected long mCreateTime = System.currentTimeMillis();
    /* access modifiers changed from: private */
    public volatile transient long mDisplayBetterFileSize = -1;
    /* access modifiers changed from: private */
    public volatile transient DisplayBetterPath mDisplayBetterPath = new DisplayBetterPath();
    protected int mDuration = -1;
    protected String mFilePath;
    protected int mHeight;
    private boolean mIsBurstItem;
    protected boolean mIsSecret;
    protected long mKey;
    protected double mLatitude;
    protected long mLocalGroupId;
    protected String mLocation;
    protected double mLongitude;
    protected String mMicroPath;
    protected String mMimeType;
    protected volatile long mMotionOffset;
    protected int mOrientation;
    protected byte[] mSecretKey;
    protected long mSize;
    protected volatile long mSpecialTypeFlags = -1;
    /* access modifiers changed from: private */
    public volatile transient int mSupportOperations = -1;
    protected String mThumbPath;
    protected String mTitle;
    protected int mWidth;

    private class DisplayBetterPath {
        private String mPath;
        private int mType;

        private DisplayBetterPath() {
            this.mType = 0;
            this.mPath = null;
        }

        public String getPath() {
            return this.mPath;
        }

        public void setPath(int i, String str) {
            if (!TextUtils.isEmpty(str) && i >= this.mType) {
                this.mType = i;
                this.mPath = str;
            }
        }
    }

    private interface Func<T> {
        T doFunc();
    }

    private boolean lock() {
        if (ThreadManager.isMainThread()) {
            boolean z = false;
            try {
                z = this.mCacheLock.tryLock(200, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Log.d(TAG, "UI thread acquired %s", (Object) Boolean.valueOf(z));
            return z;
        }
        this.mCacheLock.lock();
        return true;
    }

    private void refillBetterPath() {
        if (checkOriginalFileExist()) {
            setPathDisplayBetter(3, getOriginalPath());
        } else if (FileUtils.isFileExist(getThumnailPath())) {
            setPathDisplayBetter(2, getThumnailPath());
        } else if (FileUtils.isFileExist(getMicroPath())) {
            setPathDisplayBetter(1, getMicroPath());
        }
    }

    private <T> T safeRun(Func<T> func) {
        if (!lock()) {
            return func.doFunc();
        }
        try {
            return func.doFunc();
        } finally {
            unlock();
        }
    }

    private void unlock() {
        this.mCacheLock.unlock();
    }

    public boolean checkOriginalFileExist() {
        return FileUtils.isFileExist(getOriginalPath());
    }

    public NSGifDecode createNSGifDecoder(JobContext jobContext) {
        ParcelFileDescriptor parcelFileDescriptor;
        if (!TextUtils.isEmpty(getOriginalPath())) {
            if (!isSecret()) {
                return NSGifDecode.create(getOriginalPath());
            }
            try {
                parcelFileDescriptor = ParcelFileDescriptor.open(new File(getOriginalPath()), 805306368);
            } catch (Exception e) {
                e = e;
                parcelFileDescriptor = null;
                try {
                    Log.e(TAG, "createNSGifDecoder failed %s", (Object) e);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                parcelFileDescriptor = null;
                MiscUtil.closeSilently(parcelFileDescriptor);
                throw th;
            }
            try {
                NSGifDecode create = NSGifDecode.create(parcelFileDescriptor.getFileDescriptor(), getSecretKey());
                MiscUtil.closeSilently(parcelFileDescriptor);
                return create;
            } catch (Exception e2) {
                e = e2;
                Log.e(TAG, "createNSGifDecoder failed %s", (Object) e);
                MiscUtil.closeSilently(parcelFileDescriptor);
                return null;
            }
        }
        return null;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null || !(obj instanceof BaseDataItem)) {
            return false;
        }
        BaseDataItem baseDataItem = (BaseDataItem) obj;
        if (this.mKey == baseDataItem.getKey() && StringUtils.nullToEmpty(baseDataItem.getOriginalPath()).equals(StringUtils.nullToEmpty(getOriginalPath())) && StringUtils.nullToEmpty(baseDataItem.getThumnailPath()).equals(StringUtils.nullToEmpty(getThumnailPath()))) {
            z = true;
        }
        return z;
    }

    public ImageSize getBigPhotoImageSize() {
        return BigPhotoConfig.BIG_PHOTO_SIZE_DEFAULT;
    }

    public List<BaseDataItem> getBurstGroup() {
        return this.mBurstGroup;
    }

    public List<Long> getBurstKeys() {
        if (this.mBurstGroup == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(this.mBurstGroup.size());
        for (BaseDataItem key : this.mBurstGroup) {
            arrayList.add(Long.valueOf(key.getKey()));
        }
        return arrayList;
    }

    public String getContentDescription(Context context) {
        if (TextUtils.isEmpty(this.mContentDescription)) {
            this.mContentDescription = TalkBackUtil.getContentDescriptionForImage(context, this.mCreateTime, this.mLocation, this.mMimeType);
        }
        return this.mContentDescription;
    }

    public Uri getContentUriForExternal() {
        if (!TextUtils.isEmpty(this.mFilePath)) {
            return Uri.fromFile(new File(this.mFilePath));
        }
        if (!TextUtils.isEmpty(this.mThumbPath)) {
            return Uri.fromFile(new File(this.mThumbPath));
        }
        return null;
    }

    public void getCoordidate(double[] dArr) {
        if (dArr != null) {
            dArr[0] = this.mLatitude;
            dArr[1] = this.mLongitude;
        }
    }

    public long getCreateTime() {
        return this.mCreateTime;
    }

    public PhotoDetailInfo getDetailInfo(Context context) {
        PhotoDetailInfo photoDetailInfo = new PhotoDetailInfo();
        photoDetailInfo.addDetail(1, Long.valueOf(getCreateTime()));
        photoDetailInfo.addDetail(200, getOriginalPath());
        photoDetailInfo.addDetail(2, FileUtils.getFileName(getOriginalPath()));
        photoDetailInfo.addDetail(3, Long.valueOf(getSize()));
        photoDetailInfo.addDetail(9, getLocation());
        double[] dArr = new double[2];
        getCoordidate(dArr);
        photoDetailInfo.addDetail(6, dArr);
        if (isVideo()) {
            photoDetailInfo.addDetail(7, Integer.valueOf(getDuration()));
        } else {
            photoDetailInfo.addDetail(4, Integer.valueOf(getWidth()));
            photoDetailInfo.addDetail(5, Integer.valueOf(getHeight()));
        }
        return photoDetailInfo;
    }

    public long getDisplayBetterFileSize() {
        return ((Long) safeRun(new Func<Long>() {
            public Long doFunc() {
                return Long.valueOf(BaseDataItem.this.mDisplayBetterFileSize);
            }
        })).longValue();
    }

    public Uri getDownloadUri() {
        return null;
    }

    public int getDuration() {
        return this.mDuration;
    }

    public FavoriteInfo getFavoriteInfo(boolean z) {
        return new FavoriteInfo();
    }

    public int getHeight() {
        return this.mHeight;
    }

    public long getKey() {
        return this.mKey;
    }

    public long getLocalGroupId() {
        return this.mLocalGroupId;
    }

    public String getLocation() {
        return LocationManager.getInstance().generateTitleLine(this.mLocation);
    }

    public ImageSize getMicroImageSize() {
        return ThumbConfig.get().sMicroTargetSize;
    }

    public String getMicroPath() {
        return this.mMicroPath;
    }

    public String getMimeType() {
        return this.mMimeType;
    }

    public long getMotionOffset() {
        return this.mMotionOffset;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public String getOriginalPath() {
        return this.mFilePath;
    }

    public String getPathDisplayBetter() {
        return (String) safeRun(new Func<String>() {
            public String doFunc() {
                return BaseDataItem.this.mDisplayBetterPath.getPath();
            }
        });
    }

    public byte[] getSecretKey() {
        return this.mSecretKey;
    }

    public long getSize() {
        return this.mSize;
    }

    public long getSpecialTypeFlags() {
        return this.mSpecialTypeFlags;
    }

    public int getSupportOperations() {
        return ((Integer) safeRun(new Func<Integer>() {
            public Integer doFunc() {
                if (BaseDataItem.this.mSupportOperations < 0) {
                    BaseDataItem.this.mSupportOperations = BaseDataItem.this.initSupportOperations();
                }
                return Integer.valueOf(BaseDataItem.this.mSupportOperations);
            }
        })).intValue();
    }

    public String getThumnailPath() {
        return this.mThumbPath;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public String getViewSubTitle(Context context) {
        return DateUtils.formatDateTime(getCreateTime(), 44);
    }

    public String getViewTitle(Context context) {
        return DateUtils.formatDateTime(getCreateTime(), 896);
    }

    public int getWidth() {
        return this.mWidth;
    }

    public boolean hasFace() {
        return false;
    }

    public int hashCode() {
        return new Long(this.mKey).hashCode();
    }

    /* access modifiers changed from: protected */
    public int initSupportOperations() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void invalidCache() {
    }

    public boolean isBurstItem() {
        return this.mIsBurstItem;
    }

    public boolean isGif() {
        if (TextUtils.isEmpty(this.mMimeType)) {
            return false;
        }
        return FileMimeUtil.isGifFromMimeType(this.mMimeType);
    }

    public boolean isImage() {
        if (TextUtils.isEmpty(this.mMimeType)) {
            return false;
        }
        return FileMimeUtil.isImageFromMimeType(this.mMimeType);
    }

    public boolean isModified(BaseDataItem baseDataItem) {
        return baseDataItem != null && !equals(baseDataItem);
    }

    public boolean isMotionPhoto() {
        return isSpecialTypeRecognized() && (this.mSpecialTypeFlags & 32) != 0;
    }

    public boolean isSecret() {
        return this.mIsSecret;
    }

    public boolean isSpecialType(long j) {
        return isSpecialTypeRecognized() && (j & this.mSpecialTypeFlags) != 0;
    }

    public boolean isSpecialTypeRecognized() {
        return this.mSpecialTypeFlags != -1;
    }

    public boolean isSynced() {
        return true;
    }

    public boolean isVideo() {
        if (TextUtils.isEmpty(this.mMimeType)) {
            return false;
        }
        return FileMimeUtil.isVideoFromMimeType(this.mMimeType);
    }

    /* access modifiers changed from: protected */
    public void onCacheLoaded() {
        String path = this.mDisplayBetterPath.getPath();
        this.mDisplayBetterFileSize = FileUtils.getFileSize(path);
        long fileSize = TextUtils.equals(this.mFilePath, path) ? this.mDisplayBetterFileSize : FileUtils.getFileSize(this.mFilePath);
        if (fileSize <= 0) {
            return;
        }
        if (fileSize != this.mSize || this.mWidth == 0 || this.mHeight == 0) {
            this.mSize = fileSize;
            try {
                Options bitmapSize = BitmapFactory.getBitmapSize(this.mFilePath);
                this.mWidth = bitmapSize.outWidth;
                this.mHeight = bitmapSize.outHeight;
            } catch (IOException e) {
                Log.w(TAG, (Throwable) e);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onLoadCache() {
        refillBetterPath();
        this.mSupportOperations = initSupportOperations();
    }

    public void reloadCache() {
        safeRun(new Func<Void>() {
            public Void doFunc() {
                BaseDataItem.this.invalidCache();
                BaseDataItem.this.onLoadCache();
                BaseDataItem.this.onCacheLoaded();
                return null;
            }
        });
    }

    public void removeSupportOperation(final int i) {
        safeRun(new Func<Void>() {
            public Void doFunc() {
                if (BaseDataItem.this.mSupportOperations > 0) {
                    BaseDataItem.this.mSupportOperations = BaseDataItem.this.mSupportOperations & (i ^ -1);
                }
                return null;
            }
        });
    }

    public void resetSpecialTypeFlags() {
        this.mSpecialTypeFlags = -1;
    }

    public void save(Activity activity, OnCompleteListener onCompleteListener) {
    }

    public BaseDataItem setBurstGroup(List<BaseDataItem> list) {
        this.mBurstGroup = list;
        return this;
    }

    public BaseDataItem setBurstItem(boolean z) {
        this.mIsBurstItem = z;
        return this;
    }

    public BaseDataItem setCreateTime(long j) {
        this.mCreateTime = j;
        return this;
    }

    public BaseDataItem setDuration(int i) {
        this.mDuration = i;
        return this;
    }

    public BaseDataItem setFilePath(String str) {
        this.mFilePath = str;
        setPathDisplayBetter(3, str);
        return this;
    }

    public BaseDataItem setHeight(int i) {
        this.mHeight = i;
        return this;
    }

    public BaseDataItem setKey(long j) {
        this.mKey = j;
        return this;
    }

    public BaseDataItem setLatitude(double d) {
        this.mLatitude = d;
        return this;
    }

    public BaseDataItem setLocalGroupId(long j) {
        this.mLocalGroupId = j;
        return this;
    }

    public BaseDataItem setLocation(String str) {
        this.mLocation = str;
        return this;
    }

    public BaseDataItem setLongitude(double d) {
        this.mLongitude = d;
        return this;
    }

    public BaseDataItem setMicroPath(String str) {
        this.mMicroPath = str;
        setPathDisplayBetter(1, str);
        return this;
    }

    public BaseDataItem setMimeType(String str) {
        this.mMimeType = str;
        return this;
    }

    public void setMotionOffset(long j) {
        this.mMotionOffset = j;
    }

    public BaseDataItem setOrientation(int i) {
        this.mOrientation = i;
        return this;
    }

    /* access modifiers changed from: protected */
    public void setPathDisplayBetter(final int i, final String str) {
        safeRun(new Func<Void>() {
            public Void doFunc() {
                BaseDataItem.this.mDisplayBetterPath.setPath(i, str);
                return null;
            }
        });
    }

    public BaseDataItem setSecretKey(byte[] bArr) {
        if (bArr != null) {
            this.mIsSecret = true;
        } else {
            this.mIsSecret = false;
        }
        this.mSecretKey = bArr;
        return this;
    }

    public BaseDataItem setSize(long j) {
        this.mSize = j;
        return this;
    }

    public void setSpecialTypeFlags(long j) {
        this.mSpecialTypeFlags = j;
    }

    public BaseDataItem setThumbPath(String str) {
        this.mThumbPath = str;
        setPathDisplayBetter(2, str);
        return this;
    }

    public BaseDataItem setTitle(String str) {
        this.mTitle = str;
        return this;
    }

    public BaseDataItem setWidth(int i) {
        this.mWidth = i;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("key: ");
        sb.append(this.mKey);
        sb.append(" path: ");
        sb.append(this.mFilePath);
        sb.append(" thumb: ");
        sb.append(this.mThumbPath);
        return sb.toString();
    }
}
