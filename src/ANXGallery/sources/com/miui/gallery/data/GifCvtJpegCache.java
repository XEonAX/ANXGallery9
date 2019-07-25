package com.miui.gallery.data;

import com.miui.gallery.util.Utils;
import java.io.File;

public class GifCvtJpegCache {
    private int mCurrentLoopPosition = 0;
    private final String[] mDestinations;
    private final boolean mInitSuccess;
    private final int mSize;
    private final String[] mSources;

    public GifCvtJpegCache(File file, int i) {
        boolean z = true;
        Utils.assertTrue(i > 0);
        if (file == null || ((!file.isDirectory() && !file.mkdirs()) || !file.canWrite())) {
            z = false;
        }
        this.mInitSuccess = z;
        this.mSize = i;
        this.mSources = new String[i];
        this.mDestinations = new String[i];
        for (int i2 = 0; i2 < i; i2++) {
            String[] strArr = this.mDestinations;
            StringBuilder sb = new StringBuilder();
            sb.append("gif_cvt");
            sb.append(i2);
            sb.append(".jpg");
            strArr[i2] = new File(file, sb.toString()).getAbsolutePath();
        }
    }
}
