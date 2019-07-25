package com.miui.gallery.collage.app.common;

import android.app.Fragment;
import android.graphics.Bitmap;
import com.miui.gallery.collage.CollageActivity.ReplaceImageListener;
import com.miui.gallery.collage.core.RenderData;
import java.util.HashMap;

public abstract class CollageRenderFragment extends Fragment {
    protected boolean mBitmapReady;
    protected Bitmap[] mBitmaps;
    protected ReplaceImageListener mReplaceImageListener;

    public abstract void dismissControlWindow();

    public abstract RenderData export();

    public boolean isActivating() {
        return false;
    }

    public abstract void onBitmapReplace(Bitmap bitmap, Bitmap bitmap2);

    /* access modifiers changed from: protected */
    public abstract void onBitmapsReceive();

    public abstract HashMap<String, String> onSimple();

    public final void setBitmap(Bitmap[] bitmapArr) {
        if (bitmapArr != null && bitmapArr.length != 0) {
            this.mBitmaps = bitmapArr;
            this.mBitmapReady = true;
            onBitmapsReceive();
        }
    }

    public void setReplaceImageListener(ReplaceImageListener replaceImageListener) {
        this.mReplaceImageListener = replaceImageListener;
    }
}
