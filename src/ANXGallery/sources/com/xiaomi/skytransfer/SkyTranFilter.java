package com.xiaomi.skytransfer;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyLibraryLoaderHelper;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyTransferItem;
import com.miui.gallery.editor.photo.app.filter.skytransfer.SkyTransferTempData;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.Log;
import java.io.File;
import java.nio.ByteBuffer;

public class SkyTranFilter {
    private static SkyTranFilter sInstance = new SkyTranFilter();
    private boolean mIsLoaded;
    private long mNativeObj;
    private Object mSync = new Object();
    private SkyTransferTempData mTransferTempData;

    private byte[] bitmap2RGB(Bitmap bitmap, boolean z) {
        if (bitmap == null) {
            return null;
        }
        ByteBuffer allocate = ByteBuffer.allocate(bitmap.getByteCount());
        bitmap.copyPixelsToBuffer(allocate);
        byte[] array = allocate.array();
        byte[] array2 = ByteBuffer.allocate((array.length / 4) * 3).array();
        int length = array.length / 4;
        for (int i = 0; i < length; i++) {
            if (z) {
                int i2 = i * 3;
                int i3 = i * 4;
                array2[i2] = array[i3];
                array2[i2 + 1] = array[i3 + 1];
                array2[i2 + 2] = array[i3 + 2];
            } else {
                int i4 = i * 3;
                int i5 = i * 4;
                array2[i4] = array[i5 + 2];
                array2[i4 + 1] = array[i5 + 1];
                array2[i4 + 2] = array[i5];
            }
        }
        return array2;
    }

    private native void bitmapAdjustMoment(long j, Object obj, Object obj2, byte[] bArr, byte[] bArr2, byte[] bArr3, int i, boolean z, float f);

    private native void bitmapTransferSky(long j, Object obj, Object obj2, byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4, byte[] bArr3, byte[] bArr4, byte[] bArr5, int i5, boolean z, float f, boolean z2);

    private native void freeSkyTransfer(long j);

    private byte[] getByteFromPath(String str) {
        Bitmap safeDecodeBitmap = BitmapUtils.safeDecodeBitmap(str, new Options(), null);
        byte[] bitmap2RGB = bitmap2RGB(safeDecodeBitmap, true);
        BitmapUtils.recycleSilently(safeDecodeBitmap);
        return bitmap2RGB;
    }

    public static SkyTranFilter getInstance() {
        return sInstance;
    }

    private native int getSkyTransMode(long j);

