package com.miui.gallery.editor.photo.app.filter.skytransfer;

import android.graphics.Bitmap;
import java.util.concurrent.CountDownLatch;

public class SkyTransferTempData {
    public CountDownLatch mCountDownLatch = new CountDownLatch(1);
    public byte[] mMaskData;
    public int mSegHeight;
    public int mSegWidth;
    public int mSkyMode = 2;

    public SkyTransferTempData(Bitmap bitmap) {
        this.mSegWidth = bitmap.getWidth();
        this.mSegHeight = bitmap.getHeight();
        this.mMaskData = new byte[(this.mSegWidth * this.mSegHeight)];
    }
}
