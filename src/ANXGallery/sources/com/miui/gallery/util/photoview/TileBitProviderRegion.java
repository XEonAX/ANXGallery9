package com.miui.gallery.util.photoview;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import com.meicam.themehelper.BuildConfig;
import com.miui.gallery.Config.TileConfig;
import com.miui.gallery.util.BitmapUtils;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.ExifInfo;
import com.miui.gallery.util.Log;

public class TileBitProviderRegion implements TileBitProvider {
    private int mImageHeight;
    private int mImageWidth;
    private boolean mIsFlip;
    private Object mLock = new Object();
    private BitmapRegionDecoder mRegionDecoder;
    private int mRotation;

    public TileBitProviderRegion(String str, byte[] bArr) {
        this.mRegionDecoder = BitmapUtils.safeCreateBitmapRegionDecoder(str, false, bArr);
        if (BitmapUtils.isValidate(this.mRegionDecoder)) {
            this.mImageWidth = this.mRegionDecoder.getWidth();
            this.mImageHeight = this.mRegionDecoder.getHeight();
            ExifInfo parseRotationInfo = ExifUtil.parseRotationInfo(str, bArr);
            if (parseRotationInfo == null) {
                this.mRotation = 0;
                this.mIsFlip = false;
            } else {
                this.mRotation = parseRotationInfo.rotation;
                this.mIsFlip = parseRotationInfo.flip;
            }
        }
        Log.i("TileBitProviderRegion", "create");
    }

    public int getImageHeight() {
        return this.mImageHeight;
    }

    public int getImageWidth() {
        return this.mImageWidth;
    }

    public int getRotation() {
        return this.mRotation;
    }

    public TileBit getTileBit(Rect rect, int i) {
        Bitmap safeDecodeRegion;
        if (rect == null) {
            return null;
        }
        Rect rect2 = new Rect(0, 0, this.mImageWidth, this.mImageHeight);
        if (!rect2.intersect(rect)) {
            return null;
        }
        Options options = new Options();
        options.inPreferredConfig = TileConfig.getBitmapConfig();
        options.inSampleSize = i;
        options.outWidth = rect2.width();
        options.outHeight = rect2.height();
        options.inBitmap = TileReusedBitCache.getInstance().get(options);
        synchronized (this.mLock) {
            safeDecodeRegion = BitmapUtils.isValidate(this.mRegionDecoder) ? BitmapUtils.safeDecodeRegion(this.mRegionDecoder, rect2, options) : null;
        }
        if (safeDecodeRegion == null) {
            synchronized (this.mLock) {
                if (BitmapUtils.isValidate(options.inBitmap)) {
                    Log.w("TileBitProviderRegion", "fail in decoding region use inBitmap [width %d, height %d]", Integer.valueOf(options.inBitmap.getWidth()), Integer.valueOf(options.inBitmap.getHeight()));
                    options.inBitmap.recycle();
                    options.inBitmap = null;
                    safeDecodeRegion = BitmapUtils.safeDecodeRegion(this.mRegionDecoder, rect2, options);
                } else {
                    Log.w("TileBitProviderRegion", "fail in decoding region %s", rect.toString());
                }
            }
        }
        if (BitmapUtils.isValidate(safeDecodeRegion)) {
            return new TileBit(safeDecodeRegion, rect2.width() / i, rect2.height() / i);
        }
        return null;
    }

    public boolean isFlip() {
        return this.mIsFlip;
    }

    public void release() {
        synchronized (this.mLock) {
            if (BitmapUtils.isValidate(this.mRegionDecoder)) {
                this.mRegionDecoder.recycle();
            }
            this.mRegionDecoder = null;
            Log.i("TileBitProviderRegion", BuildConfig.BUILD_TYPE);
        }
    }
}