    private void init() {
        if (!this.mIsLoaded) {
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(SkyLibraryLoaderHelper.getInstance().getLibraryDirPath());
                sb.append("/libsky_transfer_jni.so");
                System.load(sb.toString());
                this.mIsLoaded = true;
            } catch (Error e) {
                Log.e("SkyTranFilter", (Throwable) e);
            }
        }
        if (this.mIsLoaded) {
            this.mNativeObj = newSkyTransfer();
        }
    }

    private native long newSkyTransfer();

    private native void segment(long j, byte[] bArr, int i, int i2, byte[] bArr2, boolean z, boolean z2);

    private void transferSky(Bitmap bitmap, Bitmap bitmap2, SkyTransferItem skyTransferItem, SkyTransferTempData skyTransferTempData, boolean z) {
        Object obj;
        SkyTransferTempData skyTransferTempData2 = skyTransferTempData;
        if (bitmap != null && skyTransferTempData2 != null && skyTransferItem != null) {
            if (skyTransferTempData2.mSkyMode == 2) {
                Log.w("SkyTranFilter", "transfer sky mode is forbidden");
                return;
            }
            Object obj2 = this.mSync;
            synchronized (obj2) {
                try {
                    Log.d("SkyTranFilter", "transferSky start %d-%d ,%s", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()), skyTransferItem.toString());
                    if (this.mNativeObj <= 0) {
                        Log.w("SkyTranFilter", "transfer sky native obj is null");
                    } else {
                        Options options = new Options();
                        StringBuilder sb = new StringBuilder();
                        sb.append(skyTransferItem.getPath());
                        sb.append(File.separator);
                        sb.append("background");
                        Bitmap safeDecodeBitmap = BitmapUtils.safeDecodeBitmap(sb.toString(), options, null);
                        int width = safeDecodeBitmap.getWidth();
                        int height = safeDecodeBitmap.getHeight();
                        byte[] bitmap2RGB = bitmap2RGB(safeDecodeBitmap, true);
                        BitmapUtils.recycleSilently(safeDecodeBitmap);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(skyTransferItem.getPath());
                        sb2.append(File.separator);
                        sb2.append("fore");
                        byte[] byteFromPath = getByteFromPath(sb2.toString());
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(skyTransferItem.getPath());
                        sb3.append(File.separator);
                        sb3.append("whole");
                        byte[] byteFromPath2 = getByteFromPath(sb3.toString());
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append(skyTransferItem.getPath());
                        sb4.append(File.separator);
                        sb4.append("complex");
                        byte[] byteFromPath3 = getByteFromPath(sb4.toString());
                        if (!(bitmap2RGB == null || byteFromPath == null || byteFromPath2 == null)) {
                            if (byteFromPath3 != null) {
                                obj = obj2;
                                bitmapTransferSky(this.mNativeObj, bitmap, bitmap2, skyTransferTempData2.mMaskData, skyTransferTempData2.mSegWidth, skyTransferTempData2.mSegHeight, bitmap2RGB, width, height, byteFromPath, byteFromPath2, byteFromPath3, skyTransferItem.getCate(), skyTransferTempData2.mSkyMode == 1, skyTransferItem.getProgress(), z);
                                Log.d("SkyTranFilter", "transferSky end");
                                return;
                            }
                        }
                        Object obj3 = obj2;
                        Log.w("SkyTranFilter", "res decode failed");
                    }
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            }
        }
    }

    public SkyTransferTempData getTransferTempData() {
        return this.mTransferTempData;
    }

    public void release() {
        if (this.mNativeObj > 0) {
            freeSkyTransfer(this.mNativeObj);
        }
        this.mTransferTempData = null;
        this.mNativeObj = 0;
    }

    public int segment(Bitmap bitmap) {
        synchronized (this.mSync) {
            this.mTransferTempData = null;
            if (this.mNativeObj <= 0) {
                init();
            }
            Log.d("SkyTranFilter", "segment start");
            if (this.mNativeObj <= 0) {
                Log.w("SkyTranFilter", "segment mNativeObj is null");
                return 2;
            } else if (bitmap == null) {
                Log.w("SkyTranFilter", "segment img is null or category < 0");
                return 2;
            } else {
                this.mTransferTempData = new SkyTransferTempData(bitmap);
                segment(this.mNativeObj, bitmap2RGB(bitmap, true), this.mTransferTempData.mSegWidth, this.mTransferTempData.mSegHeight, this.mTransferTempData.mMaskData, true, false);
                this.mTransferTempData.mSkyMode = getSkyTransMode(this.mNativeObj);
                this.mTransferTempData.mCountDownLatch.countDown();
                Log.d("SkyTranFilter", "segment end: %d", (Object) Integer.valueOf(this.mTransferTempData.mSkyMode));
                int i = this.mTransferTempData.mSkyMode;
                return i;
            }
        }
    }

    public void transferSkyAdjustMoment(Bitmap bitmap, Bitmap bitmap2, SkyTransferItem skyTransferItem) {
        if (bitmap != null && skyTransferItem != null) {
            synchronized (this.mSync) {
                if (this.mNativeObj <= 0) {
                    Log.v("SkyTranFilter", "transfer sky native obj is null");
                    return;
                }
                Log.d("SkyTranFilter", "transferSkyAdjustMoment start %s", (Object) skyTransferItem.toString());
                StringBuilder sb = new StringBuilder();
                sb.append(skyTransferItem.getPath());
                sb.append(File.separator);
                sb.append("fore");
                byte[] byteFromPath = getByteFromPath(sb.toString());
                StringBuilder sb2 = new StringBuilder();
                sb2.append(skyTransferItem.getPath());
                sb2.append(File.separator);
                sb2.append("whole");
                byte[] byteFromPath2 = getByteFromPath(sb2.toString());
                StringBuilder sb3 = new StringBuilder();
                sb3.append(skyTransferItem.getPath());
                sb3.append(File.separator);
                sb3.append("complex");
                byte[] byteFromPath3 = getByteFromPath(sb3.toString());
                if (!(byteFromPath == null || byteFromPath2 == null)) {
                    if (byteFromPath3 != null) {
                        bitmapAdjustMoment(this.mNativeObj, bitmap, bitmap2, byteFromPath, byteFromPath2, byteFromPath3, skyTransferItem.getCate(), this.mTransferTempData.mSkyMode == 1, skyTransferItem.getProgress());
                        Log.d("SkyTranFilter", "transferSkyAdjustMoment end");
                        return;
                    }
                }
                Log.w("SkyTranFilter", "res decode failed");
            }
        }
    }

    public void transferSkyForSave(Bitmap bitmap, SkyTransferItem skyTransferItem, SkyTransferTempData skyTransferTempData) {
        transferSky(bitmap, null, skyTransferItem, skyTransferTempData, true);
    }

    public void transferSkyForShow(Bitmap bitmap, Bitmap bitmap2, SkyTransferItem skyTransferItem) {
        transferSky(bitmap, bitmap2, skyTransferItem, this.mTransferTempData, false);
    }

    public boolean waitSegment() {
        boolean z = false;
        if (this.mTransferTempData == null) {
            return false;
        }
        try {
            this.mTransferTempData.mCountDownLatch.await();
        } catch (InterruptedException e) {
            Log.e("SkyTranFilter", (Throwable) e);
        }
        if (this.mTransferTempData.mSkyMode != 2) {
            z = true;
        }
        return z;
    }
}
